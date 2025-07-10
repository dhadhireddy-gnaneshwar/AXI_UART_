`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//  
// Create Date: 22.05.2025 10:37:11
// Design Name: 
// Module Name: WRITE_BUFFER_CONTROLLER
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


module WRITE_BUFFER_CONTROLLER #(parameter ADDR_WIDTH = 32,
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
     parameter OFFSET_START_BITS = 16
     )(
     //WRITE CONTROLLER PORT DECLARATION
     input rd_clk,
     input rst,
     //FIFO AW READ PORTS
    output addr_read,
    input  [ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+1:0] out_addr,
//    input  awfull,
    input  awempty,
    input  addr_read_ready,
    //FIFO W READ PORTS
    output read_wdata,
    input out_data_ready,
//    input  w_full,
    input  w_empty,
    input  [DATA_WIDTH-1:0] out_wdata,
     //B - CHANNEL
    output  reg bvalid,
    output reg [RESPONSE_WIDTH-1:0] bresp,
    output reg [ID_WIDTH-1:0] bid,
    input  bready,
    //UART CONTROLLER PORT DECLARATION
    output [DATA_WIDTH-1:0] tx_data,
    output tx_data_valid,
    output reg [OFFSET_START_BITS-1:0] addr,
    input [$clog2(UART_TX_FIFO_DEPTH*(DATA_WIDTH/8)):0] tx_fifo_mem_left,
    input tx_ready
    );
    
    //======================= DATA BYTE AND TOTAL ADDRESS WIDTH CALCULATION ========================\\    
    localparam DATA_BYTES = DATA_WIDTH/8;
    localparam BYTES_WIDTH = $clog2(DATA_BYTES);
    localparam ALIGN_BITS = $clog2(ADDR_WIDTH/8);
    localparam AW_FIFO_WIDTH = ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+2;
    //========================ADDRESS OFFSET CALCULATION ===========================================\\
    localparam STATUS_REG_ADDR = START_OFFSET+DATA_BYTES-16'h4;
    localparam CTRL_REG_ADDR = STATUS_REG_ADDR+16'h4;
    localparam INTRPT_REG_ADDR = CTRL_REG_ADDR+16'h4;
    localparam TX_ADDRESS_OFFSET_START = INTRPT_REG_ADDR + 16'h4;
    localparam TX_ADDRESS_OFFSET_END = TX_ADDRESS_OFFSET_START + (DATA_BYTES * UART_TX_FIFO_DEPTH);
    localparam TOTAL_BYTES = ((DATA_BYTES)*(UART_RX_FIFO_DEPTH+UART_TX_FIFO_DEPTH))+(3*4)-1;
    //======================== STATE DECLARATION ===================================================\\
    localparam IDEL = 3'b000, READ_TX_DATA =3'b001, DECODE = 3'b010, SEND_DATA = 3'B011,NEW_DATA = 3'b100,ADDRESS_UPDATE=3'b101,IN_VALID_ADDR=3'b110,READ_TX_ADDR=3'b111 , STS =2'b01, CRTL = 2'b10, INTRT = 2'b11;
    
    localparam SLVERR = 3'b010, DECERR = 3'b011,OKAY = 000;

    reg [BYTES_WIDTH:0] beat_count ;
    reg [2:0] state;
    reg [OFFSET_START_BITS-1:0] r_addr;
    //STATUS REG DATA
    wire r_data_ready, over_run, parity_error, frame_error, rx_fifo_full, rx_fifo_empty, tx_fifo_empty, tx_fifo_full;
    wire [3:0] tx_fifo_left,rx_fifo_left;
    
    //AW CHANNEL DATA
    wire [ADDR_WIDTH-1:0] awaddr;
    wire [SIZE_WIDTH-1:0] awsize;
    wire [LEN_WIDTH-1 :0] awlen;
    wire [1:0] awburst;
    wire [ID_WIDTH-1:0] awid;
    
    //W CHANNEL DATA 
    wire [DATA_WIDTH-1:0] wdata;
//    wire [(DATA_WIDTH/8)-1:0] wstrb;
    
    
    // ======DE-FRAMING THE AWFIFO OUT_ADDR===========\\
//    assign awburst = out_addr[AW_FIFO_WIDTH-1 : AW_FIFO_WIDTH-2];
//    assign awid    = out_addr[AW_FIFO_WIDTH-3 : AW_FIFO_WIDTH-2-ID_WIDTH];
//    assign awlen   = out_addr[AW_FIFO_WIDTH-3-ID_WIDTH : AW_FIFO_WIDTH-2-ID_WIDTH-LEN_WIDTH];
//    assign awsize  = out_addr[AW_FIFO_WIDTH-3-ID_WIDTH-LEN_WIDTH : AW_FIFO_WIDTH-2-ID_WIDTH-LEN_WIDTH-SIZE_WIDTH];
//    assign awaddr  = out_addr[AW_FIFO_WIDTH-3-ID_WIDTH-LEN_WIDTH-SIZE_WIDTH : 0];
      assign {awburst,awid,awlen,awsize,awaddr} = out_addr;
    
    //========DE-FRAMING W FIFO OUT DATA================\\
    assign wdata = out_wdata[DATA_WIDTH-1:0];
//    assign wstrb = out_wdata[DATA_WIDTH+(DATA_WIDTH/8)-1:DATA_WIDTH];
    
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
    
    
    //WRITE CONTROLLER PORT LOGIC
    assign addr_read = (state==READ_TX_ADDR)?1:0;
    assign read_wdata  = (state == READ_TX_DATA || state == NEW_DATA || state == IN_VALID_ADDR );
    assign tx_data_valid = (state == SEND_DATA && beat_count <= awlen);
    assign tx_data = wdata;
    
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
    
    always@(posedge rd_clk)
        begin
            if(rst)
                begin
                    beat_count <=0;
                    state <= IDEL;
                    bvalid<=0;
                    bresp <= 00;
                    bid <= 0;
                end
            else
                begin 
                    case(state)
                        IDEL:
                            begin
                            beat_count <= 0;
                            bvalid <=0;
                                if((!awempty && !w_empty) )
                                    begin
                                        state<=READ_TX_ADDR;
                                        
                                    end
                            end
                        READ_TX_ADDR:
                            begin
                                if(addr_read_ready)
                                    begin
                                        state <= READ_TX_DATA;
                                    end
                            end
                        READ_TX_DATA:
                            begin
                                if( out_data_ready)
                                    begin
                                        state<=DECODE;
                                    end                                
                            end
                        DECODE:
                            begin
                                if(awaddr[ALIGN_BITS-1:0] == 0 && (awaddr >={BASE_ADDRESS,START_OFFSET}  && awaddr<={BASE_ADDRESS,TOTAL_BYTES}) )
                                    begin
                                        if(awaddr[7:0] == 8'h18 && tx_fifo_mem_left>=((awlen+1)*(1<<awsize)))
                                            begin
                                                state <= SEND_DATA;
                                                addr <= awaddr[OFFSET_START_BITS-1:0];
                                                r_addr <= awaddr[OFFSET_START_BITS-1:0];
                                            end
                                        else if(awaddr[7:0] == 8'h18 && tx_fifo_mem_left<((awlen+1)*(1<<awsize))) 
                                            begin                                                             
                                                bvalid <= 1;
                                                bresp <= SLVERR;
                                                bid <= awid;
                                                if(bvalid && bready)
                                                    begin
                                                        bvalid <= 0;
                                                        state<=IDEL;
                                                    end                      
                                            end                                                               
                                        else
                                            begin
                                                state <= SEND_DATA;
                                                addr <= awaddr[OFFSET_START_BITS-1:0];
                                                r_addr <= awaddr[OFFSET_START_BITS-1:0];
                                            end
                                    end
                                else 
                                    begin
                                        bvalid <= 1;
                                        bresp <= SLVERR;
                                        bid <= awid;
                                        if(bvalid && bready)
                                            begin
                                                bvalid <= 0;
                                                state<=IN_VALID_ADDR;
                                            end
                                    end
                            end
                        SEND_DATA :
                            begin
                                if(awlen > 0 && beat_count <= awlen )
                                    begin
                                        if( tx_ready )
                                            begin 
                                                state <= ADDRESS_UPDATE;
                                                beat_count <= beat_count+1;
                                            end
                                    end
                                else if(awlen ==0  )
                                    begin
                                        addr <= r_addr;
                                        bvalid <= 1;
                                        bresp <= OKAY;
                                        bid <= awid;
                                        if(  tx_ready)
                                            begin
                                                 bvalid <= 0 ;
                                                state <= IDEL;
                                            end
                                    end
                                else
                                    begin
                                        bvalid <= 1;
                                        bresp <= SLVERR;
                                        bid <= awid;
                                        if(bvalid && bready)
                                            begin
                                                bvalid <= 0;
                                                state<=IDEL;
                                            end
                                        
                                    end
                            end
                        NEW_DATA:
                            begin
                                if(out_data_ready)
                                    begin
                                        state <= SEND_DATA;
                                        addr <= r_addr;
                                        
                                    end
                            end
                        ADDRESS_UPDATE: 
                            begin
                                if(awburst == 2'b01)
                                    begin
                                        r_addr <= r_addr+(beat_count*(1<<awsize));
                                    end
                                else if(awburst == 2'b00)
                                    begin
                                        r_addr <= r_addr;
                                    end
                                else if(awburst == 2'b10 && r_addr <= (awaddr + (awlen*(1<<awsize))))
                                    begin
                                        r_addr <= (beat_count*(1<<awsize));
                                    end
                                else
                                    begin
                                        r_addr <= r_addr;
                                    end
                                if(beat_count > awlen)
                                    begin
                                         bvalid <= 1;
                                        bresp <= OKAY;
                                        bid <= awid;
                                        if(  bvalid && bready)
                                            begin
                                                bvalid <= 0 ;
                                                state <= IDEL;
                                            end
                                    end
                                else
                                    begin
                                        state <= NEW_DATA;
                                    end
                            end
                        IN_VALID_ADDR:
                            begin
                               if(awlen > 0 && beat_count < awlen-1 && !w_empty )
                                    begin
                                        if( out_data_ready && read_wdata )
                                            begin 
                                                beat_count <= beat_count+1;
                                            end
                                    end
                                else
                                    begin
                                        state <= IDEL;
                                    end
                            end
                        default: state <= IDEL;
                    endcase
                end
        end
    
endmodule