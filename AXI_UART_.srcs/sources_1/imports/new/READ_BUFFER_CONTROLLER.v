`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 10:37:11
// Design Name: 
// Module Name: READ_BUFFER_CONTROLLER
// Project Name: 
// Target Devices: 
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


module READ_BUFFER_CONTROLLER #(parameter ADDR_WIDTH = 32,
     parameter DATA_WIDTH = 64,
     parameter ID_WIDTH = 4,
     parameter SIZE_WIDTH = 4,
     parameter LEN_WIDTH = 8,
     parameter RESPONSE_WIDTH = 3,
     parameter AR_DEPTH =32,
     parameter W_DEPTH =1024,
     parameter AW_DEPTH =32,
     parameter R_DEPTH =1024,
     parameter ADDR_OFFSET = 16'hE000,
     parameter CONTL_REG_WIDTH = 32,
     parameter STATUS_REG_WIDTH =32,
     parameter UART_TX_FIFO_DEPTH = 32,
     parameter UART_RX_FIFO_DEPTH = 32,
     parameter BASE_ADDRESS  = 16'hE100,
     parameter START_OFFSET = 16'h0000,
     parameter END_OFFSET  = 16'h00810,
     parameter OFFSET_START_BITS = 8
     )(
     //READ CONTROLLER PORT DECLARATION
     input rd_clk,
     input rst,
     //FIFO AR READ PORTS
    output reg ar_addr_read,
    input ar_read_ready,
//    input arfull,
    input arempty,
    input [ADDR_WIDTH+ID_WIDTH+SIZE_WIDTH+LEN_WIDTH+1:0] ar_addr_out,
    //FIFO R READ PORTS
//    input r_fifo_wr_clk,
    output [ID_WIDTH+DATA_WIDTH+RESPONSE_WIDTH-1:0] wr_r_fifo_data,
    output reg wr_r_fifo_en,
//    input wr_r_fifo_ready,
//    input r_full,
//    input r_empty,
     
    //UART CONTROLLER PORT DECLARATION
    input [DATA_WIDTH-1:0] rx_data,
    input rx_data_valid,
    output [OFFSET_START_BITS-1:0] addr,
    output rx_en,
//    input char_time_out,
    
    //AXI READ PORT CHANNEL
    input aclk,
    output rvalid,
    output [DATA_WIDTH-1:0] rdata,
    output [ID_WIDTH-1:0] rid,
    output rlast,
    output reg [RESPONSE_WIDTH-1:0] rresp,
    input rready 
    );
    
    //======================= DATA BYTE AND TOTAL ADDRESS WIDTH CALCULATION ========================\\    
    localparam DATA_BYTES = DATA_WIDTH/8;
    localparam BYTES_WIDTH = $clog2(LEN_WIDTH);
    localparam ALIGN_BITS = $clog2(ADDR_WIDTH/8);
    localparam AW_FIFO_WIDTH = ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+2;
    //========================ADDRESS OFFSET CALCULATION ===========================================\\
    localparam STATUS_REG_ADDR = START_OFFSET+DATA_BYTES-16'h4;
    localparam CTRL_REG_ADDR = STATUS_REG_ADDR+16'h4;
    localparam INTRPT_REG_ADDR = CTRL_REG_ADDR+16'h4;
    localparam TX_ADDRESS_OFFSET_START = INTRPT_REG_ADDR + 16'h4;
    localparam TX_ADDRESS_OFFSET_END = TX_ADDRESS_OFFSET_START + (DATA_BYTES * UART_TX_FIFO_DEPTH);
    localparam RX_ADDRESS_OFFSET_START = TX_ADDRESS_OFFSET_END + 16'h4;
    localparam RX_ADDRESS_OFFSET_END = RX_ADDRESS_OFFSET_START + (DATA_BYTES * UART_RX_FIFO_DEPTH);
    localparam TOTAL_BYTES = ((DATA_BYTES)*(UART_RX_FIFO_DEPTH+UART_TX_FIFO_DEPTH))+(3*4)-1;
    //======================== READ_STATE DECLARATION ===================================================\\
    localparam IDEL = 3'b000, READ_RX_ADDR =3'b001, DECODE = 3'b010, READ_RX_DATA = 3'B011 ,WRITE_BACK = 3'b100,SEND_AXI=3'b101, STS =2'b01, CRTL = 2'b10, INTRT = 2'b11;
    
    localparam SLVERR = 3'b010, DECERR = 3'b011,OKAY = 000;

    reg [BYTES_WIDTH:0] read_beat_count ;
    reg [2:0] read_state;
    reg [2:0] axi_read_state;
    reg [OFFSET_START_BITS-1:0] r_addr;
    //STATUS REG DATA
//    wire r_data_ready, over_run, parity_error, frame_error, rx_fifo_full, rx_fifo_empty, tx_fifo_empty, tx_fifo_full;
//    wire [3:0] tx_fifo_left,rx_fifo_left;
    
    //AR CHANNEL DATA
    wire [ADDR_WIDTH-1:0] araddr;
    wire [SIZE_WIDTH-1:0] arsize;
    wire [LEN_WIDTH-1 :0] arlen;
    wire [1:0] arburst;
    wire [ID_WIDTH-1:0] arid;
    wire char_time_out;
    
  
    
    // ======DE-FRAMING THE AWFIFO OUT_ADDR===========\\
//    assign awburst = out_addr[AW_FIFO_WIDTH-1 : AW_FIFO_WIDTH-2];
//    assign awid    = out_addr[AW_FIFO_WIDTH-3 : AW_FIFO_WIDTH-2-ID_WIDTH];
//    assign awlen   = out_addr[AW_FIFO_WIDTH-3-ID_WIDTH : AW_FIFO_WIDTH-2-ID_WIDTH-LEN_WIDTH];
//    assign awsize  = out_addr[AW_FIFO_WIDTH-3-ID_WIDTH-LEN_WIDTH : AW_FIFO_WIDTH-2-ID_WIDTH-LEN_WIDTH-SIZE_WIDTH];
//    assign awaddr  = out_addr[AW_FIFO_WIDTH-3-ID_WIDTH-LEN_WIDTH-SIZE_WIDTH : 0];
      assign {arburst,arid,arlen,arsize,araddr} = ar_addr_out;
    
    //========DE-FRAMING W FIFO OUT DATA================\\
    
    
    //========DE - FRAMING THE STATUS REGISTER ==========\\
    //    assign r_data_ready  = status_reg[0];
    //    assign over_run      = status_reg[1]; 
    //    assign parity_error  = status_reg[2];
    //    assign frame_error   = status_reg[3];
    //    assign rx_fifo_empty = status_reg[4];
    //    assign rx_fifo_full  = status_reg[5];
    //    assign tx_fifo_empty  = status_reg[6];
    //    assign tx_fifo_full  = status_reg[7]; 
    //    assign tx_fifo_left  = status_reg[15:8];
    //    assign rx_fifo_left  = status_reg[23:16];
    
    
    //READ CONTROLLER PORT LOGIC
    assign rlast = (read_beat_count > arlen);
    assign wr_r_fifo_data  = {arid,rx_data,rresp};
    assign rx_en = (read_state == READ_RX_DATA);
    assign addr = r_addr[7:0];
    
    
    
    // R CHANNEL PORT ASSIGNMENT
    assign rdata = rx_data;
    assign rvalid = (axi_read_state == SEND_AXI);
    assign rid = arid;
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //                                                                                                                                           //
    //                                                                                                                                           //
    //                                                 STATUS_REG FRAME                                                                          //
    //                                                                                                                                           //
    //       | 31      ...     25|   24  | 23         ...        16 | 15         ...          8 | 7    |  6  |  5  | 4  | 3  | 2  |  1  |  0     //
    //       |       Reserved    | CTS   | RX_MEM_SPACE_LEFT        | TX_MEM_SPACE_LEFT        |TXF   | TXE|  RXE |RXF | FE | PE | OR  |  RDR   //
    //                                                                                                                                           //
    //       RDR  = READ DATA READY                                                                                                              //
    //       OR  = OVER RUN                                                                                                                      //
    //       PE  = PARITY ERROR                                                                                                                  //
    //       FE  = FRAME ERROR                                                                                                                   //
    //       RXF = RX FIFO FULL                                                                                                                  //
    //       RXE = RX FIFO EMPTY                                                                                                                 //
    //       TXE = TX FIFO EMPTY                                                                                                                 //
    //       TXF = TX FIFO FULL                                                                                                                  //
    //                                                                                                                                           //
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    wire done = (read_state==READ_RX_DATA && char_time_out);
    TIMER #(.COUNT(32'hFFFF_FFFF)) WRITE_CNTRL_TIMER (
    .clk(rd_clk),
    .in_trig(rvalid),
    .rst_trig(rx_data_valid),
    .rst(rst),
    .check(),
    .trig(char_time_out)
    );
    always@(posedge rd_clk)
        begin
            if(rst)
                begin
                    read_state<=IDEL;
                    r_addr <=0;
                    
                   
                end
            else
                begin
                    case(read_state)
                        IDEL:
                            begin
                                if(!arempty )
                                    begin
                                        read_state <= READ_RX_ADDR;
                                    end
                            end
                        
                        READ_RX_ADDR:
                            begin
                                ar_addr_read <=1;
                                if(ar_read_ready && ar_addr_read)
                                    begin
                                        read_state <= DECODE;
                                        ar_addr_read <= 0;
                                        r_addr <= araddr;
                                    end
                            end
                        DECODE :
                            begin
                                 if(araddr[ALIGN_BITS-1:0] == 0 && (araddr >={BASE_ADDRESS,START_OFFSET}  && araddr<={BASE_ADDRESS,END_OFFSET}) /*&& tx_fifo_mem_left>=((awlen+1)*(1<<awsize))*/)
                                    begin
                                        read_state <= READ_RX_DATA;
                                    end
                                 else
                                    begin
                                        wr_r_fifo_en <= 1;
                                        rresp <= SLVERR;
                                        if(wr_r_fifo_en)
                                            begin
                                                read_state <= IDEL;
                                            end
                                    end                       
                            end
                        READ_RX_DATA:
                            begin
                                if(!char_time_out)
                                    begin
                                        if(rx_data_valid)
                                            begin
                                                wr_r_fifo_en <= 1;
                                                rresp <= OKAY;
                                                if(wr_r_fifo_en && read_beat_count > arlen)
                                                    begin
                                                        read_state <= IDEL;
                                                        
                                                    end
                                                else
                                                    begin
                                                        read_state <= WRITE_BACK;
                                                    end
                                            end
                                    end
                                else
                                    begin
                                        wr_r_fifo_en <= 1;
                                        rresp <= SLVERR;
                                        if(wr_r_fifo_en)
                                            begin
                                                read_state <= IDEL;
                                            end
                                    end
                            
                            end
                        WRITE_BACK:
                            begin
                                if(rready)
                                    begin
                                        if(rlast)
                                            begin
                                                read_state <= IDEL;
                                            end
                                        else
                                            begin
                                                read_state <= READ_RX_DATA;
                                                if(arburst == 2'b00)
                                                    begin
                                                        r_addr <= araddr;
                                                    end
                                                else if(arburst == 2'b01)
                                                    begin
                                                        r_addr <= r_addr+(1<<arsize)*read_beat_count;
                                                    end
                                                else if(arburst == 2'b10 && r_addr <= (araddr + (arlen*(1<<arsize))))
                                                    begin
                                                        r_addr <= (read_beat_count*(1<<arsize));
                                                    end
                                            end
                                    end
                                
                            end
                    endcase
                
                end
        end
    always@(posedge aclk)
        begin
            if(rst)
                begin
                   read_beat_count <=0;
                   axi_read_state <= IDEL;
                end
            else
                begin
                    case(axi_read_state)
                        IDEL:
                            begin
                                if(read_beat_count > arlen || read_state== IDEL || char_time_out)
                                    begin
                                        read_beat_count <=0;
                                    end
                                if(read_state == WRITE_BACK)
                                    begin
                                        axi_read_state <= SEND_AXI;
                                    end
                            end
                        SEND_AXI:
                            begin
                                if(rready)
                                    begin
                                        axi_read_state <= IDEL;
                                        read_beat_count <= read_beat_count+1;
                                    end
                            end
                    endcase
                end
        end
    
endmodule