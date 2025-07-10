`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//    
// Create Date: 15.05.2025 17:01:23
// Design Name: 
// Module Name: WRITE_BUFFER
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


module WRITE_BUFFER #(parameter ADDR_WIDTH=32, 
    parameter DATA_WIDTH=64,
    parameter ID_WIDTH = 4,
    parameter SIZE_WIDTH=4,
    parameter LEN_WIDTH=8,
    parameter RESPONSE_WIDTH=3,
    parameter W_DEPTH =32,
    parameter AW_DEPTH =32
    ) (
    input Aclk,
    input areset,
    //AXI AW FIFO WRITE PORT DEFINATION
    input awvalid,
    input [ADDR_WIDTH-1:0] awaddr,
    input [SIZE_WIDTH-1:0] awsize,
    input [LEN_WIDTH-1:0] awlen,
    input [1:0] awburst,
    input [ID_WIDTH-1:0] awid,
    output awready,
    output awfull,
    output awempty,
    //AW FIFO READ_PORT_DEFINATION
    input rd_clk,
    input addr_read,
    output [ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+1:0] out_addr,
    output addr_read_ready,
    //AXI W CHANNEL FIFO WRITE PORT DECLARATION
    input wvalid,
    input [DATA_WIDTH-1:0] in_wdata,
    input [(DATA_WIDTH/8)-1:0] in_wstrb,
    input wlast,
    output wready,
    //W CHANNEL FIFO READ_PORT_DEFINATION
    input read_wdata,
    output out_wdata_ready,
    output w_full,
    output w_empty,
    output [DATA_WIDTH+(DATA_WIDTH/8)-1:0] out_wdata
    );
    
    AW_FIFO 
            #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .RESPONSE_WIDTH(RESPONSE_WIDTH),
        .AW_DEPTH(AW_DEPTH))AW_FIFO_INST(
                // AXI AW Channel Ports
                .Aclk(Aclk),             
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
            
                // Read Port Signals
                .rd_clk(rd_clk),           
                .addr_read(addr_read),        
                .out_addr(out_addr),         
                .addr_read_ready(addr_read_ready)   
          );
          
          
    W_FIFO #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .RESPONSE_WIDTH(RESPONSE_WIDTH),
        .W_DEPTH(W_DEPTH)) 
        
        W_FIFO_INST (
                    .aclk(Aclk),
                    .areset(areset),
                    
                    .wvalid(wvalid),
                    .wfifo_wdata(in_wdata),
                    .wfifo_wstrb(in_wstrb),
                    .wlast(wlast),
                    .wready(wready),
                    
                    .rd_clk(rd_clk),
                    .read_wdata(read_wdata),
                    .out_data_ready(out_wdata_ready),
                    .w_full(w_full),
                    .w_empty(w_empty),
                    .out_wdata(out_wdata)
                     );
                
endmodule
