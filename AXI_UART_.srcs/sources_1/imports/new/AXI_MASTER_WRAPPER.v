module AXI_TOP_WRAPPER #(parameter ADDR_WIDTH = 32,
     parameter DATA_WIDTH = 64,
     parameter ID_WIDTH = 4,  
     parameter SIZE_WIDTH = 4, 
     parameter LEN_WIDTH = 8,
     parameter RESPONSE_WIDTH = 3,
     parameter AR_DEPTH =32,
     parameter W_DEPTH =32,
     parameter AW_DEPTH =32,
     parameter R_DEPTH =32,
     parameter ADDR_OFFSET = 16'h E000,
     parameter CONTL_REG_WIDTH = 32,
     parameter STATUS_REG_WIDTH =32,
     parameter UART_TX_FIFO_DEPTH = 550,
     parameter UART_RX_FIFO_DEPTH = 32,
     parameter BASE_ADDRESS  = 16'hE100,
     parameter START_OFFSET = 16'h0000,
     parameter END_OFFSET  = 16'h00810,
     parameter OFFSET_START_BITS = 8,
     parameter CTRL_REG_WIDTH =32
     )
     
(
    input trigger,
    input r_trigger,
    input aclk,
    input areset,
    input rd_clk,
    input [ADDR_WIDTH-1:0] in_addr,
    input [DATA_WIDTH-1:0] axi_in_data,
    
    input [ID_WIDTH-1:0] in_id,
    input [LEN_WIDTH-1:0] in_len,
    input [SIZE_WIDTH-1:0] in_size,
    input [1:0] burst_type,
    input [(DATA_WIDTH/8)-1:0] in_strb,
    output rx_done_uart,
    output rvalid_out,
    output rlast_out,
//    //FIFO AW READ PORTS
//    input addr_read,
//    output [ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+1:0] out_addr,
//    output awfull,
//    output awempty,
//    output addr_read_ready,
//    //FIFO W READ PORTS
//    input read_wdata,
//    output w_full,
//    output w_empty,
//    output [DATA_WIDTH+(DATA_WIDTH/8)-1:0] out_wdata,
    //FIFO AR READ PORTS
//    input ar_addr_read,
    output ar_read_ready,
    output arfull,
    output arempty,
    output [ADDR_WIDTH+ID_WIDTH+SIZE_WIDTH+LEN_WIDTH+1:0] ar_addr_out,
    //FIFO READ DATA PORT DECLARATION 
//    output [ID_WIDTH+DATA_WIDTH+RESPONSE_WIDTH-1:0] wr_r_fifo_data,
//    input wr_r_fifo_en,
//    output wr_r_fifo_ready,
    output r_tx,
    input r_rx,
//    output r_full,
//    output r_empty,
    
    output [DATA_WIDTH-1:0] read_data_out,
    output [RESPONSE_WIDTH-1:0] read_resp,
    output [RESPONSE_WIDTH-1:0] write_resp,
    output [ID_WIDTH-1:0] read_id,
    output [ID_WIDTH-1:0] write_id,
    output wvalid_o,
    //write controllrt ports
    
    output tx_data_valid,
    output [$clog2(UART_TX_FIFO_DEPTH*(DATA_WIDTH/8)):0] tx_fifo_mem_left,
    output tx_ready,
    output [DATA_WIDTH-1:0] axi_out_data
);
    
    wire [ID_WIDTH+DATA_WIDTH+RESPONSE_WIDTH-1:0] wr_r_fifo_data;
    wire  [DATA_WIDTH-1:0] tx_data;
    wire  [DATA_WIDTH-1:0] rx_data;
    wire [ADDR_WIDTH-1:0] awaddr;
    wire [ID_WIDTH-1:0] awid;
    wire [SIZE_WIDTH-1:0] awsize;
    wire [1:0] awburst;
    wire [LEN_WIDTH-1:0] awlen;
    wire awvalid;
    wire awready;
    

    wire wvalid;
    wire wready;
    wire [DATA_WIDTH-1:0] wdata,w_data;
     wire [DATA_WIDTH-1:0]w_out_wdata;
    wire [(DATA_WIDTH/8)-1:0] wstrb;
    wire wlast;

    wire w_bvalid;
    wire [RESPONSE_WIDTH-1:0] w_bresp;
    wire [ID_WIDTH-1:0] w_bid;
    wire w_bready;

    wire arvalid;
    wire [ADDR_WIDTH-1:0] araddr;
    wire [ID_WIDTH-1:0] arid;
    wire [SIZE_WIDTH-1:0] arsize;
    wire [1:0] arburst;
    wire [LEN_WIDTH-1:0] arlen;
    wire arready;

    wire rready;
    wire rvalid;
    wire [DATA_WIDTH-1:0] rdata;
    wire [ID_WIDTH-1:0] rid;
    wire rlast;
    wire [RESPONSE_WIDTH-1:0] rresp;
    wire [ADDR_WIDTH+LEN_WIDTH+SIZE_WIDTH+ID_WIDTH+1:0] out_addr_o;
    wire out_data_ready;
    wire uart_clk_o;
    //WRITE CONTROLLER
    wire [OFFSET_START_BITS-1:0] addr;
    assign out_data_ready = read_wdata ;
    assign wvalid_o = wready;
    assign rvalid_out = rvalid;
    assign rlast_out = rlast;
    assign axi_out_data = rdata;
    AXI_MASTER #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .RESPONSE_WIDTH(RESPONSE_WIDTH)
    ) master_inst (
        .trigger(trigger),
        .r_trigger(r_trigger),
        .in_addr(in_addr),
        .in_id(in_id),
        .in_len(in_len),
        .in_size(in_size),
        .burst_type(burst_type),
        .in_data(axi_in_data),
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
        .wdata(w_data), 
        .wstrb(wstrb),
        .wlast(wlast),
        .bvalid(w_bvalid),
        .bresp(w_bresp),
        .bid(w_bid),
        .bready(w_bready),
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
        .rresp(rresp),
        .read_data_out(read_data_out),
        .read_id(read_id),
        .read_resp(read_resp),
        .out_bresp(write_resp),
        .out_bid(write_id)
    );
//    AXI_SLAVE #(
//        .ADDR_WIDTH(ADDR_WIDTH),
//        .DATA_WIDTH(DATA_WIDTH),
//        .ID_WIDTH(ID_WIDTH),
//        .SIZE_WIDTH(SIZE_WIDTH),
//        .LEN_WIDTH(LEN_WIDTH),
//        .RESPONSE_WIDTH(RESPONSE_WIDTH)
//    ) slave_inst (
//        .aclk(aclk),
//        .areset(areset),
//        .awaddr(awaddr),
//        .awid(awid),
//        .awsize(awsize),
//        .awburst(awburst),
//        .awlen(awlen),
//        .awvalid(awvalid),
//        .awready(awready),
//        .wvalid(wvalid),
//        .wdata(wdata),
//        .wstrb(wstrb),  
//        .wlast(wlast),
//        .wready(wready),
//        .bvalid(bvalid),
//        .bresp(bresp),
//        .bid(bid),
//        .bready(bready),
//        .arvalid(arvalid),
//        .araddr(araddr),
//        .arid(arid),
//        .arsize(arsize),
//        .arburst(arburst),
//        .arlen(arlen),
//        .arready(arready),
//        .rvalid(rvalid),
//        .rdata(rdata),
//        .rid(rid),
//        .rlast(rlast),
//        .rresp(rresp),
//        .rready(rready),
//        .rd_clk(rd_clk),
//        .addr_read(addr_read),
//        .out_addr(out_addr),  // just for example; update if different signal is intended
//        .addr_read_ready(addr_read_ready)
//    );

     WRITE_BUFFER #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .RESPONSE_WIDTH(RESPONSE_WIDTH),
        .AW_DEPTH(AW_DEPTH),
        .W_DEPTH(W_DEPTH)) WRT_BUFFER_INST (
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
                .out_addr(out_addr_o),         
                .addr_read_ready(addr_read_ready) , 
                // WRITE DATA W FIFO PORT
                .wvalid(wvalid),
                .in_wdata(w_data),
                .in_wstrb(wstrb),
                .wlast(wlast),
                .wready(wready), 
                // WRITE DATA READ DATA
                .read_wdata(read_wdata),
                .out_wdata_ready(out_wdata_ready),
                .w_full(w_full),
                .w_empty(w_empty),
                .out_wdata(w_out_wdata)
          );
          
    
      READ_BUFFER #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .RESPONSE_WIDTH(RESPONSE_WIDTH),
        .AR_DEPTH(AR_DEPTH),
        .R_DEPTH(R_DEPTH)
    ) INST_READ_BUFFER (
        // Write ADDRESS(AR) Channel
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
        
        
    
        // Read channel
        
        
);
        
WRITE_BUFFER_CONTROLLER #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .SIZE_WIDTH(SIZE_WIDTH),
    .LEN_WIDTH(LEN_WIDTH),
    .RESPONSE_WIDTH(RESPONSE_WIDTH),
    .AR_DEPTH(AR_DEPTH),
    .W_DEPTH(W_DEPTH),
    .AW_DEPTH(AW_DEPTH),
    .R_DEPTH(R_DEPTH),
    .ADDR_OFFSET(ADDR_OFFSET),
    .CONTL_REG_WIDTH(CONTL_REG_WIDTH),
    .STATUS_REG_WIDTH(STATUS_REG_WIDTH),
    .UART_TX_FIFO_DEPTH(UART_TX_FIFO_DEPTH),
    .UART_RX_FIFO_DEPTH(UART_RX_FIFO_DEPTH),
    .BASE_ADDRESS(BASE_ADDRESS),
    .START_OFFSET(START_OFFSET),
    .END_OFFSET(END_OFFSET),
    .OFFSET_START_BITS(OFFSET_START_BITS)
) WRITE_CONTROL (
    .rd_clk(rd_clk),            // inp
    .rst(areset),               // inp
    .addr_read(addr_read),         // o
    .out_addr(out_addr_o),          // 
//    .awfull(awfull),            // inp
    .awempty(awempty),           
    .addr_read_ready(addr_read_ready), 
    .read_wdata(read_wdata),        
    .out_data_ready(out_wdata_ready),   
//    .w_full(w_full),            
    .w_empty(w_empty),           
    .out_wdata(w_out_wdata),        
    .bvalid(w_bvalid),            
    .bresp(w_bresp),             
    .bid(w_bid),               
    .bready(w_bready),            
    .tx_data(tx_data),           
    .tx_data_valid(tx_data_valid),     
    .addr(addr),              
    .tx_fifo_mem_left(tx_fifo_mem_left),
    .tx_ready(tx_ready)           // in
);

// reg [7:0] achara ;
// initial achara = 8'h41;
 
// $display("the data is %c ===================",achara);
// Module Instantiation
wire [7:0] rx_addr;
READ_BUFFER_CONTROLLER #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .SIZE_WIDTH(SIZE_WIDTH),
    .LEN_WIDTH(LEN_WIDTH),
    .RESPONSE_WIDTH(RESPONSE_WIDTH),
    .AR_DEPTH(AR_DEPTH),
    .W_DEPTH(W_DEPTH),
    .AW_DEPTH(AW_DEPTH),
    .R_DEPTH(R_DEPTH),
    .ADDR_OFFSET(ADDR_OFFSET),
    .CONTL_REG_WIDTH(CONTL_REG_WIDTH),
    .STATUS_REG_WIDTH(STATUS_REG_WIDTH),
    .UART_TX_FIFO_DEPTH(UART_TX_FIFO_DEPTH),
    .UART_RX_FIFO_DEPTH(UART_RX_FIFO_DEPTH),
    .BASE_ADDRESS(BASE_ADDRESS),
    .START_OFFSET(START_OFFSET),
    .END_OFFSET(END_OFFSET),
    .OFFSET_START_BITS(OFFSET_START_BITS)
) read_buffer_ctrl_inst (
    .rd_clk(rd_clk),
    .rst(areset),

    // FIFO AR READ
    .ar_addr_read(ar_addr_read),
    .ar_read_ready(ar_read_ready),
//    .arfull(arfull),
    .arempty(arempty),
    .ar_addr_out(ar_addr_out),

    // FIFO R WRITE
//    .r_fifo_wr_clk(rd_clk),
    .wr_r_fifo_data(wr_r_fifo_data),
    .wr_r_fifo_en(wr_r_fifo_en),
//    .wr_r_fifo_ready(wr_r_fifo_ready),
//    .r_full(r_full),
//    .r_empty(r_empty),

    // UART CONTROLLER INTERFACE
    .rx_data(rx_data),
    .rx_data_valid(rx_data_valid),
    .addr(rx_addr),
    .rx_en(rx_en),
//    .char_time_out(char_time_out),
    
    //READ CHANNEL
    .aclk(aclk),
    .rvalid(rvalid),
    .rdata(rdata),
    .rid(rid),
    .rlast(rlast),
    .rresp(rresp),
    .rready(rready)
);
            
wire sample_clk,clk_en;
wire [30:0]r_baud_rate;
wire [4:0] r_sample_rate;
    UART_CONTROLLER #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .SIZE_WIDTH(SIZE_WIDTH),
    .LEN_WIDTH(LEN_WIDTH),
    .RESPONSE_WIDTH(RESPONSE_WIDTH),
    .AR_DEPTH(AR_DEPTH),
    .W_DEPTH(W_DEPTH),
    .AW_DEPTH(AW_DEPTH),
    .R_DEPTH(R_DEPTH),
    .ADDR_OFFSET(ADDR_OFFSET),
    .CONTL_REG_WIDTH(CONTL_REG_WIDTH),
    .STATUS_REG_WIDTH(STATUS_REG_WIDTH),
    .UART_TX_FIFO_DEPTH(UART_TX_FIFO_DEPTH),
    .UART_RX_FIFO_DEPTH(UART_RX_FIFO_DEPTH),
    .CTRL_REG_WIDTH(CTRL_REG_WIDTH)
) UART_CONTROL (
    // UART CONTROLLER PORT
    .uart_clk(uart_clk_o), 
    .rx_done(rx_done_uart),
    .sample_clk(sample_clk),
    // WRITE BUFFER CONTROLLER PORT 
    .rd_clk(rd_clk),
    .tx_data(tx_data),
    .tx_data_valid(tx_data_valid),
    .tx_addr(addr),
    .tx_fifo_mem_left(tx_fifo_mem_left),
    .tx_ready(tx_ready),

    // READ BUFFER CONTROLLER PORT 
    .rx_data(rx_data),
    .rx_data_valid(rx_data_valid),
    .rx_addr(rx_addr),
    .rx_en(rx_en),
//    .char_time_out(char_time_out),
////
    // UART PORTS
    .rx(r_rx),
    .tx(r_tx),
    
    //UART TO BAUD RATE GENRATOR
    .baud_rate(r_baud_rate),
    .sample_rate_o(r_sample_rate),
    .baud_en(clk_en),
    .rst(areset)
);

    BAUD_GENRATOR BAUD_CLK_GEN(
                .ref_clk(rd_clk),
                .uart_clk_o(uart_clk_o),
                .sample_clk(sample_clk),
                .baud_rate(r_baud_rate),
                .sample_rate(r_sample_rate),
                .rst(clk_en)
                );

endmodule
