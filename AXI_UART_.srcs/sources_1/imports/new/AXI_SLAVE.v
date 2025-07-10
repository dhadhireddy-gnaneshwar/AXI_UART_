`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2025 12:11:17
// Design Name: 
// Module Name: AXI_SLAVE
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

module AXI_SLAVE #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 64,
    parameter ID_WIDTH = 4,
    parameter SIZE_WIDTH = 4,
    parameter LEN_WIDTH = 8,
    parameter RESPONSE_WIDTH = 3
)(
    input aclk,
    input areset,

    // Write Address Channel (AW)
    input [ADDR_WIDTH-1:0] awaddr,
    input [ID_WIDTH-1:0] awid,
    input [SIZE_WIDTH-1:0] awsize,
    input [1:0] awburst,
    input [LEN_WIDTH-1:0] awlen,
    input awvalid,
    output  awready,

    // Write Data Channel (W)
    input wvalid,
    input [DATA_WIDTH-1:0] wdata,
    input [(DATA_WIDTH/8)-1:0] wstrb,
    input wlast,
    output reg wready,

    // Write Response Channel (B)
    output reg bvalid,
    output reg [RESPONSE_WIDTH-1:0] bresp,
    output reg [ID_WIDTH-1:0] bid,
    input bready,

    // Read Address Channel (AR)
    input arvalid,
    input [ADDR_WIDTH-1:0] araddr,
    input [ID_WIDTH-1:0] arid,
    input [SIZE_WIDTH-1:0] arsize,
    input [1:0] arburst,
    input [LEN_WIDTH-1:0] arlen,
    output reg arready,

    // Read Data Channel (R)
    output reg rvalid,
    output reg [DATA_WIDTH-1:0] rdata,
    output reg [ID_WIDTH-1:0] rid,
    output reg rlast,
    output reg [RESPONSE_WIDTH-1:0] rresp,
    input rready,    
    //WRITE CONTROLLER PORT DECLARATION
    input rd_clk,
    input addr_read,
    output [ADDR_WIDTH-1:0] out_addr,
    output addr_read_ready
);


    WRITE_CONTROLLER #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .RESPONSE_WIDTH(RESPONSE_WIDTH)) WRT_CONTRLER_INST (
                // AXI AW Channel Ports
                .Aclk(aclk),             
                .areset(areset),           
                .awvalid(awvalid),         
                .awaddr(awaddr),           
                .awsize(awsize),           
                .awlen(awlen),            
                .awburst(awburst),          
                .awid(awid),             
                .awready(awready),          
                .awfull(awfull),           
                .awempty(awempty),          
                // ADDRESS WRITE Read Port Signals
                .rd_clk(rd_clk),           
                .addr_read(addr_read),        
                .out_addr(out_addr),         
                .addr_read_ready(addr_read_ready)  
                // WRITE DATA W FIFO PORT
                .wvalid(wvalid),
                .wdata(wdata),
                .wstrb(wstrb),
                .wlast(wlast),
                .wready(wready), 
                // WRITE DATA READ DATA
                read_wdata(read_wdata),
                .out_data_ready(out_wdata_ready),
                .w_full(w_full),
                .w_empty(w_empty),
                .out_wdata(out_wdata)
          );
        
        
endmodule
