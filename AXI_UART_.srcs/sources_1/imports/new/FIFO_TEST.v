`timescale 1ns / 1ps

module FIFO_tb;

    parameter DATA_WIDTH = 32;
    parameter DEPTH = 4;

    reg rst;
    reg wr_clk, rd_clk;
    reg wr_en, rd_en;
    reg [DATA_WIDTH-1:0] wr_data;
    wire [DATA_WIDTH-1:0] rd_data;
    wire wr_ready, rd_ready;
    wire full, empty;

    // Instantiate FIFO
    FIFO #(DATA_WIDTH, DEPTH) uut (
        .rst(rst),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_data(wr_data),
        .wr_ready(wr_ready),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_data(rd_data),
        .rd_ready(rd_ready),
        .full(full),
        .empty(empty)
    );

    // Clocks
    always #5 wr_clk = ~wr_clk;
    always #7 rd_clk = ~rd_clk;

    integer i;

    initial begin
        // Initialize
        wr_clk = 0; rd_clk = 0;
        rst = 1; wr_en = 0; rd_en = 0; wr_data = 0;

        #20;
        rst = 0;

        // === Test Write Until Full ===
        $display("Starting Write Test...");
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(posedge wr_clk);
            if (!full) begin
                wr_en = 1;
                wr_data = i + 100;
            end
            @(posedge wr_clk);
            wr_en = 0;
        end

        $display("Write Test Completed. Full = %b", full);

        // Wait a few cycles
        #40;

        // === Test Read Until Empty ===
        $display("Starting Read Test...");
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(posedge rd_clk);
            if (!empty) begin
                rd_en = 1;
            end
            @(posedge rd_clk);
            rd_en = 0;
        end

        $display("Read Test Completed. Empty = %b", empty);

        // Done
        #20;
        $finish;
    end

endmodule
