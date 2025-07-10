module W_FIFO #(parameter ADDR_WIDTH=32, 
    parameter DATA_WIDTH=64,
    parameter ID_WIDTH = 4,
    parameter SIZE_WIDTH=4,
    parameter LEN_WIDTH=8,
    parameter RESPONSE_WIDTH=3,
    parameter W_DEPTH =32 )(
    
    input aclk,
    input areset,
    
    input wvalid,
    input [DATA_WIDTH-1:0] wfifo_wdata,
    input [(DATA_WIDTH/8)-1:0] wfifo_wstrb,
    input wlast,
    output wready,
    
    input rd_clk,
    input read_wdata,
    output out_data_ready,
    output w_full,
    output w_empty,
    output [DATA_WIDTH-1:0] out_wdata
    );
    
    localparam WDATA_FIFO_WIDTH = DATA_WIDTH + (DATA_WIDTH/8+1);
    wire [WDATA_FIFO_WIDTH-1:0] data;
    wire [WDATA_FIFO_WIDTH-1:0] w_data;
    assign data = {wlast,wfifo_wstrb, wfifo_wdata};
    assign out_wdata = w_data[DATA_WIDTH-1:0];
    FIFO #(
    .DATA_WIDTH(WDATA_FIFO_WIDTH),
    .DEPTH(W_DEPTH)
            ) W_FIFO_INST (
                .rst(areset),
                .wr_clk(aclk),
                .wr_en(wvalid),
                .wr_data(data),
                .wr_ready(wready),
                .rd_clk(rd_clk),
                .rd_en(read_wdata),
                .rd_data(w_data),
                .rd_ready(out_data_ready),
                .full(w_full),
                .empty(w_empty)
            );
endmodule