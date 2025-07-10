`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2025 12:41:03
// Design Name: 
// Module Name: READ_BUFFER
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


module READ_BUFFER#(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 64,
    parameter ID_WIDTH = 4,
    parameter SIZE_WIDTH = 4,
    parameter LEN_WIDTH = 8,
    parameter RESPONSE_WIDTH = 3,
    parameter AR_DEPTH =32,
    parameter R_DEPTH = 32
)(
     // Read Address Channel (AR) FIFO WRITE 
    input aclk,
    input areset,
    input arvalid,
    input [ADDR_WIDTH-1:0] araddr,
    input [ID_WIDTH-1:0] arid,
    input [SIZE_WIDTH-1:0] arsize,
    input [1:0] arburst,
    input [LEN_WIDTH-1:0] arlen,
    output arready,
    
    //ADDRESS READ CHANNEL FIFO READ PORT DECLARATION
    input rd_clk,
    input ar_addr_read,
    output ar_read_ready,
    output arfull,
    output arempty,
    output [ADDR_WIDTH+ID_WIDTH+SIZE_WIDTH+LEN_WIDTH+1:0] ar_addr_out
    
    
    );
    
    AR_FIFO #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .SIZE_WIDTH(SIZE_WIDTH),
    .LEN_WIDTH(LEN_WIDTH),
    .RESPONSE_WIDTH(RESPONSE_WIDTH),
    .AR_DEPTH(AR_DEPTH)
) AR_FIFO_INST_READ_BUFFER (
    // Write (AR) Channel
    .aclk(aclk),
    .areset(areset),
    .arvalid(arvalid),
    .araddr(araddr),
    .arid(arid),
    .arsize(arsize),
    .arburst(arburst),
    .arlen(arlen),
    .arready(arready),

    // Read side
    .rd_clk(rd_clk),
    .ar_addr_read(ar_addr_read),
    .ar_read_ready(ar_read_ready),
    .arfull(arfull),
    .arempty(arempty),
    .ar_addr_out(ar_addr_out)
);

//    R_FIFO #(
//    .ADDR_WIDTH(ADDR_WIDTH),
//    .DATA_WIDTH(DATA_WIDTH),
//    .ID_WIDTH(ID_WIDTH),
//    .SIZE_WIDTH(SIZE_WIDTH),
//    .LEN_WIDTH(LEN_WIDTH),
//    .RESPONSE_WIDTH(RESPONSE_WIDTH),
//    .R_DEPTH(R_DEPTH)
//) r_fifo_inst (
//    .r_fifo_wr_clk(r_fifo_wr_clk),
//    .wr_r_fifo_data(wr_r_fifo_data),
//    .wr_r_fifo_en(wr_r_fifo_en),
//    .wr_r_fifo_ready(wr_r_fifo_ready),
//    .r_full(r_full),
//    .r_empty(r_empty),

//    // Read channel
//    .aclk(aclk),
//    .areset(areset),
//    .rvalid(rvalid),
//    .rdata(rdata),
//    .rid(rid),
//    .rlast(rlast),
//    .rresp(rresp),
//    .rready(rready)
//);


endmodule
