`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 17:31:51
// Design Name: 
// Module Name: AXI_MASTER_TEST
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

module AXI_MASTER_tb;

    // Parameters
    parameter ADDR_WIDTH = 32;
    parameter DATA_WIDTH = 64;
    parameter ID_WIDTH = 4;
    parameter SIZE_WIDTH = 4;
    parameter LEN_WIDTH = 8;
    parameter RESPONSE_WIDTH = 3;

    // DUT Inputs
    reg trigger, r_trigger;
    reg [ADDR_WIDTH-1:0] in_addr;
    reg [ID_WIDTH-1:0] in_id;
    reg [LEN_WIDTH-1:0] in_len;
    reg [1:0] burst_type;
    reg [(DATA_WIDTH/8)-1:0] in_strb;

    reg aclk, areset;

    reg awready;
    wire [ADDR_WIDTH-1:0] awaddr;
    wire [ID_WIDTH-1:0] awid;
    wire [SIZE_WIDTH-1:0] awsize;
    wire [1:0] awburst;
    wire [LEN_WIDTH-1:0] awlen;
    wire awvalid;

    wire wvalid;
    reg wready;
    wire [DATA_WIDTH-1:0] wdata;
    wire [(ADDR_WIDTH/8)-1:0] wstrb;
    wire wlast;

    reg bvalid;
    reg [RESPONSE_WIDTH-1:0] bresp;
    reg [ID_WIDTH-1:0] bid;
    wire bready;

    reg arready;
    wire [ADDR_WIDTH-1:0] araddr;
    wire [ID_WIDTH-1:0] arid;
    wire [SIZE_WIDTH-1:0] arsize;
    wire [1:0] arburst;
    wire [LEN_WIDTH-1:0] arlen;
    wire arvalid;

    wire rready;
    reg rvalid;
    reg [DATA_WIDTH-1:0] rdata;
    reg [ID_WIDTH-1:0] rid;
    reg rlast;
    reg [RESPONSE_WIDTH-1:0] rresp;

    // DUT instantiation
    AXI_MASTER #(
        .ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH), .ID_WIDTH(ID_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH), .LEN_WIDTH(LEN_WIDTH), .RESPONSE_WIDTH(RESPONSE_WIDTH)
    ) dut (
        .trigger(trigger),
        .r_trigger(r_trigger),
        .in_addr(in_addr),
        .in_id(in_id),
        .in_len(in_len),
        .burst_type(burst_type),
        .in_strb(in_strb),
        .aclk(aclk),
        .areset(areset),
        .awready(awready),
        .awaddr(awaddr),
        .awid(awid),
        .awsize(awsize),
        .awburst(awburst),
        .awlen(awlen),
        .awvalid(awvalid),
        .wvalid(wvalid),
        .wready(wready),
        .wdata(wdata),
        .wstrb(wstrb),
        .wlast(wlast),
        .bvalid(bvalid),
        .bresp(bresp),
        .bid(bid),
        .bready(bready),
        .arready(arready),
        .araddr(araddr),
        .arid(arid),
        .arsize(arsize),
        .arburst(arburst),
        .arlen(arlen),
        .arvalid(arvalid),
        .rready(rready),
        .rvalid(rvalid),
        .rdata(rdata),
        .rid(rid),
        .rlast(rlast),
        .rresp(rresp)
    );

    // Clock generation
    always #5 aclk = ~aclk;

    initial begin
        // Initial conditions
        aclk = 0;
        areset = 1;
        trigger = 0;
        r_trigger = 0;
        awready = 0;
        wready = 0;
        bvalid = 0;
        arready = 0;
        rvalid = 0;
        rlast = 0;
        in_addr = 32'h4000_0000;
        in_id = 4'h1;
        in_len = 8'd3;
        burst_type = 2'b01;
        in_strb = 8'hFF;

        #20;
        areset = 0;

        // ---------------- WRITE TRANSACTION ----------------
        #10;
        trigger = 1;
        #10;
        trigger = 0;

        // AW handshake
        wait(awvalid);
        #10 awready = 1;
        #10 awready = 0;

        // W handshake
        wait(wvalid);
        repeat(3) begin
            #10 wready = 1;
        end
        #10 wready = 0;

        // B response
        #10 bvalid = 1; bid = 4'h1; bresp = 3'b000;
        #10 bvalid = 0;

        // ---------------- READ TRANSACTION ----------------
        #30;
        r_trigger = 1;
        #10;
        r_trigger = 0;

        wait(arvalid);
        #50;
        
        #10 arready = 1;
        #10 arready = 0;

        #10;
        rvalid = 1; rid = 4'h1; rdata = 64'hA5A5A5A5A5A5A5A5; rlast = 0;
        #10 rvalid = 1; rlast = 0;
        #10 rvalid = 1; rlast = 1;
        #10 rvalid = 0;

        // ---------------- PASS / FAIL CHECK ----------------
        #50;
        if (awaddr == 32'h4000_0000 && wlast == 1 && araddr == 32'h4000_0000 && rlast == 1)
            $display("TEST PASSED ?");
        else
            $display("TEST FAILED ?");

    end

endmodule

