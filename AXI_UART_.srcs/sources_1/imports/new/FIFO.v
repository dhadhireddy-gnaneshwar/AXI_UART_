`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2025 12:17:43
// Design Name: 
// Module Name: FIFO
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


module FIFO #(parameter DATA_WIDTH=32,
              parameter DEPTH=32 )
    (
        input rst,
//======WRITE PORTS DECLARATION=====\\
        input wr_clk,
        input wr_en,
        input [DATA_WIDTH-1:0] wr_data,
        output wr_ready,
//======READ PORTS DECLARATION=====\\  
        input rd_clk,
        input rd_en,
        output reg [DATA_WIDTH-1:0] rd_data,
        output reg rd_ready,
//======FLAG PORT DECLARATION =====\\
        output full,
        output empty          

    );
    
    localparam COUNTER_WIDTH = $clog2(DEPTH);
    localparam BYTES = DATA_WIDTH/8;
    localparam BYTE_POINTER_WIDTH = $clog2(DEPTH*8);
    localparam IDEL = 2'b0, WRITE = 2'b01, READ = 2'b10; 
    

    reg [DATA_WIDTH-1 : 0] mem [0 : DEPTH-1];
    reg [1:0] wr_state,rd_state;
    reg [COUNTER_WIDTH :0] wr_pointer, rd_pointer;
    reg [DATA_WIDTH-1 : 0] sync_1;
    
    assign wr_ready = (!(wr_state==IDEL));
    
    assign full =  rst?0:((wr_pointer + 1) % DEPTH) == rd_pointer;
    assign empty = (wr_pointer == rd_pointer);
    
//======= WRITE LOGIC DEFINATION =======\\  
    always@(posedge wr_clk)
            begin
            if(rst)
                begin
                    wr_pointer <= 0;
                    wr_state<=IDEL;
                end
            else
                begin
                    case(wr_state)
                        IDEL:
                            begin
                                if(wr_en)
                                    begin
                                        wr_state <= WRITE;
                                        sync_1 <= wr_data;
                                    end
                            end
                        WRITE:
                            begin
                                if(!full && wr_en )
                                    begin
                                        mem[wr_pointer] <= sync_1;;
                                        wr_pointer <= (wr_pointer +1)%DEPTH;
                                        
                                        wr_state <= IDEL;
                                    end
                                else
                                    begin
                                        wr_state <= IDEL;
                                    end
                            end
                    endcase
                    
                end
        end
        
//======= READ LOGIC DEFINATION =======\\  
        always@(posedge rd_clk)
            begin
            if(rst)
                begin
                    rd_pointer <= 0;
                    rd_state<=IDEL;
                end
            else
                begin
                    case(rd_state)
                        IDEL:
                            begin
                                rd_ready <=0;
                                if(rd_en)
                                    begin
                                        rd_state <= READ;
                                    end
                            end
                        READ:
                            begin
                                if(!empty && rd_en )
                                    begin
                                        rd_data <= mem [rd_pointer];
                                        rd_pointer <= (rd_pointer +1)%DEPTH;
                                        rd_state <= IDEL;
                                        rd_ready <=1;
                                    end
                            end
                        default: rd_state <= IDEL;
                    endcase
                end
        end
endmodule
