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


module UART_FIFO #(parameter DATA_WIDTH=32,
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
        output rd_ready,
//======FLAG PORT DECLARATION =====\\
        output full,
        output empty,
        output [$clog2(DEPTH):0] used_entries          

    );
    
    localparam COUNTER_WIDTH = $clog2(DEPTH);
    localparam BYTES = DATA_WIDTH/8;
    localparam BYTE_POINTER_WIDTH = $clog2(DEPTH*8);
    localparam IDEL = 2'b0, WRITE = 2'b01, READ = 2'b10,DONE=2'b11; 
    

    reg [DATA_WIDTH-1 : 0] mem [0 : DEPTH-1];
    reg [1:0] wr_state,rd_state;
    reg [COUNTER_WIDTH :0] wr_pointer, rd_pointer;
    reg [DATA_WIDTH-1 : 0] sync_1;
    integer i;
    assign wr_ready = (!(wr_state==IDEL));
    assign rd_ready = (!(rd_state==IDEL || rd_state == READ));
    assign full =  ~rst?0:((wr_pointer + 1) % DEPTH) == rd_pointer;
    assign empty = (wr_pointer == rd_pointer);
    assign used_entries = (wr_pointer >= rd_pointer) ? 
                      (wr_pointer - rd_pointer) : 
                      (DEPTH - rd_pointer + wr_pointer);
    
//======= WRITE LOGIC DEFINATION =======\\  
//======= WRITE POINTER AND STATE =======\\  
always @(posedge wr_clk ) begin
    if (!rst) begin
        wr_pointer <= 0;
        wr_state <= IDEL;
        sync_1 <= 0;
    end else begin
        case (wr_state)
            IDEL: begin
                if (wr_en) begin
                    wr_state <= WRITE;
                    sync_1 <= wr_data;
                end
            end
            WRITE: begin
                if (!full) begin
                    wr_state <= IDEL;
                    wr_pointer <= (wr_pointer + 1) % DEPTH;
                end else begin
                    wr_state <= IDEL;
                end
            end
            default: wr_state <= IDEL;
        endcase
    end
end

//======= SEPARATE MEMORY WRITE LOGIC =======\\  
always @(posedge wr_clk) begin
    if (wr_state == WRITE && !full) begin
        mem[wr_pointer] <= sync_1;
    end
end

        
//======= READ LOGIC DEFINATION =======\\  
        always@(posedge rd_clk )
            begin
            if(!rst)
                begin
                    rd_pointer <= 0;
                    rd_state<=IDEL;
                    rd_data <=0;
                end
            else
                begin
                    case(rd_state)
                        IDEL:
                            begin
                                if(rd_en)
                                    begin
                                        rd_state <= READ;
                                    end
                            end
                        READ:
                            begin
                                if(!empty )
                                    begin
                                        rd_data <= mem [rd_pointer];
                                        rd_state <= DONE;
                                    end
                            end
                        DONE:
                            begin
                                rd_state <= IDEL;
                                rd_pointer <= (rd_pointer +1)%DEPTH;
                            end
                        default: rd_state <= IDEL;
                    endcase
                end
        end
endmodule
