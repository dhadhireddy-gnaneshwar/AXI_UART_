module R_FIFO #(parameter ADDR_WIDTH=32, 
    parameter DATA_WIDTH=64,
    parameter ID_WIDTH = 4,
    parameter SIZE_WIDTH=4,
    parameter LEN_WIDTH=8,
    parameter RESPONSE_WIDTH=3,
    parameter R_DEPTH =32 ) ( 
    
    input r_fifo_wr_clk,
    input [ID_WIDTH+DATA_WIDTH+RESPONSE_WIDTH-1:0] wr_r_fifo_data,
    input wr_r_fifo_en,
    output wr_r_fifo_ready,
    output r_full,
    output r_empty,
    
    // READ CHANNEL y
    input aclk,
    input areset,
    output rvalid,
    output [DATA_WIDTH-1:0] rdata,
    output [ID_WIDTH-1:0] rid,
    output rlast,
    output [RESPONSE_WIDTH-1:0] rresp,
    input rready 
    
    );
    
    //PARAMETER DECLARATION FOR WIDTH AND STATE FOR FSM
    localparam R_DATA_FIFO_WIDTH = DATA_WIDTH+ID_WIDTH+RESPONSE_WIDTH;
    localparam IDEL =2'b00, READ =2'b01,SYNCRONIZE= 2'b10,SEND = 2'b11; 
    
    reg [1:0] r_fifo_state;
    reg r_fifo_rd_en;
    reg [R_DATA_FIFO_WIDTH-1:0] sync1;
    
    wire rd_ready;
    wire [R_DATA_FIFO_WIDTH-1:0] out_rdata;
    
    assign rlast = (sync1[R_DATA_FIFO_WIDTH-1:R_DATA_FIFO_WIDTH-(DATA_WIDTH+RESPONSE_WIDTH)] == out_rdata[R_DATA_FIFO_WIDTH-1:R_DATA_FIFO_WIDTH-(DATA_WIDTH+RESPONSE_WIDTH)])?0:1;  
    assign rvalid = (r_fifo_state == SEND);
    assign rid =  sync1[R_DATA_FIFO_WIDTH-1 -: ID_WIDTH];
    assign rdata = sync1[RESPONSE_WIDTH +: DATA_WIDTH];
    assign rresp = sync1[RESPONSE_WIDTH-1:0];
    
    FIFO #(
    .DATA_WIDTH(R_DATA_FIFO_WIDTH),
    .DEPTH(R_DEPTH)
            ) R_FIFO_INST (
                .rst(areset),
                .wr_clk(r_fifo_wr_clk),
                .wr_en(wr_r_fifo_en),
                .wr_data(wr_r_fifo_data),
                .wr_ready(wr_r_fifo_ready),
                .rd_clk(aclk),
                .rd_en(wr_r_fifo_en),
                .rd_data(out_rdata),
                .rd_ready(rd_ready),
                .full(r_full),
                .empty(r_empty)
            );
            
        
        always@(posedge aclk)
        begin
            if(areset)
                begin
                    r_fifo_rd_en<=0;
                    r_fifo_state <= IDEL;
                end
                
            else
                begin
                    case(r_fifo_state)
                        IDEL : 
                            begin
                                if(!r_empty)
                                    begin
                                        r_fifo_state <= READ;
                                    end
                                else
                                    begin
                                        r_fifo_state <= IDEL;
                                    end
                            end
                        READ :
                            begin 
                                r_fifo_rd_en <=1;
                                if(!rd_ready)
                                    begin
                                        sync1 <= out_rdata;
                                        r_fifo_state <= SYNCRONIZE;
                                    end
                            end
                        SYNCRONIZE:
                            begin
//                                sync2 <= sync1;
                                r_fifo_state <= SEND;
                            end
                        SEND :
                            begin
                                if(rvalid && rready)
                                    begin
                                        r_fifo_state <= IDEL;
                                        
                                    end
                            end
                    endcase
                end
        end
    
endmodule
