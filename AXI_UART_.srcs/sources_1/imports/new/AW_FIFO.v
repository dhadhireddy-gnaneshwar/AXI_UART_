module AW_FIFO #(parameter ADDR_WIDTH=32, 
    parameter DATA_WIDTH=64,
    parameter ID_WIDTH = 4,
    parameter SIZE_WIDTH=4,
    parameter LEN_WIDTH=8,
    parameter RESPONSE_WIDTH=3,
    parameter AW_DEPTH = 32) (
    //AXI AW CHANNEL PORT DEFINATION
    input Aclk,
    input areset,
    input awvalid,
    input [ADDR_WIDTH-1:0] awaddr,
    input [SIZE_WIDTH-1:0] awsize,
    input [LEN_WIDTH-1:0] awlen,
    input [1:0] awburst,
    input [ID_WIDTH-1:0] awid,
    output awready,
    output awfull,
    output awempty,
    //READ_PORT_DEFINATION
    input rd_clk,
    input addr_read,
    output [ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+1:0] out_addr,
    output addr_read_ready
 );
    wire [ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+1:0] data;
    
    localparam AW_FIFO_WIDTH = ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+2;
    assign data = {awburst,awid,awlen,awsize,awaddr};
 
    FIFO #(
    .DATA_WIDTH(AW_FIFO_WIDTH),
    .DEPTH(AW_DEPTH)) AWFIFO (
                    .rst(areset),
                    .wr_clk(Aclk),
                    .wr_en(awvalid),
                    .wr_data(data),
                    .wr_ready(awready),
                    .rd_clk(rd_clk),
                    .rd_en(addr_read),
                    .rd_data(out_addr),
                    .rd_ready(addr_read_ready),
                    .full(awfull),
                    .empty(awempty)
);

    always@(posedge Aclk)
        begin
            
        end

endmodule