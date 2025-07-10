`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2025 15:33:31
// Design Name: 
// Module Name: AR_FIFO
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


module AR_FIFO #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 64,
    parameter ID_WIDTH = 4,
    parameter SIZE_WIDTH = 4,
    parameter LEN_WIDTH = 8,
    parameter RESPONSE_WIDTH = 3,
    parameter AR_DEPTH =32
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
    localparam AR_FIFO_WIDTH = ADDR_WIDTH+ID_WIDTH+SIZE_WIDTH+LEN_WIDTH+2;
    wire [AR_FIFO_WIDTH-1:0] ar_in_addr;
    
    assign ar_in_addr = {arburst,arid,arlen,arsize,araddr};
     FIFO #(
    .DATA_WIDTH(AR_FIFO_WIDTH),
    .DEPTH(AR_DEPTH)) ARFIFO (
                    .rst(areset),
                    .wr_clk(aclk),
                    .wr_en(arvalid),
                    .wr_data(ar_in_addr),
                    .wr_ready(arready),
                    .rd_clk(rd_clk),
                    .rd_en(ar_addr_read),
                    .rd_data(ar_addr_out),
                    .rd_ready(ar_read_ready),
                    .full(arfull),
                    .empty(arempty)
);
endmodule
