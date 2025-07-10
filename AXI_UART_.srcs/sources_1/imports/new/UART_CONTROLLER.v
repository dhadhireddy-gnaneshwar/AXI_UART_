`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//   
// Create Date: 26.05.2025 17:18:15
// Design Name: 
// Module Name: UART_CONTROLLER
// Project Name: AXI_UART_V2 
// Target Devices: ZYNQ 7000  
// Tool Versions:  
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UART_CONTROLLER #(parameter ADDR_WIDTH = 32,
     parameter DATA_WIDTH = 64,
     parameter ID_WIDTH = 4,
     parameter SIZE_WIDTH = 4,
     parameter LEN_WIDTH = 8,
     parameter RESPONSE_WIDTH = 3,
     parameter AR_DEPTH =32,
     parameter W_DEPTH =1024,
     parameter AW_DEPTH =32,
     parameter R_DEPTH =1024,
     parameter ADDR_OFFSET = 16'h E000,
     parameter CONTL_REG_WIDTH = 32,
     parameter STATUS_REG_WIDTH =32,
     parameter UART_TX_FIFO_DEPTH = 256,
     parameter UART_RX_FIFO_DEPTH = 32,
     parameter CTRL_REG_WIDTH = 32)(

    // UART CONTROLLER PORT
    input uart_clk,
    input sample_clk,
    input rst,
    output rx_done,
    output [30:0] baud_rate,
    output baud_en,
    output [4:0] sample_rate_o, 
    // WRITE BUFFER CONTROLLER PORT 
    input rd_clk,
    input [DATA_WIDTH-1:0] tx_data,
    input tx_data_valid,
    input [7:0] tx_addr,
    output [$clog2(UART_TX_FIFO_DEPTH*(DATA_WIDTH/8)):0] tx_fifo_mem_left,
    output tx_ready,
    // READ BUFFER CONTROLLER PORT 
    output reg [DATA_WIDTH-1:0] rx_data,
    output rx_data_valid,
    input [7:0] rx_addr,
    input rx_en,
//    output char_time_out,
    //UART PORTS
    input rx,
    output reg tx
    );
  
  
//===============================================================//
//    **LOCAL PARAMETERS FOR STATES AND ADDRESSS DECODING**      //
//===============================================================//
    localparam IDEL = 3'b000, DECODE = 3'b001, DONE = 2'b01, WRITE = 2'b11, READ = 2'b10;
    localparam CR = 8'h04,
    BAUD_GEN = 8'h00, 
    IER = 8'h08,
    IDR= 8'h0c,
    IMR = 8'h10,
    ISR = 8'h14, 
    TX =8'h18,
    RX=8'h1c,
    CSR = 8'h20;
    localparam BYTES = DATA_WIDTH/8;
    localparam READ_TX_FIFO = 3'b001,START= 3'b010,DATA=3'b011,PARITY=3'b100,STOP= 3'b101;
    
//===============================================================//
//                *** UART REG DECLARATION ***                   //
//===============================================================//    
    
    reg [31:0] cntrl_reg;
    wire [35:0] status_reg;
    
    wire tx_wr_en;
    wire tx_rd_en;
    wire [DATA_WIDTH-1:0] out_rx_data;
    reg [DATA_WIDTH-1:0] in_rx_data;
    wire [7:0] in_tx_data,out_tx_data;
    wire [$clog2(UART_TX_FIFO_DEPTH):0] tx_entries;
    wire [$clog2(UART_RX_FIFO_DEPTH):0] rx_entries;
    reg [2:0] tx_action_state,rx_action_state;
    reg [2:0] uart_tx_state,uart_rx_state;
    reg [1:0] tx_fifo_state,rx_fifo_state;
    reg tx_wr_start;
    reg [7:0] uart_rx_data;
    
    reg [7:0] w_addr,r_addr;
    reg [DATA_WIDTH-1:0] w_data,r_data;
    reg [3:0] wr_bit_counter, rd_bit_counter;
    reg [3:0] byte_counter;
    reg [3:0] tx_byte_counter;
    reg [4:0] sample_counter;
    

//===============================================================//
//            *** STATUS BITS DECLARATION ***                    //
//===============================================================//
    wire        tx_empty;  
    wire        tx_full;   
    wire        rx_empty;  
    wire        rx_full;   
    wire        tx_active;
    wire        rx_active;
    wire [9:0]  rx_mem_used = rx_entries* (DATA_WIDTH/8); 
    wire [$clog2(UART_TX_FIFO_DEPTH*(DATA_WIDTH/8)):0]  tx_mem_left = (UART_TX_FIFO_DEPTH - tx_entries) * (DATA_WIDTH/8); 
    wire        overrun_error = rx_full;
    wire        parity_error;
    reg        frame_error;
    wire [1:0]  tx_fifo_status;  
    wire [1:0]  rx_fifo_status;  
//===============================================================//
//            *** TX_FIFO SIGNAL ASSINGN  ***                    //
//===============================================================//
    assign tx_wr_en = ( tx_fifo_state == WRITE);
    assign rx_wr_en = ( rx_fifo_state == WRITE);
    assign in_tx_data = rst? 0 : w_data[7:0];
    assign tx_rd_en = (uart_tx_state==READ_TX_FIFO);
    assign rx_rd_en = (rx_action_state == DECODE && r_addr==RX);
    assign tx_fifo_mem_left = (UART_TX_FIFO_DEPTH - tx_entries) * (DATA_WIDTH/8);

//===============================================================//
//            *** CONRTOL BITS DECLARATION ***                   //
//===============================================================//
    wire        tx_fifo_rst    = cntrl_reg[0];
    wire        rx_fifo_rst    = cntrl_reg[1];
    wire        tx_enable      = cntrl_reg[3];
    wire        rx_enable      = cntrl_reg[4];
    wire        stop_bit       = cntrl_reg[5];
    wire        parity_bit     = cntrl_reg[6];
    wire  [3:0] data_bits      = cntrl_reg[26:23];      
    wire  [4:0] sample_rate    = cntrl_reg[13:9];
    wire  [4:0] tx_trig        = cntrl_reg[18:14];
    wire  [4:0] rx_trig        = cntrl_reg[22:19];

    reg [31:0] r_IER,r_IDR,baud_reg;
    wire [31:0] r_IMR,r_ISR;

    
    wire int_tx_empty      = tx_empty;    
    wire int_tx_full       = tx_full;     
    wire int_rx_empty      = rx_empty;    
    wire int_rx_full       = rx_full;     
    wire int_tx_trigger    = ~(tx_trig)?0:(~(tx_action_state == DECODE && w_addr==TX))?0:1;    
    wire int_rx_trigger    = ~(rx_trig)?0:(~(rx_action_state == DECODE && r_addr==RX))?0:1;     
    wire int_parity_error  = ~(parity_error)?0:(~(tx_action_state == DECODE && w_addr==ISR))?0:1;
    wire int_frame_error   = ~(frame_error)?0:(~(tx_action_state == DECODE && w_addr==ISR))?0:1;
    wire int_overrun_error = ~(rx_full)?1:(~(tx_action_state == DECODE && w_addr==ISR))?1:0;
    
///=======UART CONTROLLER PORT ASSIGNMENT
    assign tx_ready = (
    // From CR
    (w_addr == CR && (
        (cntrl_reg[0] && cntrl_reg[1] && tx_empty && rx_empty) || 
        (cntrl_reg[0] && !cntrl_reg[1] && tx_empty) || 
        (cntrl_reg[1] && !cntrl_reg[0] && rx_empty) || 
        (!cntrl_reg[0] && !cntrl_reg[1])
    ) && tx_action_state != IDEL) ||

    // From IER
    (w_addr == IER && tx_action_state != IDEL) ||

    // From IDR
    (w_addr == IDR && tx_action_state != IDEL) ||
    
    //From BAUD_GEN
    (w_addr == BAUD_GEN  && tx_action_state != IDEL) ||

    // From TX, only if FIFO is idle
    (w_addr == TX && tx_fifo_state == IDEL && tx_action_state != IDEL)
);
    assign rx_data_valid = (
    (rx_action_state == DECODE) && (
        (r_addr == CR) ||
        (r_addr == IMR) ||
        (r_addr == ISR) ||
        (r_addr == RX && !rx_empty && (rx_mem_used >= rx_trig) && rx_fifo_status[1])
    )
);

    assign rx_done = !rx_empty;
    
   
/*  
|----------------------------------------------------------------|-------------------------------------------------------| 
|                     STATUS BITS                                |                   CONTROL BITS                        |
|------------------|---------------------------------------------|--------------------------|----------------------------|                         
|      Bit Index   |       Description                           |         Bit Index        |       Description          |                        
|------------------|---------------------------------------------|--------------------------|----------------------------| 
|      31 - 32     | RX_FIFO_STATUS    31- WRITE 32-READ         |             0            |  Tx FIFO RST               | 
|      29 - 30     | TX_FIFO_STATUS                              |             1            |  Rx FIFO RST               | 
|      28          | FE (Frame Error)                            |             3            |  Tx EN                     | 
|      27          | PE (Parity Error)                           |             4            |  Rx EN                     | 
|      26          | OE (Overrun Error)                          |             5            |  STOP BIT                  | 
|      25 - 16     | RxMem_Lefts [9:0]                           |             6            |  PARITY BIT                | 
|      6 - 15      | RxMem_Lefts [9:0]                           |             7            |  RESERVED                  | 
|      5           | Rx ACTIVE                                   |             8            |  RESERVED                  | 
|      4           | Tx ACTIVE                                   |           [ 9:13]        |  SAMPLE RATE               | 
|      3           | Rx FULL                                     |           [14:18]        |  TxTRIG                    | 
|      2           | Rx EMPTY                                    |           [19:22]        |  RxTRIG                    | 
|      1           | Tx FULL                                     |           [23:26]        |  DATA_BITS {5,6,7,8}       | 
|      0           | Tx EMPTY                                    |           [26:31]        |  RESERVED                  | 
|------------------|---------------------------------------------|--------------------------|----------------------------| 
*/


//===============================================================//
//               **INTERUPTS FRAME**                             //
//===============================================================//
 /*
|-------------------------------------------------------|
|                   INTERUPT BITS                        |
|--------------------------|----------------------------|
|         Bit Index        |       Description          |
|--------------------------|----------------------------|
|             0            |  Tx FIFO EMPTY             |
|             1            |  Tx FIFO FULL              |
|             3            |  Rx FIFO EMPTY             |
|             4            |  Rx FIFO FULL              |
|             5            |  Tx FIFO TRIGG             |
|             6            |  Tx FIFO TRIGG             |
|             7            |  PARITY ERROR              |
|             8            |  FRAME ERROR               |
|             9            |  OVER RUN ERROR            |
|             10           |  CHAR TIME OUT             |
|             11           |  BREAKDOWN                 |
|           [12:32]        |  RESERVED                  |
|--------------------------|----------------------------|
*/

//===============================================================//
//    **Assigning the mask register according to IER & IDR &     //
//    ** Assigning the status of inturupts to status register**  //
//===============================================================//

    assign r_IMR = r_IER & !r_IDR;

//===============================================================//
//    **Assign the bits of status_reg from individual wires**    //
//===============================================================//

    assign status_reg[0]    = tx_empty;
    assign status_reg[1]    = tx_full;
    assign status_reg[2]    = rx_empty;
    assign status_reg[3]    = rx_full;
    assign status_reg[4]    = tx_active;
    assign status_reg[5]    = rx_active;
    assign status_reg[15:6] = rx_mem_used;
    assign status_reg[25:16]= tx_mem_left;
    assign status_reg[26]   = overrun_error;
    assign status_reg[27]   = parity_error;
    assign status_reg[28]   = frame_error;
    assign status_reg[30:29]= tx_fifo_status;
    assign status_reg[32:31]= rx_fifo_status;
    
    wire exp_parity = (uart_rx_state == PARITY)?^uart_rx_data:0;
    reg parity ; 
    assign parity_error = (uart_rx_state == PARITY && parity == exp_parity);
    assign tx_active = (uart_tx_state ==IDEL);
    assign rx_active = (uart_rx_state ==IDEL);
    
    assign baud_rate = baud_reg[30:0];
    assign baud_en = baud_reg[31];
    assign sample_rate_o =sample_rate;
//===============================================================//
//               *** FIFO INSTANTION ***                         //
//===============================================================//
 UART_FIFO #(
    .DATA_WIDTH(8),
    .DEPTH(UART_TX_FIFO_DEPTH)) TxFIFO (
                    .rst(~tx_fifo_rst),
                    .wr_clk(rd_clk),
                    .wr_en(tx_wr_en),
                    .wr_data(in_tx_data),
                    .wr_ready(tx_fifo_status[0]),
                    .rd_clk(uart_clk),
                    .rd_en(tx_rd_en),
                    .rd_data(out_tx_data),
                    .rd_ready(tx_fifo_status[1]),
                    .full(tx_full),
                    .empty(tx_empty),
                    .used_entries(tx_entries)
                    );
 UART_FIFO #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(UART_RX_FIFO_DEPTH)) RxFIFO (
                    .rst(~rx_fifo_rst),
                    .wr_clk(sample_clk),
                    .wr_en(rx_wr_en),
                    .wr_data(in_rx_data),
                    .wr_ready(rx_fifo_status[0]),
                    .rd_clk(rd_clk),
                    .rd_en(rx_rd_en),
                    .rd_data(out_rx_data),
                    .rd_ready(rx_fifo_status[1]),
                    .full(rx_full),
                    .empty(rx_empty),
                    .used_entries(rx_entries)
                    );


    always@(posedge rd_clk)
        begin
            if(rst)
                begin
                    tx_action_state <=IDEL;
                    rx_action_state <=IDEL;
                    
                    tx_fifo_state <= IDEL;
                    baud_reg <=0;
                    tx_byte_counter <=0;
                    r_IER <=0;
                    r_IDR <= 0;
                end
            else
                begin
        //===============================================================//
        //                      *** TX WRITE LOGIC ***                   //
        //===============================================================//
                    case(tx_action_state)
                        IDEL:
                            begin
                            tx_wr_start<=0;
                            w_addr <= tx_addr;
                            if(tx_data_valid)
                                begin
                                    
                                    
                                    tx_action_state <= DECODE;
                                end
                            end
                        DECODE:
                            begin
                                case(w_addr)
                                    CR:
                                        begin
                                            cntrl_reg <= tx_data[31:0];
                                            if(tx_data[0] && tx_data[1] )
                                                begin
                                                    tx_fifo_state <= IDEL;
                                                    
                                                    if(tx_empty && rx_empty )
                                                        begin
                                                          cntrl_reg[0] <= 0;
                                                          cntrl_reg[1] <= 0;
                                                          tx_action_state<=IDEL;
                                                        end
                                                end
                                            else if(tx_data[0] && !tx_data[1])
                                                begin
                                                    tx_fifo_state <= IDEL;
                                                    if(tx_empty)
                                                        begin
                                                          cntrl_reg[0] <= 0;
                                                          tx_action_state<=IDEL;  
                                                        end
                                                end
                                            else if(tx_data[1] && !tx_data[0])
                                                begin
                                                    
                                                    if(rx_empty)
                                                        begin
                                                          cntrl_reg[1] <= 0;
                                                          tx_action_state<=IDEL;  
                                                        end
                                                end
                                            else
                                                begin
                                                   tx_action_state <= IDEL; 
                                                end
                                        end
                                    IER:
                                        begin
                                            r_IER <= tx_data;
                                            tx_action_state<=IDEL;
                                        end
                                    IDR:
                                        begin
                                            r_IDR <= tx_data;
                                            tx_action_state<=IDEL;
                                        end
                                    TX:
                                        begin
                                            if(tx_fifo_state ==IDEL)
                                                begin
                                                    tx_wr_start <=1;
                                                    tx_action_state<=IDEL;
                                                end
                                        end
                                    BAUD_GEN:
                                        begin
                                            baud_reg <= tx_data[31:0];
                                            tx_wr_start <=0;
                                            tx_action_state<=IDEL;
                                        end
                                    default : tx_action_state<=IDEL;
                                endcase    
                            end
                    endcase
        //===============================================================//
        //                      *** RX READ LOGIC ***                    //
        //===============================================================//
                    
                    case(rx_action_state)
                        IDEL:
                            begin
                            if(rx_en)
                                begin
                                    r_addr <= rx_addr;
                                    rx_action_state <= DECODE;
                                end
                            end
                        DECODE:
                            begin
                                case(r_addr)
                                    CR:
                                        begin
                                            rx_data <= {32'h0000_0000,cntrl_reg};
                                            rx_action_state <= IDEL;
                                        end
                                    IMR:
                                        begin
                                            rx_data <= {32'h0000_0000,r_IMR};
                                            rx_action_state <= IDEL;
                                        end
                                    ISR:
                                        begin
                                            rx_data <= {32'h0000_0000,r_ISR};
                                            rx_action_state <= IDEL;
                                        end
                                    RX:
                                        begin
                                            if(!rx_empty && (rx_mem_used >= rx_trig))
                                                begin
                                                   if(rx_fifo_status[1])
                                                    begin
                                                        rx_data <= out_rx_data;
                                                        rx_action_state<=IDEL; 
                                                    end
                                                end
                                        end
        
                                    default : rx_action_state<=IDEL;
                                endcase    
                            end
                    endcase
                    
                    
     //===============================================================//
     //             *** TX FIFO WRITE OPERATION ***                   //
     //===============================================================//
                    case(tx_fifo_state)
                        IDEL:
                            begin
                                if(tx_wr_start && !tx_full && tx_mem_left >= BYTES)
                                    begin
                                        tx_fifo_state <= WRITE;
                                        w_data <= tx_data;
                                        tx_byte_counter <=0; 
                                    end
                            end
                        WRITE:
                            begin
                                if(tx_fifo_status[0] && tx_wr_en)
                                    begin
                                       tx_fifo_state<= DONE; 
                                    end
                            end
                        DONE:
                            begin
                                if(tx_byte_counter == BYTES-1)
                                    begin
                                        tx_fifo_state <= IDEL;
                                    end
                                else
                                    begin
                                        tx_fifo_state <= WRITE;
                                        w_data <= w_data>>8;
                                        tx_byte_counter <= tx_byte_counter +1;
                                    end
                            end
                        default : tx_fifo_state<=IDEL;
                    endcase
                end
        end

    always@(posedge uart_clk or posedge rst)
        begin
     //===============================================================//
     //                   *** UART TX OPERATION ***                   //
     //===============================================================//
             if(rst)
                begin
                    wr_bit_counter <= 4'h0;
                    uart_tx_state <= IDEL;
                    tx <= 1;
                end
            else
                begin
                    case(uart_tx_state)
                        IDEL:
                            begin
                                if(!tx_empty && tx_enable)
                                    begin
                                        uart_tx_state <= READ_TX_FIFO;
                                    end
                                else
                                    begin
                                        tx <=1;
                                    end
                            end
                        READ_TX_FIFO:
                            begin
                                if(tx_fifo_status[1])
                                    begin
                                        uart_tx_state <= START;
                                    end
                            end
                        START:
                            begin
                                tx <=0;
                                uart_tx_state <= DATA;
                            end
                        DATA:
                            begin
                                if(wr_bit_counter == data_bits-1 )
                                    begin
                                        wr_bit_counter <=4'h0;
                                        if(parity_bit)
                                            begin
                                                uart_tx_state <= PARITY;
                                            end
                                        else
                                            begin
                                                uart_tx_state <= STOP;
                                            end
                                    end
                                else
                                    begin
                                        tx <= out_tx_data[wr_bit_counter];
                                        wr_bit_counter <= wr_bit_counter+4'h1;
                                    end
                            end
                        PARITY:
                            begin
                                uart_tx_state <= STOP;
                            end
                        STOP:
                            begin
                                tx <=1;
                               if(stop_bit)
                                    begin
                                        wr_bit_counter <=wr_bit_counter+4'h1;
                                        if(wr_bit_counter ==1)
                                            begin
                                                uart_tx_state <= IDEL;
                                                wr_bit_counter <=4'h0;
                                            end
                                    end
                                else
                                    begin
                                        uart_tx_state <= IDEL;
                                    end
                            end
                        default : uart_tx_state <= IDEL;
                    endcase
                end
        end
    always@(posedge sample_clk or posedge rst)
        begin
            if(rst)
                begin
                    rd_bit_counter <=0;
                    uart_rx_state <=0; 
                    byte_counter <=0;
                    frame_error <=0;
                    in_rx_data <=0;
                    uart_rx_data <=0;
                    parity<=0;
                    sample_counter <= 0;
                end
            else
                begin
                    if(!rx_enable || rx_full )
                        begin
                           rd_bit_counter <=0;
                           uart_rx_state <=0; 
                           byte_counter <=0;
                           sample_counter <=0;
                          
                        end
                    else
                        begin
                            case(uart_rx_state)
                                IDEL:
                                    begin
                                        parity <=0;
                                        if(byte_counter == (DATA_WIDTH/8) && rx_fifo_status[0] && rx_wr_en)
                                            begin
                                                byte_counter <=0;
                                                in_rx_data <=0;
                                            end
                                        if(rx==0 && sample_counter == (sample_rate/2)-1)
                                            begin
                                                uart_rx_data <=0;
                                                uart_rx_state <= DATA;
                                                sample_counter <= 0;
                                            end
                                        else if(rx==0 && sample_counter < (sample_rate/2)-1)
                                            begin
                                                sample_counter <= sample_counter+1;
                                            end
                                        else
                                            begin
                                                sample_counter <=0;
                                            end
                                    end
                                    
                                DATA:
                                    begin
                                        if(sample_counter == sample_rate-1)
                                            begin
                                                sample_counter <= 0;
                                                if(rd_bit_counter < data_bits-1 )
                                                    begin
                                                        uart_rx_data [rd_bit_counter] <= rx;
                                                        rd_bit_counter <= rd_bit_counter+1;
                                                    end
                                                else
                                                    begin
                                                         rd_bit_counter <= 0;
                                                        
                                                        if(parity_bit)
                                                            begin
                                                                uart_rx_state <= PARITY;
                                                            end
                                                        else
                                                            begin
                                                                uart_rx_state <= STOP;
                                                            end
                                                    end
                                            end
                                        else
                                            begin
                                                sample_counter <=sample_counter + 1;
                                            end
                                    end
                                PARITY:
                                    begin
                                        if(sample_counter == sample_rate-1)
                                            begin
                                                parity <=rx;
                                                uart_rx_state <= STOP;
                                                sample_counter <= 0;
                                            end
                                        else
                                            begin
                                                sample_counter <= sample_counter+1;
                                            end
                                    end
                                STOP:
                                    begin
                                        if(sample_counter ==  sample_rate-1)
                                            begin
                                                if(rx==1)
                                                    begin
                                                        sample_counter <= 0;
                                                        if(stop_bit)
                                                            begin
                                                                rd_bit_counter <=rd_bit_counter+1;
                                                                if(rd_bit_counter ==1)
                                                                    begin
                                                                        in_rx_data <= {uart_rx_data,in_rx_data[DATA_WIDTH-1:8]};
                                                                        uart_rx_state <= IDEL;
                                                                        byte_counter <= byte_counter+1;
                                                                        rd_bit_counter <=0;
                                                                    end
                                                            end
                                                        else
                                                            begin
                                                                uart_rx_state <= IDEL;
                                                                in_rx_data<={uart_rx_data,in_rx_data[DATA_WIDTH-1:8]};
                                                                byte_counter <= byte_counter+1;
                                                                rd_bit_counter <=0;
                                                            end
                                                        end
                                              
                                                else
                                                    begin
                                                        uart_rx_state <= IDEL;
                                                        frame_error <=1;
                                                    end
                                            end
                                        else
                                            begin
                                                sample_counter <=  sample_counter+1;
                                            end
                                    end
                                default : uart_rx_state <= IDEL;
                            endcase
                        end
                end
            end
    always@(posedge sample_clk)
        begin
            if(rst)
                begin
                    rx_fifo_state <= IDEL;
                end
            else
                begin
     //===============================================================//
     //             *** RX FIFO WRITE OPERATION ***                   //
     //===============================================================//
                    case(rx_fifo_state)
                        IDEL:
                            begin
                                if(byte_counter == (DATA_WIDTH/8) )
                                    begin
                                        rx_fifo_state<=WRITE;
                                    end
                            end
                        WRITE:
                            begin
                                
                                if(rx_fifo_status[0] && rx_wr_en)
                                    begin
                                        rx_fifo_state <= IDEL;
                                    end
                            end
                          
                        default : rx_fifo_state<=IDEL;
                    endcase 
                end
                
        end
endmodule
