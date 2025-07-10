// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Jun 30 18:22:54 2025
// Host        : GNANESHWAR running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/demon/INTERNSHIP/src_sim_vivado/AXI_UART_/AXI_UART_.sim/sim_1/synth/func/xsim/AXI_TOP_TEST_func_synth.v
// Design      : AXI_TOP_WRAPPER
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tlfbv676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ADDR_WIDTH = "32" *) (* AR_DEPTH = "32" *) (* AR_FIFO_WIDTH = "50" *) 
(* DATA_WIDTH = "64" *) (* ID_WIDTH = "4" *) (* LEN_WIDTH = "8" *) 
(* RESPONSE_WIDTH = "3" *) (* SIZE_WIDTH = "4" *) 
module AR_FIFO
   (aclk,
    areset,
    arvalid,
    araddr,
    arid,
    arsize,
    arburst,
    arlen,
    arready,
    rd_clk,
    ar_addr_read,
    ar_read_ready,
    arfull,
    arempty,
    ar_addr_out);
  input aclk;
  input areset;
  input arvalid;
  input [31:0]araddr;
  input [3:0]arid;
  input [3:0]arsize;
  input [1:0]arburst;
  input [7:0]arlen;
  output arready;
  input rd_clk;
  input ar_addr_read;
  output ar_read_ready;
  output arfull;
  output arempty;
  output [49:0]ar_addr_out;

  wire aclk;
  wire [49:0]ar_addr_out;
  wire ar_addr_read;
  wire ar_read_ready;
  wire [31:0]araddr;
  wire [1:0]arburst;
  wire arempty;
  wire areset;
  wire arfull;
  wire [3:0]arid;
  wire [7:0]arlen;
  wire arready;
  wire arvalid;
  wire rd_clk;

  (* BYTES = "6" *) 
  (* BYTE_POINTER_WIDTH = "8" *) 
  (* COUNTER_WIDTH = "5" *) 
  (* DATA_WIDTH = "50" *) 
  (* DEPTH = "32" *) 
  (* IDEL = "2'b00" *) 
  (* READ = "2'b10" *) 
  (* WRITE = "2'b01" *) 
  FIFO ARFIFO
       (.empty(arempty),
        .full(arfull),
        .rd_clk(rd_clk),
        .rd_data(ar_addr_out),
        .rd_en(ar_addr_read),
        .rd_ready(ar_read_ready),
        .rst(areset),
        .wr_clk(aclk),
        .wr_data({arburst,arid,arlen,1'b0,1'b0,1'b0,1'b0,araddr}),
        .wr_en(arvalid),
        .wr_ready(arready));
endmodule

(* ADDR_WIDTH = "32" *) (* AW_DEPTH = "32" *) (* AW_FIFO_WIDTH = "50" *) 
(* DATA_WIDTH = "64" *) (* ID_WIDTH = "4" *) (* LEN_WIDTH = "8" *) 
(* RESPONSE_WIDTH = "3" *) (* SIZE_WIDTH = "4" *) 
module AW_FIFO
   (Aclk,
    areset,
    awvalid,
    awaddr,
    awsize,
    awlen,
    awburst,
    awid,
    awready,
    awfull,
    awempty,
    rd_clk,
    addr_read,
    out_addr,
    addr_read_ready);
  input Aclk;
  input areset;
  input awvalid;
  input [31:0]awaddr;
  input [3:0]awsize;
  input [7:0]awlen;
  input [1:0]awburst;
  input [3:0]awid;
  output awready;
  output awfull;
  output awempty;
  input rd_clk;
  input addr_read;
  output [49:0]out_addr;
  output addr_read_ready;

  wire \<const0> ;
  wire Aclk;
  wire addr_read;
  wire addr_read_ready;
  wire areset;
  wire [31:0]awaddr;
  wire [1:0]awburst;
  wire awempty;
  wire [3:0]awid;
  wire [7:0]awlen;
  wire awready;
  wire [3:0]awsize;
  wire awvalid;
  wire [49:0]out_addr;
  wire rd_clk;
  wire NLW_AWFIFO_full_UNCONNECTED;

  assign awfull = \<const0> ;
  (* BYTES = "6" *) 
  (* BYTE_POINTER_WIDTH = "8" *) 
  (* COUNTER_WIDTH = "5" *) 
  (* DATA_WIDTH = "50" *) 
  (* DEPTH = "32" *) 
  (* IDEL = "2'b00" *) 
  (* READ = "2'b10" *) 
  (* WRITE = "2'b01" *) 
  FIFO__1 AWFIFO
       (.empty(awempty),
        .full(NLW_AWFIFO_full_UNCONNECTED),
        .rd_clk(rd_clk),
        .rd_data(out_addr),
        .rd_en(addr_read),
        .rd_ready(addr_read_ready),
        .rst(areset),
        .wr_clk(Aclk),
        .wr_data({awburst,awid,awlen,awsize,awaddr}),
        .wr_en(awvalid),
        .wr_ready(awready));
  GND GND
       (.G(\<const0> ));
endmodule

(* ADDR_WIDTH = "32" *) (* DATA = "2'b10" *) (* DATA_WIDTH = "64" *) 
(* IDEL = "2'b00" *) (* ID_WIDTH = "4" *) (* LEN_WIDTH = "8" *) 
(* RESPONSE_WIDTH = "3" *) (* SIZE_WIDTH = "4" *) (* START = "2'b01" *) 
module AXI_MASTER
   (trigger,
    r_trigger,
    in_addr,
    in_id,
    in_len,
    in_size,
    burst_type,
    in_strb,
    in_data,
    out_bresp,
    out_bid,
    aclk,
    areset,
    awready,
    awaddr,
    awid,
    awsize,
    awburst,
    awlen,
    awvalid,
    wvalid,
    wready,
    wdata,
    wstrb,
    wlast,
    bvalid,
    bresp,
    bid,
    bready,
    arready,
    araddr,
    arid,
    arsize,
    arburst,
    arlen,
    arvalid,
    rready,
    rvalid,
    rdata,
    rid,
    rlast,
    rresp,
    read_data_out,
    read_resp,
    read_id);
  input trigger;
  input r_trigger;
  input [31:0]in_addr;
  input [3:0]in_id;
  input [7:0]in_len;
  input [3:0]in_size;
  input [1:0]burst_type;
  input [7:0]in_strb;
  input [63:0]in_data;
  output [2:0]out_bresp;
  output [3:0]out_bid;
  input aclk;
  input areset;
  input awready;
  output [31:0]awaddr;
  output [3:0]awid;
  output [3:0]awsize;
  output [1:0]awburst;
  output [7:0]awlen;
  output awvalid;
  output wvalid;
  input wready;
  output [63:0]wdata;
  output [7:0]wstrb;
  output wlast;
  input bvalid;
  input [2:0]bresp;
  input [3:0]bid;
  output bready;
  input arready;
  output [31:0]araddr;
  output [3:0]arid;
  output [3:0]arsize;
  output [1:0]arburst;
  output [7:0]arlen;
  output arvalid;
  output rready;
  input rvalid;
  input [63:0]rdata;
  input [3:0]rid;
  input rlast;
  input [2:0]rresp;
  output [63:0]read_data_out;
  output [2:0]read_resp;
  output [3:0]read_id;

  wire \<const0> ;
  wire FSM_sequential_ar_state_i_1_n_0;
  wire FSM_sequential_b_state_i_1_n_0;
  wire FSM_sequential_b_state_reg_n_0;
  wire FSM_sequential_r_state_i_1_n_0;
  wire \FSM_sequential_w_state[0]_i_10_n_0 ;
  wire \FSM_sequential_w_state[0]_i_3_n_0 ;
  wire \FSM_sequential_w_state[0]_i_4_n_0 ;
  wire \FSM_sequential_w_state[0]_i_5_n_0 ;
  wire \FSM_sequential_w_state[0]_i_6_n_0 ;
  wire \FSM_sequential_w_state[0]_i_7_n_0 ;
  wire \FSM_sequential_w_state[0]_i_8_n_0 ;
  wire \FSM_sequential_w_state[0]_i_9_n_0 ;
  wire \FSM_sequential_w_state_reg[0]_i_2_n_1 ;
  wire \FSM_sequential_w_state_reg[0]_i_2_n_2 ;
  wire \FSM_sequential_w_state_reg[0]_i_2_n_3 ;
  wire aclk;
  wire [31:0]araddr;
  wire [1:0]arburst;
  wire areset;
  wire [3:0]arid;
  wire [7:0]arlen;
  wire arready;
  wire arvalid;
  wire aw_state;
  wire awready;
  wire [3:0]awsize;
  wire awvalid;
  wire beat_counter;
  wire \beat_counter[0]_i_1_n_0 ;
  wire \beat_counter[1]_i_1_n_0 ;
  wire \beat_counter[2]_i_1_n_0 ;
  wire \beat_counter[3]_i_1_n_0 ;
  wire \beat_counter[4]_i_1_n_0 ;
  wire \beat_counter[4]_i_2_n_0 ;
  wire \beat_counter[5]_i_1_n_0 ;
  wire \beat_counter[5]_i_2_n_0 ;
  wire \beat_counter[6]_i_1_n_0 ;
  wire \beat_counter[7]_i_2_n_0 ;
  wire \beat_counter[7]_i_3_n_0 ;
  wire \beat_counter_reg_n_0_[0] ;
  wire \beat_counter_reg_n_0_[1] ;
  wire \beat_counter_reg_n_0_[2] ;
  wire \beat_counter_reg_n_0_[3] ;
  wire \beat_counter_reg_n_0_[4] ;
  wire \beat_counter_reg_n_0_[5] ;
  wire \beat_counter_reg_n_0_[6] ;
  wire \beat_counter_reg_n_0_[7] ;
  wire [3:0]bid;
  wire bready;
  wire [2:0]bresp;
  wire [1:0]burst_type;
  wire bvalid;
  wire [31:0]in_addr;
  wire [63:0]in_data;
  wire [3:0]in_id;
  wire [7:0]in_len;
  wire [3:0]in_size;
  wire [7:0]in_strb;
  wire [3:0]out_bid;
  wire [1:1]\^out_bresp ;
  wire [7:0]r_awlen;
  wire \r_awlen[7]_i_1_n_0 ;
  wire r_trigger;
  wire [63:0]rdata;
  wire [63:0]read_data_out;
  wire [3:0]read_id;
  wire [1:1]\^read_resp ;
  wire [3:0]rid;
  wire rlast;
  wire rready;
  wire [2:0]rresp;
  wire rvalid;
  wire trigger;
  wire [1:0]w_state;
  wire w_state11_in;
  wire [1:0]w_state__0;
  wire [63:0]wdata;
  wire wready;
  wire [7:0]wstrb;
  wire wvalid;
  wire [3:0]\NLW_FSM_sequential_w_state_reg[0]_i_2_O_UNCONNECTED ;

  assign arsize[3] = \<const0> ;
  assign arsize[2] = \<const0> ;
  assign arsize[1] = \<const0> ;
  assign arsize[0] = \<const0> ;
  assign awaddr[31] = \<const0> ;
  assign awaddr[30] = \<const0> ;
  assign awaddr[29] = \<const0> ;
  assign awaddr[28] = \<const0> ;
  assign awaddr[27] = \<const0> ;
  assign awaddr[26] = \<const0> ;
  assign awaddr[25] = \<const0> ;
  assign awaddr[24] = \<const0> ;
  assign awaddr[23] = \<const0> ;
  assign awaddr[22] = \<const0> ;
  assign awaddr[21] = \<const0> ;
  assign awaddr[20] = \<const0> ;
  assign awaddr[19] = \<const0> ;
  assign awaddr[18] = \<const0> ;
  assign awaddr[17] = \<const0> ;
  assign awaddr[16] = \<const0> ;
  assign awaddr[15] = \<const0> ;
  assign awaddr[14] = \<const0> ;
  assign awaddr[13] = \<const0> ;
  assign awaddr[12] = \<const0> ;
  assign awaddr[11] = \<const0> ;
  assign awaddr[10] = \<const0> ;
  assign awaddr[9] = \<const0> ;
  assign awaddr[8] = \<const0> ;
  assign awaddr[7] = \<const0> ;
  assign awaddr[6] = \<const0> ;
  assign awaddr[5] = \<const0> ;
  assign awaddr[4] = \<const0> ;
  assign awaddr[3] = \<const0> ;
  assign awaddr[2] = \<const0> ;
  assign awaddr[1] = \<const0> ;
  assign awaddr[0] = \<const0> ;
  assign awburst[1] = \<const0> ;
  assign awburst[0] = \<const0> ;
  assign awid[3] = \<const0> ;
  assign awid[2] = \<const0> ;
  assign awid[1] = \<const0> ;
  assign awid[0] = \<const0> ;
  assign awlen[7] = \<const0> ;
  assign awlen[6] = \<const0> ;
  assign awlen[5] = \<const0> ;
  assign awlen[4] = \<const0> ;
  assign awlen[3] = \<const0> ;
  assign awlen[2] = \<const0> ;
  assign awlen[1] = \<const0> ;
  assign awlen[0] = \<const0> ;
  assign out_bresp[2] = \<const0> ;
  assign out_bresp[1] = \^out_bresp [1];
  assign out_bresp[0] = \<const0> ;
  assign read_resp[2] = \<const0> ;
  assign read_resp[1] = \^read_resp [1];
  assign read_resp[0] = \<const0> ;
  assign wlast = \<const0> ;
  LUT3 #(
    .INIT(8'h3A)) 
    FSM_sequential_ar_state_i_1
       (.I0(r_trigger),
        .I1(arready),
        .I2(arvalid),
        .O(FSM_sequential_ar_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDEL:0,START:1," *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_ar_state_reg
       (.C(aclk),
        .CE(1'b1),
        .D(FSM_sequential_ar_state_i_1_n_0),
        .Q(arvalid),
        .R(areset));
  LUT3 #(
    .INIT(8'h74)) 
    FSM_sequential_aw_state_i_1
       (.I0(awready),
        .I1(awvalid),
        .I2(trigger),
        .O(aw_state));
  (* FSM_ENCODED_STATES = "IDEL:0,START:1" *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_aw_state_reg
       (.C(aclk),
        .CE(1'b1),
        .D(aw_state),
        .Q(awvalid),
        .R(areset));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h6)) 
    FSM_sequential_b_state_i_1
       (.I0(bvalid),
        .I1(FSM_sequential_b_state_reg_n_0),
        .O(FSM_sequential_b_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDEL:0,START:1," *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_b_state_reg
       (.C(aclk),
        .CE(1'b1),
        .D(FSM_sequential_b_state_i_1_n_0),
        .Q(FSM_sequential_b_state_reg_n_0),
        .R(areset));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h7A)) 
    FSM_sequential_r_state_i_1
       (.I0(rvalid),
        .I1(rlast),
        .I2(rready),
        .O(FSM_sequential_r_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDEL:0,START:1," *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_r_state_reg
       (.C(aclk),
        .CE(1'b1),
        .D(FSM_sequential_r_state_i_1_n_0),
        .Q(rready),
        .R(areset));
  LUT6 #(
    .INIT(64'h005500C00055FFC0)) 
    \FSM_sequential_w_state[0]_i_1 
       (.I0(w_state11_in),
        .I1(awready),
        .I2(awvalid),
        .I3(w_state[0]),
        .I4(w_state[1]),
        .I5(wready),
        .O(w_state__0[0]));
  LUT4 #(
    .INIT(16'h8421)) 
    \FSM_sequential_w_state[0]_i_10 
       (.I0(\beat_counter_reg_n_0_[0] ),
        .I1(\beat_counter_reg_n_0_[1] ),
        .I2(r_awlen[0]),
        .I3(r_awlen[1]),
        .O(\FSM_sequential_w_state[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_w_state[0]_i_3 
       (.I0(\beat_counter_reg_n_0_[7] ),
        .I1(r_awlen[7]),
        .I2(\beat_counter_reg_n_0_[6] ),
        .I3(r_awlen[6]),
        .O(\FSM_sequential_w_state[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_w_state[0]_i_4 
       (.I0(\beat_counter_reg_n_0_[5] ),
        .I1(r_awlen[5]),
        .I2(\beat_counter_reg_n_0_[4] ),
        .I3(r_awlen[4]),
        .O(\FSM_sequential_w_state[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_w_state[0]_i_5 
       (.I0(\beat_counter_reg_n_0_[3] ),
        .I1(r_awlen[3]),
        .I2(\beat_counter_reg_n_0_[2] ),
        .I3(r_awlen[2]),
        .O(\FSM_sequential_w_state[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h20BA)) 
    \FSM_sequential_w_state[0]_i_6 
       (.I0(\beat_counter_reg_n_0_[1] ),
        .I1(r_awlen[0]),
        .I2(\beat_counter_reg_n_0_[0] ),
        .I3(r_awlen[1]),
        .O(\FSM_sequential_w_state[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_w_state[0]_i_7 
       (.I0(r_awlen[7]),
        .I1(\beat_counter_reg_n_0_[7] ),
        .I2(r_awlen[6]),
        .I3(\beat_counter_reg_n_0_[6] ),
        .O(\FSM_sequential_w_state[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_w_state[0]_i_8 
       (.I0(r_awlen[5]),
        .I1(\beat_counter_reg_n_0_[5] ),
        .I2(r_awlen[4]),
        .I3(\beat_counter_reg_n_0_[4] ),
        .O(\FSM_sequential_w_state[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_w_state[0]_i_9 
       (.I0(r_awlen[3]),
        .I1(\beat_counter_reg_n_0_[3] ),
        .I2(r_awlen[2]),
        .I3(\beat_counter_reg_n_0_[2] ),
        .O(\FSM_sequential_w_state[0]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \FSM_sequential_w_state[1]_i_1 
       (.I0(w_state[1]),
        .I1(wready),
        .I2(w_state[0]),
        .O(w_state__0[1]));
  (* FSM_ENCODED_STATES = "DATA:10,IDEL:00,START:01" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_w_state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(w_state__0[0]),
        .Q(w_state[0]),
        .R(areset));
  CARRY4 \FSM_sequential_w_state_reg[0]_i_2 
       (.CI(1'b0),
        .CO({w_state11_in,\FSM_sequential_w_state_reg[0]_i_2_n_1 ,\FSM_sequential_w_state_reg[0]_i_2_n_2 ,\FSM_sequential_w_state_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\FSM_sequential_w_state[0]_i_3_n_0 ,\FSM_sequential_w_state[0]_i_4_n_0 ,\FSM_sequential_w_state[0]_i_5_n_0 ,\FSM_sequential_w_state[0]_i_6_n_0 }),
        .O(\NLW_FSM_sequential_w_state_reg[0]_i_2_O_UNCONNECTED [3:0]),
        .S({\FSM_sequential_w_state[0]_i_7_n_0 ,\FSM_sequential_w_state[0]_i_8_n_0 ,\FSM_sequential_w_state[0]_i_9_n_0 ,\FSM_sequential_w_state[0]_i_10_n_0 }));
  (* FSM_ENCODED_STATES = "DATA:10,IDEL:00,START:01" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_w_state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(w_state__0[1]),
        .Q(w_state[1]),
        .R(areset));
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[0]_INST_0 
       (.I0(in_addr[0]),
        .I1(areset),
        .O(araddr[0]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[10]_INST_0 
       (.I0(in_addr[10]),
        .I1(areset),
        .O(araddr[10]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[11]_INST_0 
       (.I0(in_addr[11]),
        .I1(areset),
        .O(araddr[11]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[12]_INST_0 
       (.I0(in_addr[12]),
        .I1(areset),
        .O(araddr[12]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[13]_INST_0 
       (.I0(in_addr[13]),
        .I1(areset),
        .O(araddr[13]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[14]_INST_0 
       (.I0(in_addr[14]),
        .I1(areset),
        .O(araddr[14]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[15]_INST_0 
       (.I0(in_addr[15]),
        .I1(areset),
        .O(araddr[15]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[16]_INST_0 
       (.I0(in_addr[16]),
        .I1(areset),
        .O(araddr[16]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[17]_INST_0 
       (.I0(in_addr[17]),
        .I1(areset),
        .O(araddr[17]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[18]_INST_0 
       (.I0(in_addr[18]),
        .I1(areset),
        .O(araddr[18]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[19]_INST_0 
       (.I0(in_addr[19]),
        .I1(areset),
        .O(araddr[19]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[1]_INST_0 
       (.I0(in_addr[1]),
        .I1(areset),
        .O(araddr[1]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[20]_INST_0 
       (.I0(in_addr[20]),
        .I1(areset),
        .O(araddr[20]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[21]_INST_0 
       (.I0(in_addr[21]),
        .I1(areset),
        .O(araddr[21]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[22]_INST_0 
       (.I0(in_addr[22]),
        .I1(areset),
        .O(araddr[22]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[23]_INST_0 
       (.I0(in_addr[23]),
        .I1(areset),
        .O(araddr[23]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[24]_INST_0 
       (.I0(in_addr[24]),
        .I1(areset),
        .O(araddr[24]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[25]_INST_0 
       (.I0(in_addr[25]),
        .I1(areset),
        .O(araddr[25]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[26]_INST_0 
       (.I0(in_addr[26]),
        .I1(areset),
        .O(araddr[26]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[27]_INST_0 
       (.I0(in_addr[27]),
        .I1(areset),
        .O(araddr[27]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[28]_INST_0 
       (.I0(in_addr[28]),
        .I1(areset),
        .O(araddr[28]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[29]_INST_0 
       (.I0(in_addr[29]),
        .I1(areset),
        .O(araddr[29]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[2]_INST_0 
       (.I0(in_addr[2]),
        .I1(areset),
        .O(araddr[2]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[30]_INST_0 
       (.I0(in_addr[30]),
        .I1(areset),
        .O(araddr[30]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[31]_INST_0 
       (.I0(in_addr[31]),
        .I1(areset),
        .O(araddr[31]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[3]_INST_0 
       (.I0(in_addr[3]),
        .I1(areset),
        .O(araddr[3]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[4]_INST_0 
       (.I0(in_addr[4]),
        .I1(areset),
        .O(araddr[4]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[5]_INST_0 
       (.I0(in_addr[5]),
        .I1(areset),
        .O(araddr[5]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[6]_INST_0 
       (.I0(in_addr[6]),
        .I1(areset),
        .O(araddr[6]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[7]_INST_0 
       (.I0(in_addr[7]),
        .I1(areset),
        .O(araddr[7]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[8]_INST_0 
       (.I0(in_addr[8]),
        .I1(areset),
        .O(araddr[8]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \araddr[9]_INST_0 
       (.I0(in_addr[9]),
        .I1(areset),
        .O(araddr[9]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arburst[0]_INST_0 
       (.I0(burst_type[0]),
        .I1(areset),
        .O(arburst[0]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arburst[1]_INST_0 
       (.I0(burst_type[1]),
        .I1(areset),
        .O(arburst[1]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arid[0]_INST_0 
       (.I0(in_id[0]),
        .I1(areset),
        .O(arid[0]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arid[1]_INST_0 
       (.I0(in_id[1]),
        .I1(areset),
        .O(arid[1]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arid[2]_INST_0 
       (.I0(in_id[2]),
        .I1(areset),
        .O(arid[2]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arid[3]_INST_0 
       (.I0(in_id[3]),
        .I1(areset),
        .O(arid[3]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arlen[0]_INST_0 
       (.I0(in_len[0]),
        .I1(areset),
        .O(arlen[0]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arlen[1]_INST_0 
       (.I0(in_len[1]),
        .I1(areset),
        .O(arlen[1]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arlen[2]_INST_0 
       (.I0(in_len[2]),
        .I1(areset),
        .O(arlen[2]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arlen[3]_INST_0 
       (.I0(in_len[3]),
        .I1(areset),
        .O(arlen[3]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arlen[4]_INST_0 
       (.I0(in_len[4]),
        .I1(areset),
        .O(arlen[4]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arlen[5]_INST_0 
       (.I0(in_len[5]),
        .I1(areset),
        .O(arlen[5]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arlen[6]_INST_0 
       (.I0(in_len[6]),
        .I1(areset),
        .O(arlen[6]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arlen[7]_INST_0 
       (.I0(in_len[7]),
        .I1(areset),
        .O(arlen[7]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \awsize[0]_INST_0 
       (.I0(in_size[0]),
        .I1(areset),
        .O(awsize[0]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \awsize[1]_INST_0 
       (.I0(in_size[1]),
        .I1(areset),
        .O(awsize[1]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \awsize[2]_INST_0 
       (.I0(in_size[2]),
        .I1(areset),
        .O(awsize[2]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \awsize[3]_INST_0 
       (.I0(in_size[3]),
        .I1(areset),
        .O(awsize[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \beat_counter[0]_i_1 
       (.I0(w_state11_in),
        .I1(w_state[1]),
        .I2(\beat_counter_reg_n_0_[0] ),
        .O(\beat_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0220)) 
    \beat_counter[1]_i_1 
       (.I0(w_state[1]),
        .I1(w_state11_in),
        .I2(\beat_counter_reg_n_0_[0] ),
        .I3(\beat_counter_reg_n_0_[1] ),
        .O(\beat_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h02222000)) 
    \beat_counter[2]_i_1 
       (.I0(w_state[1]),
        .I1(w_state11_in),
        .I2(\beat_counter_reg_n_0_[1] ),
        .I3(\beat_counter_reg_n_0_[0] ),
        .I4(\beat_counter_reg_n_0_[2] ),
        .O(\beat_counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h007F000000800000)) 
    \beat_counter[3]_i_1 
       (.I0(\beat_counter_reg_n_0_[0] ),
        .I1(\beat_counter_reg_n_0_[1] ),
        .I2(\beat_counter_reg_n_0_[2] ),
        .I3(w_state11_in),
        .I4(w_state[1]),
        .I5(\beat_counter_reg_n_0_[3] ),
        .O(\beat_counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2010)) 
    \beat_counter[4]_i_1 
       (.I0(\beat_counter[4]_i_2_n_0 ),
        .I1(w_state11_in),
        .I2(w_state[1]),
        .I3(\beat_counter_reg_n_0_[4] ),
        .O(\beat_counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \beat_counter[4]_i_2 
       (.I0(\beat_counter_reg_n_0_[2] ),
        .I1(\beat_counter_reg_n_0_[0] ),
        .I2(\beat_counter_reg_n_0_[1] ),
        .I3(\beat_counter_reg_n_0_[3] ),
        .O(\beat_counter[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h2010)) 
    \beat_counter[5]_i_1 
       (.I0(\beat_counter[5]_i_2_n_0 ),
        .I1(w_state11_in),
        .I2(w_state[1]),
        .I3(\beat_counter_reg_n_0_[5] ),
        .O(\beat_counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \beat_counter[5]_i_2 
       (.I0(\beat_counter_reg_n_0_[3] ),
        .I1(\beat_counter_reg_n_0_[1] ),
        .I2(\beat_counter_reg_n_0_[0] ),
        .I3(\beat_counter_reg_n_0_[2] ),
        .I4(\beat_counter_reg_n_0_[4] ),
        .O(\beat_counter[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2010)) 
    \beat_counter[6]_i_1 
       (.I0(\beat_counter[7]_i_3_n_0 ),
        .I1(w_state11_in),
        .I2(w_state[1]),
        .I3(\beat_counter_reg_n_0_[6] ),
        .O(\beat_counter[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0F07)) 
    \beat_counter[7]_i_1 
       (.I0(awvalid),
        .I1(awready),
        .I2(w_state[0]),
        .I3(w_state[1]),
        .O(beat_counter));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0B000400)) 
    \beat_counter[7]_i_2 
       (.I0(\beat_counter[7]_i_3_n_0 ),
        .I1(\beat_counter_reg_n_0_[6] ),
        .I2(w_state11_in),
        .I3(w_state[1]),
        .I4(\beat_counter_reg_n_0_[7] ),
        .O(\beat_counter[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \beat_counter[7]_i_3 
       (.I0(\beat_counter_reg_n_0_[4] ),
        .I1(\beat_counter_reg_n_0_[2] ),
        .I2(\beat_counter_reg_n_0_[0] ),
        .I3(\beat_counter_reg_n_0_[1] ),
        .I4(\beat_counter_reg_n_0_[3] ),
        .I5(\beat_counter_reg_n_0_[5] ),
        .O(\beat_counter[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \beat_counter_reg[0] 
       (.C(aclk),
        .CE(beat_counter),
        .D(\beat_counter[0]_i_1_n_0 ),
        .Q(\beat_counter_reg_n_0_[0] ),
        .R(areset));
  FDRE #(
    .INIT(1'b0)) 
    \beat_counter_reg[1] 
       (.C(aclk),
        .CE(beat_counter),
        .D(\beat_counter[1]_i_1_n_0 ),
        .Q(\beat_counter_reg_n_0_[1] ),
        .R(areset));
  FDRE #(
    .INIT(1'b0)) 
    \beat_counter_reg[2] 
       (.C(aclk),
        .CE(beat_counter),
        .D(\beat_counter[2]_i_1_n_0 ),
        .Q(\beat_counter_reg_n_0_[2] ),
        .R(areset));
  FDRE #(
    .INIT(1'b0)) 
    \beat_counter_reg[3] 
       (.C(aclk),
        .CE(beat_counter),
        .D(\beat_counter[3]_i_1_n_0 ),
        .Q(\beat_counter_reg_n_0_[3] ),
        .R(areset));
  FDRE #(
    .INIT(1'b0)) 
    \beat_counter_reg[4] 
       (.C(aclk),
        .CE(beat_counter),
        .D(\beat_counter[4]_i_1_n_0 ),
        .Q(\beat_counter_reg_n_0_[4] ),
        .R(areset));
  FDRE #(
    .INIT(1'b0)) 
    \beat_counter_reg[5] 
       (.C(aclk),
        .CE(beat_counter),
        .D(\beat_counter[5]_i_1_n_0 ),
        .Q(\beat_counter_reg_n_0_[5] ),
        .R(areset));
  FDRE #(
    .INIT(1'b0)) 
    \beat_counter_reg[6] 
       (.C(aclk),
        .CE(beat_counter),
        .D(\beat_counter[6]_i_1_n_0 ),
        .Q(\beat_counter_reg_n_0_[6] ),
        .R(areset));
  FDRE #(
    .INIT(1'b0)) 
    \beat_counter_reg[7] 
       (.C(aclk),
        .CE(beat_counter),
        .D(\beat_counter[7]_i_2_n_0 ),
        .Q(\beat_counter_reg_n_0_[7] ),
        .R(areset));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h8)) 
    bready_INST_0
       (.I0(FSM_sequential_b_state_reg_n_0),
        .I1(bvalid),
        .O(bready));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_bid[0]_INST_0 
       (.I0(bvalid),
        .I1(bid[0]),
        .O(out_bid[0]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_bid[1]_INST_0 
       (.I0(bvalid),
        .I1(bid[1]),
        .O(out_bid[1]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_bid[2]_INST_0 
       (.I0(bvalid),
        .I1(bid[2]),
        .O(out_bid[2]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_bid[3]_INST_0 
       (.I0(bvalid),
        .I1(bid[3]),
        .O(out_bid[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_bresp[1]_INST_0 
       (.I0(bvalid),
        .I1(bresp[1]),
        .O(\^out_bresp ));
  LUT3 #(
    .INIT(8'h08)) 
    \r_awlen[7]_i_1 
       (.I0(awready),
        .I1(awvalid),
        .I2(areset),
        .O(\r_awlen[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_awlen_reg[0] 
       (.C(aclk),
        .CE(\r_awlen[7]_i_1_n_0 ),
        .D(in_len[0]),
        .Q(r_awlen[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_awlen_reg[1] 
       (.C(aclk),
        .CE(\r_awlen[7]_i_1_n_0 ),
        .D(in_len[1]),
        .Q(r_awlen[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_awlen_reg[2] 
       (.C(aclk),
        .CE(\r_awlen[7]_i_1_n_0 ),
        .D(in_len[2]),
        .Q(r_awlen[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_awlen_reg[3] 
       (.C(aclk),
        .CE(\r_awlen[7]_i_1_n_0 ),
        .D(in_len[3]),
        .Q(r_awlen[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_awlen_reg[4] 
       (.C(aclk),
        .CE(\r_awlen[7]_i_1_n_0 ),
        .D(in_len[4]),
        .Q(r_awlen[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_awlen_reg[5] 
       (.C(aclk),
        .CE(\r_awlen[7]_i_1_n_0 ),
        .D(in_len[5]),
        .Q(r_awlen[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_awlen_reg[6] 
       (.C(aclk),
        .CE(\r_awlen[7]_i_1_n_0 ),
        .D(in_len[6]),
        .Q(r_awlen[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_awlen_reg[7] 
       (.C(aclk),
        .CE(\r_awlen[7]_i_1_n_0 ),
        .D(in_len[7]),
        .Q(r_awlen[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[0]_INST_0 
       (.I0(rready),
        .I1(rdata[0]),
        .O(read_data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[10]_INST_0 
       (.I0(rready),
        .I1(rdata[10]),
        .O(read_data_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[11]_INST_0 
       (.I0(rready),
        .I1(rdata[11]),
        .O(read_data_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[12]_INST_0 
       (.I0(rready),
        .I1(rdata[12]),
        .O(read_data_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[13]_INST_0 
       (.I0(rready),
        .I1(rdata[13]),
        .O(read_data_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[14]_INST_0 
       (.I0(rready),
        .I1(rdata[14]),
        .O(read_data_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[15]_INST_0 
       (.I0(rready),
        .I1(rdata[15]),
        .O(read_data_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[16]_INST_0 
       (.I0(rready),
        .I1(rdata[16]),
        .O(read_data_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[17]_INST_0 
       (.I0(rready),
        .I1(rdata[17]),
        .O(read_data_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[18]_INST_0 
       (.I0(rready),
        .I1(rdata[18]),
        .O(read_data_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[19]_INST_0 
       (.I0(rready),
        .I1(rdata[19]),
        .O(read_data_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[1]_INST_0 
       (.I0(rready),
        .I1(rdata[1]),
        .O(read_data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[20]_INST_0 
       (.I0(rready),
        .I1(rdata[20]),
        .O(read_data_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[21]_INST_0 
       (.I0(rready),
        .I1(rdata[21]),
        .O(read_data_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[22]_INST_0 
       (.I0(rready),
        .I1(rdata[22]),
        .O(read_data_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[23]_INST_0 
       (.I0(rready),
        .I1(rdata[23]),
        .O(read_data_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[24]_INST_0 
       (.I0(rready),
        .I1(rdata[24]),
        .O(read_data_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[25]_INST_0 
       (.I0(rready),
        .I1(rdata[25]),
        .O(read_data_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[26]_INST_0 
       (.I0(rready),
        .I1(rdata[26]),
        .O(read_data_out[26]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[27]_INST_0 
       (.I0(rready),
        .I1(rdata[27]),
        .O(read_data_out[27]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[28]_INST_0 
       (.I0(rready),
        .I1(rdata[28]),
        .O(read_data_out[28]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[29]_INST_0 
       (.I0(rready),
        .I1(rdata[29]),
        .O(read_data_out[29]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[2]_INST_0 
       (.I0(rready),
        .I1(rdata[2]),
        .O(read_data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[30]_INST_0 
       (.I0(rready),
        .I1(rdata[30]),
        .O(read_data_out[30]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[31]_INST_0 
       (.I0(rready),
        .I1(rdata[31]),
        .O(read_data_out[31]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[32]_INST_0 
       (.I0(rready),
        .I1(rdata[32]),
        .O(read_data_out[32]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[33]_INST_0 
       (.I0(rready),
        .I1(rdata[33]),
        .O(read_data_out[33]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[34]_INST_0 
       (.I0(rready),
        .I1(rdata[34]),
        .O(read_data_out[34]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[35]_INST_0 
       (.I0(rready),
        .I1(rdata[35]),
        .O(read_data_out[35]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[36]_INST_0 
       (.I0(rready),
        .I1(rdata[36]),
        .O(read_data_out[36]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[37]_INST_0 
       (.I0(rready),
        .I1(rdata[37]),
        .O(read_data_out[37]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[38]_INST_0 
       (.I0(rready),
        .I1(rdata[38]),
        .O(read_data_out[38]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[39]_INST_0 
       (.I0(rready),
        .I1(rdata[39]),
        .O(read_data_out[39]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[3]_INST_0 
       (.I0(rready),
        .I1(rdata[3]),
        .O(read_data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[40]_INST_0 
       (.I0(rready),
        .I1(rdata[40]),
        .O(read_data_out[40]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[41]_INST_0 
       (.I0(rready),
        .I1(rdata[41]),
        .O(read_data_out[41]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[42]_INST_0 
       (.I0(rready),
        .I1(rdata[42]),
        .O(read_data_out[42]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[43]_INST_0 
       (.I0(rready),
        .I1(rdata[43]),
        .O(read_data_out[43]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[44]_INST_0 
       (.I0(rready),
        .I1(rdata[44]),
        .O(read_data_out[44]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[45]_INST_0 
       (.I0(rready),
        .I1(rdata[45]),
        .O(read_data_out[45]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[46]_INST_0 
       (.I0(rready),
        .I1(rdata[46]),
        .O(read_data_out[46]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[47]_INST_0 
       (.I0(rready),
        .I1(rdata[47]),
        .O(read_data_out[47]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[48]_INST_0 
       (.I0(rready),
        .I1(rdata[48]),
        .O(read_data_out[48]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[49]_INST_0 
       (.I0(rready),
        .I1(rdata[49]),
        .O(read_data_out[49]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[4]_INST_0 
       (.I0(rready),
        .I1(rdata[4]),
        .O(read_data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[50]_INST_0 
       (.I0(rready),
        .I1(rdata[50]),
        .O(read_data_out[50]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[51]_INST_0 
       (.I0(rready),
        .I1(rdata[51]),
        .O(read_data_out[51]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[52]_INST_0 
       (.I0(rready),
        .I1(rdata[52]),
        .O(read_data_out[52]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[53]_INST_0 
       (.I0(rready),
        .I1(rdata[53]),
        .O(read_data_out[53]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[54]_INST_0 
       (.I0(rready),
        .I1(rdata[54]),
        .O(read_data_out[54]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[55]_INST_0 
       (.I0(rready),
        .I1(rdata[55]),
        .O(read_data_out[55]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[56]_INST_0 
       (.I0(rready),
        .I1(rdata[56]),
        .O(read_data_out[56]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[57]_INST_0 
       (.I0(rready),
        .I1(rdata[57]),
        .O(read_data_out[57]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[58]_INST_0 
       (.I0(rready),
        .I1(rdata[58]),
        .O(read_data_out[58]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[59]_INST_0 
       (.I0(rready),
        .I1(rdata[59]),
        .O(read_data_out[59]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[5]_INST_0 
       (.I0(rready),
        .I1(rdata[5]),
        .O(read_data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[60]_INST_0 
       (.I0(rready),
        .I1(rdata[60]),
        .O(read_data_out[60]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[61]_INST_0 
       (.I0(rready),
        .I1(rdata[61]),
        .O(read_data_out[61]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[62]_INST_0 
       (.I0(rready),
        .I1(rdata[62]),
        .O(read_data_out[62]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[63]_INST_0 
       (.I0(rready),
        .I1(rdata[63]),
        .O(read_data_out[63]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[6]_INST_0 
       (.I0(rready),
        .I1(rdata[6]),
        .O(read_data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[7]_INST_0 
       (.I0(rready),
        .I1(rdata[7]),
        .O(read_data_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[8]_INST_0 
       (.I0(rready),
        .I1(rdata[8]),
        .O(read_data_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_data_out[9]_INST_0 
       (.I0(rready),
        .I1(rdata[9]),
        .O(read_data_out[9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_id[0]_INST_0 
       (.I0(rready),
        .I1(rid[0]),
        .O(read_id[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_id[1]_INST_0 
       (.I0(rready),
        .I1(rid[1]),
        .O(read_id[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_id[2]_INST_0 
       (.I0(rready),
        .I1(rid[2]),
        .O(read_id[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_id[3]_INST_0 
       (.I0(rready),
        .I1(rid[3]),
        .O(read_id[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \read_resp[1]_INST_0 
       (.I0(rready),
        .I1(rresp[1]),
        .O(\^read_resp ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[0]_INST_0 
       (.I0(in_data[0]),
        .I1(areset),
        .O(wdata[0]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[10]_INST_0 
       (.I0(in_data[10]),
        .I1(areset),
        .O(wdata[10]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[11]_INST_0 
       (.I0(in_data[11]),
        .I1(areset),
        .O(wdata[11]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[12]_INST_0 
       (.I0(in_data[12]),
        .I1(areset),
        .O(wdata[12]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[13]_INST_0 
       (.I0(in_data[13]),
        .I1(areset),
        .O(wdata[13]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[14]_INST_0 
       (.I0(in_data[14]),
        .I1(areset),
        .O(wdata[14]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[15]_INST_0 
       (.I0(in_data[15]),
        .I1(areset),
        .O(wdata[15]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[16]_INST_0 
       (.I0(in_data[16]),
        .I1(areset),
        .O(wdata[16]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[17]_INST_0 
       (.I0(in_data[17]),
        .I1(areset),
        .O(wdata[17]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[18]_INST_0 
       (.I0(in_data[18]),
        .I1(areset),
        .O(wdata[18]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[19]_INST_0 
       (.I0(in_data[19]),
        .I1(areset),
        .O(wdata[19]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[1]_INST_0 
       (.I0(in_data[1]),
        .I1(areset),
        .O(wdata[1]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[20]_INST_0 
       (.I0(in_data[20]),
        .I1(areset),
        .O(wdata[20]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[21]_INST_0 
       (.I0(in_data[21]),
        .I1(areset),
        .O(wdata[21]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[22]_INST_0 
       (.I0(in_data[22]),
        .I1(areset),
        .O(wdata[22]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[23]_INST_0 
       (.I0(in_data[23]),
        .I1(areset),
        .O(wdata[23]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[24]_INST_0 
       (.I0(in_data[24]),
        .I1(areset),
        .O(wdata[24]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[25]_INST_0 
       (.I0(in_data[25]),
        .I1(areset),
        .O(wdata[25]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[26]_INST_0 
       (.I0(in_data[26]),
        .I1(areset),
        .O(wdata[26]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[27]_INST_0 
       (.I0(in_data[27]),
        .I1(areset),
        .O(wdata[27]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[28]_INST_0 
       (.I0(in_data[28]),
        .I1(areset),
        .O(wdata[28]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[29]_INST_0 
       (.I0(in_data[29]),
        .I1(areset),
        .O(wdata[29]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[2]_INST_0 
       (.I0(in_data[2]),
        .I1(areset),
        .O(wdata[2]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[30]_INST_0 
       (.I0(in_data[30]),
        .I1(areset),
        .O(wdata[30]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[31]_INST_0 
       (.I0(in_data[31]),
        .I1(areset),
        .O(wdata[31]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[32]_INST_0 
       (.I0(in_data[32]),
        .I1(areset),
        .O(wdata[32]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[33]_INST_0 
       (.I0(in_data[33]),
        .I1(areset),
        .O(wdata[33]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[34]_INST_0 
       (.I0(in_data[34]),
        .I1(areset),
        .O(wdata[34]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[35]_INST_0 
       (.I0(in_data[35]),
        .I1(areset),
        .O(wdata[35]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[36]_INST_0 
       (.I0(in_data[36]),
        .I1(areset),
        .O(wdata[36]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[37]_INST_0 
       (.I0(in_data[37]),
        .I1(areset),
        .O(wdata[37]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[38]_INST_0 
       (.I0(in_data[38]),
        .I1(areset),
        .O(wdata[38]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[39]_INST_0 
       (.I0(in_data[39]),
        .I1(areset),
        .O(wdata[39]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[3]_INST_0 
       (.I0(in_data[3]),
        .I1(areset),
        .O(wdata[3]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[40]_INST_0 
       (.I0(in_data[40]),
        .I1(areset),
        .O(wdata[40]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[41]_INST_0 
       (.I0(in_data[41]),
        .I1(areset),
        .O(wdata[41]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[42]_INST_0 
       (.I0(in_data[42]),
        .I1(areset),
        .O(wdata[42]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[43]_INST_0 
       (.I0(in_data[43]),
        .I1(areset),
        .O(wdata[43]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[44]_INST_0 
       (.I0(in_data[44]),
        .I1(areset),
        .O(wdata[44]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[45]_INST_0 
       (.I0(in_data[45]),
        .I1(areset),
        .O(wdata[45]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[46]_INST_0 
       (.I0(in_data[46]),
        .I1(areset),
        .O(wdata[46]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[47]_INST_0 
       (.I0(in_data[47]),
        .I1(areset),
        .O(wdata[47]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[48]_INST_0 
       (.I0(in_data[48]),
        .I1(areset),
        .O(wdata[48]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[49]_INST_0 
       (.I0(in_data[49]),
        .I1(areset),
        .O(wdata[49]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[4]_INST_0 
       (.I0(in_data[4]),
        .I1(areset),
        .O(wdata[4]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[50]_INST_0 
       (.I0(in_data[50]),
        .I1(areset),
        .O(wdata[50]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[51]_INST_0 
       (.I0(in_data[51]),
        .I1(areset),
        .O(wdata[51]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[52]_INST_0 
       (.I0(in_data[52]),
        .I1(areset),
        .O(wdata[52]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[53]_INST_0 
       (.I0(in_data[53]),
        .I1(areset),
        .O(wdata[53]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[54]_INST_0 
       (.I0(in_data[54]),
        .I1(areset),
        .O(wdata[54]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[55]_INST_0 
       (.I0(in_data[55]),
        .I1(areset),
        .O(wdata[55]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[56]_INST_0 
       (.I0(in_data[56]),
        .I1(areset),
        .O(wdata[56]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[57]_INST_0 
       (.I0(in_data[57]),
        .I1(areset),
        .O(wdata[57]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[58]_INST_0 
       (.I0(in_data[58]),
        .I1(areset),
        .O(wdata[58]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[59]_INST_0 
       (.I0(in_data[59]),
        .I1(areset),
        .O(wdata[59]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[5]_INST_0 
       (.I0(in_data[5]),
        .I1(areset),
        .O(wdata[5]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[60]_INST_0 
       (.I0(in_data[60]),
        .I1(areset),
        .O(wdata[60]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[61]_INST_0 
       (.I0(in_data[61]),
        .I1(areset),
        .O(wdata[61]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[62]_INST_0 
       (.I0(in_data[62]),
        .I1(areset),
        .O(wdata[62]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[63]_INST_0 
       (.I0(in_data[63]),
        .I1(areset),
        .O(wdata[63]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[6]_INST_0 
       (.I0(in_data[6]),
        .I1(areset),
        .O(wdata[6]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[7]_INST_0 
       (.I0(in_data[7]),
        .I1(areset),
        .O(wdata[7]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[8]_INST_0 
       (.I0(in_data[8]),
        .I1(areset),
        .O(wdata[8]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wdata[9]_INST_0 
       (.I0(in_data[9]),
        .I1(areset),
        .O(wdata[9]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wstrb[0]_INST_0 
       (.I0(in_strb[0]),
        .I1(areset),
        .O(wstrb[0]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wstrb[1]_INST_0 
       (.I0(in_strb[1]),
        .I1(areset),
        .O(wstrb[1]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wstrb[2]_INST_0 
       (.I0(in_strb[2]),
        .I1(areset),
        .O(wstrb[2]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wstrb[3]_INST_0 
       (.I0(in_strb[3]),
        .I1(areset),
        .O(wstrb[3]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wstrb[4]_INST_0 
       (.I0(in_strb[4]),
        .I1(areset),
        .O(wstrb[4]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wstrb[5]_INST_0 
       (.I0(in_strb[5]),
        .I1(areset),
        .O(wstrb[5]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wstrb[6]_INST_0 
       (.I0(in_strb[6]),
        .I1(areset),
        .O(wstrb[6]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wstrb[7]_INST_0 
       (.I0(in_strb[7]),
        .I1(areset),
        .O(wstrb[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    wvalid_INST_0
       (.I0(w_state[0]),
        .I1(w_state[1]),
        .O(wvalid));
endmodule

(* ADDR_OFFSET = "16'b1110000000000000" *) (* ADDR_WIDTH = "32" *) (* AR_DEPTH = "32" *) 
(* AW_DEPTH = "32" *) (* BASE_ADDRESS = "16'b1110000100000000" *) (* CONTL_REG_WIDTH = "32" *) 
(* CTRL_REG_WIDTH = "32" *) (* DATA_WIDTH = "64" *) (* END_OFFSET = "16'b0000100000010000" *) 
(* ID_WIDTH = "4" *) (* LEN_WIDTH = "8" *) (* OFFSET_START_BITS = "8" *) 
(* RESPONSE_WIDTH = "3" *) (* R_DEPTH = "32" *) (* SIZE_WIDTH = "4" *) 
(* START_OFFSET = "16'b0000000000000000" *) (* STATUS_REG_WIDTH = "32" *) (* UART_RX_FIFO_DEPTH = "32" *) 
(* UART_TX_FIFO_DEPTH = "256" *) (* W_DEPTH = "32" *) 
(* NotValidForBitStream *)
module AXI_TOP_WRAPPER
   (trigger,
    r_trigger,
    aclk,
    areset,
    rd_clk,
    in_addr,
    axi_in_data,
    in_id,
    in_len,
    in_size,
    burst_type,
    in_strb,
    rx_done_uart,
    rvalid_out,
    rlast_out,
    ar_read_ready,
    arfull,
    arempty,
    ar_addr_out,
    r_tx,
    r_rx,
    read_data_out,
    read_resp,
    write_resp,
    read_id,
    write_id,
    wvalid_o,
    tx_data_valid,
    tx_fifo_mem_left,
    tx_ready,
    A,
    axi_out_data);
  input trigger;
  input r_trigger;
  input aclk;
  input areset;
  input rd_clk;
  input [31:0]in_addr;
  input [63:0]axi_in_data;
  input [3:0]in_id;
  input [7:0]in_len;
  input [3:0]in_size;
  input [1:0]burst_type;
  input [7:0]in_strb;
  output rx_done_uart;
  output rvalid_out;
  output rlast_out;
  output ar_read_ready;
  output arfull;
  output arempty;
  output [49:0]ar_addr_out;
  output r_tx;
  input r_rx;
  output [63:0]read_data_out;
  output [2:0]read_resp;
  output [2:0]write_resp;
  output [3:0]read_id;
  output [3:0]write_id;
  output wvalid_o;
  output tx_data_valid;
  output [11:0]tx_fifo_mem_left;
  output tx_ready;
  output A;
  output [63:0]axi_out_data;

  wire A;
  wire A_OBUF;
  wire aclk;
  wire aclk_IBUF;
  wire aclk_IBUF_BUFG;
  wire [7:0]addr;
  wire addr_read;
  wire addr_read_ready;
  wire [49:0]ar_addr_out;
  wire [49:0]ar_addr_out_OBUF;
  wire ar_addr_read;
  wire ar_read_ready;
  wire ar_read_ready_OBUF;
  wire [31:0]araddr;
  wire [1:0]arburst;
  wire arempty;
  wire arempty_OBUF;
  wire areset;
  wire areset_IBUF;
  wire arfull;
  wire arfull_OBUF;
  wire [3:0]arid;
  wire [7:0]arlen;
  wire arready;
  wire arvalid;
  wire awempty;
  wire awready;
  wire [3:0]awsize;
  wire awvalid;
  wire [63:0]axi_in_data;
  wire [63:0]axi_in_data_IBUF;
  wire [63:0]axi_out_data;
  wire [63:0]axi_out_data_OBUF;
  wire [1:0]burst_type;
  wire [1:0]burst_type_IBUF;
  wire clk_en;
  wire [31:0]in_addr;
  wire [31:0]in_addr_IBUF;
  wire [3:0]in_id;
  wire [3:0]in_id_IBUF;
  wire [7:0]in_len;
  wire [7:0]in_len_IBUF;
  wire [3:0]in_size;
  wire [3:0]in_size_IBUF;
  wire [7:0]in_strb;
  wire [7:0]in_strb_IBUF;
  wire [49:0]out_addr_o;
  wire out_wdata_ready;
  wire [30:1]r_baud_rate;
  wire r_rx;
  wire r_rx_IBUF;
  wire [4:1]r_sample_rate;
  wire r_trigger;
  wire r_trigger_IBUF;
  wire r_tx;
  wire r_tx_OBUF;
  wire rd_clk;
  wire rd_clk_IBUF;
  wire rd_clk_IBUF_BUFG;
  wire [63:0]read_data_out;
  wire [63:0]read_data_out_OBUF;
  wire [3:0]read_id;
  wire [3:0]read_id_OBUF;
  wire [2:0]read_resp;
  wire [1:1]read_resp_OBUF;
  wire read_wdata;
  wire rlast_out;
  wire rlast_out_OBUF;
  wire rready;
  wire [1:1]rresp;
  wire rvalid_out;
  wire rvalid_out_OBUF;
  wire [7:0]rx_addr;
  wire rx_data_valid;
  wire rx_done_uart;
  wire rx_done_uart_OBUF;
  wire rx_en;
  wire trigger;
  wire trigger_IBUF;
  wire tx_data_valid;
  wire tx_data_valid_OBUF;
  wire [11:0]tx_fifo_mem_left;
  wire [11:3]tx_fifo_mem_left_OBUF;
  wire tx_ready;
  wire uart_clk_o;
  wire [3:0]w_bid;
  wire w_bready;
  wire [1:1]w_bresp;
  wire w_bvalid;
  wire [63:0]w_data;
  wire w_empty;
  wire [63:0]w_out_wdata;
  wire [3:0]write_id;
  wire [3:0]write_id_OBUF;
  wire [2:0]write_resp;
  wire [1:1]write_resp_OBUF;
  wire [7:0]wstrb;
  wire wvalid;
  wire wvalid_o;
  wire wvalid_o_OBUF;
  wire NLW_BAUD_CLK_GEN_sample_clk_UNCONNECTED;
  wire [0:0]NLW_UART_CONTROL_baud_rate_UNCONNECTED;
  wire [0:0]NLW_UART_CONTROL_sample_rate_o_UNCONNECTED;
  wire [2:0]NLW_UART_CONTROL_tx_fifo_mem_left_UNCONNECTED;
  wire [2:0]NLW_WRITE_CONTROL_bresp_UNCONNECTED;
  wire [63:0]NLW_WRITE_CONTROL_tx_data_UNCONNECTED;
  wire NLW_WRT_BUFFER_INST_awfull_UNCONNECTED;
  wire NLW_WRT_BUFFER_INST_w_full_UNCONNECTED;
  wire NLW_master_inst_wlast_UNCONNECTED;
  wire [3:0]NLW_master_inst_arsize_UNCONNECTED;
  wire [31:0]NLW_master_inst_awaddr_UNCONNECTED;
  wire [1:0]NLW_master_inst_awburst_UNCONNECTED;
  wire [3:0]NLW_master_inst_awid_UNCONNECTED;
  wire [7:0]NLW_master_inst_awlen_UNCONNECTED;
  wire [2:0]NLW_master_inst_out_bresp_UNCONNECTED;
  wire [2:0]NLW_master_inst_read_resp_UNCONNECTED;
  wire NLW_read_buffer_ctrl_inst_wr_r_fifo_en_UNCONNECTED;
  wire [63:0]NLW_read_buffer_ctrl_inst_rdata_UNCONNECTED;
  wire [3:0]NLW_read_buffer_ctrl_inst_rid_UNCONNECTED;
  wire [2:0]NLW_read_buffer_ctrl_inst_rresp_UNCONNECTED;
  wire [70:0]NLW_read_buffer_ctrl_inst_wr_r_fifo_data_UNCONNECTED;

  OBUF A_OBUF_inst
       (.I(A_OBUF),
        .O(A));
  (* FREQNCY = "70000000" *) 
  BAUD_GENRATOR BAUD_CLK_GEN
       (.baud_rate({r_baud_rate,1'b0}),
        .ref_clk(rd_clk_IBUF_BUFG),
        .rst(clk_en),
        .sample_clk(NLW_BAUD_CLK_GEN_sample_clk_UNCONNECTED),
        .sample_rate({r_sample_rate,1'b0}),
        .uart_clk_o(uart_clk_o));
  (* ADDR_WIDTH = "32" *) 
  (* AR_DEPTH = "32" *) 
  (* DATA_WIDTH = "64" *) 
  (* ID_WIDTH = "4" *) 
  (* LEN_WIDTH = "8" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* R_DEPTH = "32" *) 
  (* SIZE_WIDTH = "4" *) 
  READ_BUFFER INST_READ_BUFFER
       (.aclk(aclk_IBUF_BUFG),
        .ar_addr_out(ar_addr_out_OBUF),
        .ar_addr_read(ar_addr_read),
        .ar_read_ready(ar_read_ready_OBUF),
        .araddr(araddr),
        .arburst(arburst),
        .arempty(arempty_OBUF),
        .areset(areset_IBUF),
        .arfull(arfull_OBUF),
        .arid(arid),
        .arlen(arlen),
        .arready(arready),
        .arsize({1'b0,1'b0,1'b0,1'b0}),
        .arvalid(arvalid),
        .rd_clk(rd_clk_IBUF_BUFG));
  (* ADDR_OFFSET = "16'b1110000000000000" *) 
  (* ADDR_WIDTH = "32" *) 
  (* AR_DEPTH = "32" *) 
  (* AW_DEPTH = "32" *) 
  (* BAUD_GEN = "8'b00000000" *) 
  (* BYTES = "8" *) 
  (* CONTL_REG_WIDTH = "32" *) 
  (* CR = "8'b00000100" *) 
  (* CSR = "8'b00100000" *) 
  (* CTRL_REG_WIDTH = "32" *) 
  (* DATA = "3'b011" *) 
  (* DATA_WIDTH = "64" *) 
  (* DECODE = "3'b001" *) 
  (* DONE = "2'b01" *) 
  (* IDEL = "3'b000" *) 
  (* IDR = "8'b00001100" *) 
  (* ID_WIDTH = "4" *) 
  (* IER = "8'b00001000" *) 
  (* IMR = "8'b00010000" *) 
  (* ISR = "8'b00010100" *) 
  (* LEN_WIDTH = "8" *) 
  (* PARITY = "3'b100" *) 
  (* READ = "2'b10" *) 
  (* READ_TX_FIFO = "3'b001" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* RX = "8'b00011100" *) 
  (* R_DEPTH = "32" *) 
  (* SIZE_WIDTH = "4" *) 
  (* START = "3'b010" *) 
  (* STATUS_REG_WIDTH = "32" *) 
  (* STOP = "3'b101" *) 
  (* TX = "8'b00011000" *) 
  (* UART_RX_FIFO_DEPTH = "32" *) 
  (* UART_TX_FIFO_DEPTH = "256" *) 
  (* WRITE = "2'b11" *) 
  (* W_DEPTH = "32" *) 
  UART_CONTROLLER UART_CONTROL
       (.baud_en(clk_en),
        .baud_rate({r_baud_rate,NLW_UART_CONTROL_baud_rate_UNCONNECTED[0]}),
        .rd_clk(rd_clk_IBUF_BUFG),
        .rst(areset_IBUF),
        .rx(r_rx_IBUF),
        .rx_addr(rx_addr),
        .rx_data(axi_out_data_OBUF),
        .rx_data_valid(rx_data_valid),
        .rx_done(rx_done_uart_OBUF),
        .rx_en(rx_en),
        .sample_rate_o({r_sample_rate,NLW_UART_CONTROL_sample_rate_o_UNCONNECTED[0]}),
        .tx(r_tx_OBUF),
        .tx_addr(addr),
        .tx_data(w_out_wdata),
        .tx_data_valid(tx_data_valid_OBUF),
        .tx_fifo_mem_left({tx_fifo_mem_left_OBUF,NLW_UART_CONTROL_tx_fifo_mem_left_UNCONNECTED[2:0]}),
        .tx_ready(A_OBUF),
        .uart_clk(uart_clk_o));
  (* ADDRESS_UPDATE = "3'b101" *) 
  (* ADDR_OFFSET = "16'b1110000000000000" *) 
  (* ADDR_WIDTH = "32" *) 
  (* ALIGN_BITS = "2" *) 
  (* AR_DEPTH = "32" *) 
  (* AW_DEPTH = "32" *) 
  (* AW_FIFO_WIDTH = "50" *) 
  (* BASE_ADDRESS = "16'b1110000100000000" *) 
  (* BYTES_WIDTH = "3" *) 
  (* CONTL_REG_WIDTH = "32" *) 
  (* CRTL = "2'b10" *) 
  (* CTRL_REG_ADDR = "8" *) 
  (* DATA_BYTES = "8" *) 
  (* DATA_WIDTH = "64" *) 
  (* DECERR = "3'b011" *) 
  (* DECODE = "3'b010" *) 
  (* END_OFFSET = "16'b0000100000010000" *) 
  (* IDEL = "3'b000" *) 
  (* ID_WIDTH = "4" *) 
  (* INTRPT_REG_ADDR = "12" *) 
  (* INTRT = "2'b11" *) 
  (* IN_VALID_ADDR = "3'b110" *) 
  (* LEN_WIDTH = "8" *) 
  (* NEW_DATA = "3'b100" *) 
  (* OFFSET_START_BITS = "8" *) 
  (* OKAY = "0" *) 
  (* READ_TX_ADDR = "3'b111" *) 
  (* READ_TX_DATA = "3'b001" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* R_DEPTH = "32" *) 
  (* SEND_DATA = "3'b011" *) 
  (* SIZE_WIDTH = "4" *) 
  (* SLVERR = "3'b010" *) 
  (* START_OFFSET = "16'b0000000000000000" *) 
  (* STATUS_REG_ADDR = "4" *) 
  (* STATUS_REG_WIDTH = "32" *) 
  (* STS = "2'b01" *) 
  (* TOTAL_BYTES = "2315" *) 
  (* TX_ADDRESS_OFFSET_END = "2064" *) 
  (* TX_ADDRESS_OFFSET_START = "16" *) 
  (* UART_RX_FIFO_DEPTH = "32" *) 
  (* UART_TX_FIFO_DEPTH = "256" *) 
  (* W_DEPTH = "32" *) 
  WRITE_BUFFER_CONTROLLER WRITE_CONTROL
       (.addr(addr),
        .addr_read(addr_read),
        .addr_read_ready(addr_read_ready),
        .awempty(awempty),
        .bid(w_bid),
        .bready(w_bready),
        .bresp({NLW_WRITE_CONTROL_bresp_UNCONNECTED[2],w_bresp,NLW_WRITE_CONTROL_bresp_UNCONNECTED[0]}),
        .bvalid(w_bvalid),
        .out_addr(out_addr_o),
        .out_data_ready(out_wdata_ready),
        .out_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk_IBUF_BUFG),
        .read_wdata(read_wdata),
        .rst(areset_IBUF),
        .tx_data(NLW_WRITE_CONTROL_tx_data_UNCONNECTED[63:0]),
        .tx_data_valid(tx_data_valid_OBUF),
        .tx_fifo_mem_left({tx_fifo_mem_left_OBUF,1'b0,1'b0,1'b0}),
        .tx_ready(A_OBUF),
        .w_empty(w_empty));
  (* ADDR_WIDTH = "32" *) 
  (* AW_DEPTH = "32" *) 
  (* DATA_WIDTH = "64" *) 
  (* ID_WIDTH = "4" *) 
  (* LEN_WIDTH = "8" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* SIZE_WIDTH = "4" *) 
  (* W_DEPTH = "32" *) 
  WRITE_BUFFER WRT_BUFFER_INST
       (.Aclk(aclk_IBUF_BUFG),
        .addr_read(addr_read),
        .addr_read_ready(addr_read_ready),
        .areset(areset_IBUF),
        .awaddr(araddr),
        .awburst(arburst),
        .awempty(awempty),
        .awfull(NLW_WRT_BUFFER_INST_awfull_UNCONNECTED),
        .awid(arid),
        .awlen(arlen),
        .awready(awready),
        .awsize(awsize),
        .awvalid(awvalid),
        .in_wdata(w_data),
        .in_wstrb(wstrb),
        .out_addr(out_addr_o),
        .out_wdata(w_out_wdata),
        .out_wdata_ready(out_wdata_ready),
        .rd_clk(rd_clk_IBUF_BUFG),
        .read_wdata(read_wdata),
        .w_empty(w_empty),
        .w_full(NLW_WRT_BUFFER_INST_w_full_UNCONNECTED),
        .wlast(1'b0),
        .wready(wvalid_o_OBUF),
        .wvalid(wvalid));
  BUFG aclk_IBUF_BUFG_inst
       (.I(aclk_IBUF),
        .O(aclk_IBUF_BUFG));
  IBUF aclk_IBUF_inst
       (.I(aclk),
        .O(aclk_IBUF));
  OBUF \ar_addr_out_OBUF[0]_inst 
       (.I(ar_addr_out_OBUF[0]),
        .O(ar_addr_out[0]));
  OBUF \ar_addr_out_OBUF[10]_inst 
       (.I(ar_addr_out_OBUF[10]),
        .O(ar_addr_out[10]));
  OBUF \ar_addr_out_OBUF[11]_inst 
       (.I(ar_addr_out_OBUF[11]),
        .O(ar_addr_out[11]));
  OBUF \ar_addr_out_OBUF[12]_inst 
       (.I(ar_addr_out_OBUF[12]),
        .O(ar_addr_out[12]));
  OBUF \ar_addr_out_OBUF[13]_inst 
       (.I(ar_addr_out_OBUF[13]),
        .O(ar_addr_out[13]));
  OBUF \ar_addr_out_OBUF[14]_inst 
       (.I(ar_addr_out_OBUF[14]),
        .O(ar_addr_out[14]));
  OBUF \ar_addr_out_OBUF[15]_inst 
       (.I(ar_addr_out_OBUF[15]),
        .O(ar_addr_out[15]));
  OBUF \ar_addr_out_OBUF[16]_inst 
       (.I(ar_addr_out_OBUF[16]),
        .O(ar_addr_out[16]));
  OBUF \ar_addr_out_OBUF[17]_inst 
       (.I(ar_addr_out_OBUF[17]),
        .O(ar_addr_out[17]));
  OBUF \ar_addr_out_OBUF[18]_inst 
       (.I(ar_addr_out_OBUF[18]),
        .O(ar_addr_out[18]));
  OBUF \ar_addr_out_OBUF[19]_inst 
       (.I(ar_addr_out_OBUF[19]),
        .O(ar_addr_out[19]));
  OBUF \ar_addr_out_OBUF[1]_inst 
       (.I(ar_addr_out_OBUF[1]),
        .O(ar_addr_out[1]));
  OBUF \ar_addr_out_OBUF[20]_inst 
       (.I(ar_addr_out_OBUF[20]),
        .O(ar_addr_out[20]));
  OBUF \ar_addr_out_OBUF[21]_inst 
       (.I(ar_addr_out_OBUF[21]),
        .O(ar_addr_out[21]));
  OBUF \ar_addr_out_OBUF[22]_inst 
       (.I(ar_addr_out_OBUF[22]),
        .O(ar_addr_out[22]));
  OBUF \ar_addr_out_OBUF[23]_inst 
       (.I(ar_addr_out_OBUF[23]),
        .O(ar_addr_out[23]));
  OBUF \ar_addr_out_OBUF[24]_inst 
       (.I(ar_addr_out_OBUF[24]),
        .O(ar_addr_out[24]));
  OBUF \ar_addr_out_OBUF[25]_inst 
       (.I(ar_addr_out_OBUF[25]),
        .O(ar_addr_out[25]));
  OBUF \ar_addr_out_OBUF[26]_inst 
       (.I(ar_addr_out_OBUF[26]),
        .O(ar_addr_out[26]));
  OBUF \ar_addr_out_OBUF[27]_inst 
       (.I(ar_addr_out_OBUF[27]),
        .O(ar_addr_out[27]));
  OBUF \ar_addr_out_OBUF[28]_inst 
       (.I(ar_addr_out_OBUF[28]),
        .O(ar_addr_out[28]));
  OBUF \ar_addr_out_OBUF[29]_inst 
       (.I(ar_addr_out_OBUF[29]),
        .O(ar_addr_out[29]));
  OBUF \ar_addr_out_OBUF[2]_inst 
       (.I(ar_addr_out_OBUF[2]),
        .O(ar_addr_out[2]));
  OBUF \ar_addr_out_OBUF[30]_inst 
       (.I(ar_addr_out_OBUF[30]),
        .O(ar_addr_out[30]));
  OBUF \ar_addr_out_OBUF[31]_inst 
       (.I(ar_addr_out_OBUF[31]),
        .O(ar_addr_out[31]));
  OBUF \ar_addr_out_OBUF[32]_inst 
       (.I(ar_addr_out_OBUF[32]),
        .O(ar_addr_out[32]));
  OBUF \ar_addr_out_OBUF[33]_inst 
       (.I(ar_addr_out_OBUF[33]),
        .O(ar_addr_out[33]));
  OBUF \ar_addr_out_OBUF[34]_inst 
       (.I(ar_addr_out_OBUF[34]),
        .O(ar_addr_out[34]));
  OBUF \ar_addr_out_OBUF[35]_inst 
       (.I(ar_addr_out_OBUF[35]),
        .O(ar_addr_out[35]));
  OBUF \ar_addr_out_OBUF[36]_inst 
       (.I(ar_addr_out_OBUF[36]),
        .O(ar_addr_out[36]));
  OBUF \ar_addr_out_OBUF[37]_inst 
       (.I(ar_addr_out_OBUF[37]),
        .O(ar_addr_out[37]));
  OBUF \ar_addr_out_OBUF[38]_inst 
       (.I(ar_addr_out_OBUF[38]),
        .O(ar_addr_out[38]));
  OBUF \ar_addr_out_OBUF[39]_inst 
       (.I(ar_addr_out_OBUF[39]),
        .O(ar_addr_out[39]));
  OBUF \ar_addr_out_OBUF[3]_inst 
       (.I(ar_addr_out_OBUF[3]),
        .O(ar_addr_out[3]));
  OBUF \ar_addr_out_OBUF[40]_inst 
       (.I(ar_addr_out_OBUF[40]),
        .O(ar_addr_out[40]));
  OBUF \ar_addr_out_OBUF[41]_inst 
       (.I(ar_addr_out_OBUF[41]),
        .O(ar_addr_out[41]));
  OBUF \ar_addr_out_OBUF[42]_inst 
       (.I(ar_addr_out_OBUF[42]),
        .O(ar_addr_out[42]));
  OBUF \ar_addr_out_OBUF[43]_inst 
       (.I(ar_addr_out_OBUF[43]),
        .O(ar_addr_out[43]));
  OBUF \ar_addr_out_OBUF[44]_inst 
       (.I(ar_addr_out_OBUF[44]),
        .O(ar_addr_out[44]));
  OBUF \ar_addr_out_OBUF[45]_inst 
       (.I(ar_addr_out_OBUF[45]),
        .O(ar_addr_out[45]));
  OBUF \ar_addr_out_OBUF[46]_inst 
       (.I(ar_addr_out_OBUF[46]),
        .O(ar_addr_out[46]));
  OBUF \ar_addr_out_OBUF[47]_inst 
       (.I(ar_addr_out_OBUF[47]),
        .O(ar_addr_out[47]));
  OBUF \ar_addr_out_OBUF[48]_inst 
       (.I(ar_addr_out_OBUF[48]),
        .O(ar_addr_out[48]));
  OBUF \ar_addr_out_OBUF[49]_inst 
       (.I(ar_addr_out_OBUF[49]),
        .O(ar_addr_out[49]));
  OBUF \ar_addr_out_OBUF[4]_inst 
       (.I(ar_addr_out_OBUF[4]),
        .O(ar_addr_out[4]));
  OBUF \ar_addr_out_OBUF[5]_inst 
       (.I(ar_addr_out_OBUF[5]),
        .O(ar_addr_out[5]));
  OBUF \ar_addr_out_OBUF[6]_inst 
       (.I(ar_addr_out_OBUF[6]),
        .O(ar_addr_out[6]));
  OBUF \ar_addr_out_OBUF[7]_inst 
       (.I(ar_addr_out_OBUF[7]),
        .O(ar_addr_out[7]));
  OBUF \ar_addr_out_OBUF[8]_inst 
       (.I(ar_addr_out_OBUF[8]),
        .O(ar_addr_out[8]));
  OBUF \ar_addr_out_OBUF[9]_inst 
       (.I(ar_addr_out_OBUF[9]),
        .O(ar_addr_out[9]));
  OBUF ar_read_ready_OBUF_inst
       (.I(ar_read_ready_OBUF),
        .O(ar_read_ready));
  OBUF arempty_OBUF_inst
       (.I(arempty_OBUF),
        .O(arempty));
  IBUF areset_IBUF_inst
       (.I(areset),
        .O(areset_IBUF));
  OBUF arfull_OBUF_inst
       (.I(arfull_OBUF),
        .O(arfull));
  IBUF \axi_in_data_IBUF[0]_inst 
       (.I(axi_in_data[0]),
        .O(axi_in_data_IBUF[0]));
  IBUF \axi_in_data_IBUF[10]_inst 
       (.I(axi_in_data[10]),
        .O(axi_in_data_IBUF[10]));
  IBUF \axi_in_data_IBUF[11]_inst 
       (.I(axi_in_data[11]),
        .O(axi_in_data_IBUF[11]));
  IBUF \axi_in_data_IBUF[12]_inst 
       (.I(axi_in_data[12]),
        .O(axi_in_data_IBUF[12]));
  IBUF \axi_in_data_IBUF[13]_inst 
       (.I(axi_in_data[13]),
        .O(axi_in_data_IBUF[13]));
  IBUF \axi_in_data_IBUF[14]_inst 
       (.I(axi_in_data[14]),
        .O(axi_in_data_IBUF[14]));
  IBUF \axi_in_data_IBUF[15]_inst 
       (.I(axi_in_data[15]),
        .O(axi_in_data_IBUF[15]));
  IBUF \axi_in_data_IBUF[16]_inst 
       (.I(axi_in_data[16]),
        .O(axi_in_data_IBUF[16]));
  IBUF \axi_in_data_IBUF[17]_inst 
       (.I(axi_in_data[17]),
        .O(axi_in_data_IBUF[17]));
  IBUF \axi_in_data_IBUF[18]_inst 
       (.I(axi_in_data[18]),
        .O(axi_in_data_IBUF[18]));
  IBUF \axi_in_data_IBUF[19]_inst 
       (.I(axi_in_data[19]),
        .O(axi_in_data_IBUF[19]));
  IBUF \axi_in_data_IBUF[1]_inst 
       (.I(axi_in_data[1]),
        .O(axi_in_data_IBUF[1]));
  IBUF \axi_in_data_IBUF[20]_inst 
       (.I(axi_in_data[20]),
        .O(axi_in_data_IBUF[20]));
  IBUF \axi_in_data_IBUF[21]_inst 
       (.I(axi_in_data[21]),
        .O(axi_in_data_IBUF[21]));
  IBUF \axi_in_data_IBUF[22]_inst 
       (.I(axi_in_data[22]),
        .O(axi_in_data_IBUF[22]));
  IBUF \axi_in_data_IBUF[23]_inst 
       (.I(axi_in_data[23]),
        .O(axi_in_data_IBUF[23]));
  IBUF \axi_in_data_IBUF[24]_inst 
       (.I(axi_in_data[24]),
        .O(axi_in_data_IBUF[24]));
  IBUF \axi_in_data_IBUF[25]_inst 
       (.I(axi_in_data[25]),
        .O(axi_in_data_IBUF[25]));
  IBUF \axi_in_data_IBUF[26]_inst 
       (.I(axi_in_data[26]),
        .O(axi_in_data_IBUF[26]));
  IBUF \axi_in_data_IBUF[27]_inst 
       (.I(axi_in_data[27]),
        .O(axi_in_data_IBUF[27]));
  IBUF \axi_in_data_IBUF[28]_inst 
       (.I(axi_in_data[28]),
        .O(axi_in_data_IBUF[28]));
  IBUF \axi_in_data_IBUF[29]_inst 
       (.I(axi_in_data[29]),
        .O(axi_in_data_IBUF[29]));
  IBUF \axi_in_data_IBUF[2]_inst 
       (.I(axi_in_data[2]),
        .O(axi_in_data_IBUF[2]));
  IBUF \axi_in_data_IBUF[30]_inst 
       (.I(axi_in_data[30]),
        .O(axi_in_data_IBUF[30]));
  IBUF \axi_in_data_IBUF[31]_inst 
       (.I(axi_in_data[31]),
        .O(axi_in_data_IBUF[31]));
  IBUF \axi_in_data_IBUF[32]_inst 
       (.I(axi_in_data[32]),
        .O(axi_in_data_IBUF[32]));
  IBUF \axi_in_data_IBUF[33]_inst 
       (.I(axi_in_data[33]),
        .O(axi_in_data_IBUF[33]));
  IBUF \axi_in_data_IBUF[34]_inst 
       (.I(axi_in_data[34]),
        .O(axi_in_data_IBUF[34]));
  IBUF \axi_in_data_IBUF[35]_inst 
       (.I(axi_in_data[35]),
        .O(axi_in_data_IBUF[35]));
  IBUF \axi_in_data_IBUF[36]_inst 
       (.I(axi_in_data[36]),
        .O(axi_in_data_IBUF[36]));
  IBUF \axi_in_data_IBUF[37]_inst 
       (.I(axi_in_data[37]),
        .O(axi_in_data_IBUF[37]));
  IBUF \axi_in_data_IBUF[38]_inst 
       (.I(axi_in_data[38]),
        .O(axi_in_data_IBUF[38]));
  IBUF \axi_in_data_IBUF[39]_inst 
       (.I(axi_in_data[39]),
        .O(axi_in_data_IBUF[39]));
  IBUF \axi_in_data_IBUF[3]_inst 
       (.I(axi_in_data[3]),
        .O(axi_in_data_IBUF[3]));
  IBUF \axi_in_data_IBUF[40]_inst 
       (.I(axi_in_data[40]),
        .O(axi_in_data_IBUF[40]));
  IBUF \axi_in_data_IBUF[41]_inst 
       (.I(axi_in_data[41]),
        .O(axi_in_data_IBUF[41]));
  IBUF \axi_in_data_IBUF[42]_inst 
       (.I(axi_in_data[42]),
        .O(axi_in_data_IBUF[42]));
  IBUF \axi_in_data_IBUF[43]_inst 
       (.I(axi_in_data[43]),
        .O(axi_in_data_IBUF[43]));
  IBUF \axi_in_data_IBUF[44]_inst 
       (.I(axi_in_data[44]),
        .O(axi_in_data_IBUF[44]));
  IBUF \axi_in_data_IBUF[45]_inst 
       (.I(axi_in_data[45]),
        .O(axi_in_data_IBUF[45]));
  IBUF \axi_in_data_IBUF[46]_inst 
       (.I(axi_in_data[46]),
        .O(axi_in_data_IBUF[46]));
  IBUF \axi_in_data_IBUF[47]_inst 
       (.I(axi_in_data[47]),
        .O(axi_in_data_IBUF[47]));
  IBUF \axi_in_data_IBUF[48]_inst 
       (.I(axi_in_data[48]),
        .O(axi_in_data_IBUF[48]));
  IBUF \axi_in_data_IBUF[49]_inst 
       (.I(axi_in_data[49]),
        .O(axi_in_data_IBUF[49]));
  IBUF \axi_in_data_IBUF[4]_inst 
       (.I(axi_in_data[4]),
        .O(axi_in_data_IBUF[4]));
  IBUF \axi_in_data_IBUF[50]_inst 
       (.I(axi_in_data[50]),
        .O(axi_in_data_IBUF[50]));
  IBUF \axi_in_data_IBUF[51]_inst 
       (.I(axi_in_data[51]),
        .O(axi_in_data_IBUF[51]));
  IBUF \axi_in_data_IBUF[52]_inst 
       (.I(axi_in_data[52]),
        .O(axi_in_data_IBUF[52]));
  IBUF \axi_in_data_IBUF[53]_inst 
       (.I(axi_in_data[53]),
        .O(axi_in_data_IBUF[53]));
  IBUF \axi_in_data_IBUF[54]_inst 
       (.I(axi_in_data[54]),
        .O(axi_in_data_IBUF[54]));
  IBUF \axi_in_data_IBUF[55]_inst 
       (.I(axi_in_data[55]),
        .O(axi_in_data_IBUF[55]));
  IBUF \axi_in_data_IBUF[56]_inst 
       (.I(axi_in_data[56]),
        .O(axi_in_data_IBUF[56]));
  IBUF \axi_in_data_IBUF[57]_inst 
       (.I(axi_in_data[57]),
        .O(axi_in_data_IBUF[57]));
  IBUF \axi_in_data_IBUF[58]_inst 
       (.I(axi_in_data[58]),
        .O(axi_in_data_IBUF[58]));
  IBUF \axi_in_data_IBUF[59]_inst 
       (.I(axi_in_data[59]),
        .O(axi_in_data_IBUF[59]));
  IBUF \axi_in_data_IBUF[5]_inst 
       (.I(axi_in_data[5]),
        .O(axi_in_data_IBUF[5]));
  IBUF \axi_in_data_IBUF[60]_inst 
       (.I(axi_in_data[60]),
        .O(axi_in_data_IBUF[60]));
  IBUF \axi_in_data_IBUF[61]_inst 
       (.I(axi_in_data[61]),
        .O(axi_in_data_IBUF[61]));
  IBUF \axi_in_data_IBUF[62]_inst 
       (.I(axi_in_data[62]),
        .O(axi_in_data_IBUF[62]));
  IBUF \axi_in_data_IBUF[63]_inst 
       (.I(axi_in_data[63]),
        .O(axi_in_data_IBUF[63]));
  IBUF \axi_in_data_IBUF[6]_inst 
       (.I(axi_in_data[6]),
        .O(axi_in_data_IBUF[6]));
  IBUF \axi_in_data_IBUF[7]_inst 
       (.I(axi_in_data[7]),
        .O(axi_in_data_IBUF[7]));
  IBUF \axi_in_data_IBUF[8]_inst 
       (.I(axi_in_data[8]),
        .O(axi_in_data_IBUF[8]));
  IBUF \axi_in_data_IBUF[9]_inst 
       (.I(axi_in_data[9]),
        .O(axi_in_data_IBUF[9]));
  OBUF \axi_out_data_OBUF[0]_inst 
       (.I(axi_out_data_OBUF[0]),
        .O(axi_out_data[0]));
  OBUF \axi_out_data_OBUF[10]_inst 
       (.I(axi_out_data_OBUF[10]),
        .O(axi_out_data[10]));
  OBUF \axi_out_data_OBUF[11]_inst 
       (.I(axi_out_data_OBUF[11]),
        .O(axi_out_data[11]));
  OBUF \axi_out_data_OBUF[12]_inst 
       (.I(axi_out_data_OBUF[12]),
        .O(axi_out_data[12]));
  OBUF \axi_out_data_OBUF[13]_inst 
       (.I(axi_out_data_OBUF[13]),
        .O(axi_out_data[13]));
  OBUF \axi_out_data_OBUF[14]_inst 
       (.I(axi_out_data_OBUF[14]),
        .O(axi_out_data[14]));
  OBUF \axi_out_data_OBUF[15]_inst 
       (.I(axi_out_data_OBUF[15]),
        .O(axi_out_data[15]));
  OBUF \axi_out_data_OBUF[16]_inst 
       (.I(axi_out_data_OBUF[16]),
        .O(axi_out_data[16]));
  OBUF \axi_out_data_OBUF[17]_inst 
       (.I(axi_out_data_OBUF[17]),
        .O(axi_out_data[17]));
  OBUF \axi_out_data_OBUF[18]_inst 
       (.I(axi_out_data_OBUF[18]),
        .O(axi_out_data[18]));
  OBUF \axi_out_data_OBUF[19]_inst 
       (.I(axi_out_data_OBUF[19]),
        .O(axi_out_data[19]));
  OBUF \axi_out_data_OBUF[1]_inst 
       (.I(axi_out_data_OBUF[1]),
        .O(axi_out_data[1]));
  OBUF \axi_out_data_OBUF[20]_inst 
       (.I(axi_out_data_OBUF[20]),
        .O(axi_out_data[20]));
  OBUF \axi_out_data_OBUF[21]_inst 
       (.I(axi_out_data_OBUF[21]),
        .O(axi_out_data[21]));
  OBUF \axi_out_data_OBUF[22]_inst 
       (.I(axi_out_data_OBUF[22]),
        .O(axi_out_data[22]));
  OBUF \axi_out_data_OBUF[23]_inst 
       (.I(axi_out_data_OBUF[23]),
        .O(axi_out_data[23]));
  OBUF \axi_out_data_OBUF[24]_inst 
       (.I(axi_out_data_OBUF[24]),
        .O(axi_out_data[24]));
  OBUF \axi_out_data_OBUF[25]_inst 
       (.I(axi_out_data_OBUF[25]),
        .O(axi_out_data[25]));
  OBUF \axi_out_data_OBUF[26]_inst 
       (.I(axi_out_data_OBUF[26]),
        .O(axi_out_data[26]));
  OBUF \axi_out_data_OBUF[27]_inst 
       (.I(axi_out_data_OBUF[27]),
        .O(axi_out_data[27]));
  OBUF \axi_out_data_OBUF[28]_inst 
       (.I(axi_out_data_OBUF[28]),
        .O(axi_out_data[28]));
  OBUF \axi_out_data_OBUF[29]_inst 
       (.I(axi_out_data_OBUF[29]),
        .O(axi_out_data[29]));
  OBUF \axi_out_data_OBUF[2]_inst 
       (.I(axi_out_data_OBUF[2]),
        .O(axi_out_data[2]));
  OBUF \axi_out_data_OBUF[30]_inst 
       (.I(axi_out_data_OBUF[30]),
        .O(axi_out_data[30]));
  OBUF \axi_out_data_OBUF[31]_inst 
       (.I(axi_out_data_OBUF[31]),
        .O(axi_out_data[31]));
  OBUF \axi_out_data_OBUF[32]_inst 
       (.I(axi_out_data_OBUF[32]),
        .O(axi_out_data[32]));
  OBUF \axi_out_data_OBUF[33]_inst 
       (.I(axi_out_data_OBUF[33]),
        .O(axi_out_data[33]));
  OBUF \axi_out_data_OBUF[34]_inst 
       (.I(axi_out_data_OBUF[34]),
        .O(axi_out_data[34]));
  OBUF \axi_out_data_OBUF[35]_inst 
       (.I(axi_out_data_OBUF[35]),
        .O(axi_out_data[35]));
  OBUF \axi_out_data_OBUF[36]_inst 
       (.I(axi_out_data_OBUF[36]),
        .O(axi_out_data[36]));
  OBUF \axi_out_data_OBUF[37]_inst 
       (.I(axi_out_data_OBUF[37]),
        .O(axi_out_data[37]));
  OBUF \axi_out_data_OBUF[38]_inst 
       (.I(axi_out_data_OBUF[38]),
        .O(axi_out_data[38]));
  OBUF \axi_out_data_OBUF[39]_inst 
       (.I(axi_out_data_OBUF[39]),
        .O(axi_out_data[39]));
  OBUF \axi_out_data_OBUF[3]_inst 
       (.I(axi_out_data_OBUF[3]),
        .O(axi_out_data[3]));
  OBUF \axi_out_data_OBUF[40]_inst 
       (.I(axi_out_data_OBUF[40]),
        .O(axi_out_data[40]));
  OBUF \axi_out_data_OBUF[41]_inst 
       (.I(axi_out_data_OBUF[41]),
        .O(axi_out_data[41]));
  OBUF \axi_out_data_OBUF[42]_inst 
       (.I(axi_out_data_OBUF[42]),
        .O(axi_out_data[42]));
  OBUF \axi_out_data_OBUF[43]_inst 
       (.I(axi_out_data_OBUF[43]),
        .O(axi_out_data[43]));
  OBUF \axi_out_data_OBUF[44]_inst 
       (.I(axi_out_data_OBUF[44]),
        .O(axi_out_data[44]));
  OBUF \axi_out_data_OBUF[45]_inst 
       (.I(axi_out_data_OBUF[45]),
        .O(axi_out_data[45]));
  OBUF \axi_out_data_OBUF[46]_inst 
       (.I(axi_out_data_OBUF[46]),
        .O(axi_out_data[46]));
  OBUF \axi_out_data_OBUF[47]_inst 
       (.I(axi_out_data_OBUF[47]),
        .O(axi_out_data[47]));
  OBUF \axi_out_data_OBUF[48]_inst 
       (.I(axi_out_data_OBUF[48]),
        .O(axi_out_data[48]));
  OBUF \axi_out_data_OBUF[49]_inst 
       (.I(axi_out_data_OBUF[49]),
        .O(axi_out_data[49]));
  OBUF \axi_out_data_OBUF[4]_inst 
       (.I(axi_out_data_OBUF[4]),
        .O(axi_out_data[4]));
  OBUF \axi_out_data_OBUF[50]_inst 
       (.I(axi_out_data_OBUF[50]),
        .O(axi_out_data[50]));
  OBUF \axi_out_data_OBUF[51]_inst 
       (.I(axi_out_data_OBUF[51]),
        .O(axi_out_data[51]));
  OBUF \axi_out_data_OBUF[52]_inst 
       (.I(axi_out_data_OBUF[52]),
        .O(axi_out_data[52]));
  OBUF \axi_out_data_OBUF[53]_inst 
       (.I(axi_out_data_OBUF[53]),
        .O(axi_out_data[53]));
  OBUF \axi_out_data_OBUF[54]_inst 
       (.I(axi_out_data_OBUF[54]),
        .O(axi_out_data[54]));
  OBUF \axi_out_data_OBUF[55]_inst 
       (.I(axi_out_data_OBUF[55]),
        .O(axi_out_data[55]));
  OBUF \axi_out_data_OBUF[56]_inst 
       (.I(axi_out_data_OBUF[56]),
        .O(axi_out_data[56]));
  OBUF \axi_out_data_OBUF[57]_inst 
       (.I(axi_out_data_OBUF[57]),
        .O(axi_out_data[57]));
  OBUF \axi_out_data_OBUF[58]_inst 
       (.I(axi_out_data_OBUF[58]),
        .O(axi_out_data[58]));
  OBUF \axi_out_data_OBUF[59]_inst 
       (.I(axi_out_data_OBUF[59]),
        .O(axi_out_data[59]));
  OBUF \axi_out_data_OBUF[5]_inst 
       (.I(axi_out_data_OBUF[5]),
        .O(axi_out_data[5]));
  OBUF \axi_out_data_OBUF[60]_inst 
       (.I(axi_out_data_OBUF[60]),
        .O(axi_out_data[60]));
  OBUF \axi_out_data_OBUF[61]_inst 
       (.I(axi_out_data_OBUF[61]),
        .O(axi_out_data[61]));
  OBUF \axi_out_data_OBUF[62]_inst 
       (.I(axi_out_data_OBUF[62]),
        .O(axi_out_data[62]));
  OBUF \axi_out_data_OBUF[63]_inst 
       (.I(axi_out_data_OBUF[63]),
        .O(axi_out_data[63]));
  OBUF \axi_out_data_OBUF[6]_inst 
       (.I(axi_out_data_OBUF[6]),
        .O(axi_out_data[6]));
  OBUF \axi_out_data_OBUF[7]_inst 
       (.I(axi_out_data_OBUF[7]),
        .O(axi_out_data[7]));
  OBUF \axi_out_data_OBUF[8]_inst 
       (.I(axi_out_data_OBUF[8]),
        .O(axi_out_data[8]));
  OBUF \axi_out_data_OBUF[9]_inst 
       (.I(axi_out_data_OBUF[9]),
        .O(axi_out_data[9]));
  IBUF \burst_type_IBUF[0]_inst 
       (.I(burst_type[0]),
        .O(burst_type_IBUF[0]));
  IBUF \burst_type_IBUF[1]_inst 
       (.I(burst_type[1]),
        .O(burst_type_IBUF[1]));
  IBUF \in_addr_IBUF[0]_inst 
       (.I(in_addr[0]),
        .O(in_addr_IBUF[0]));
  IBUF \in_addr_IBUF[10]_inst 
       (.I(in_addr[10]),
        .O(in_addr_IBUF[10]));
  IBUF \in_addr_IBUF[11]_inst 
       (.I(in_addr[11]),
        .O(in_addr_IBUF[11]));
  IBUF \in_addr_IBUF[12]_inst 
       (.I(in_addr[12]),
        .O(in_addr_IBUF[12]));
  IBUF \in_addr_IBUF[13]_inst 
       (.I(in_addr[13]),
        .O(in_addr_IBUF[13]));
  IBUF \in_addr_IBUF[14]_inst 
       (.I(in_addr[14]),
        .O(in_addr_IBUF[14]));
  IBUF \in_addr_IBUF[15]_inst 
       (.I(in_addr[15]),
        .O(in_addr_IBUF[15]));
  IBUF \in_addr_IBUF[16]_inst 
       (.I(in_addr[16]),
        .O(in_addr_IBUF[16]));
  IBUF \in_addr_IBUF[17]_inst 
       (.I(in_addr[17]),
        .O(in_addr_IBUF[17]));
  IBUF \in_addr_IBUF[18]_inst 
       (.I(in_addr[18]),
        .O(in_addr_IBUF[18]));
  IBUF \in_addr_IBUF[19]_inst 
       (.I(in_addr[19]),
        .O(in_addr_IBUF[19]));
  IBUF \in_addr_IBUF[1]_inst 
       (.I(in_addr[1]),
        .O(in_addr_IBUF[1]));
  IBUF \in_addr_IBUF[20]_inst 
       (.I(in_addr[20]),
        .O(in_addr_IBUF[20]));
  IBUF \in_addr_IBUF[21]_inst 
       (.I(in_addr[21]),
        .O(in_addr_IBUF[21]));
  IBUF \in_addr_IBUF[22]_inst 
       (.I(in_addr[22]),
        .O(in_addr_IBUF[22]));
  IBUF \in_addr_IBUF[23]_inst 
       (.I(in_addr[23]),
        .O(in_addr_IBUF[23]));
  IBUF \in_addr_IBUF[24]_inst 
       (.I(in_addr[24]),
        .O(in_addr_IBUF[24]));
  IBUF \in_addr_IBUF[25]_inst 
       (.I(in_addr[25]),
        .O(in_addr_IBUF[25]));
  IBUF \in_addr_IBUF[26]_inst 
       (.I(in_addr[26]),
        .O(in_addr_IBUF[26]));
  IBUF \in_addr_IBUF[27]_inst 
       (.I(in_addr[27]),
        .O(in_addr_IBUF[27]));
  IBUF \in_addr_IBUF[28]_inst 
       (.I(in_addr[28]),
        .O(in_addr_IBUF[28]));
  IBUF \in_addr_IBUF[29]_inst 
       (.I(in_addr[29]),
        .O(in_addr_IBUF[29]));
  IBUF \in_addr_IBUF[2]_inst 
       (.I(in_addr[2]),
        .O(in_addr_IBUF[2]));
  IBUF \in_addr_IBUF[30]_inst 
       (.I(in_addr[30]),
        .O(in_addr_IBUF[30]));
  IBUF \in_addr_IBUF[31]_inst 
       (.I(in_addr[31]),
        .O(in_addr_IBUF[31]));
  IBUF \in_addr_IBUF[3]_inst 
       (.I(in_addr[3]),
        .O(in_addr_IBUF[3]));
  IBUF \in_addr_IBUF[4]_inst 
       (.I(in_addr[4]),
        .O(in_addr_IBUF[4]));
  IBUF \in_addr_IBUF[5]_inst 
       (.I(in_addr[5]),
        .O(in_addr_IBUF[5]));
  IBUF \in_addr_IBUF[6]_inst 
       (.I(in_addr[6]),
        .O(in_addr_IBUF[6]));
  IBUF \in_addr_IBUF[7]_inst 
       (.I(in_addr[7]),
        .O(in_addr_IBUF[7]));
  IBUF \in_addr_IBUF[8]_inst 
       (.I(in_addr[8]),
        .O(in_addr_IBUF[8]));
  IBUF \in_addr_IBUF[9]_inst 
       (.I(in_addr[9]),
        .O(in_addr_IBUF[9]));
  IBUF \in_id_IBUF[0]_inst 
       (.I(in_id[0]),
        .O(in_id_IBUF[0]));
  IBUF \in_id_IBUF[1]_inst 
       (.I(in_id[1]),
        .O(in_id_IBUF[1]));
  IBUF \in_id_IBUF[2]_inst 
       (.I(in_id[2]),
        .O(in_id_IBUF[2]));
  IBUF \in_id_IBUF[3]_inst 
       (.I(in_id[3]),
        .O(in_id_IBUF[3]));
  IBUF \in_len_IBUF[0]_inst 
       (.I(in_len[0]),
        .O(in_len_IBUF[0]));
  IBUF \in_len_IBUF[1]_inst 
       (.I(in_len[1]),
        .O(in_len_IBUF[1]));
  IBUF \in_len_IBUF[2]_inst 
       (.I(in_len[2]),
        .O(in_len_IBUF[2]));
  IBUF \in_len_IBUF[3]_inst 
       (.I(in_len[3]),
        .O(in_len_IBUF[3]));
  IBUF \in_len_IBUF[4]_inst 
       (.I(in_len[4]),
        .O(in_len_IBUF[4]));
  IBUF \in_len_IBUF[5]_inst 
       (.I(in_len[5]),
        .O(in_len_IBUF[5]));
  IBUF \in_len_IBUF[6]_inst 
       (.I(in_len[6]),
        .O(in_len_IBUF[6]));
  IBUF \in_len_IBUF[7]_inst 
       (.I(in_len[7]),
        .O(in_len_IBUF[7]));
  IBUF \in_size_IBUF[0]_inst 
       (.I(in_size[0]),
        .O(in_size_IBUF[0]));
  IBUF \in_size_IBUF[1]_inst 
       (.I(in_size[1]),
        .O(in_size_IBUF[1]));
  IBUF \in_size_IBUF[2]_inst 
       (.I(in_size[2]),
        .O(in_size_IBUF[2]));
  IBUF \in_size_IBUF[3]_inst 
       (.I(in_size[3]),
        .O(in_size_IBUF[3]));
  IBUF \in_strb_IBUF[0]_inst 
       (.I(in_strb[0]),
        .O(in_strb_IBUF[0]));
  IBUF \in_strb_IBUF[1]_inst 
       (.I(in_strb[1]),
        .O(in_strb_IBUF[1]));
  IBUF \in_strb_IBUF[2]_inst 
       (.I(in_strb[2]),
        .O(in_strb_IBUF[2]));
  IBUF \in_strb_IBUF[3]_inst 
       (.I(in_strb[3]),
        .O(in_strb_IBUF[3]));
  IBUF \in_strb_IBUF[4]_inst 
       (.I(in_strb[4]),
        .O(in_strb_IBUF[4]));
  IBUF \in_strb_IBUF[5]_inst 
       (.I(in_strb[5]),
        .O(in_strb_IBUF[5]));
  IBUF \in_strb_IBUF[6]_inst 
       (.I(in_strb[6]),
        .O(in_strb_IBUF[6]));
  IBUF \in_strb_IBUF[7]_inst 
       (.I(in_strb[7]),
        .O(in_strb_IBUF[7]));
  (* ADDR_WIDTH = "32" *) 
  (* DATA = "2'b10" *) 
  (* DATA_WIDTH = "64" *) 
  (* IDEL = "2'b00" *) 
  (* ID_WIDTH = "4" *) 
  (* LEN_WIDTH = "8" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* SIZE_WIDTH = "4" *) 
  (* START = "2'b01" *) 
  AXI_MASTER master_inst
       (.aclk(aclk_IBUF_BUFG),
        .araddr(araddr),
        .arburst(arburst),
        .areset(areset_IBUF),
        .arid(arid),
        .arlen(arlen),
        .arready(arready),
        .arsize(NLW_master_inst_arsize_UNCONNECTED[3:0]),
        .arvalid(arvalid),
        .awaddr(NLW_master_inst_awaddr_UNCONNECTED[31:0]),
        .awburst(NLW_master_inst_awburst_UNCONNECTED[1:0]),
        .awid(NLW_master_inst_awid_UNCONNECTED[3:0]),
        .awlen(NLW_master_inst_awlen_UNCONNECTED[7:0]),
        .awready(awready),
        .awsize(awsize),
        .awvalid(awvalid),
        .bid(w_bid),
        .bready(w_bready),
        .bresp({1'b0,w_bresp,1'b0}),
        .burst_type(burst_type_IBUF),
        .bvalid(w_bvalid),
        .in_addr(in_addr_IBUF),
        .in_data(axi_in_data_IBUF),
        .in_id(in_id_IBUF),
        .in_len(in_len_IBUF),
        .in_size(in_size_IBUF),
        .in_strb(in_strb_IBUF),
        .out_bid(write_id_OBUF),
        .out_bresp({NLW_master_inst_out_bresp_UNCONNECTED[2],write_resp_OBUF,NLW_master_inst_out_bresp_UNCONNECTED[0]}),
        .r_trigger(r_trigger_IBUF),
        .rdata(axi_out_data_OBUF),
        .read_data_out(read_data_out_OBUF),
        .read_id(read_id_OBUF),
        .read_resp({NLW_master_inst_read_resp_UNCONNECTED[2],read_resp_OBUF,NLW_master_inst_read_resp_UNCONNECTED[0]}),
        .rid(ar_addr_out_OBUF[47:44]),
        .rlast(rlast_out_OBUF),
        .rready(rready),
        .rresp({1'b0,rresp,1'b0}),
        .rvalid(rvalid_out_OBUF),
        .trigger(trigger_IBUF),
        .wdata(w_data),
        .wlast(NLW_master_inst_wlast_UNCONNECTED),
        .wready(wvalid_o_OBUF),
        .wstrb(wstrb),
        .wvalid(wvalid));
  IBUF r_rx_IBUF_inst
       (.I(r_rx),
        .O(r_rx_IBUF));
  IBUF r_trigger_IBUF_inst
       (.I(r_trigger),
        .O(r_trigger_IBUF));
  OBUF r_tx_OBUF_inst
       (.I(r_tx_OBUF),
        .O(r_tx));
  BUFG rd_clk_IBUF_BUFG_inst
       (.I(rd_clk_IBUF),
        .O(rd_clk_IBUF_BUFG));
  IBUF rd_clk_IBUF_inst
       (.I(rd_clk),
        .O(rd_clk_IBUF));
  (* ADDR_OFFSET = "16'b1110000000000000" *) 
  (* ADDR_WIDTH = "32" *) 
  (* ALIGN_BITS = "2" *) 
  (* AR_DEPTH = "32" *) 
  (* AW_DEPTH = "32" *) 
  (* AW_FIFO_WIDTH = "50" *) 
  (* BASE_ADDRESS = "16'b1110000100000000" *) 
  (* BYTES_WIDTH = "3" *) 
  (* CONTL_REG_WIDTH = "32" *) 
  (* CRTL = "2'b10" *) 
  (* CTRL_REG_ADDR = "8" *) 
  (* DATA_BYTES = "8" *) 
  (* DATA_WIDTH = "64" *) 
  (* DECERR = "3'b011" *) 
  (* DECODE = "3'b010" *) 
  (* END_OFFSET = "16'b0000100000010000" *) 
  (* IDEL = "3'b000" *) 
  (* ID_WIDTH = "4" *) 
  (* INTRPT_REG_ADDR = "12" *) 
  (* INTRT = "2'b11" *) 
  (* LEN_WIDTH = "8" *) 
  (* OFFSET_START_BITS = "8" *) 
  (* OKAY = "0" *) 
  (* READ_RX_ADDR = "3'b001" *) 
  (* READ_RX_DATA = "3'b011" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* RX_ADDRESS_OFFSET_END = "2324" *) 
  (* RX_ADDRESS_OFFSET_START = "2068" *) 
  (* R_DEPTH = "32" *) 
  (* SEND_AXI = "3'b101" *) 
  (* SIZE_WIDTH = "4" *) 
  (* SLVERR = "3'b010" *) 
  (* START_OFFSET = "16'b0000000000000000" *) 
  (* STATUS_REG_ADDR = "4" *) 
  (* STATUS_REG_WIDTH = "32" *) 
  (* STS = "2'b01" *) 
  (* TOTAL_BYTES = "2315" *) 
  (* TX_ADDRESS_OFFSET_END = "2064" *) 
  (* TX_ADDRESS_OFFSET_START = "16" *) 
  (* UART_RX_FIFO_DEPTH = "32" *) 
  (* UART_TX_FIFO_DEPTH = "256" *) 
  (* WRITE_BACK = "3'b100" *) 
  (* W_DEPTH = "32" *) 
  READ_BUFFER_CONTROLLER read_buffer_ctrl_inst
       (.aclk(aclk_IBUF_BUFG),
        .addr(rx_addr),
        .ar_addr_out({ar_addr_out_OBUF[49:48],1'b0,1'b0,1'b0,1'b0,ar_addr_out_OBUF[43:0]}),
        .ar_addr_read(ar_addr_read),
        .ar_read_ready(ar_read_ready_OBUF),
        .arempty(arempty_OBUF),
        .rd_clk(rd_clk_IBUF_BUFG),
        .rdata(NLW_read_buffer_ctrl_inst_rdata_UNCONNECTED[63:0]),
        .rid(NLW_read_buffer_ctrl_inst_rid_UNCONNECTED[3:0]),
        .rlast(rlast_out_OBUF),
        .rready(rready),
        .rresp({NLW_read_buffer_ctrl_inst_rresp_UNCONNECTED[2],rresp,NLW_read_buffer_ctrl_inst_rresp_UNCONNECTED[0]}),
        .rst(areset_IBUF),
        .rvalid(rvalid_out_OBUF),
        .rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rx_data_valid(rx_data_valid),
        .rx_en(rx_en),
        .wr_r_fifo_data(NLW_read_buffer_ctrl_inst_wr_r_fifo_data_UNCONNECTED[70:0]),
        .wr_r_fifo_en(NLW_read_buffer_ctrl_inst_wr_r_fifo_en_UNCONNECTED));
  OBUF \read_data_out_OBUF[0]_inst 
       (.I(read_data_out_OBUF[0]),
        .O(read_data_out[0]));
  OBUF \read_data_out_OBUF[10]_inst 
       (.I(read_data_out_OBUF[10]),
        .O(read_data_out[10]));
  OBUF \read_data_out_OBUF[11]_inst 
       (.I(read_data_out_OBUF[11]),
        .O(read_data_out[11]));
  OBUF \read_data_out_OBUF[12]_inst 
       (.I(read_data_out_OBUF[12]),
        .O(read_data_out[12]));
  OBUF \read_data_out_OBUF[13]_inst 
       (.I(read_data_out_OBUF[13]),
        .O(read_data_out[13]));
  OBUF \read_data_out_OBUF[14]_inst 
       (.I(read_data_out_OBUF[14]),
        .O(read_data_out[14]));
  OBUF \read_data_out_OBUF[15]_inst 
       (.I(read_data_out_OBUF[15]),
        .O(read_data_out[15]));
  OBUF \read_data_out_OBUF[16]_inst 
       (.I(read_data_out_OBUF[16]),
        .O(read_data_out[16]));
  OBUF \read_data_out_OBUF[17]_inst 
       (.I(read_data_out_OBUF[17]),
        .O(read_data_out[17]));
  OBUF \read_data_out_OBUF[18]_inst 
       (.I(read_data_out_OBUF[18]),
        .O(read_data_out[18]));
  OBUF \read_data_out_OBUF[19]_inst 
       (.I(read_data_out_OBUF[19]),
        .O(read_data_out[19]));
  OBUF \read_data_out_OBUF[1]_inst 
       (.I(read_data_out_OBUF[1]),
        .O(read_data_out[1]));
  OBUF \read_data_out_OBUF[20]_inst 
       (.I(read_data_out_OBUF[20]),
        .O(read_data_out[20]));
  OBUF \read_data_out_OBUF[21]_inst 
       (.I(read_data_out_OBUF[21]),
        .O(read_data_out[21]));
  OBUF \read_data_out_OBUF[22]_inst 
       (.I(read_data_out_OBUF[22]),
        .O(read_data_out[22]));
  OBUF \read_data_out_OBUF[23]_inst 
       (.I(read_data_out_OBUF[23]),
        .O(read_data_out[23]));
  OBUF \read_data_out_OBUF[24]_inst 
       (.I(read_data_out_OBUF[24]),
        .O(read_data_out[24]));
  OBUF \read_data_out_OBUF[25]_inst 
       (.I(read_data_out_OBUF[25]),
        .O(read_data_out[25]));
  OBUF \read_data_out_OBUF[26]_inst 
       (.I(read_data_out_OBUF[26]),
        .O(read_data_out[26]));
  OBUF \read_data_out_OBUF[27]_inst 
       (.I(read_data_out_OBUF[27]),
        .O(read_data_out[27]));
  OBUF \read_data_out_OBUF[28]_inst 
       (.I(read_data_out_OBUF[28]),
        .O(read_data_out[28]));
  OBUF \read_data_out_OBUF[29]_inst 
       (.I(read_data_out_OBUF[29]),
        .O(read_data_out[29]));
  OBUF \read_data_out_OBUF[2]_inst 
       (.I(read_data_out_OBUF[2]),
        .O(read_data_out[2]));
  OBUF \read_data_out_OBUF[30]_inst 
       (.I(read_data_out_OBUF[30]),
        .O(read_data_out[30]));
  OBUF \read_data_out_OBUF[31]_inst 
       (.I(read_data_out_OBUF[31]),
        .O(read_data_out[31]));
  OBUF \read_data_out_OBUF[32]_inst 
       (.I(read_data_out_OBUF[32]),
        .O(read_data_out[32]));
  OBUF \read_data_out_OBUF[33]_inst 
       (.I(read_data_out_OBUF[33]),
        .O(read_data_out[33]));
  OBUF \read_data_out_OBUF[34]_inst 
       (.I(read_data_out_OBUF[34]),
        .O(read_data_out[34]));
  OBUF \read_data_out_OBUF[35]_inst 
       (.I(read_data_out_OBUF[35]),
        .O(read_data_out[35]));
  OBUF \read_data_out_OBUF[36]_inst 
       (.I(read_data_out_OBUF[36]),
        .O(read_data_out[36]));
  OBUF \read_data_out_OBUF[37]_inst 
       (.I(read_data_out_OBUF[37]),
        .O(read_data_out[37]));
  OBUF \read_data_out_OBUF[38]_inst 
       (.I(read_data_out_OBUF[38]),
        .O(read_data_out[38]));
  OBUF \read_data_out_OBUF[39]_inst 
       (.I(read_data_out_OBUF[39]),
        .O(read_data_out[39]));
  OBUF \read_data_out_OBUF[3]_inst 
       (.I(read_data_out_OBUF[3]),
        .O(read_data_out[3]));
  OBUF \read_data_out_OBUF[40]_inst 
       (.I(read_data_out_OBUF[40]),
        .O(read_data_out[40]));
  OBUF \read_data_out_OBUF[41]_inst 
       (.I(read_data_out_OBUF[41]),
        .O(read_data_out[41]));
  OBUF \read_data_out_OBUF[42]_inst 
       (.I(read_data_out_OBUF[42]),
        .O(read_data_out[42]));
  OBUF \read_data_out_OBUF[43]_inst 
       (.I(read_data_out_OBUF[43]),
        .O(read_data_out[43]));
  OBUF \read_data_out_OBUF[44]_inst 
       (.I(read_data_out_OBUF[44]),
        .O(read_data_out[44]));
  OBUF \read_data_out_OBUF[45]_inst 
       (.I(read_data_out_OBUF[45]),
        .O(read_data_out[45]));
  OBUF \read_data_out_OBUF[46]_inst 
       (.I(read_data_out_OBUF[46]),
        .O(read_data_out[46]));
  OBUF \read_data_out_OBUF[47]_inst 
       (.I(read_data_out_OBUF[47]),
        .O(read_data_out[47]));
  OBUF \read_data_out_OBUF[48]_inst 
       (.I(read_data_out_OBUF[48]),
        .O(read_data_out[48]));
  OBUF \read_data_out_OBUF[49]_inst 
       (.I(read_data_out_OBUF[49]),
        .O(read_data_out[49]));
  OBUF \read_data_out_OBUF[4]_inst 
       (.I(read_data_out_OBUF[4]),
        .O(read_data_out[4]));
  OBUF \read_data_out_OBUF[50]_inst 
       (.I(read_data_out_OBUF[50]),
        .O(read_data_out[50]));
  OBUF \read_data_out_OBUF[51]_inst 
       (.I(read_data_out_OBUF[51]),
        .O(read_data_out[51]));
  OBUF \read_data_out_OBUF[52]_inst 
       (.I(read_data_out_OBUF[52]),
        .O(read_data_out[52]));
  OBUF \read_data_out_OBUF[53]_inst 
       (.I(read_data_out_OBUF[53]),
        .O(read_data_out[53]));
  OBUF \read_data_out_OBUF[54]_inst 
       (.I(read_data_out_OBUF[54]),
        .O(read_data_out[54]));
  OBUF \read_data_out_OBUF[55]_inst 
       (.I(read_data_out_OBUF[55]),
        .O(read_data_out[55]));
  OBUF \read_data_out_OBUF[56]_inst 
       (.I(read_data_out_OBUF[56]),
        .O(read_data_out[56]));
  OBUF \read_data_out_OBUF[57]_inst 
       (.I(read_data_out_OBUF[57]),
        .O(read_data_out[57]));
  OBUF \read_data_out_OBUF[58]_inst 
       (.I(read_data_out_OBUF[58]),
        .O(read_data_out[58]));
  OBUF \read_data_out_OBUF[59]_inst 
       (.I(read_data_out_OBUF[59]),
        .O(read_data_out[59]));
  OBUF \read_data_out_OBUF[5]_inst 
       (.I(read_data_out_OBUF[5]),
        .O(read_data_out[5]));
  OBUF \read_data_out_OBUF[60]_inst 
       (.I(read_data_out_OBUF[60]),
        .O(read_data_out[60]));
  OBUF \read_data_out_OBUF[61]_inst 
       (.I(read_data_out_OBUF[61]),
        .O(read_data_out[61]));
  OBUF \read_data_out_OBUF[62]_inst 
       (.I(read_data_out_OBUF[62]),
        .O(read_data_out[62]));
  OBUF \read_data_out_OBUF[63]_inst 
       (.I(read_data_out_OBUF[63]),
        .O(read_data_out[63]));
  OBUF \read_data_out_OBUF[6]_inst 
       (.I(read_data_out_OBUF[6]),
        .O(read_data_out[6]));
  OBUF \read_data_out_OBUF[7]_inst 
       (.I(read_data_out_OBUF[7]),
        .O(read_data_out[7]));
  OBUF \read_data_out_OBUF[8]_inst 
       (.I(read_data_out_OBUF[8]),
        .O(read_data_out[8]));
  OBUF \read_data_out_OBUF[9]_inst 
       (.I(read_data_out_OBUF[9]),
        .O(read_data_out[9]));
  OBUF \read_id_OBUF[0]_inst 
       (.I(read_id_OBUF[0]),
        .O(read_id[0]));
  OBUF \read_id_OBUF[1]_inst 
       (.I(read_id_OBUF[1]),
        .O(read_id[1]));
  OBUF \read_id_OBUF[2]_inst 
       (.I(read_id_OBUF[2]),
        .O(read_id[2]));
  OBUF \read_id_OBUF[3]_inst 
       (.I(read_id_OBUF[3]),
        .O(read_id[3]));
  OBUF \read_resp_OBUF[0]_inst 
       (.I(1'b0),
        .O(read_resp[0]));
  OBUF \read_resp_OBUF[1]_inst 
       (.I(read_resp_OBUF),
        .O(read_resp[1]));
  OBUF \read_resp_OBUF[2]_inst 
       (.I(1'b0),
        .O(read_resp[2]));
  OBUF rlast_out_OBUF_inst
       (.I(rlast_out_OBUF),
        .O(rlast_out));
  OBUF rvalid_out_OBUF_inst
       (.I(rvalid_out_OBUF),
        .O(rvalid_out));
  OBUF rx_done_uart_OBUF_inst
       (.I(rx_done_uart_OBUF),
        .O(rx_done_uart));
  IBUF trigger_IBUF_inst
       (.I(trigger),
        .O(trigger_IBUF));
  OBUF tx_data_valid_OBUF_inst
       (.I(tx_data_valid_OBUF),
        .O(tx_data_valid));
  OBUF \tx_fifo_mem_left_OBUF[0]_inst 
       (.I(1'b0),
        .O(tx_fifo_mem_left[0]));
  OBUF \tx_fifo_mem_left_OBUF[10]_inst 
       (.I(tx_fifo_mem_left_OBUF[10]),
        .O(tx_fifo_mem_left[10]));
  OBUF \tx_fifo_mem_left_OBUF[11]_inst 
       (.I(tx_fifo_mem_left_OBUF[11]),
        .O(tx_fifo_mem_left[11]));
  OBUF \tx_fifo_mem_left_OBUF[1]_inst 
       (.I(1'b0),
        .O(tx_fifo_mem_left[1]));
  OBUF \tx_fifo_mem_left_OBUF[2]_inst 
       (.I(1'b0),
        .O(tx_fifo_mem_left[2]));
  OBUF \tx_fifo_mem_left_OBUF[3]_inst 
       (.I(tx_fifo_mem_left_OBUF[3]),
        .O(tx_fifo_mem_left[3]));
  OBUF \tx_fifo_mem_left_OBUF[4]_inst 
       (.I(tx_fifo_mem_left_OBUF[4]),
        .O(tx_fifo_mem_left[4]));
  OBUF \tx_fifo_mem_left_OBUF[5]_inst 
       (.I(tx_fifo_mem_left_OBUF[5]),
        .O(tx_fifo_mem_left[5]));
  OBUF \tx_fifo_mem_left_OBUF[6]_inst 
       (.I(tx_fifo_mem_left_OBUF[6]),
        .O(tx_fifo_mem_left[6]));
  OBUF \tx_fifo_mem_left_OBUF[7]_inst 
       (.I(tx_fifo_mem_left_OBUF[7]),
        .O(tx_fifo_mem_left[7]));
  OBUF \tx_fifo_mem_left_OBUF[8]_inst 
       (.I(tx_fifo_mem_left_OBUF[8]),
        .O(tx_fifo_mem_left[8]));
  OBUF \tx_fifo_mem_left_OBUF[9]_inst 
       (.I(tx_fifo_mem_left_OBUF[9]),
        .O(tx_fifo_mem_left[9]));
  OBUF tx_ready_OBUF_inst
       (.I(A_OBUF),
        .O(tx_ready));
  OBUF \write_id_OBUF[0]_inst 
       (.I(write_id_OBUF[0]),
        .O(write_id[0]));
  OBUF \write_id_OBUF[1]_inst 
       (.I(write_id_OBUF[1]),
        .O(write_id[1]));
  OBUF \write_id_OBUF[2]_inst 
       (.I(write_id_OBUF[2]),
        .O(write_id[2]));
  OBUF \write_id_OBUF[3]_inst 
       (.I(write_id_OBUF[3]),
        .O(write_id[3]));
  OBUF \write_resp_OBUF[0]_inst 
       (.I(1'b0),
        .O(write_resp[0]));
  OBUF \write_resp_OBUF[1]_inst 
       (.I(write_resp_OBUF),
        .O(write_resp[1]));
  OBUF \write_resp_OBUF[2]_inst 
       (.I(1'b0),
        .O(write_resp[2]));
  OBUF wvalid_o_OBUF_inst
       (.I(wvalid_o_OBUF),
        .O(wvalid_o));
endmodule

(* FREQNCY = "70000000" *) 
module BAUD_GENRATOR
   (ref_clk,
    rst,
    baud_rate,
    sample_rate,
    uart_clk_o,
    sample_clk);
  input ref_clk;
  input rst;
  input [30:0]baud_rate;
  input [4:0]sample_rate;
  output uart_clk_o;
  output sample_clk;

  wire \<const0> ;
  wire [30:0]baud_rate;
  wire \counter[5]_i_10_n_0 ;
  wire \counter[5]_i_11_n_0 ;
  wire \counter[5]_i_12_n_0 ;
  wire \counter[5]_i_13_n_0 ;
  wire \counter[5]_i_14_n_0 ;
  wire \counter[5]_i_15_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[5]_i_5_n_0 ;
  wire \counter[5]_i_6_n_0 ;
  wire \counter[5]_i_8_n_0 ;
  wire \counter[5]_i_9_n_0 ;
  wire [5:0]counter_reg;
  wire \counter_reg[5]_i_3_n_2 ;
  wire \counter_reg[5]_i_3_n_3 ;
  wire \counter_reg[5]_i_4_n_0 ;
  wire \counter_reg[5]_i_4_n_1 ;
  wire \counter_reg[5]_i_4_n_2 ;
  wire \counter_reg[5]_i_4_n_3 ;
  wire \counter_reg[5]_i_7_n_0 ;
  wire \counter_reg[5]_i_7_n_1 ;
  wire \counter_reg[5]_i_7_n_2 ;
  wire \counter_reg[5]_i_7_n_3 ;
  wire [5:0]p_0_in;
  wire ref_clk;
  wire rst;
  wire sample_clk_i_1_n_0;
  wire sample_clk_reg_n_0;
  wire [4:0]sample_rate;
  wire [3:0]u_counter;
  wire \u_counter[0]_i_1_n_0 ;
  wire \u_counter[1]_i_1_n_0 ;
  wire \u_counter[1]_i_2_n_0 ;
  wire \u_counter[2]_i_1_n_0 ;
  wire \u_counter[3]_i_1_n_0 ;
  wire uart_clk_o;
  wire uart_clk_o_i_1_n_0;
  wire uart_clk_o_i_2_n_0;
  wire uart_clk_o_i_3_n_0;
  wire uart_clk_o_i_4_n_0;
  wire uart_clk_o_i_5_n_0;
  wire uart_clk_o_i_6_n_0;
  wire [3:2]\NLW_counter_reg[5]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[5]_i_3_O_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[5]_i_4_O_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[5]_i_7_O_UNCONNECTED ;

  assign sample_clk = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair239" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair239" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter[2]_i_1 
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .I2(counter_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair238" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter[3]_i_1 
       (.I0(counter_reg[1]),
        .I1(counter_reg[0]),
        .I2(counter_reg[2]),
        .I3(counter_reg[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair238" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \counter[4]_i_1 
       (.I0(counter_reg[2]),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .I3(counter_reg[3]),
        .I4(counter_reg[4]),
        .O(p_0_in[4]));
  LUT2 #(
    .INIT(4'hB)) 
    \counter[5]_i_1 
       (.I0(\counter_reg[5]_i_3_n_2 ),
        .I1(rst),
        .O(\counter[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[5]_i_10 
       (.I0(baud_rate[18]),
        .I1(baud_rate[17]),
        .I2(baud_rate[16]),
        .O(\counter[5]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[5]_i_11 
       (.I0(baud_rate[15]),
        .I1(baud_rate[14]),
        .I2(baud_rate[13]),
        .O(\counter[5]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[5]_i_12 
       (.I0(baud_rate[12]),
        .I1(baud_rate[11]),
        .I2(baud_rate[10]),
        .O(\counter[5]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[5]_i_13 
       (.I0(baud_rate[9]),
        .I1(baud_rate[8]),
        .I2(baud_rate[7]),
        .O(\counter[5]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \counter[5]_i_14 
       (.I0(counter_reg[3]),
        .I1(baud_rate[4]),
        .I2(baud_rate[6]),
        .I3(counter_reg[5]),
        .I4(baud_rate[5]),
        .I5(counter_reg[4]),
        .O(\counter[5]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \counter[5]_i_15 
       (.I0(counter_reg[0]),
        .I1(baud_rate[1]),
        .I2(baud_rate[3]),
        .I3(counter_reg[2]),
        .I4(baud_rate[2]),
        .I5(counter_reg[1]),
        .O(\counter[5]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter[5]_i_2 
       (.I0(counter_reg[3]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .I3(counter_reg[2]),
        .I4(counter_reg[4]),
        .I5(counter_reg[5]),
        .O(p_0_in[5]));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[5]_i_5 
       (.I0(baud_rate[30]),
        .I1(baud_rate[29]),
        .I2(baud_rate[28]),
        .O(\counter[5]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[5]_i_6 
       (.I0(baud_rate[27]),
        .I1(baud_rate[26]),
        .I2(baud_rate[25]),
        .O(\counter[5]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[5]_i_8 
       (.I0(baud_rate[24]),
        .I1(baud_rate[23]),
        .I2(baud_rate[22]),
        .O(\counter[5]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter[5]_i_9 
       (.I0(baud_rate[21]),
        .I1(baud_rate[20]),
        .I2(baud_rate[19]),
        .O(\counter[5]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(ref_clk),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(counter_reg[0]),
        .R(\counter[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(ref_clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(counter_reg[1]),
        .R(\counter[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(ref_clk),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(counter_reg[2]),
        .R(\counter[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(ref_clk),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(counter_reg[3]),
        .R(\counter[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(ref_clk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(counter_reg[4]),
        .R(\counter[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(ref_clk),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(counter_reg[5]),
        .R(\counter[5]_i_1_n_0 ));
  CARRY4 \counter_reg[5]_i_3 
       (.CI(\counter_reg[5]_i_4_n_0 ),
        .CO({\NLW_counter_reg[5]_i_3_CO_UNCONNECTED [3:2],\counter_reg[5]_i_3_n_2 ,\counter_reg[5]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_counter_reg[5]_i_3_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\counter[5]_i_5_n_0 ,\counter[5]_i_6_n_0 }));
  CARRY4 \counter_reg[5]_i_4 
       (.CI(\counter_reg[5]_i_7_n_0 ),
        .CO({\counter_reg[5]_i_4_n_0 ,\counter_reg[5]_i_4_n_1 ,\counter_reg[5]_i_4_n_2 ,\counter_reg[5]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_counter_reg[5]_i_4_O_UNCONNECTED [3:0]),
        .S({\counter[5]_i_8_n_0 ,\counter[5]_i_9_n_0 ,\counter[5]_i_10_n_0 ,\counter[5]_i_11_n_0 }));
  CARRY4 \counter_reg[5]_i_7 
       (.CI(1'b0),
        .CO({\counter_reg[5]_i_7_n_0 ,\counter_reg[5]_i_7_n_1 ,\counter_reg[5]_i_7_n_2 ,\counter_reg[5]_i_7_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_counter_reg[5]_i_7_O_UNCONNECTED [3:0]),
        .S({\counter[5]_i_12_n_0 ,\counter[5]_i_13_n_0 ,\counter[5]_i_14_n_0 ,\counter[5]_i_15_n_0 }));
  LUT3 #(
    .INIT(8'h28)) 
    sample_clk_i_1
       (.I0(rst),
        .I1(sample_clk_reg_n_0),
        .I2(\counter_reg[5]_i_3_n_2 ),
        .O(sample_clk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sample_clk_reg
       (.C(ref_clk),
        .CE(1'b1),
        .D(sample_clk_i_1_n_0),
        .Q(sample_clk_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000022323333)) 
    \u_counter[0]_i_1 
       (.I0(sample_rate[1]),
        .I1(u_counter[0]),
        .I2(sample_rate[2]),
        .I3(u_counter[1]),
        .I4(\u_counter[1]_i_2_n_0 ),
        .I5(uart_clk_o_i_4_n_0),
        .O(\u_counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000CF00AF0000)) 
    \u_counter[1]_i_1 
       (.I0(sample_rate[1]),
        .I1(sample_rate[2]),
        .I2(\u_counter[1]_i_2_n_0 ),
        .I3(uart_clk_o_i_4_n_0),
        .I4(u_counter[1]),
        .I5(u_counter[0]),
        .O(\u_counter[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hD0DD)) 
    \u_counter[1]_i_2 
       (.I0(sample_rate[4]),
        .I1(u_counter[3]),
        .I2(u_counter[2]),
        .I3(sample_rate[3]),
        .O(\u_counter[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h02222000)) 
    \u_counter[2]_i_1 
       (.I0(uart_clk_o_i_5_n_0),
        .I1(uart_clk_o_i_4_n_0),
        .I2(u_counter[0]),
        .I3(u_counter[1]),
        .I4(u_counter[2]),
        .O(\u_counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2222222220000000)) 
    \u_counter[3]_i_1 
       (.I0(uart_clk_o_i_5_n_0),
        .I1(uart_clk_o_i_4_n_0),
        .I2(u_counter[1]),
        .I3(u_counter[0]),
        .I4(u_counter[2]),
        .I5(u_counter[3]),
        .O(\u_counter[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \u_counter_reg[0] 
       (.C(sample_clk_reg_n_0),
        .CE(1'b1),
        .CLR(uart_clk_o_i_2_n_0),
        .D(\u_counter[0]_i_1_n_0 ),
        .Q(u_counter[0]));
  FDCE #(
    .INIT(1'b0)) 
    \u_counter_reg[1] 
       (.C(sample_clk_reg_n_0),
        .CE(1'b1),
        .CLR(uart_clk_o_i_2_n_0),
        .D(\u_counter[1]_i_1_n_0 ),
        .Q(u_counter[1]));
  FDCE #(
    .INIT(1'b0)) 
    \u_counter_reg[2] 
       (.C(sample_clk_reg_n_0),
        .CE(1'b1),
        .CLR(uart_clk_o_i_2_n_0),
        .D(\u_counter[2]_i_1_n_0 ),
        .Q(u_counter[2]));
  FDCE #(
    .INIT(1'b0)) 
    \u_counter_reg[3] 
       (.C(sample_clk_reg_n_0),
        .CE(1'b1),
        .CLR(uart_clk_o_i_2_n_0),
        .D(\u_counter[3]_i_1_n_0 ),
        .Q(u_counter[3]));
  LUT4 #(
    .INIT(16'h3005)) 
    uart_clk_o_i_1
       (.I0(uart_clk_o_i_3_n_0),
        .I1(uart_clk_o_i_4_n_0),
        .I2(uart_clk_o_i_5_n_0),
        .I3(uart_clk_o),
        .O(uart_clk_o_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    uart_clk_o_i_2
       (.I0(rst),
        .O(uart_clk_o_i_2_n_0));
  LUT5 #(
    .INIT(32'h5DFF5D5D)) 
    uart_clk_o_i_3
       (.I0(uart_clk_o_i_6_n_0),
        .I1(u_counter[3]),
        .I2(sample_rate[4]),
        .I3(sample_rate[1]),
        .I4(u_counter[0]),
        .O(uart_clk_o_i_3_n_0));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    uart_clk_o_i_4
       (.I0(u_counter[1]),
        .I1(sample_rate[2]),
        .I2(sample_rate[3]),
        .I3(u_counter[2]),
        .I4(sample_rate[4]),
        .I5(u_counter[3]),
        .O(uart_clk_o_i_4_n_0));
  LUT5 #(
    .INIT(32'h22F2FFFF)) 
    uart_clk_o_i_5
       (.I0(sample_rate[1]),
        .I1(u_counter[0]),
        .I2(sample_rate[2]),
        .I3(u_counter[1]),
        .I4(\u_counter[1]_i_2_n_0 ),
        .O(uart_clk_o_i_5_n_0));
  LUT4 #(
    .INIT(16'hD0DD)) 
    uart_clk_o_i_6
       (.I0(u_counter[1]),
        .I1(sample_rate[2]),
        .I2(sample_rate[3]),
        .I3(u_counter[2]),
        .O(uart_clk_o_i_6_n_0));
  FDCE #(
    .INIT(1'b0)) 
    uart_clk_o_reg
       (.C(sample_clk_reg_n_0),
        .CE(1'b1),
        .CLR(uart_clk_o_i_2_n_0),
        .D(uart_clk_o_i_1_n_0),
        .Q(uart_clk_o));
endmodule

(* BYTES = "6" *) (* BYTE_POINTER_WIDTH = "8" *) (* COUNTER_WIDTH = "5" *) 
(* DATA_WIDTH = "50" *) (* DEPTH = "32" *) (* IDEL = "2'b00" *) 
(* READ = "2'b10" *) (* WRITE = "2'b01" *) 
module FIFO
   (rst,
    wr_clk,
    wr_en,
    wr_data,
    wr_ready,
    rd_clk,
    rd_en,
    rd_data,
    rd_ready,
    full,
    empty);
  input rst;
  input wr_clk;
  input wr_en;
  input [49:0]wr_data;
  output wr_ready;
  input rd_clk;
  input rd_en;
  output [49:0]rd_data;
  output rd_ready;
  output full;
  output empty;

  wire FSM_sequential_rd_state_i_1_n_0;
  wire empty;
  wire empty_INST_0_i_1_n_0;
  wire full;
  wire full_INST_0_i_1_n_0;
  wire full_INST_0_i_2_n_0;
  wire full_INST_0_i_3_n_0;
  wire mem_reg_i_1_n_0;
  wire mem_reg_i_3_n_0;
  wire mem_reg_i_4_n_0;
  wire mem_reg_i_5_n_0;
  wire rd_clk;
  wire [49:0]rd_data;
  wire rd_en;
  wire \rd_pointer[0]_i_1_n_0 ;
  wire \rd_pointer[0]_i_2_n_0 ;
  wire \rd_pointer[1]_i_1_n_0 ;
  wire \rd_pointer[2]_i_1_n_0 ;
  wire \rd_pointer[3]_i_1_n_0 ;
  wire \rd_pointer[4]_i_1_n_0 ;
  wire [4:0]rd_pointer_reg;
  wire rd_ready;
  wire rd_ready_i_1_n_0;
  wire rd_state;
  wire rst;
  wire [49:0]sync_1;
  wire \sync_1[49]_i_1_n_0 ;
  wire wr_clk;
  wire [49:0]wr_data;
  wire wr_en;
  wire wr_pointer0;
  wire \wr_pointer[0]_i_1_n_0 ;
  wire \wr_pointer[1]_i_1_n_0 ;
  wire \wr_pointer[2]_i_1_n_0 ;
  wire \wr_pointer[4]_i_1_n_0 ;
  wire \wr_pointer[4]_i_2_n_0 ;
  wire \wr_pointer_reg_n_0_[0] ;
  wire \wr_pointer_reg_n_0_[1] ;
  wire \wr_pointer_reg_n_0_[2] ;
  wire \wr_pointer_reg_n_0_[3] ;
  wire \wr_pointer_reg_n_0_[4] ;
  wire wr_ready;
  wire \wr_state[0]_i_1_n_0 ;
  wire NLW_mem_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_SBITERR_UNCONNECTED;
  wire [31:18]NLW_mem_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_RDADDRECC_UNCONNECTED;

  LUT4 #(
    .INIT(16'hD5AA)) 
    FSM_sequential_rd_state_i_1
       (.I0(rd_en),
        .I1(empty_INST_0_i_1_n_0),
        .I2(mem_reg_i_4_n_0),
        .I3(rd_state),
        .O(FSM_sequential_rd_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDEL:0,READ:1," *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_rd_state_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(FSM_sequential_rd_state_i_1_n_0),
        .Q(rd_state),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT5 #(
    .INIT(32'h82000082)) 
    empty_INST_0
       (.I0(empty_INST_0_i_1_n_0),
        .I1(rd_pointer_reg[4]),
        .I2(\wr_pointer_reg_n_0_[4] ),
        .I3(rd_pointer_reg[3]),
        .I4(\wr_pointer_reg_n_0_[3] ),
        .O(empty));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    empty_INST_0_i_1
       (.I0(rd_pointer_reg[0]),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(rd_pointer_reg[2]),
        .I3(\wr_pointer_reg_n_0_[2] ),
        .I4(rd_pointer_reg[1]),
        .I5(\wr_pointer_reg_n_0_[1] ),
        .O(empty_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000090000090)) 
    full_INST_0
       (.I0(full_INST_0_i_1_n_0),
        .I1(rd_pointer_reg[4]),
        .I2(full_INST_0_i_2_n_0),
        .I3(rd_pointer_reg[3]),
        .I4(full_INST_0_i_3_n_0),
        .I5(rst),
        .O(full));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    full_INST_0_i_1
       (.I0(\wr_pointer_reg_n_0_[2] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(\wr_pointer_reg_n_0_[3] ),
        .I4(\wr_pointer_reg_n_0_[4] ),
        .O(full_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0041820014000082)) 
    full_INST_0_i_2
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[2]),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(\wr_pointer_reg_n_0_[0] ),
        .I5(rd_pointer_reg[1]),
        .O(full_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    full_INST_0_i_3
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[3] ),
        .O(full_INST_0_i_3_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d50" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d50" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "1600" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "511" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "49" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "480" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "49" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    mem_reg
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,rd_pointer_reg,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,\wr_pointer_reg_n_0_[4] ,\wr_pointer_reg_n_0_[3] ,\wr_pointer_reg_n_0_[2] ,\wr_pointer_reg_n_0_[1] ,\wr_pointer_reg_n_0_[0] ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_mem_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(rd_clk),
        .CLKBWRCLK(wr_clk),
        .DBITERR(NLW_mem_reg_DBITERR_UNCONNECTED),
        .DIADI(sync_1[31:0]),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,sync_1[49:36],sync_1[39:36]}),
        .DIPADIP({1'b1,1'b1,1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO(rd_data[31:0]),
        .DOBDO({NLW_mem_reg_DOBDO_UNCONNECTED[31:18],rd_data[49:32]}),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_mem_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(mem_reg_i_1_n_0),
        .ENBWREN(wr_pointer0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_mem_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0}));
  LUT5 #(
    .INIT(32'h00002A00)) 
    mem_reg_i_1
       (.I0(rd_en),
        .I1(mem_reg_i_4_n_0),
        .I2(empty_INST_0_i_1_n_0),
        .I3(rd_state),
        .I4(rst),
        .O(mem_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'h8AA8AAAAAAAAAAAA)) 
    mem_reg_i_2
       (.I0(wr_en),
        .I1(rst),
        .I2(full_INST_0_i_3_n_0),
        .I3(rd_pointer_reg[3]),
        .I4(full_INST_0_i_2_n_0),
        .I5(mem_reg_i_5_n_0),
        .O(wr_pointer0));
  LUT2 #(
    .INIT(4'h2)) 
    mem_reg_i_3
       (.I0(wr_ready),
        .I1(rst),
        .O(mem_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    mem_reg_i_4
       (.I0(\wr_pointer_reg_n_0_[3] ),
        .I1(rd_pointer_reg[3]),
        .I2(\wr_pointer_reg_n_0_[4] ),
        .I3(rd_pointer_reg[4]),
        .O(mem_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'h6999999999999999)) 
    mem_reg_i_5
       (.I0(rd_pointer_reg[4]),
        .I1(\wr_pointer_reg_n_0_[4] ),
        .I2(\wr_pointer_reg_n_0_[3] ),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(\wr_pointer_reg_n_0_[0] ),
        .I5(\wr_pointer_reg_n_0_[2] ),
        .O(mem_reg_i_5_n_0));
  LUT4 #(
    .INIT(16'h2A00)) 
    \rd_pointer[0]_i_1 
       (.I0(rd_state),
        .I1(empty_INST_0_i_1_n_0),
        .I2(mem_reg_i_4_n_0),
        .I3(rd_en),
        .O(\rd_pointer[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_pointer[0]_i_2 
       (.I0(rd_pointer_reg[0]),
        .O(\rd_pointer[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pointer[1]_i_1 
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .O(\rd_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rd_pointer[2]_i_1 
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .I2(rd_pointer_reg[2]),
        .O(\rd_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rd_pointer[3]_i_1 
       (.I0(rd_pointer_reg[1]),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[2]),
        .I3(rd_pointer_reg[3]),
        .O(\rd_pointer[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \rd_pointer[4]_i_1 
       (.I0(rd_pointer_reg[2]),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[1]),
        .I3(rd_pointer_reg[3]),
        .I4(rd_pointer_reg[4]),
        .O(\rd_pointer[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[0] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[0]_i_2_n_0 ),
        .Q(rd_pointer_reg[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[1] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[1]_i_1_n_0 ),
        .Q(rd_pointer_reg[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[2] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[2]_i_1_n_0 ),
        .Q(rd_pointer_reg[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[3] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[3]_i_1_n_0 ),
        .Q(rd_pointer_reg[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[4] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[4]_i_1_n_0 ),
        .Q(rd_pointer_reg[4]),
        .R(rst));
  LUT6 #(
    .INIT(64'hFFFFAAAA00000888)) 
    rd_ready_i_1
       (.I0(rd_state),
        .I1(rd_en),
        .I2(mem_reg_i_4_n_0),
        .I3(empty_INST_0_i_1_n_0),
        .I4(rst),
        .I5(rd_ready),
        .O(rd_ready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rd_ready_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(rd_ready_i_1_n_0),
        .Q(rd_ready),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    \sync_1[49]_i_1 
       (.I0(wr_ready),
        .I1(wr_en),
        .I2(rst),
        .O(\sync_1[49]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[0] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[0]),
        .Q(sync_1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[10] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[10]),
        .Q(sync_1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[11] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[11]),
        .Q(sync_1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[12] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[12]),
        .Q(sync_1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[13] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[13]),
        .Q(sync_1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[14] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[14]),
        .Q(sync_1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[15] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[15]),
        .Q(sync_1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[16] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[16]),
        .Q(sync_1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[17] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[17]),
        .Q(sync_1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[18] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[18]),
        .Q(sync_1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[19] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[19]),
        .Q(sync_1[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[1] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[1]),
        .Q(sync_1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[20] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[20]),
        .Q(sync_1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[21] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[21]),
        .Q(sync_1[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[22] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[22]),
        .Q(sync_1[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[23] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[23]),
        .Q(sync_1[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[24] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[24]),
        .Q(sync_1[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[25] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[25]),
        .Q(sync_1[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[26] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[26]),
        .Q(sync_1[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[27] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[27]),
        .Q(sync_1[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[28] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[28]),
        .Q(sync_1[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[29] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[29]),
        .Q(sync_1[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[2] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[2]),
        .Q(sync_1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[30] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[30]),
        .Q(sync_1[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[31] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[31]),
        .Q(sync_1[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[36] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[36]),
        .Q(sync_1[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[37] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[37]),
        .Q(sync_1[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[38] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[38]),
        .Q(sync_1[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[39] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[39]),
        .Q(sync_1[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[3] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[3]),
        .Q(sync_1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[40] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[40]),
        .Q(sync_1[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[41] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[41]),
        .Q(sync_1[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[42] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[42]),
        .Q(sync_1[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[43] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[43]),
        .Q(sync_1[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[44] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[44]),
        .Q(sync_1[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[45] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[45]),
        .Q(sync_1[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[46] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[46]),
        .Q(sync_1[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[47] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[47]),
        .Q(sync_1[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[48] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[48]),
        .Q(sync_1[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[49] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[49]),
        .Q(sync_1[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[4] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[4]),
        .Q(sync_1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[5] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[5]),
        .Q(sync_1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[6] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[6]),
        .Q(sync_1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[7] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[7]),
        .Q(sync_1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[8] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[8]),
        .Q(sync_1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[9] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[9]),
        .Q(sync_1[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \wr_pointer[0]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .O(\wr_pointer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pointer[1]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_pointer[2]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .O(\wr_pointer[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2AAA0000)) 
    \wr_pointer[4]_i_1 
       (.I0(wr_ready),
        .I1(mem_reg_i_5_n_0),
        .I2(full_INST_0_i_2_n_0),
        .I3(\wr_pointer[4]_i_2_n_0 ),
        .I4(wr_en),
        .O(\wr_pointer[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT5 #(
    .INIT(32'h69999999)) 
    \wr_pointer[4]_i_2 
       (.I0(rd_pointer_reg[3]),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .I4(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[0] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[0]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[1] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[1]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[2] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[2]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[3] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(full_INST_0_i_3_n_0),
        .Q(\wr_pointer_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[4] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(full_INST_0_i_1_n_0),
        .Q(\wr_pointer_reg_n_0_[4] ),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    \wr_state[0]_i_1 
       (.I0(wr_en),
        .I1(wr_ready),
        .O(\wr_state[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_state_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\wr_state[0]_i_1_n_0 ),
        .Q(wr_ready),
        .R(rst));
endmodule

(* BYTES = "6" *) (* BYTE_POINTER_WIDTH = "8" *) (* COUNTER_WIDTH = "5" *) 
(* DATA_WIDTH = "50" *) (* DEPTH = "32" *) (* IDEL = "2'b00" *) 
(* ORIG_REF_NAME = "FIFO" *) (* READ = "2'b10" *) (* WRITE = "2'b01" *) 
module FIFO__1
   (rst,
    wr_clk,
    wr_en,
    wr_data,
    wr_ready,
    rd_clk,
    rd_en,
    rd_data,
    rd_ready,
    full,
    empty);
  input rst;
  input wr_clk;
  input wr_en;
  input [49:0]wr_data;
  output wr_ready;
  input rd_clk;
  input rd_en;
  output [49:0]rd_data;
  output rd_ready;
  output full;
  output empty;

  wire \<const0> ;
  wire FSM_sequential_rd_state_i_1_n_0;
  wire empty;
  wire empty_INST_0_i_1_n_0;
  wire mem_reg_i_1_n_0;
  wire mem_reg_i_3_n_0;
  wire mem_reg_i_4_n_0;
  wire mem_reg_i_5_n_0;
  wire mem_reg_i_6_n_0;
  wire rd_clk;
  wire [49:0]rd_data;
  wire rd_en;
  wire rd_pointer;
  wire \rd_pointer[0]_i_2_n_0 ;
  wire \rd_pointer[1]_i_1_n_0 ;
  wire \rd_pointer[2]_i_1_n_0 ;
  wire \rd_pointer[3]_i_1_n_0 ;
  wire \rd_pointer[4]_i_1_n_0 ;
  wire [4:0]rd_pointer_reg;
  wire rd_ready;
  wire rd_ready_i_1_n_0;
  wire rd_state;
  wire rst;
  wire [49:0]sync_1;
  wire \sync_1[49]_i_1_n_0 ;
  wire wr_clk;
  wire [49:0]wr_data;
  wire wr_en;
  wire wr_pointer0;
  wire \wr_pointer[0]_i_1_n_0 ;
  wire \wr_pointer[1]_i_1_n_0 ;
  wire \wr_pointer[2]_i_1_n_0 ;
  wire \wr_pointer[3]_i_1_n_0 ;
  wire \wr_pointer[4]_i_1_n_0 ;
  wire \wr_pointer[4]_i_2_n_0 ;
  wire \wr_pointer[4]_i_3_n_0 ;
  wire \wr_pointer_reg_n_0_[0] ;
  wire \wr_pointer_reg_n_0_[1] ;
  wire \wr_pointer_reg_n_0_[2] ;
  wire \wr_pointer_reg_n_0_[3] ;
  wire \wr_pointer_reg_n_0_[4] ;
  wire wr_ready;
  wire \wr_state[0]_i_1_n_0 ;
  wire NLW_mem_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_SBITERR_UNCONNECTED;
  wire [31:18]NLW_mem_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_RDADDRECC_UNCONNECTED;

  assign full = \<const0> ;
  LUT4 #(
    .INIT(16'hD5AA)) 
    FSM_sequential_rd_state_i_1
       (.I0(rd_en),
        .I1(empty_INST_0_i_1_n_0),
        .I2(mem_reg_i_4_n_0),
        .I3(rd_state),
        .O(FSM_sequential_rd_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDEL:0,READ:1," *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_rd_state_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(FSM_sequential_rd_state_i_1_n_0),
        .Q(rd_state),
        .R(rst));
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT5 #(
    .INIT(32'h82000082)) 
    empty_INST_0
       (.I0(empty_INST_0_i_1_n_0),
        .I1(rd_pointer_reg[4]),
        .I2(\wr_pointer_reg_n_0_[4] ),
        .I3(rd_pointer_reg[3]),
        .I4(\wr_pointer_reg_n_0_[3] ),
        .O(empty));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    empty_INST_0_i_1
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[2]),
        .I3(\wr_pointer_reg_n_0_[2] ),
        .I4(rd_pointer_reg[1]),
        .I5(\wr_pointer_reg_n_0_[1] ),
        .O(empty_INST_0_i_1_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d50" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d50" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "1600" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "511" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "49" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "480" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "49" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    mem_reg
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,rd_pointer_reg,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,\wr_pointer_reg_n_0_[4] ,\wr_pointer_reg_n_0_[3] ,\wr_pointer_reg_n_0_[2] ,\wr_pointer_reg_n_0_[1] ,\wr_pointer_reg_n_0_[0] ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_mem_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(rd_clk),
        .CLKBWRCLK(wr_clk),
        .DBITERR(NLW_mem_reg_DBITERR_UNCONNECTED),
        .DIADI(sync_1[31:0]),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,sync_1[49:32]}),
        .DIPADIP({1'b1,1'b1,1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO(rd_data[31:0]),
        .DOBDO({NLW_mem_reg_DOBDO_UNCONNECTED[31:18],rd_data[49:32]}),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_mem_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(mem_reg_i_1_n_0),
        .ENBWREN(wr_pointer0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_mem_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0}));
  LUT5 #(
    .INIT(32'h00002A00)) 
    mem_reg_i_1
       (.I0(rd_en),
        .I1(mem_reg_i_4_n_0),
        .I2(empty_INST_0_i_1_n_0),
        .I3(rd_state),
        .I4(rst),
        .O(mem_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'h8AA8AAAAAAAAAAAA)) 
    mem_reg_i_2
       (.I0(wr_en),
        .I1(rst),
        .I2(\wr_pointer[3]_i_1_n_0 ),
        .I3(rd_pointer_reg[3]),
        .I4(mem_reg_i_5_n_0),
        .I5(mem_reg_i_6_n_0),
        .O(wr_pointer0));
  LUT2 #(
    .INIT(4'h2)) 
    mem_reg_i_3
       (.I0(wr_ready),
        .I1(rst),
        .O(mem_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    mem_reg_i_4
       (.I0(\wr_pointer_reg_n_0_[3] ),
        .I1(rd_pointer_reg[3]),
        .I2(\wr_pointer_reg_n_0_[4] ),
        .I3(rd_pointer_reg[4]),
        .O(mem_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'h0041820014000082)) 
    mem_reg_i_5
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[2]),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(\wr_pointer_reg_n_0_[0] ),
        .I5(rd_pointer_reg[1]),
        .O(mem_reg_i_5_n_0));
  LUT6 #(
    .INIT(64'h6999999999999999)) 
    mem_reg_i_6
       (.I0(rd_pointer_reg[4]),
        .I1(\wr_pointer_reg_n_0_[4] ),
        .I2(\wr_pointer_reg_n_0_[3] ),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(\wr_pointer_reg_n_0_[0] ),
        .I5(\wr_pointer_reg_n_0_[2] ),
        .O(mem_reg_i_6_n_0));
  LUT4 #(
    .INIT(16'h2A00)) 
    \rd_pointer[0]_i_1 
       (.I0(rd_state),
        .I1(empty_INST_0_i_1_n_0),
        .I2(mem_reg_i_4_n_0),
        .I3(rd_en),
        .O(rd_pointer));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_pointer[0]_i_2 
       (.I0(rd_pointer_reg[0]),
        .O(\rd_pointer[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pointer[1]_i_1 
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .O(\rd_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rd_pointer[2]_i_1 
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .I2(rd_pointer_reg[2]),
        .O(\rd_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rd_pointer[3]_i_1 
       (.I0(rd_pointer_reg[1]),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[2]),
        .I3(rd_pointer_reg[3]),
        .O(\rd_pointer[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \rd_pointer[4]_i_1 
       (.I0(rd_pointer_reg[2]),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[1]),
        .I3(rd_pointer_reg[3]),
        .I4(rd_pointer_reg[4]),
        .O(\rd_pointer[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[0] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[0]_i_2_n_0 ),
        .Q(rd_pointer_reg[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[1] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[1]_i_1_n_0 ),
        .Q(rd_pointer_reg[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[2] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[2]_i_1_n_0 ),
        .Q(rd_pointer_reg[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[3] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[3]_i_1_n_0 ),
        .Q(rd_pointer_reg[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[4] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[4]_i_1_n_0 ),
        .Q(rd_pointer_reg[4]),
        .R(rst));
  LUT6 #(
    .INIT(64'hFFFFAAAA00000888)) 
    rd_ready_i_1
       (.I0(rd_state),
        .I1(rd_en),
        .I2(mem_reg_i_4_n_0),
        .I3(empty_INST_0_i_1_n_0),
        .I4(rst),
        .I5(rd_ready),
        .O(rd_ready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rd_ready_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(rd_ready_i_1_n_0),
        .Q(rd_ready),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    \sync_1[49]_i_1 
       (.I0(wr_ready),
        .I1(wr_en),
        .I2(rst),
        .O(\sync_1[49]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[0] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[0]),
        .Q(sync_1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[10] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[10]),
        .Q(sync_1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[11] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[11]),
        .Q(sync_1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[12] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[12]),
        .Q(sync_1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[13] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[13]),
        .Q(sync_1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[14] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[14]),
        .Q(sync_1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[15] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[15]),
        .Q(sync_1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[16] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[16]),
        .Q(sync_1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[17] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[17]),
        .Q(sync_1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[18] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[18]),
        .Q(sync_1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[19] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[19]),
        .Q(sync_1[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[1] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[1]),
        .Q(sync_1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[20] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[20]),
        .Q(sync_1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[21] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[21]),
        .Q(sync_1[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[22] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[22]),
        .Q(sync_1[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[23] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[23]),
        .Q(sync_1[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[24] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[24]),
        .Q(sync_1[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[25] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[25]),
        .Q(sync_1[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[26] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[26]),
        .Q(sync_1[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[27] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[27]),
        .Q(sync_1[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[28] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[28]),
        .Q(sync_1[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[29] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[29]),
        .Q(sync_1[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[2] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[2]),
        .Q(sync_1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[30] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[30]),
        .Q(sync_1[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[31] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[31]),
        .Q(sync_1[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[32] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[32]),
        .Q(sync_1[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[33] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[33]),
        .Q(sync_1[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[34] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[34]),
        .Q(sync_1[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[35] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[35]),
        .Q(sync_1[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[36] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[36]),
        .Q(sync_1[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[37] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[37]),
        .Q(sync_1[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[38] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[38]),
        .Q(sync_1[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[39] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[39]),
        .Q(sync_1[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[3] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[3]),
        .Q(sync_1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[40] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[40]),
        .Q(sync_1[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[41] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[41]),
        .Q(sync_1[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[42] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[42]),
        .Q(sync_1[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[43] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[43]),
        .Q(sync_1[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[44] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[44]),
        .Q(sync_1[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[45] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[45]),
        .Q(sync_1[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[46] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[46]),
        .Q(sync_1[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[47] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[47]),
        .Q(sync_1[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[48] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[48]),
        .Q(sync_1[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[49] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[49]),
        .Q(sync_1[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[4] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[4]),
        .Q(sync_1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[5] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[5]),
        .Q(sync_1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[6] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[6]),
        .Q(sync_1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[7] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[7]),
        .Q(sync_1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[8] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[8]),
        .Q(sync_1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[9] 
       (.C(wr_clk),
        .CE(\sync_1[49]_i_1_n_0 ),
        .D(wr_data[9]),
        .Q(sync_1[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \wr_pointer[0]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .O(\wr_pointer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pointer[1]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_pointer[2]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .O(\wr_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \wr_pointer[3]_i_1 
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[3] ),
        .O(\wr_pointer[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2AAA0000)) 
    \wr_pointer[4]_i_1 
       (.I0(wr_ready),
        .I1(mem_reg_i_6_n_0),
        .I2(mem_reg_i_5_n_0),
        .I3(\wr_pointer[4]_i_3_n_0 ),
        .I4(wr_en),
        .O(\wr_pointer[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \wr_pointer[4]_i_2 
       (.I0(\wr_pointer_reg_n_0_[2] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(\wr_pointer_reg_n_0_[3] ),
        .I4(\wr_pointer_reg_n_0_[4] ),
        .O(\wr_pointer[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT5 #(
    .INIT(32'h69999999)) 
    \wr_pointer[4]_i_3 
       (.I0(rd_pointer_reg[3]),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .I4(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[4]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[0] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[0]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[1] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[1]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[2] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[2]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[3] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[3]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[4] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[4]_i_2_n_0 ),
        .Q(\wr_pointer_reg_n_0_[4] ),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    \wr_state[0]_i_1 
       (.I0(wr_en),
        .I1(wr_ready),
        .O(\wr_state[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_state_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\wr_state[0]_i_1_n_0 ),
        .Q(wr_ready),
        .R(rst));
endmodule

(* BYTES = "9" *) (* BYTE_POINTER_WIDTH = "8" *) (* COUNTER_WIDTH = "5" *) 
(* DATA_WIDTH = "73" *) (* DEPTH = "32" *) (* IDEL = "2'b00" *) 
(* ORIG_REF_NAME = "FIFO" *) (* READ = "2'b10" *) (* WRITE = "2'b01" *) 
module FIFO__parameterized0
   (rst,
    wr_clk,
    wr_en,
    wr_data,
    wr_ready,
    rd_clk,
    rd_en,
    rd_data,
    rd_ready,
    full,
    empty);
  input rst;
  input wr_clk;
  input wr_en;
  input [72:0]wr_data;
  output wr_ready;
  input rd_clk;
  input rd_en;
  output [72:0]rd_data;
  output rd_ready;
  output full;
  output empty;

  wire \<const0> ;
  wire FSM_sequential_rd_state_i_1_n_0;
  wire empty;
  wire empty_INST_0_i_1_n_0;
  wire mem_reg_0_i_1_n_0;
  wire mem_reg_0_i_3_n_0;
  wire mem_reg_0_i_4_n_0;
  wire mem_reg_0_i_5_n_0;
  wire mem_reg_0_i_6_n_0;
  wire mem_reg_0_n_68;
  wire mem_reg_0_n_69;
  wire mem_reg_0_n_70;
  wire mem_reg_0_n_71;
  wire mem_reg_0_n_72;
  wire mem_reg_0_n_73;
  wire mem_reg_0_n_74;
  wire mem_reg_0_n_75;
  wire rd_clk;
  wire [63:0]\^rd_data ;
  wire rd_en;
  wire \rd_pointer[0]_i_1_n_0 ;
  wire \rd_pointer[0]_i_2_n_0 ;
  wire \rd_pointer[1]_i_1_n_0 ;
  wire \rd_pointer[2]_i_1_n_0 ;
  wire \rd_pointer[3]_i_1_n_0 ;
  wire \rd_pointer[4]_i_1_n_0 ;
  wire [4:0]rd_pointer_reg;
  wire rd_ready;
  wire rd_ready_i_1_n_0;
  wire rd_state;
  wire rst;
  wire [71:0]sync_1;
  wire \sync_1[71]_i_1_n_0 ;
  wire wr_clk;
  wire [72:0]wr_data;
  wire wr_en;
  wire wr_pointer0;
  wire \wr_pointer[0]_i_1_n_0 ;
  wire \wr_pointer[1]_i_1_n_0 ;
  wire \wr_pointer[2]_i_1_n_0 ;
  wire \wr_pointer[3]_i_1_n_0 ;
  wire \wr_pointer[4]_i_1_n_0 ;
  wire \wr_pointer[4]_i_2_n_0 ;
  wire \wr_pointer[4]_i_3_n_0 ;
  wire \wr_pointer_reg_n_0_[0] ;
  wire \wr_pointer_reg_n_0_[1] ;
  wire \wr_pointer_reg_n_0_[2] ;
  wire \wr_pointer_reg_n_0_[3] ;
  wire \wr_pointer_reg_n_0_[4] ;
  wire wr_ready;
  wire \wr_state[0]_i_1_n_0 ;
  wire NLW_mem_reg_0_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_0_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_0_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_0_SBITERR_UNCONNECTED;
  wire [7:0]NLW_mem_reg_0_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_0_RDADDRECC_UNCONNECTED;

  assign full = \<const0> ;
  assign rd_data[72] = \<const0> ;
  assign rd_data[71] = \<const0> ;
  assign rd_data[70] = \<const0> ;
  assign rd_data[69] = \<const0> ;
  assign rd_data[68] = \<const0> ;
  assign rd_data[67] = \<const0> ;
  assign rd_data[66] = \<const0> ;
  assign rd_data[65] = \<const0> ;
  assign rd_data[64] = \<const0> ;
  assign rd_data[63:0] = \^rd_data [63:0];
  LUT4 #(
    .INIT(16'hD5AA)) 
    FSM_sequential_rd_state_i_1
       (.I0(rd_en),
        .I1(empty_INST_0_i_1_n_0),
        .I2(mem_reg_0_i_4_n_0),
        .I3(rd_state),
        .O(FSM_sequential_rd_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDEL:0,READ:1," *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_rd_state_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(FSM_sequential_rd_state_i_1_n_0),
        .Q(rd_state),
        .R(rst));
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT5 #(
    .INIT(32'h82000082)) 
    empty_INST_0
       (.I0(empty_INST_0_i_1_n_0),
        .I1(rd_pointer_reg[4]),
        .I2(\wr_pointer_reg_n_0_[4] ),
        .I3(rd_pointer_reg[3]),
        .I4(\wr_pointer_reg_n_0_[3] ),
        .O(empty));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    empty_INST_0_i_1
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[2]),
        .I3(\wr_pointer_reg_n_0_[2] ),
        .I4(rd_pointer_reg[1]),
        .I5(\wr_pointer_reg_n_0_[1] ),
        .O(empty_INST_0_i_1_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p8_d64" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p8_d64" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2336" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "511" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "71" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "480" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "71" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    mem_reg_0
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,rd_pointer_reg,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,\wr_pointer_reg_n_0_[4] ,\wr_pointer_reg_n_0_[3] ,\wr_pointer_reg_n_0_[2] ,\wr_pointer_reg_n_0_[1] ,\wr_pointer_reg_n_0_[0] ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_mem_reg_0_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_0_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(rd_clk),
        .CLKBWRCLK(wr_clk),
        .DBITERR(NLW_mem_reg_0_DBITERR_UNCONNECTED),
        .DIADI(sync_1[31:0]),
        .DIBDI(sync_1[63:32]),
        .DIPADIP(sync_1[67:64]),
        .DIPBDIP(sync_1[71:68]),
        .DOADO(\^rd_data [31:0]),
        .DOBDO(\^rd_data [63:32]),
        .DOPADOP({mem_reg_0_n_68,mem_reg_0_n_69,mem_reg_0_n_70,mem_reg_0_n_71}),
        .DOPBDOP({mem_reg_0_n_72,mem_reg_0_n_73,mem_reg_0_n_74,mem_reg_0_n_75}),
        .ECCPARITY(NLW_mem_reg_0_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(mem_reg_0_i_1_n_0),
        .ENBWREN(wr_pointer0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_mem_reg_0_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_0_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({mem_reg_0_i_3_n_0,mem_reg_0_i_3_n_0,mem_reg_0_i_3_n_0,mem_reg_0_i_3_n_0,mem_reg_0_i_3_n_0,mem_reg_0_i_3_n_0,mem_reg_0_i_3_n_0,mem_reg_0_i_3_n_0}));
  LUT5 #(
    .INIT(32'h00002A00)) 
    mem_reg_0_i_1
       (.I0(rd_en),
        .I1(mem_reg_0_i_4_n_0),
        .I2(empty_INST_0_i_1_n_0),
        .I3(rd_state),
        .I4(rst),
        .O(mem_reg_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAA8AAA)) 
    mem_reg_0_i_2
       (.I0(wr_en),
        .I1(rst),
        .I2(mem_reg_0_i_5_n_0),
        .I3(mem_reg_0_i_6_n_0),
        .I4(rd_pointer_reg[3]),
        .I5(\wr_pointer[3]_i_1_n_0 ),
        .O(wr_pointer0));
  LUT2 #(
    .INIT(4'h2)) 
    mem_reg_0_i_3
       (.I0(wr_ready),
        .I1(rst),
        .O(mem_reg_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    mem_reg_0_i_4
       (.I0(\wr_pointer_reg_n_0_[3] ),
        .I1(rd_pointer_reg[3]),
        .I2(\wr_pointer_reg_n_0_[4] ),
        .I3(rd_pointer_reg[4]),
        .O(mem_reg_0_i_4_n_0));
  LUT6 #(
    .INIT(64'h0041820014000082)) 
    mem_reg_0_i_5
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[2]),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(\wr_pointer_reg_n_0_[0] ),
        .I5(rd_pointer_reg[1]),
        .O(mem_reg_0_i_5_n_0));
  LUT6 #(
    .INIT(64'h6999999999999999)) 
    mem_reg_0_i_6
       (.I0(rd_pointer_reg[4]),
        .I1(\wr_pointer_reg_n_0_[4] ),
        .I2(\wr_pointer_reg_n_0_[3] ),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(\wr_pointer_reg_n_0_[0] ),
        .I5(\wr_pointer_reg_n_0_[2] ),
        .O(mem_reg_0_i_6_n_0));
  LUT4 #(
    .INIT(16'h2A00)) 
    \rd_pointer[0]_i_1 
       (.I0(rd_state),
        .I1(empty_INST_0_i_1_n_0),
        .I2(mem_reg_0_i_4_n_0),
        .I3(rd_en),
        .O(\rd_pointer[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_pointer[0]_i_2 
       (.I0(rd_pointer_reg[0]),
        .O(\rd_pointer[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pointer[1]_i_1 
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .O(\rd_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rd_pointer[2]_i_1 
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .I2(rd_pointer_reg[2]),
        .O(\rd_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rd_pointer[3]_i_1 
       (.I0(rd_pointer_reg[1]),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[2]),
        .I3(rd_pointer_reg[3]),
        .O(\rd_pointer[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \rd_pointer[4]_i_1 
       (.I0(rd_pointer_reg[2]),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[1]),
        .I3(rd_pointer_reg[3]),
        .I4(rd_pointer_reg[4]),
        .O(\rd_pointer[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[0] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[0]_i_2_n_0 ),
        .Q(rd_pointer_reg[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[1] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[1]_i_1_n_0 ),
        .Q(rd_pointer_reg[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[2] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[2]_i_1_n_0 ),
        .Q(rd_pointer_reg[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[3] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[3]_i_1_n_0 ),
        .Q(rd_pointer_reg[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[4] 
       (.C(rd_clk),
        .CE(\rd_pointer[0]_i_1_n_0 ),
        .D(\rd_pointer[4]_i_1_n_0 ),
        .Q(rd_pointer_reg[4]),
        .R(rst));
  LUT6 #(
    .INIT(64'hFFFFAAAA00000888)) 
    rd_ready_i_1
       (.I0(rd_state),
        .I1(rd_en),
        .I2(mem_reg_0_i_4_n_0),
        .I3(empty_INST_0_i_1_n_0),
        .I4(rst),
        .I5(rd_ready),
        .O(rd_ready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rd_ready_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(rd_ready_i_1_n_0),
        .Q(rd_ready),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    \sync_1[71]_i_1 
       (.I0(wr_ready),
        .I1(wr_en),
        .I2(rst),
        .O(\sync_1[71]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[0] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[0]),
        .Q(sync_1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[10] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[10]),
        .Q(sync_1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[11] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[11]),
        .Q(sync_1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[12] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[12]),
        .Q(sync_1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[13] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[13]),
        .Q(sync_1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[14] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[14]),
        .Q(sync_1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[15] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[15]),
        .Q(sync_1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[16] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[16]),
        .Q(sync_1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[17] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[17]),
        .Q(sync_1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[18] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[18]),
        .Q(sync_1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[19] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[19]),
        .Q(sync_1[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[1] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[1]),
        .Q(sync_1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[20] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[20]),
        .Q(sync_1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[21] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[21]),
        .Q(sync_1[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[22] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[22]),
        .Q(sync_1[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[23] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[23]),
        .Q(sync_1[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[24] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[24]),
        .Q(sync_1[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[25] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[25]),
        .Q(sync_1[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[26] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[26]),
        .Q(sync_1[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[27] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[27]),
        .Q(sync_1[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[28] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[28]),
        .Q(sync_1[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[29] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[29]),
        .Q(sync_1[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[2] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[2]),
        .Q(sync_1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[30] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[30]),
        .Q(sync_1[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[31] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[31]),
        .Q(sync_1[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[32] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[32]),
        .Q(sync_1[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[33] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[33]),
        .Q(sync_1[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[34] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[34]),
        .Q(sync_1[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[35] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[35]),
        .Q(sync_1[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[36] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[36]),
        .Q(sync_1[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[37] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[37]),
        .Q(sync_1[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[38] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[38]),
        .Q(sync_1[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[39] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[39]),
        .Q(sync_1[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[3] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[3]),
        .Q(sync_1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[40] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[40]),
        .Q(sync_1[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[41] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[41]),
        .Q(sync_1[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[42] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[42]),
        .Q(sync_1[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[43] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[43]),
        .Q(sync_1[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[44] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[44]),
        .Q(sync_1[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[45] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[45]),
        .Q(sync_1[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[46] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[46]),
        .Q(sync_1[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[47] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[47]),
        .Q(sync_1[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[48] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[48]),
        .Q(sync_1[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[49] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[49]),
        .Q(sync_1[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[4] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[4]),
        .Q(sync_1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[50] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[50]),
        .Q(sync_1[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[51] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[51]),
        .Q(sync_1[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[52] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[52]),
        .Q(sync_1[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[53] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[53]),
        .Q(sync_1[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[54] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[54]),
        .Q(sync_1[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[55] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[55]),
        .Q(sync_1[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[56] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[56]),
        .Q(sync_1[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[57] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[57]),
        .Q(sync_1[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[58] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[58]),
        .Q(sync_1[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[59] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[59]),
        .Q(sync_1[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[5] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[5]),
        .Q(sync_1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[60] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[60]),
        .Q(sync_1[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[61] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[61]),
        .Q(sync_1[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[62] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[62]),
        .Q(sync_1[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[63] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[63]),
        .Q(sync_1[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[64] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[64]),
        .Q(sync_1[64]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[65] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[65]),
        .Q(sync_1[65]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[66] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[66]),
        .Q(sync_1[66]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[67] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[67]),
        .Q(sync_1[67]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[68] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[68]),
        .Q(sync_1[68]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[69] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[69]),
        .Q(sync_1[69]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[6] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[6]),
        .Q(sync_1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[70] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[70]),
        .Q(sync_1[70]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[71] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[71]),
        .Q(sync_1[71]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[7] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[7]),
        .Q(sync_1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[8] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[8]),
        .Q(sync_1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[9] 
       (.C(wr_clk),
        .CE(\sync_1[71]_i_1_n_0 ),
        .D(wr_data[9]),
        .Q(sync_1[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \wr_pointer[0]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .O(\wr_pointer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pointer[1]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_pointer[2]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .O(\wr_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \wr_pointer[3]_i_1 
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[3] ),
        .O(\wr_pointer[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2AAA0000)) 
    \wr_pointer[4]_i_1 
       (.I0(wr_ready),
        .I1(\wr_pointer[4]_i_3_n_0 ),
        .I2(mem_reg_0_i_6_n_0),
        .I3(mem_reg_0_i_5_n_0),
        .I4(wr_en),
        .O(\wr_pointer[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \wr_pointer[4]_i_2 
       (.I0(\wr_pointer_reg_n_0_[2] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(\wr_pointer_reg_n_0_[3] ),
        .I4(\wr_pointer_reg_n_0_[4] ),
        .O(\wr_pointer[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT5 #(
    .INIT(32'h69999999)) 
    \wr_pointer[4]_i_3 
       (.I0(rd_pointer_reg[3]),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .I4(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[4]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[0] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[0]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[1] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[1]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[2] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[2]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[3] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[3]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[4] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[4]_i_2_n_0 ),
        .Q(\wr_pointer_reg_n_0_[4] ),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    \wr_state[0]_i_1 
       (.I0(wr_en),
        .I1(wr_ready),
        .O(\wr_state[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_state_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\wr_state[0]_i_1_n_0 ),
        .Q(wr_ready),
        .R(rst));
endmodule

(* ADDR_WIDTH = "32" *) (* AR_DEPTH = "32" *) (* DATA_WIDTH = "64" *) 
(* ID_WIDTH = "4" *) (* LEN_WIDTH = "8" *) (* RESPONSE_WIDTH = "3" *) 
(* R_DEPTH = "32" *) (* SIZE_WIDTH = "4" *) 
module READ_BUFFER
   (aclk,
    areset,
    arvalid,
    araddr,
    arid,
    arsize,
    arburst,
    arlen,
    arready,
    rd_clk,
    ar_addr_read,
    ar_read_ready,
    arfull,
    arempty,
    ar_addr_out);
  input aclk;
  input areset;
  input arvalid;
  input [31:0]araddr;
  input [3:0]arid;
  input [3:0]arsize;
  input [1:0]arburst;
  input [7:0]arlen;
  output arready;
  input rd_clk;
  input ar_addr_read;
  output ar_read_ready;
  output arfull;
  output arempty;
  output [49:0]ar_addr_out;

  wire aclk;
  wire [49:0]ar_addr_out;
  wire ar_addr_read;
  wire ar_read_ready;
  wire [31:0]araddr;
  wire [1:0]arburst;
  wire arempty;
  wire areset;
  wire arfull;
  wire [3:0]arid;
  wire [7:0]arlen;
  wire arready;
  wire arvalid;
  wire rd_clk;

  (* ADDR_WIDTH = "32" *) 
  (* AR_DEPTH = "32" *) 
  (* AR_FIFO_WIDTH = "50" *) 
  (* DATA_WIDTH = "64" *) 
  (* ID_WIDTH = "4" *) 
  (* LEN_WIDTH = "8" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* SIZE_WIDTH = "4" *) 
  AR_FIFO AR_FIFO_INST_READ_BUFFER
       (.aclk(aclk),
        .ar_addr_out(ar_addr_out),
        .ar_addr_read(ar_addr_read),
        .ar_read_ready(ar_read_ready),
        .araddr(araddr),
        .arburst(arburst),
        .arempty(arempty),
        .areset(areset),
        .arfull(arfull),
        .arid(arid),
        .arlen(arlen),
        .arready(arready),
        .arsize({1'b0,1'b0,1'b0,1'b0}),
        .arvalid(arvalid),
        .rd_clk(rd_clk));
endmodule

(* ADDR_OFFSET = "16'b1110000000000000" *) (* ADDR_WIDTH = "32" *) (* ALIGN_BITS = "2" *) 
(* AR_DEPTH = "32" *) (* AW_DEPTH = "32" *) (* AW_FIFO_WIDTH = "50" *) 
(* BASE_ADDRESS = "16'b1110000100000000" *) (* BYTES_WIDTH = "3" *) (* CONTL_REG_WIDTH = "32" *) 
(* CRTL = "2'b10" *) (* CTRL_REG_ADDR = "8" *) (* DATA_BYTES = "8" *) 
(* DATA_WIDTH = "64" *) (* DECERR = "3'b011" *) (* DECODE = "3'b010" *) 
(* END_OFFSET = "16'b0000100000010000" *) (* IDEL = "3'b000" *) (* ID_WIDTH = "4" *) 
(* INTRPT_REG_ADDR = "12" *) (* INTRT = "2'b11" *) (* LEN_WIDTH = "8" *) 
(* OFFSET_START_BITS = "8" *) (* OKAY = "0" *) (* READ_RX_ADDR = "3'b001" *) 
(* READ_RX_DATA = "3'b011" *) (* RESPONSE_WIDTH = "3" *) (* RX_ADDRESS_OFFSET_END = "2324" *) 
(* RX_ADDRESS_OFFSET_START = "2068" *) (* R_DEPTH = "32" *) (* SEND_AXI = "3'b101" *) 
(* SIZE_WIDTH = "4" *) (* SLVERR = "3'b010" *) (* START_OFFSET = "16'b0000000000000000" *) 
(* STATUS_REG_ADDR = "4" *) (* STATUS_REG_WIDTH = "32" *) (* STS = "2'b01" *) 
(* TOTAL_BYTES = "2315" *) (* TX_ADDRESS_OFFSET_END = "2064" *) (* TX_ADDRESS_OFFSET_START = "16" *) 
(* UART_RX_FIFO_DEPTH = "32" *) (* UART_TX_FIFO_DEPTH = "256" *) (* WRITE_BACK = "3'b100" *) 
(* W_DEPTH = "32" *) 
module READ_BUFFER_CONTROLLER
   (rd_clk,
    rst,
    ar_addr_read,
    ar_read_ready,
    arempty,
    ar_addr_out,
    wr_r_fifo_data,
    wr_r_fifo_en,
    rx_data,
    rx_data_valid,
    addr,
    rx_en,
    aclk,
    rvalid,
    rdata,
    rid,
    rlast,
    rresp,
    rready);
  input rd_clk;
  input rst;
  output ar_addr_read;
  input ar_read_ready;
  input arempty;
  input [49:0]ar_addr_out;
  output [70:0]wr_r_fifo_data;
  output wr_r_fifo_en;
  input [63:0]rx_data;
  input rx_data_valid;
  output [7:0]addr;
  output rx_en;
  input aclk;
  output rvalid;
  output [63:0]rdata;
  output [3:0]rid;
  output rlast;
  output [2:0]rresp;
  input rready;

  wire \<const0> ;
  wire FSM_sequential_axi_read_state_i_1_n_0;
  wire aclk;
  wire [7:0]addr;
  wire [49:0]ar_addr_out;
  wire ar_addr_read;
  wire ar_addr_read_i_1_n_0;
  wire ar_read_ready;
  wire arempty;
  wire [0:0]axi_read_state;
  wire \axi_read_state[0]_i_1_n_0 ;
  wire char_time_out;
  wire [7:0]p_1_in;
  wire [7:0]r_addr0;
  wire r_addr1;
  wire r_addr2_i_10_n_0;
  wire r_addr2_i_11_n_0;
  wire r_addr2_i_12_n_0;
  wire r_addr2_i_13_n_0;
  wire r_addr2_i_14_n_0;
  wire r_addr2_i_15_n_0;
  wire r_addr2_i_16_n_0;
  wire r_addr2_i_1_n_0;
  wire r_addr2_i_2_n_0;
  wire r_addr2_i_3_n_0;
  wire r_addr2_i_4_n_0;
  wire r_addr2_i_5_n_0;
  wire r_addr2_i_6_n_0;
  wire r_addr2_i_7_n_0;
  wire r_addr2_i_8_n_0;
  wire r_addr2_i_9_n_0;
  wire r_addr2_n_100;
  wire r_addr2_n_101;
  wire r_addr2_n_102;
  wire r_addr2_n_103;
  wire r_addr2_n_104;
  wire r_addr2_n_105;
  wire r_addr2_n_74;
  wire r_addr2_n_75;
  wire r_addr2_n_76;
  wire r_addr2_n_77;
  wire r_addr2_n_78;
  wire r_addr2_n_79;
  wire r_addr2_n_80;
  wire r_addr2_n_81;
  wire r_addr2_n_82;
  wire r_addr2_n_83;
  wire r_addr2_n_84;
  wire r_addr2_n_85;
  wire r_addr2_n_86;
  wire r_addr2_n_87;
  wire r_addr2_n_88;
  wire r_addr2_n_89;
  wire r_addr2_n_90;
  wire r_addr2_n_91;
  wire r_addr2_n_92;
  wire r_addr2_n_93;
  wire r_addr2_n_94;
  wire r_addr2_n_95;
  wire r_addr2_n_96;
  wire r_addr2_n_97;
  wire r_addr2_n_98;
  wire r_addr2_n_99;
  wire \r_addr[0]_i_3_n_0 ;
  wire \r_addr[0]_i_4_n_0 ;
  wire \r_addr[0]_i_5_n_0 ;
  wire \r_addr[0]_i_6_n_0 ;
  wire \r_addr[3]_i_10_n_0 ;
  wire \r_addr[3]_i_11_n_0 ;
  wire \r_addr[3]_i_12_n_0 ;
  wire \r_addr[3]_i_13_n_0 ;
  wire \r_addr[3]_i_14_n_0 ;
  wire \r_addr[3]_i_15_n_0 ;
  wire \r_addr[3]_i_4_n_0 ;
  wire \r_addr[3]_i_5_n_0 ;
  wire \r_addr[3]_i_6_n_0 ;
  wire \r_addr[3]_i_7_n_0 ;
  wire \r_addr[3]_i_8_n_0 ;
  wire \r_addr[3]_i_9_n_0 ;
  wire \r_addr[7]_i_10_n_0 ;
  wire \r_addr[7]_i_11_n_0 ;
  wire \r_addr[7]_i_12_n_0 ;
  wire \r_addr[7]_i_13_n_0 ;
  wire \r_addr[7]_i_14_n_0 ;
  wire \r_addr[7]_i_15_n_0 ;
  wire \r_addr[7]_i_16_n_0 ;
  wire \r_addr[7]_i_18_n_0 ;
  wire \r_addr[7]_i_19_n_0 ;
  wire \r_addr[7]_i_1_n_0 ;
  wire \r_addr[7]_i_20_n_0 ;
  wire \r_addr[7]_i_21_n_0 ;
  wire \r_addr[7]_i_22_n_0 ;
  wire \r_addr[7]_i_23_n_0 ;
  wire \r_addr[7]_i_24_n_0 ;
  wire \r_addr[7]_i_25_n_0 ;
  wire \r_addr[7]_i_26_n_0 ;
  wire \r_addr[7]_i_27_n_0 ;
  wire \r_addr[7]_i_28_n_0 ;
  wire \r_addr[7]_i_29_n_0 ;
  wire \r_addr[7]_i_30_n_0 ;
  wire \r_addr[7]_i_33_n_0 ;
  wire \r_addr[7]_i_34_n_0 ;
  wire \r_addr[7]_i_35_n_0 ;
  wire \r_addr[7]_i_36_n_0 ;
  wire \r_addr[7]_i_37_n_0 ;
  wire \r_addr[7]_i_38_n_0 ;
  wire \r_addr[7]_i_39_n_0 ;
  wire \r_addr[7]_i_3_n_0 ;
  wire \r_addr[7]_i_40_n_0 ;
  wire \r_addr[7]_i_41_n_0 ;
  wire \r_addr[7]_i_42_n_0 ;
  wire \r_addr[7]_i_43_n_0 ;
  wire \r_addr[7]_i_44_n_0 ;
  wire \r_addr[7]_i_46_n_0 ;
  wire \r_addr[7]_i_47_n_0 ;
  wire \r_addr[7]_i_48_n_0 ;
  wire \r_addr[7]_i_49_n_0 ;
  wire \r_addr[7]_i_50_n_0 ;
  wire \r_addr[7]_i_51_n_0 ;
  wire \r_addr[7]_i_52_n_0 ;
  wire \r_addr[7]_i_53_n_0 ;
  wire \r_addr[7]_i_54_n_0 ;
  wire \r_addr[7]_i_55_n_0 ;
  wire \r_addr[7]_i_56_n_0 ;
  wire \r_addr[7]_i_57_n_0 ;
  wire \r_addr[7]_i_58_n_0 ;
  wire \r_addr[7]_i_59_n_0 ;
  wire \r_addr[7]_i_60_n_0 ;
  wire \r_addr[7]_i_61_n_0 ;
  wire \r_addr[7]_i_6_n_0 ;
  wire \r_addr[7]_i_8_n_0 ;
  wire \r_addr[7]_i_9_n_0 ;
  wire \r_addr_reg[0]_i_2_n_0 ;
  wire \r_addr_reg[0]_i_2_n_1 ;
  wire \r_addr_reg[0]_i_2_n_2 ;
  wire \r_addr_reg[0]_i_2_n_3 ;
  wire \r_addr_reg[0]_i_2_n_4 ;
  wire \r_addr_reg[0]_i_2_n_5 ;
  wire \r_addr_reg[0]_i_2_n_6 ;
  wire \r_addr_reg[0]_i_2_n_7 ;
  wire \r_addr_reg[3]_i_2_n_0 ;
  wire \r_addr_reg[3]_i_2_n_1 ;
  wire \r_addr_reg[3]_i_2_n_2 ;
  wire \r_addr_reg[3]_i_2_n_3 ;
  wire \r_addr_reg[3]_i_2_n_4 ;
  wire \r_addr_reg[3]_i_2_n_5 ;
  wire \r_addr_reg[3]_i_2_n_6 ;
  wire \r_addr_reg[3]_i_3_n_0 ;
  wire \r_addr_reg[3]_i_3_n_1 ;
  wire \r_addr_reg[3]_i_3_n_2 ;
  wire \r_addr_reg[3]_i_3_n_3 ;
  wire \r_addr_reg[7]_i_17_n_0 ;
  wire \r_addr_reg[7]_i_17_n_1 ;
  wire \r_addr_reg[7]_i_17_n_2 ;
  wire \r_addr_reg[7]_i_17_n_3 ;
  wire \r_addr_reg[7]_i_31_n_1 ;
  wire \r_addr_reg[7]_i_31_n_2 ;
  wire \r_addr_reg[7]_i_31_n_3 ;
  wire \r_addr_reg[7]_i_31_n_4 ;
  wire \r_addr_reg[7]_i_31_n_5 ;
  wire \r_addr_reg[7]_i_31_n_6 ;
  wire \r_addr_reg[7]_i_31_n_7 ;
  wire \r_addr_reg[7]_i_32_n_0 ;
  wire \r_addr_reg[7]_i_32_n_1 ;
  wire \r_addr_reg[7]_i_32_n_2 ;
  wire \r_addr_reg[7]_i_32_n_3 ;
  wire \r_addr_reg[7]_i_45_n_0 ;
  wire \r_addr_reg[7]_i_45_n_1 ;
  wire \r_addr_reg[7]_i_45_n_2 ;
  wire \r_addr_reg[7]_i_45_n_3 ;
  wire \r_addr_reg[7]_i_4_n_1 ;
  wire \r_addr_reg[7]_i_4_n_2 ;
  wire \r_addr_reg[7]_i_4_n_3 ;
  wire \r_addr_reg[7]_i_4_n_4 ;
  wire \r_addr_reg[7]_i_4_n_5 ;
  wire \r_addr_reg[7]_i_4_n_6 ;
  wire \r_addr_reg[7]_i_4_n_7 ;
  wire \r_addr_reg[7]_i_5_n_1 ;
  wire \r_addr_reg[7]_i_5_n_2 ;
  wire \r_addr_reg[7]_i_5_n_3 ;
  wire \r_addr_reg[7]_i_7_n_1 ;
  wire \r_addr_reg[7]_i_7_n_2 ;
  wire \r_addr_reg[7]_i_7_n_3 ;
  wire rd_clk;
  wire \read_beat_count[0]_i_1_n_0 ;
  wire \read_beat_count[1]_i_1_n_0 ;
  wire \read_beat_count[2]_i_1_n_0 ;
  wire \read_beat_count[3]_i_1_n_0 ;
  wire \read_beat_count[3]_i_2_n_0 ;
  wire \read_beat_count[3]_i_3_n_0 ;
  wire \read_beat_count[3]_i_4_n_0 ;
  wire [3:0]read_beat_count_reg;
  wire read_state;
  wire \read_state[0]_i_1_n_0 ;
  wire \read_state[1]_i_1_n_0 ;
  wire \read_state[1]_i_2_n_0 ;
  wire \read_state[1]_i_3_n_0 ;
  wire \read_state[1]_i_4_n_0 ;
  wire \read_state[1]_i_5_n_0 ;
  wire \read_state[2]_i_1_n_0 ;
  wire \read_state_reg_n_0_[0] ;
  wire \read_state_reg_n_0_[1] ;
  wire \read_state_reg_n_0_[2] ;
  wire rlast;
  wire rlast_INST_0_i_1_n_0;
  wire rlast_INST_0_i_2_n_0;
  wire rlast_INST_0_i_3_n_0;
  wire rlast_INST_0_i_4_n_0;
  wire rlast_INST_0_i_5_n_0;
  wire rlast_INST_0_i_6_n_0;
  wire rlast_INST_0_n_1;
  wire rlast_INST_0_n_2;
  wire rlast_INST_0_n_3;
  wire rready;
  wire [1:1]\^rresp ;
  wire \rresp[1]_i_10_n_0 ;
  wire \rresp[1]_i_11_n_0 ;
  wire \rresp[1]_i_12_n_0 ;
  wire \rresp[1]_i_1_n_0 ;
  wire \rresp[1]_i_2_n_0 ;
  wire \rresp[1]_i_3_n_0 ;
  wire \rresp[1]_i_4_n_0 ;
  wire \rresp[1]_i_5_n_0 ;
  wire \rresp[1]_i_6_n_0 ;
  wire \rresp[1]_i_7_n_0 ;
  wire \rresp[1]_i_8_n_0 ;
  wire \rresp[1]_i_9_n_0 ;
  wire rst;
  wire rvalid;
  wire rx_data_valid;
  wire rx_en;
  wire wr_r_fifo_en_i_1_n_0;
  wire wr_r_fifo_en_i_2_n_0;
  wire wr_r_fifo_en_reg_n_0;
  wire NLW_r_addr2_CARRYCASCOUT_UNCONNECTED;
  wire NLW_r_addr2_MULTSIGNOUT_UNCONNECTED;
  wire NLW_r_addr2_OVERFLOW_UNCONNECTED;
  wire NLW_r_addr2_PATTERNBDETECT_UNCONNECTED;
  wire NLW_r_addr2_PATTERNDETECT_UNCONNECTED;
  wire NLW_r_addr2_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_r_addr2_ACOUT_UNCONNECTED;
  wire [17:0]NLW_r_addr2_BCOUT_UNCONNECTED;
  wire [3:0]NLW_r_addr2_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_r_addr2_P_UNCONNECTED;
  wire [47:0]NLW_r_addr2_PCOUT_UNCONNECTED;
  wire [0:0]\NLW_r_addr_reg[3]_i_2_O_UNCONNECTED ;
  wire [3:0]\NLW_r_addr_reg[7]_i_17_O_UNCONNECTED ;
  wire [3:3]\NLW_r_addr_reg[7]_i_31_CO_UNCONNECTED ;
  wire [3:0]\NLW_r_addr_reg[7]_i_32_O_UNCONNECTED ;
  wire [3:3]\NLW_r_addr_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_r_addr_reg[7]_i_45_O_UNCONNECTED ;
  wire [3:3]\NLW_r_addr_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_r_addr_reg[7]_i_7_O_UNCONNECTED ;
  wire [3:0]NLW_rlast_INST_0_O_UNCONNECTED;

  assign rdata[63] = \<const0> ;
  assign rdata[62] = \<const0> ;
  assign rdata[61] = \<const0> ;
  assign rdata[60] = \<const0> ;
  assign rdata[59] = \<const0> ;
  assign rdata[58] = \<const0> ;
  assign rdata[57] = \<const0> ;
  assign rdata[56] = \<const0> ;
  assign rdata[55] = \<const0> ;
  assign rdata[54] = \<const0> ;
  assign rdata[53] = \<const0> ;
  assign rdata[52] = \<const0> ;
  assign rdata[51] = \<const0> ;
  assign rdata[50] = \<const0> ;
  assign rdata[49] = \<const0> ;
  assign rdata[48] = \<const0> ;
  assign rdata[47] = \<const0> ;
  assign rdata[46] = \<const0> ;
  assign rdata[45] = \<const0> ;
  assign rdata[44] = \<const0> ;
  assign rdata[43] = \<const0> ;
  assign rdata[42] = \<const0> ;
  assign rdata[41] = \<const0> ;
  assign rdata[40] = \<const0> ;
  assign rdata[39] = \<const0> ;
  assign rdata[38] = \<const0> ;
  assign rdata[37] = \<const0> ;
  assign rdata[36] = \<const0> ;
  assign rdata[35] = \<const0> ;
  assign rdata[34] = \<const0> ;
  assign rdata[33] = \<const0> ;
  assign rdata[32] = \<const0> ;
  assign rdata[31] = \<const0> ;
  assign rdata[30] = \<const0> ;
  assign rdata[29] = \<const0> ;
  assign rdata[28] = \<const0> ;
  assign rdata[27] = \<const0> ;
  assign rdata[26] = \<const0> ;
  assign rdata[25] = \<const0> ;
  assign rdata[24] = \<const0> ;
  assign rdata[23] = \<const0> ;
  assign rdata[22] = \<const0> ;
  assign rdata[21] = \<const0> ;
  assign rdata[20] = \<const0> ;
  assign rdata[19] = \<const0> ;
  assign rdata[18] = \<const0> ;
  assign rdata[17] = \<const0> ;
  assign rdata[16] = \<const0> ;
  assign rdata[15] = \<const0> ;
  assign rdata[14] = \<const0> ;
  assign rdata[13] = \<const0> ;
  assign rdata[12] = \<const0> ;
  assign rdata[11] = \<const0> ;
  assign rdata[10] = \<const0> ;
  assign rdata[9] = \<const0> ;
  assign rdata[8] = \<const0> ;
  assign rdata[7] = \<const0> ;
  assign rdata[6] = \<const0> ;
  assign rdata[5] = \<const0> ;
  assign rdata[4] = \<const0> ;
  assign rdata[3] = \<const0> ;
  assign rdata[2] = \<const0> ;
  assign rdata[1] = \<const0> ;
  assign rdata[0] = \<const0> ;
  assign rid[3] = \<const0> ;
  assign rid[2] = \<const0> ;
  assign rid[1] = \<const0> ;
  assign rid[0] = \<const0> ;
  assign rresp[2] = \<const0> ;
  assign rresp[1] = \^rresp [1];
  assign rresp[0] = \<const0> ;
  assign wr_r_fifo_data[70] = \<const0> ;
  assign wr_r_fifo_data[69] = \<const0> ;
  assign wr_r_fifo_data[68] = \<const0> ;
  assign wr_r_fifo_data[67] = \<const0> ;
  assign wr_r_fifo_data[66] = \<const0> ;
  assign wr_r_fifo_data[65] = \<const0> ;
  assign wr_r_fifo_data[64] = \<const0> ;
  assign wr_r_fifo_data[63] = \<const0> ;
  assign wr_r_fifo_data[62] = \<const0> ;
  assign wr_r_fifo_data[61] = \<const0> ;
  assign wr_r_fifo_data[60] = \<const0> ;
  assign wr_r_fifo_data[59] = \<const0> ;
  assign wr_r_fifo_data[58] = \<const0> ;
  assign wr_r_fifo_data[57] = \<const0> ;
  assign wr_r_fifo_data[56] = \<const0> ;
  assign wr_r_fifo_data[55] = \<const0> ;
  assign wr_r_fifo_data[54] = \<const0> ;
  assign wr_r_fifo_data[53] = \<const0> ;
  assign wr_r_fifo_data[52] = \<const0> ;
  assign wr_r_fifo_data[51] = \<const0> ;
  assign wr_r_fifo_data[50] = \<const0> ;
  assign wr_r_fifo_data[49] = \<const0> ;
  assign wr_r_fifo_data[48] = \<const0> ;
  assign wr_r_fifo_data[47] = \<const0> ;
  assign wr_r_fifo_data[46] = \<const0> ;
  assign wr_r_fifo_data[45] = \<const0> ;
  assign wr_r_fifo_data[44] = \<const0> ;
  assign wr_r_fifo_data[43] = \<const0> ;
  assign wr_r_fifo_data[42] = \<const0> ;
  assign wr_r_fifo_data[41] = \<const0> ;
  assign wr_r_fifo_data[40] = \<const0> ;
  assign wr_r_fifo_data[39] = \<const0> ;
  assign wr_r_fifo_data[38] = \<const0> ;
  assign wr_r_fifo_data[37] = \<const0> ;
  assign wr_r_fifo_data[36] = \<const0> ;
  assign wr_r_fifo_data[35] = \<const0> ;
  assign wr_r_fifo_data[34] = \<const0> ;
  assign wr_r_fifo_data[33] = \<const0> ;
  assign wr_r_fifo_data[32] = \<const0> ;
  assign wr_r_fifo_data[31] = \<const0> ;
  assign wr_r_fifo_data[30] = \<const0> ;
  assign wr_r_fifo_data[29] = \<const0> ;
  assign wr_r_fifo_data[28] = \<const0> ;
  assign wr_r_fifo_data[27] = \<const0> ;
  assign wr_r_fifo_data[26] = \<const0> ;
  assign wr_r_fifo_data[25] = \<const0> ;
  assign wr_r_fifo_data[24] = \<const0> ;
  assign wr_r_fifo_data[23] = \<const0> ;
  assign wr_r_fifo_data[22] = \<const0> ;
  assign wr_r_fifo_data[21] = \<const0> ;
  assign wr_r_fifo_data[20] = \<const0> ;
  assign wr_r_fifo_data[19] = \<const0> ;
  assign wr_r_fifo_data[18] = \<const0> ;
  assign wr_r_fifo_data[17] = \<const0> ;
  assign wr_r_fifo_data[16] = \<const0> ;
  assign wr_r_fifo_data[15] = \<const0> ;
  assign wr_r_fifo_data[14] = \<const0> ;
  assign wr_r_fifo_data[13] = \<const0> ;
  assign wr_r_fifo_data[12] = \<const0> ;
  assign wr_r_fifo_data[11] = \<const0> ;
  assign wr_r_fifo_data[10] = \<const0> ;
  assign wr_r_fifo_data[9] = \<const0> ;
  assign wr_r_fifo_data[8] = \<const0> ;
  assign wr_r_fifo_data[7] = \<const0> ;
  assign wr_r_fifo_data[6] = \<const0> ;
  assign wr_r_fifo_data[5] = \<const0> ;
  assign wr_r_fifo_data[4] = \<const0> ;
  assign wr_r_fifo_data[3] = \<const0> ;
  assign wr_r_fifo_data[2] = \<const0> ;
  assign wr_r_fifo_data[1] = \<const0> ;
  assign wr_r_fifo_data[0] = \<const0> ;
  assign wr_r_fifo_en = \<const0> ;
  LUT6 #(
    .INIT(64'h5551FFFBAAAE0004)) 
    FSM_sequential_axi_read_state_i_1
       (.I0(axi_read_state),
        .I1(\read_state_reg_n_0_[2] ),
        .I2(\read_state_reg_n_0_[1] ),
        .I3(\read_state_reg_n_0_[0] ),
        .I4(rready),
        .I5(rvalid),
        .O(FSM_sequential_axi_read_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDEL:0,SEND_AXI:1," *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_axi_read_state_reg
       (.C(aclk),
        .CE(1'b1),
        .D(FSM_sequential_axi_read_state_i_1_n_0),
        .Q(rvalid),
        .R(rst));
  GND GND
       (.G(\<const0> ));
  (* BEGIN = "2'b01" *) 
  (* COUNT = "100000" *) 
  (* IDEL = "2'b00" *) 
  (* TRIGGER = "2'b10" *) 
  TIMER WRITE_CNTRL_TIMER
       (.check(1'b0),
        .clk(rd_clk),
        .in_trig(rvalid),
        .rst(rst),
        .rst_trig(rx_data_valid),
        .trig(char_time_out));
  LUT6 #(
    .INIT(64'hFFFDFFFF00030000)) 
    ar_addr_read_i_1
       (.I0(ar_read_ready),
        .I1(\read_state_reg_n_0_[2] ),
        .I2(rst),
        .I3(\read_state_reg_n_0_[1] ),
        .I4(\read_state_reg_n_0_[0] ),
        .I5(ar_addr_read),
        .O(ar_addr_read_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ar_addr_read_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(ar_addr_read_i_1_n_0),
        .Q(ar_addr_read),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT5 #(
    .INIT(32'h00FF0202)) 
    \axi_read_state[0]_i_1 
       (.I0(\read_state_reg_n_0_[2] ),
        .I1(\read_state_reg_n_0_[1] ),
        .I2(\read_state_reg_n_0_[0] ),
        .I3(rready),
        .I4(axi_read_state),
        .O(\axi_read_state[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \axi_read_state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\axi_read_state[0]_i_1_n_0 ),
        .Q(axi_read_state),
        .R(rst));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    r_addr2
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,r_addr2_i_1_n_0,r_addr2_i_2_n_0,r_addr2_i_3_n_0,r_addr2_i_4_n_0,r_addr2_i_5_n_0,r_addr2_i_6_n_0,r_addr2_i_7_n_0,r_addr2_i_8_n_0,r_addr2_i_9_n_0,r_addr2_i_10_n_0,r_addr2_i_11_n_0,r_addr2_i_12_n_0,r_addr2_i_13_n_0,r_addr2_i_14_n_0,r_addr2_i_15_n_0,r_addr2_i_16_n_0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_r_addr2_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ar_addr_out[43:36]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_r_addr2_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ar_addr_out[31:0]}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_r_addr2_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_r_addr2_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_r_addr2_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_r_addr2_OVERFLOW_UNCONNECTED),
        .P({NLW_r_addr2_P_UNCONNECTED[47:32],r_addr2_n_74,r_addr2_n_75,r_addr2_n_76,r_addr2_n_77,r_addr2_n_78,r_addr2_n_79,r_addr2_n_80,r_addr2_n_81,r_addr2_n_82,r_addr2_n_83,r_addr2_n_84,r_addr2_n_85,r_addr2_n_86,r_addr2_n_87,r_addr2_n_88,r_addr2_n_89,r_addr2_n_90,r_addr2_n_91,r_addr2_n_92,r_addr2_n_93,r_addr2_n_94,r_addr2_n_95,r_addr2_n_96,r_addr2_n_97,r_addr2_n_98,r_addr2_n_99,r_addr2_n_100,r_addr2_n_101,r_addr2_n_102,r_addr2_n_103,r_addr2_n_104,r_addr2_n_105}),
        .PATTERNBDETECT(NLW_r_addr2_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_r_addr2_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_r_addr2_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_r_addr2_UNDERFLOW_UNCONNECTED));
  LUT4 #(
    .INIT(16'h8000)) 
    r_addr2_i_1
       (.I0(ar_addr_out[32]),
        .I1(ar_addr_out[33]),
        .I2(ar_addr_out[34]),
        .I3(ar_addr_out[35]),
        .O(r_addr2_i_1_n_0));
  LUT4 #(
    .INIT(16'h0400)) 
    r_addr2_i_10
       (.I0(ar_addr_out[32]),
        .I1(ar_addr_out[33]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_10_n_0));
  LUT4 #(
    .INIT(16'h0200)) 
    r_addr2_i_11
       (.I0(ar_addr_out[32]),
        .I1(ar_addr_out[33]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_11_n_0));
  LUT4 #(
    .INIT(16'h0100)) 
    r_addr2_i_12
       (.I0(ar_addr_out[33]),
        .I1(ar_addr_out[32]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_12_n_0));
  LUT4 #(
    .INIT(16'h0008)) 
    r_addr2_i_13
       (.I0(ar_addr_out[33]),
        .I1(ar_addr_out[32]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_13_n_0));
  LUT4 #(
    .INIT(16'h0100)) 
    r_addr2_i_14
       (.I0(ar_addr_out[35]),
        .I1(ar_addr_out[34]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .O(r_addr2_i_14_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    r_addr2_i_15
       (.I0(ar_addr_out[32]),
        .I1(ar_addr_out[33]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_15_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    r_addr2_i_16
       (.I0(ar_addr_out[32]),
        .I1(ar_addr_out[33]),
        .I2(ar_addr_out[34]),
        .I3(ar_addr_out[35]),
        .O(r_addr2_i_16_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    r_addr2_i_2
       (.I0(ar_addr_out[33]),
        .I1(ar_addr_out[32]),
        .I2(ar_addr_out[34]),
        .I3(ar_addr_out[35]),
        .O(r_addr2_i_2_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    r_addr2_i_3
       (.I0(ar_addr_out[33]),
        .I1(ar_addr_out[32]),
        .I2(ar_addr_out[34]),
        .I3(ar_addr_out[35]),
        .O(r_addr2_i_3_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    r_addr2_i_4
       (.I0(ar_addr_out[32]),
        .I1(ar_addr_out[33]),
        .I2(ar_addr_out[34]),
        .I3(ar_addr_out[35]),
        .O(r_addr2_i_4_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    r_addr2_i_5
       (.I0(ar_addr_out[32]),
        .I1(ar_addr_out[33]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_5_n_0));
  LUT4 #(
    .INIT(16'h0020)) 
    r_addr2_i_6
       (.I0(ar_addr_out[33]),
        .I1(ar_addr_out[32]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_6_n_0));
  LUT4 #(
    .INIT(16'h0040)) 
    r_addr2_i_7
       (.I0(ar_addr_out[33]),
        .I1(ar_addr_out[32]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_7_n_0));
  LUT4 #(
    .INIT(16'h0010)) 
    r_addr2_i_8
       (.I0(ar_addr_out[32]),
        .I1(ar_addr_out[33]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[34]),
        .O(r_addr2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    r_addr2_i_9
       (.I0(ar_addr_out[34]),
        .I1(ar_addr_out[35]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .O(r_addr2_i_9_n_0));
  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \r_addr[0]_i_1 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\r_addr_reg[0]_i_2_n_7 ),
        .I2(ar_addr_out[49]),
        .I3(r_addr0[0]),
        .I4(ar_addr_out[48]),
        .I5(ar_addr_out[0]),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'hA9AAAAAAAAAAAAAA)) 
    \r_addr[0]_i_3 
       (.I0(\r_addr[3]_i_4_n_0 ),
        .I1(ar_addr_out[34]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[32]),
        .I4(ar_addr_out[33]),
        .I5(read_beat_count_reg[0]),
        .O(\r_addr[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000CFA00000C0A)) 
    \r_addr[0]_i_4 
       (.I0(read_beat_count_reg[2]),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[33]),
        .I3(ar_addr_out[32]),
        .I4(\r_addr[3]_i_15_n_0 ),
        .I5(read_beat_count_reg[0]),
        .O(\r_addr[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000000AC)) 
    \r_addr[0]_i_5 
       (.I0(read_beat_count_reg[0]),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(ar_addr_out[34]),
        .I5(ar_addr_out[35]),
        .O(\r_addr[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \r_addr[0]_i_6 
       (.I0(ar_addr_out[35]),
        .I1(ar_addr_out[34]),
        .I2(ar_addr_out[33]),
        .I3(ar_addr_out[32]),
        .I4(read_beat_count_reg[0]),
        .O(\r_addr[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \r_addr[1]_i_1 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\r_addr_reg[3]_i_2_n_6 ),
        .I2(ar_addr_out[49]),
        .I3(r_addr0[1]),
        .I4(ar_addr_out[48]),
        .I5(ar_addr_out[1]),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \r_addr[2]_i_1 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\r_addr_reg[3]_i_2_n_5 ),
        .I2(ar_addr_out[49]),
        .I3(r_addr0[2]),
        .I4(ar_addr_out[48]),
        .I5(ar_addr_out[2]),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \r_addr[3]_i_1 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\r_addr_reg[3]_i_2_n_4 ),
        .I2(ar_addr_out[49]),
        .I3(r_addr0[3]),
        .I4(ar_addr_out[48]),
        .I5(ar_addr_out[3]),
        .O(p_1_in[3]));
  LUT5 #(
    .INIT(32'h00010000)) 
    \r_addr[3]_i_10 
       (.I0(ar_addr_out[35]),
        .I1(ar_addr_out[34]),
        .I2(ar_addr_out[33]),
        .I3(ar_addr_out[32]),
        .I4(read_beat_count_reg[0]),
        .O(\r_addr[3]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_addr[3]_i_11 
       (.I0(addr[3]),
        .I1(\r_addr_reg[0]_i_2_n_4 ),
        .O(\r_addr[3]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_addr[3]_i_12 
       (.I0(addr[2]),
        .I1(\r_addr_reg[0]_i_2_n_5 ),
        .O(\r_addr[3]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_addr[3]_i_13 
       (.I0(addr[1]),
        .I1(\r_addr_reg[0]_i_2_n_6 ),
        .O(\r_addr[3]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA6)) 
    \r_addr[3]_i_14 
       (.I0(addr[0]),
        .I1(read_beat_count_reg[0]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(ar_addr_out[34]),
        .I5(ar_addr_out[35]),
        .O(\r_addr[3]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[3]_i_15 
       (.I0(ar_addr_out[35]),
        .I1(ar_addr_out[34]),
        .O(\r_addr[3]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h00000FCA000000CA)) 
    \r_addr[3]_i_4 
       (.I0(read_beat_count_reg[3]),
        .I1(read_beat_count_reg[2]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(\r_addr[3]_i_15_n_0 ),
        .I5(read_beat_count_reg[1]),
        .O(\r_addr[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000B00000008)) 
    \r_addr[3]_i_5 
       (.I0(read_beat_count_reg[1]),
        .I1(ar_addr_out[32]),
        .I2(ar_addr_out[33]),
        .I3(ar_addr_out[34]),
        .I4(ar_addr_out[35]),
        .I5(read_beat_count_reg[2]),
        .O(\r_addr[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \r_addr[3]_i_6 
       (.I0(read_beat_count_reg[0]),
        .I1(ar_addr_out[32]),
        .I2(ar_addr_out[33]),
        .I3(ar_addr_out[35]),
        .I4(ar_addr_out[34]),
        .O(\r_addr[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hA9AAAAAAAAAAAAAA)) 
    \r_addr[3]_i_7 
       (.I0(\r_addr[3]_i_4_n_0 ),
        .I1(ar_addr_out[34]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[32]),
        .I4(ar_addr_out[33]),
        .I5(read_beat_count_reg[0]),
        .O(\r_addr[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00000CFA00000C0A)) 
    \r_addr[3]_i_8 
       (.I0(read_beat_count_reg[2]),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[33]),
        .I3(ar_addr_out[32]),
        .I4(\r_addr[3]_i_15_n_0 ),
        .I5(read_beat_count_reg[0]),
        .O(\r_addr[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000000AC)) 
    \r_addr[3]_i_9 
       (.I0(read_beat_count_reg[0]),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(ar_addr_out[34]),
        .I5(ar_addr_out[35]),
        .O(\r_addr[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \r_addr[4]_i_1 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\r_addr_reg[7]_i_4_n_7 ),
        .I2(ar_addr_out[49]),
        .I3(r_addr0[4]),
        .I4(ar_addr_out[48]),
        .I5(ar_addr_out[4]),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \r_addr[5]_i_1 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\r_addr_reg[7]_i_4_n_6 ),
        .I2(ar_addr_out[49]),
        .I3(r_addr0[5]),
        .I4(ar_addr_out[48]),
        .I5(ar_addr_out[5]),
        .O(p_1_in[5]));
  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \r_addr[6]_i_1 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\r_addr_reg[7]_i_4_n_5 ),
        .I2(ar_addr_out[49]),
        .I3(r_addr0[6]),
        .I4(ar_addr_out[48]),
        .I5(ar_addr_out[6]),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    \r_addr[7]_i_1 
       (.I0(\read_state_reg_n_0_[2] ),
        .I1(\read_state_reg_n_0_[1] ),
        .I2(\read_state_reg_n_0_[0] ),
        .I3(ar_read_ready),
        .I4(ar_addr_read),
        .I5(\r_addr[7]_i_3_n_0 ),
        .O(\r_addr[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAFEAAAAAAAEA)) 
    \r_addr[7]_i_10 
       (.I0(\r_addr[7]_i_29_n_0 ),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(\r_addr[7]_i_27_n_0 ),
        .I5(read_beat_count_reg[0]),
        .O(\r_addr[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCEECCFC)) 
    \r_addr[7]_i_11 
       (.I0(read_beat_count_reg[0]),
        .I1(\r_addr[7]_i_30_n_0 ),
        .I2(read_beat_count_reg[1]),
        .I3(ar_addr_out[33]),
        .I4(ar_addr_out[32]),
        .I5(\r_addr[7]_i_27_n_0 ),
        .O(\r_addr[7]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    \r_addr[7]_i_12 
       (.I0(ar_addr_out[34]),
        .I1(ar_addr_out[35]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(read_beat_count_reg[0]),
        .I5(\r_addr[7]_i_26_n_0 ),
        .O(\r_addr[7]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_addr[7]_i_13 
       (.I0(\r_addr_reg[7]_i_31_n_4 ),
        .I1(addr[7]),
        .O(\r_addr[7]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_addr[7]_i_14 
       (.I0(addr[6]),
        .I1(\r_addr_reg[7]_i_31_n_5 ),
        .O(\r_addr[7]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_addr[7]_i_15 
       (.I0(addr[5]),
        .I1(\r_addr_reg[7]_i_31_n_6 ),
        .O(\r_addr[7]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_addr[7]_i_16 
       (.I0(addr[4]),
        .I1(\r_addr_reg[7]_i_31_n_7 ),
        .O(\r_addr[7]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_18 
       (.I0(r_addr2_n_74),
        .I1(r_addr2_n_75),
        .O(\r_addr[7]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_19 
       (.I0(r_addr2_n_76),
        .I1(r_addr2_n_77),
        .O(\r_addr[7]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hEFEAEFEF45404040)) 
    \r_addr[7]_i_2 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\r_addr_reg[7]_i_4_n_4 ),
        .I2(ar_addr_out[49]),
        .I3(r_addr0[7]),
        .I4(ar_addr_out[48]),
        .I5(ar_addr_out[7]),
        .O(p_1_in[7]));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_20 
       (.I0(r_addr2_n_78),
        .I1(r_addr2_n_79),
        .O(\r_addr[7]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_21 
       (.I0(r_addr2_n_80),
        .I1(r_addr2_n_81),
        .O(\r_addr[7]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_22 
       (.I0(r_addr2_n_75),
        .I1(r_addr2_n_74),
        .O(\r_addr[7]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_23 
       (.I0(r_addr2_n_77),
        .I1(r_addr2_n_76),
        .O(\r_addr[7]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_24 
       (.I0(r_addr2_n_79),
        .I1(r_addr2_n_78),
        .O(\r_addr[7]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_25 
       (.I0(r_addr2_n_81),
        .I1(r_addr2_n_80),
        .O(\r_addr[7]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h0F0C0A00000C0A00)) 
    \r_addr[7]_i_26 
       (.I0(read_beat_count_reg[3]),
        .I1(read_beat_count_reg[2]),
        .I2(\r_addr[3]_i_15_n_0 ),
        .I3(ar_addr_out[32]),
        .I4(ar_addr_out[33]),
        .I5(read_beat_count_reg[1]),
        .O(\r_addr[7]_i_26_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \r_addr[7]_i_27 
       (.I0(ar_addr_out[35]),
        .I1(ar_addr_out[34]),
        .O(\r_addr[7]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h000C000800000008)) 
    \r_addr[7]_i_28 
       (.I0(read_beat_count_reg[3]),
        .I1(ar_addr_out[34]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[33]),
        .I4(ar_addr_out[32]),
        .I5(read_beat_count_reg[2]),
        .O(\r_addr[7]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'h0200000C02000000)) 
    \r_addr[7]_i_29 
       (.I0(read_beat_count_reg[3]),
        .I1(ar_addr_out[34]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[32]),
        .I4(ar_addr_out[33]),
        .I5(read_beat_count_reg[2]),
        .O(\r_addr[7]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020AA0000)) 
    \r_addr[7]_i_3 
       (.I0(\r_addr[7]_i_6_n_0 ),
        .I1(ar_addr_out[48]),
        .I2(r_addr1),
        .I3(ar_addr_out[49]),
        .I4(\read_state_reg_n_0_[2] ),
        .I5(rlast),
        .O(\r_addr[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0302000000020000)) 
    \r_addr[7]_i_30 
       (.I0(read_beat_count_reg[3]),
        .I1(ar_addr_out[34]),
        .I2(ar_addr_out[35]),
        .I3(ar_addr_out[32]),
        .I4(ar_addr_out[33]),
        .I5(read_beat_count_reg[2]),
        .O(\r_addr[7]_i_30_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_33 
       (.I0(r_addr2_n_82),
        .I1(r_addr2_n_83),
        .O(\r_addr[7]_i_33_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_34 
       (.I0(r_addr2_n_84),
        .I1(r_addr2_n_85),
        .O(\r_addr[7]_i_34_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_35 
       (.I0(r_addr2_n_86),
        .I1(r_addr2_n_87),
        .O(\r_addr[7]_i_35_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_36 
       (.I0(r_addr2_n_88),
        .I1(r_addr2_n_89),
        .O(\r_addr[7]_i_36_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_37 
       (.I0(r_addr2_n_83),
        .I1(r_addr2_n_82),
        .O(\r_addr[7]_i_37_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_38 
       (.I0(r_addr2_n_85),
        .I1(r_addr2_n_84),
        .O(\r_addr[7]_i_38_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_39 
       (.I0(r_addr2_n_87),
        .I1(r_addr2_n_86),
        .O(\r_addr[7]_i_39_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_40 
       (.I0(r_addr2_n_89),
        .I1(r_addr2_n_88),
        .O(\r_addr[7]_i_40_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000AC00)) 
    \r_addr[7]_i_41 
       (.I0(read_beat_count_reg[0]),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(\r_addr[7]_i_27_n_0 ),
        .I5(\r_addr[7]_i_28_n_0 ),
        .O(\r_addr[7]_i_41_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAFEAAAAAAAEA)) 
    \r_addr[7]_i_42 
       (.I0(\r_addr[7]_i_29_n_0 ),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(\r_addr[7]_i_27_n_0 ),
        .I5(read_beat_count_reg[0]),
        .O(\r_addr[7]_i_42_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCEECCFC)) 
    \r_addr[7]_i_43 
       (.I0(read_beat_count_reg[0]),
        .I1(\r_addr[7]_i_30_n_0 ),
        .I2(read_beat_count_reg[1]),
        .I3(ar_addr_out[33]),
        .I4(ar_addr_out[32]),
        .I5(\r_addr[7]_i_27_n_0 ),
        .O(\r_addr[7]_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    \r_addr[7]_i_44 
       (.I0(ar_addr_out[34]),
        .I1(ar_addr_out[35]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(read_beat_count_reg[0]),
        .I5(\r_addr[7]_i_26_n_0 ),
        .O(\r_addr[7]_i_44_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_46 
       (.I0(r_addr2_n_90),
        .I1(r_addr2_n_91),
        .O(\r_addr[7]_i_46_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_47 
       (.I0(r_addr2_n_92),
        .I1(r_addr2_n_93),
        .O(\r_addr[7]_i_47_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_48 
       (.I0(r_addr2_n_94),
        .I1(r_addr2_n_95),
        .O(\r_addr[7]_i_48_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_49 
       (.I0(r_addr2_n_96),
        .I1(r_addr2_n_97),
        .O(\r_addr[7]_i_49_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_50 
       (.I0(r_addr2_n_91),
        .I1(r_addr2_n_90),
        .O(\r_addr[7]_i_50_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_51 
       (.I0(r_addr2_n_93),
        .I1(r_addr2_n_92),
        .O(\r_addr[7]_i_51_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_52 
       (.I0(r_addr2_n_95),
        .I1(r_addr2_n_94),
        .O(\r_addr[7]_i_52_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_53 
       (.I0(r_addr2_n_97),
        .I1(r_addr2_n_96),
        .O(\r_addr[7]_i_53_n_0 ));
  LUT4 #(
    .INIT(16'h44D4)) 
    \r_addr[7]_i_54 
       (.I0(addr[7]),
        .I1(r_addr2_n_98),
        .I2(r_addr2_n_99),
        .I3(addr[6]),
        .O(\r_addr[7]_i_54_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \r_addr[7]_i_55 
       (.I0(r_addr2_n_100),
        .I1(addr[5]),
        .I2(r_addr2_n_101),
        .I3(addr[4]),
        .O(\r_addr[7]_i_55_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \r_addr[7]_i_56 
       (.I0(r_addr2_n_102),
        .I1(addr[3]),
        .I2(r_addr2_n_103),
        .I3(addr[2]),
        .O(\r_addr[7]_i_56_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \r_addr[7]_i_57 
       (.I0(r_addr2_n_104),
        .I1(addr[1]),
        .I2(r_addr2_n_105),
        .I3(addr[0]),
        .O(\r_addr[7]_i_57_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \r_addr[7]_i_58 
       (.I0(r_addr2_n_98),
        .I1(addr[7]),
        .I2(addr[6]),
        .I3(r_addr2_n_99),
        .O(\r_addr[7]_i_58_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \r_addr[7]_i_59 
       (.I0(addr[5]),
        .I1(r_addr2_n_100),
        .I2(addr[4]),
        .I3(r_addr2_n_101),
        .O(\r_addr[7]_i_59_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \r_addr[7]_i_6 
       (.I0(rready),
        .I1(\read_state_reg_n_0_[1] ),
        .I2(\read_state_reg_n_0_[0] ),
        .O(\r_addr[7]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \r_addr[7]_i_60 
       (.I0(addr[3]),
        .I1(r_addr2_n_102),
        .I2(addr[2]),
        .I3(r_addr2_n_103),
        .O(\r_addr[7]_i_60_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \r_addr[7]_i_61 
       (.I0(addr[1]),
        .I1(r_addr2_n_104),
        .I2(addr[0]),
        .I3(r_addr2_n_105),
        .O(\r_addr[7]_i_61_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    \r_addr[7]_i_8 
       (.I0(ar_addr_out[34]),
        .I1(ar_addr_out[35]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(read_beat_count_reg[0]),
        .I5(\r_addr[7]_i_26_n_0 ),
        .O(\r_addr[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000AC00)) 
    \r_addr[7]_i_9 
       (.I0(read_beat_count_reg[0]),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[32]),
        .I3(ar_addr_out[33]),
        .I4(\r_addr[7]_i_27_n_0 ),
        .I5(\r_addr[7]_i_28_n_0 ),
        .O(\r_addr[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[0] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(addr[0]),
        .R(rst));
  CARRY4 \r_addr_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\r_addr_reg[0]_i_2_n_0 ,\r_addr_reg[0]_i_2_n_1 ,\r_addr_reg[0]_i_2_n_2 ,\r_addr_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[3]_i_4_n_0 ,\r_addr[3]_i_5_n_0 ,\r_addr[3]_i_6_n_0 ,1'b0}),
        .O({\r_addr_reg[0]_i_2_n_4 ,\r_addr_reg[0]_i_2_n_5 ,\r_addr_reg[0]_i_2_n_6 ,\r_addr_reg[0]_i_2_n_7 }),
        .S({\r_addr[0]_i_3_n_0 ,\r_addr[0]_i_4_n_0 ,\r_addr[0]_i_5_n_0 ,\r_addr[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[1] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(addr[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[2] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(addr[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[3] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(addr[3]),
        .R(rst));
  CARRY4 \r_addr_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\r_addr_reg[3]_i_2_n_0 ,\r_addr_reg[3]_i_2_n_1 ,\r_addr_reg[3]_i_2_n_2 ,\r_addr_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[3]_i_4_n_0 ,\r_addr[3]_i_5_n_0 ,\r_addr[3]_i_6_n_0 ,1'b0}),
        .O({\r_addr_reg[3]_i_2_n_4 ,\r_addr_reg[3]_i_2_n_5 ,\r_addr_reg[3]_i_2_n_6 ,\NLW_r_addr_reg[3]_i_2_O_UNCONNECTED [0]}),
        .S({\r_addr[3]_i_7_n_0 ,\r_addr[3]_i_8_n_0 ,\r_addr[3]_i_9_n_0 ,\r_addr[3]_i_10_n_0 }));
  CARRY4 \r_addr_reg[3]_i_3 
       (.CI(1'b0),
        .CO({\r_addr_reg[3]_i_3_n_0 ,\r_addr_reg[3]_i_3_n_1 ,\r_addr_reg[3]_i_3_n_2 ,\r_addr_reg[3]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(addr[3:0]),
        .O(r_addr0[3:0]),
        .S({\r_addr[3]_i_11_n_0 ,\r_addr[3]_i_12_n_0 ,\r_addr[3]_i_13_n_0 ,\r_addr[3]_i_14_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[4] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(addr[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[5] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(addr[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[6] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(addr[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[7] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(addr[7]),
        .R(rst));
  CARRY4 \r_addr_reg[7]_i_17 
       (.CI(\r_addr_reg[7]_i_32_n_0 ),
        .CO({\r_addr_reg[7]_i_17_n_0 ,\r_addr_reg[7]_i_17_n_1 ,\r_addr_reg[7]_i_17_n_2 ,\r_addr_reg[7]_i_17_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[7]_i_33_n_0 ,\r_addr[7]_i_34_n_0 ,\r_addr[7]_i_35_n_0 ,\r_addr[7]_i_36_n_0 }),
        .O(\NLW_r_addr_reg[7]_i_17_O_UNCONNECTED [3:0]),
        .S({\r_addr[7]_i_37_n_0 ,\r_addr[7]_i_38_n_0 ,\r_addr[7]_i_39_n_0 ,\r_addr[7]_i_40_n_0 }));
  CARRY4 \r_addr_reg[7]_i_31 
       (.CI(\r_addr_reg[0]_i_2_n_0 ),
        .CO({\NLW_r_addr_reg[7]_i_31_CO_UNCONNECTED [3],\r_addr_reg[7]_i_31_n_1 ,\r_addr_reg[7]_i_31_n_2 ,\r_addr_reg[7]_i_31_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\r_addr[7]_i_8_n_0 }),
        .O({\r_addr_reg[7]_i_31_n_4 ,\r_addr_reg[7]_i_31_n_5 ,\r_addr_reg[7]_i_31_n_6 ,\r_addr_reg[7]_i_31_n_7 }),
        .S({\r_addr[7]_i_41_n_0 ,\r_addr[7]_i_42_n_0 ,\r_addr[7]_i_43_n_0 ,\r_addr[7]_i_44_n_0 }));
  CARRY4 \r_addr_reg[7]_i_32 
       (.CI(\r_addr_reg[7]_i_45_n_0 ),
        .CO({\r_addr_reg[7]_i_32_n_0 ,\r_addr_reg[7]_i_32_n_1 ,\r_addr_reg[7]_i_32_n_2 ,\r_addr_reg[7]_i_32_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[7]_i_46_n_0 ,\r_addr[7]_i_47_n_0 ,\r_addr[7]_i_48_n_0 ,\r_addr[7]_i_49_n_0 }),
        .O(\NLW_r_addr_reg[7]_i_32_O_UNCONNECTED [3:0]),
        .S({\r_addr[7]_i_50_n_0 ,\r_addr[7]_i_51_n_0 ,\r_addr[7]_i_52_n_0 ,\r_addr[7]_i_53_n_0 }));
  CARRY4 \r_addr_reg[7]_i_4 
       (.CI(\r_addr_reg[3]_i_2_n_0 ),
        .CO({\NLW_r_addr_reg[7]_i_4_CO_UNCONNECTED [3],\r_addr_reg[7]_i_4_n_1 ,\r_addr_reg[7]_i_4_n_2 ,\r_addr_reg[7]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\r_addr[7]_i_8_n_0 }),
        .O({\r_addr_reg[7]_i_4_n_4 ,\r_addr_reg[7]_i_4_n_5 ,\r_addr_reg[7]_i_4_n_6 ,\r_addr_reg[7]_i_4_n_7 }),
        .S({\r_addr[7]_i_9_n_0 ,\r_addr[7]_i_10_n_0 ,\r_addr[7]_i_11_n_0 ,\r_addr[7]_i_12_n_0 }));
  CARRY4 \r_addr_reg[7]_i_45 
       (.CI(1'b0),
        .CO({\r_addr_reg[7]_i_45_n_0 ,\r_addr_reg[7]_i_45_n_1 ,\r_addr_reg[7]_i_45_n_2 ,\r_addr_reg[7]_i_45_n_3 }),
        .CYINIT(1'b1),
        .DI({\r_addr[7]_i_54_n_0 ,\r_addr[7]_i_55_n_0 ,\r_addr[7]_i_56_n_0 ,\r_addr[7]_i_57_n_0 }),
        .O(\NLW_r_addr_reg[7]_i_45_O_UNCONNECTED [3:0]),
        .S({\r_addr[7]_i_58_n_0 ,\r_addr[7]_i_59_n_0 ,\r_addr[7]_i_60_n_0 ,\r_addr[7]_i_61_n_0 }));
  CARRY4 \r_addr_reg[7]_i_5 
       (.CI(\r_addr_reg[3]_i_3_n_0 ),
        .CO({\NLW_r_addr_reg[7]_i_5_CO_UNCONNECTED [3],\r_addr_reg[7]_i_5_n_1 ,\r_addr_reg[7]_i_5_n_2 ,\r_addr_reg[7]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,addr[6:4]}),
        .O(r_addr0[7:4]),
        .S({\r_addr[7]_i_13_n_0 ,\r_addr[7]_i_14_n_0 ,\r_addr[7]_i_15_n_0 ,\r_addr[7]_i_16_n_0 }));
  CARRY4 \r_addr_reg[7]_i_7 
       (.CI(\r_addr_reg[7]_i_17_n_0 ),
        .CO({r_addr1,\r_addr_reg[7]_i_7_n_1 ,\r_addr_reg[7]_i_7_n_2 ,\r_addr_reg[7]_i_7_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[7]_i_18_n_0 ,\r_addr[7]_i_19_n_0 ,\r_addr[7]_i_20_n_0 ,\r_addr[7]_i_21_n_0 }),
        .O(\NLW_r_addr_reg[7]_i_7_O_UNCONNECTED [3:0]),
        .S({\r_addr[7]_i_22_n_0 ,\r_addr[7]_i_23_n_0 ,\r_addr[7]_i_24_n_0 ,\r_addr[7]_i_25_n_0 }));
  LUT5 #(
    .INIT(32'h0000B888)) 
    \read_beat_count[0]_i_1 
       (.I0(\read_beat_count[3]_i_3_n_0 ),
        .I1(read_beat_count_reg[0]),
        .I2(rready),
        .I3(rvalid),
        .I4(rst),
        .O(\read_beat_count[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h50501400)) 
    \read_beat_count[1]_i_1 
       (.I0(rst),
        .I1(read_beat_count_reg[0]),
        .I2(read_beat_count_reg[1]),
        .I3(rvalid),
        .I4(\read_beat_count[3]_i_3_n_0 ),
        .O(\read_beat_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT5 #(
    .INIT(32'hAEEE4000)) 
    \read_beat_count[2]_i_1 
       (.I0(\read_beat_count[3]_i_3_n_0 ),
        .I1(rvalid),
        .I2(read_beat_count_reg[0]),
        .I3(read_beat_count_reg[1]),
        .I4(read_beat_count_reg[2]),
        .O(\read_beat_count[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5050505040044040)) 
    \read_beat_count[3]_i_1 
       (.I0(rst),
        .I1(rvalid),
        .I2(read_beat_count_reg[3]),
        .I3(\read_beat_count[3]_i_2_n_0 ),
        .I4(read_beat_count_reg[2]),
        .I5(\read_beat_count[3]_i_3_n_0 ),
        .O(\read_beat_count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \read_beat_count[3]_i_2 
       (.I0(read_beat_count_reg[0]),
        .I1(read_beat_count_reg[1]),
        .O(\read_beat_count[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF000E000E)) 
    \read_beat_count[3]_i_3 
       (.I0(\read_beat_count[3]_i_4_n_0 ),
        .I1(\read_state_reg_n_0_[2] ),
        .I2(rlast),
        .I3(char_time_out),
        .I4(rready),
        .I5(rvalid),
        .O(\read_beat_count[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \read_beat_count[3]_i_4 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\read_state_reg_n_0_[1] ),
        .O(\read_beat_count[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \read_beat_count_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\read_beat_count[0]_i_1_n_0 ),
        .Q(read_beat_count_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_beat_count_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\read_beat_count[1]_i_1_n_0 ),
        .Q(read_beat_count_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_beat_count_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\read_beat_count[2]_i_1_n_0 ),
        .Q(read_beat_count_reg[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \read_beat_count_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\read_beat_count[3]_i_1_n_0 ),
        .Q(read_beat_count_reg[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0077FFFF07770000)) 
    \read_state[0]_i_1 
       (.I0(\read_state_reg_n_0_[2] ),
        .I1(rlast),
        .I2(\read_state_reg_n_0_[1] ),
        .I3(\rresp[1]_i_4_n_0 ),
        .I4(read_state),
        .I5(\read_state_reg_n_0_[0] ),
        .O(\read_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FF00AFE0FFE0)) 
    \read_state[1]_i_1 
       (.I0(\read_state[1]_i_2_n_0 ),
        .I1(\read_state_reg_n_0_[0] ),
        .I2(\read_state[1]_i_3_n_0 ),
        .I3(\read_state_reg_n_0_[1] ),
        .I4(\rresp[1]_i_4_n_0 ),
        .I5(\read_state[1]_i_4_n_0 ),
        .O(\read_state[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \read_state[1]_i_2 
       (.I0(\read_state_reg_n_0_[2] ),
        .I1(rlast),
        .O(\read_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT4 #(
    .INIT(16'h10FF)) 
    \read_state[1]_i_3 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(\read_state_reg_n_0_[1] ),
        .I2(rready),
        .I3(\read_state_reg_n_0_[2] ),
        .O(\read_state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000045FF75FF)) 
    \read_state[1]_i_4 
       (.I0(wr_r_fifo_en_reg_n_0),
        .I1(char_time_out),
        .I2(\read_state_reg_n_0_[0] ),
        .I3(\read_state_reg_n_0_[1] ),
        .I4(rx_data_valid),
        .I5(\read_state[1]_i_5_n_0 ),
        .O(\read_state[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0088000F)) 
    \read_state[1]_i_5 
       (.I0(ar_addr_read),
        .I1(ar_read_ready),
        .I2(arempty),
        .I3(\read_state_reg_n_0_[1] ),
        .I4(\read_state_reg_n_0_[0] ),
        .I5(\read_state_reg_n_0_[2] ),
        .O(\read_state[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2A00FFFF2A000000)) 
    \read_state[2]_i_1 
       (.I0(\rresp[1]_i_2_n_0 ),
        .I1(wr_r_fifo_en_reg_n_0),
        .I2(rlast),
        .I3(\read_state_reg_n_0_[1] ),
        .I4(read_state),
        .I5(\read_state_reg_n_0_[2] ),
        .O(\read_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000008AAAAAAAA)) 
    \read_state[2]_i_2 
       (.I0(\read_state[1]_i_3_n_0 ),
        .I1(\read_state_reg_n_0_[1] ),
        .I2(\rresp[1]_i_7_n_0 ),
        .I3(\rresp[1]_i_6_n_0 ),
        .I4(\rresp[1]_i_5_n_0 ),
        .I5(\read_state[1]_i_4_n_0 ),
        .O(read_state));
  FDRE #(
    .INIT(1'b0)) 
    \read_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\read_state[0]_i_1_n_0 ),
        .Q(\read_state_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \read_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\read_state[1]_i_1_n_0 ),
        .Q(\read_state_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \read_state_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\read_state[2]_i_1_n_0 ),
        .Q(\read_state_reg_n_0_[2] ),
        .R(rst));
  CARRY4 rlast_INST_0
       (.CI(1'b0),
        .CO({rlast,rlast_INST_0_n_1,rlast_INST_0_n_2,rlast_INST_0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,rlast_INST_0_i_1_n_0,rlast_INST_0_i_2_n_0}),
        .O(NLW_rlast_INST_0_O_UNCONNECTED[3:0]),
        .S({rlast_INST_0_i_3_n_0,rlast_INST_0_i_4_n_0,rlast_INST_0_i_5_n_0,rlast_INST_0_i_6_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    rlast_INST_0_i_1
       (.I0(read_beat_count_reg[3]),
        .I1(ar_addr_out[39]),
        .I2(read_beat_count_reg[2]),
        .I3(ar_addr_out[38]),
        .O(rlast_INST_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rlast_INST_0_i_2
       (.I0(read_beat_count_reg[1]),
        .I1(ar_addr_out[37]),
        .I2(read_beat_count_reg[0]),
        .I3(ar_addr_out[36]),
        .O(rlast_INST_0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    rlast_INST_0_i_3
       (.I0(ar_addr_out[43]),
        .I1(ar_addr_out[42]),
        .O(rlast_INST_0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    rlast_INST_0_i_4
       (.I0(ar_addr_out[41]),
        .I1(ar_addr_out[40]),
        .O(rlast_INST_0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rlast_INST_0_i_5
       (.I0(ar_addr_out[39]),
        .I1(read_beat_count_reg[3]),
        .I2(ar_addr_out[38]),
        .I3(read_beat_count_reg[2]),
        .O(rlast_INST_0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rlast_INST_0_i_6
       (.I0(ar_addr_out[37]),
        .I1(read_beat_count_reg[1]),
        .I2(ar_addr_out[36]),
        .I3(read_beat_count_reg[0]),
        .O(rlast_INST_0_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFF7FFFF00040000)) 
    \rresp[1]_i_1 
       (.I0(\rresp[1]_i_2_n_0 ),
        .I1(\rresp[1]_i_3_n_0 ),
        .I2(rst),
        .I3(\read_state_reg_n_0_[2] ),
        .I4(\rresp[1]_i_4_n_0 ),
        .I5(\^rresp ),
        .O(\rresp[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rresp[1]_i_10 
       (.I0(ar_addr_out[14]),
        .I1(ar_addr_out[20]),
        .I2(ar_addr_out[0]),
        .I3(ar_addr_out[23]),
        .O(\rresp[1]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \rresp[1]_i_11 
       (.I0(ar_addr_out[13]),
        .I1(\read_state_reg_n_0_[0] ),
        .I2(ar_addr_out[30]),
        .I3(ar_addr_out[26]),
        .O(\rresp[1]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rresp[1]_i_12 
       (.I0(ar_addr_out[28]),
        .I1(ar_addr_out[18]),
        .I2(ar_addr_out[12]),
        .I3(ar_addr_out[19]),
        .O(\rresp[1]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rresp[1]_i_2 
       (.I0(\read_state_reg_n_0_[0] ),
        .I1(char_time_out),
        .O(\rresp[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT4 #(
    .INIT(16'hAA8A)) 
    \rresp[1]_i_3 
       (.I0(\read_state_reg_n_0_[1] ),
        .I1(rx_data_valid),
        .I2(\read_state_reg_n_0_[0] ),
        .I3(char_time_out),
        .O(\rresp[1]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \rresp[1]_i_4 
       (.I0(\rresp[1]_i_5_n_0 ),
        .I1(\rresp[1]_i_6_n_0 ),
        .I2(\rresp[1]_i_7_n_0 ),
        .O(\rresp[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hA8A8A888)) 
    \rresp[1]_i_5 
       (.I0(ar_addr_out[11]),
        .I1(\rresp[1]_i_8_n_0 ),
        .I2(ar_addr_out[4]),
        .I3(ar_addr_out[2]),
        .I4(ar_addr_out[3]),
        .O(\rresp[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \rresp[1]_i_6 
       (.I0(\rresp[1]_i_9_n_0 ),
        .I1(\rresp[1]_i_10_n_0 ),
        .I2(\rresp[1]_i_11_n_0 ),
        .I3(ar_addr_out[1]),
        .I4(ar_addr_out[15]),
        .I5(ar_addr_out[21]),
        .O(\rresp[1]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \rresp[1]_i_7 
       (.I0(ar_addr_out[17]),
        .I1(ar_addr_out[29]),
        .I2(ar_addr_out[16]),
        .I3(ar_addr_out[25]),
        .I4(\rresp[1]_i_12_n_0 ),
        .O(\rresp[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \rresp[1]_i_8 
       (.I0(ar_addr_out[10]),
        .I1(ar_addr_out[9]),
        .I2(ar_addr_out[8]),
        .I3(ar_addr_out[7]),
        .I4(ar_addr_out[5]),
        .I5(ar_addr_out[6]),
        .O(\rresp[1]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \rresp[1]_i_9 
       (.I0(ar_addr_out[24]),
        .I1(ar_addr_out[22]),
        .I2(ar_addr_out[31]),
        .I3(ar_addr_out[27]),
        .O(\rresp[1]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rresp_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\rresp[1]_i_1_n_0 ),
        .Q(\^rresp ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'h40)) 
    rx_en_INST_0
       (.I0(\read_state_reg_n_0_[2] ),
        .I1(\read_state_reg_n_0_[1] ),
        .I2(\read_state_reg_n_0_[0] ),
        .O(rx_en));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    wr_r_fifo_en_i_1
       (.I0(\read_state_reg_n_0_[1] ),
        .I1(wr_r_fifo_en_i_2_n_0),
        .I2(rst),
        .I3(\read_state_reg_n_0_[2] ),
        .I4(\rresp[1]_i_4_n_0 ),
        .I5(wr_r_fifo_en_reg_n_0),
        .O(wr_r_fifo_en_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT3 #(
    .INIT(8'h04)) 
    wr_r_fifo_en_i_2
       (.I0(char_time_out),
        .I1(\read_state_reg_n_0_[0] ),
        .I2(rx_data_valid),
        .O(wr_r_fifo_en_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    wr_r_fifo_en_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(wr_r_fifo_en_i_1_n_0),
        .Q(wr_r_fifo_en_reg_n_0),
        .R(1'b0));
endmodule

(* BEGIN = "2'b01" *) (* COUNT = "100000" *) (* IDEL = "2'b00" *) 
(* TRIGGER = "2'b10" *) 
module TIMER
   (clk,
    rst,
    in_trig,
    rst_trig,
    check,
    trig);
  input clk;
  input rst;
  input in_trig;
  input rst_trig;
  input check;
  output trig;

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_3_n_0 ;
  wire \FSM_onehot_state[2]_i_4_n_0 ;
  wire \FSM_onehot_state[2]_i_5_n_0 ;
  wire \FSM_onehot_state[2]_i_6_n_0 ;
  wire \FSM_onehot_state[2]_i_7_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire clk;
  wire count;
  wire \count[0]_i_1_n_0 ;
  wire \count[10]_i_1_n_0 ;
  wire \count[11]_i_1_n_0 ;
  wire \count[12]_i_1_n_0 ;
  wire \count[13]_i_1_n_0 ;
  wire \count[14]_i_1_n_0 ;
  wire \count[15]_i_1_n_0 ;
  wire \count[16]_i_1_n_0 ;
  wire \count[17]_i_2_n_0 ;
  wire \count[17]_i_4_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire \count[5]_i_1_n_0 ;
  wire \count[6]_i_1_n_0 ;
  wire \count[7]_i_1_n_0 ;
  wire \count[8]_i_1_n_0 ;
  wire \count[9]_i_1_n_0 ;
  wire \count_reg[12]_i_2_n_0 ;
  wire \count_reg[12]_i_2_n_1 ;
  wire \count_reg[12]_i_2_n_2 ;
  wire \count_reg[12]_i_2_n_3 ;
  wire \count_reg[16]_i_2_n_0 ;
  wire \count_reg[16]_i_2_n_1 ;
  wire \count_reg[16]_i_2_n_2 ;
  wire \count_reg[16]_i_2_n_3 ;
  wire \count_reg[4]_i_2_n_0 ;
  wire \count_reg[4]_i_2_n_1 ;
  wire \count_reg[4]_i_2_n_2 ;
  wire \count_reg[4]_i_2_n_3 ;
  wire \count_reg[8]_i_2_n_0 ;
  wire \count_reg[8]_i_2_n_1 ;
  wire \count_reg[8]_i_2_n_2 ;
  wire \count_reg[8]_i_2_n_3 ;
  wire [17:1]data0;
  wire in_trig;
  wire rst;
  wire rst_trig;
  wire [17:0]sel0;
  wire trig;
  wire trig_i_1_n_0;
  wire [3:0]\NLW_count_reg[17]_i_3_CO_UNCONNECTED ;
  wire [3:1]\NLW_count_reg[17]_i_3_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hEAFFEA00)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(rst_trig),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_state[2]_i_2_n_0 ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2F20)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(rst_trig),
        .I2(\FSM_onehot_state[2]_i_2_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAAA)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(\FSM_onehot_state[2]_i_3_n_0 ),
        .I1(\FSM_onehot_state[2]_i_4_n_0 ),
        .I2(\FSM_onehot_state[2]_i_5_n_0 ),
        .I3(\FSM_onehot_state[2]_i_6_n_0 ),
        .I4(\FSM_onehot_state[2]_i_7_n_0 ),
        .I5(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \FSM_onehot_state[2]_i_3 
       (.I0(in_trig),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(rst_trig),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_onehot_state[2]_i_4 
       (.I0(sel0[6]),
        .I1(sel0[3]),
        .I2(sel0[8]),
        .I3(sel0[17]),
        .I4(sel0[1]),
        .I5(sel0[13]),
        .O(\FSM_onehot_state[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \FSM_onehot_state[2]_i_5 
       (.I0(sel0[15]),
        .I1(sel0[11]),
        .I2(sel0[9]),
        .I3(sel0[2]),
        .O(\FSM_onehot_state[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \FSM_onehot_state[2]_i_6 
       (.I0(sel0[16]),
        .I1(sel0[10]),
        .I2(sel0[12]),
        .I3(sel0[0]),
        .O(\FSM_onehot_state[2]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \FSM_onehot_state[2]_i_7 
       (.I0(sel0[5]),
        .I1(sel0[4]),
        .I2(sel0[7]),
        .I3(sel0[14]),
        .O(\FSM_onehot_state[2]_i_7_n_0 ));
  (* FSM_ENCODED_STATES = "BEGIN:010,TRIGGER:100,IDEL:001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "BEGIN:010,TRIGGER:100,IDEL:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "BEGIN:010,TRIGGER:100,IDEL:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \count[0]_i_1 
       (.I0(sel0[0]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[10]_i_1 
       (.I0(data0[10]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[11]_i_1 
       (.I0(data0[11]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[12]_i_1 
       (.I0(data0[12]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[13]_i_1 
       (.I0(data0[13]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[14]_i_1 
       (.I0(data0[14]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[15]_i_1 
       (.I0(data0[15]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[16]_i_1 
       (.I0(data0[16]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[16]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \count[17]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .O(count));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[17]_i_2 
       (.I0(data0[17]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDDDDDDDDDDDDDDF)) 
    \count[17]_i_4 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(rst_trig),
        .I2(\FSM_onehot_state[2]_i_7_n_0 ),
        .I3(\FSM_onehot_state[2]_i_6_n_0 ),
        .I4(\FSM_onehot_state[2]_i_5_n_0 ),
        .I5(\FSM_onehot_state[2]_i_4_n_0 ),
        .O(\count[17]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[1]_i_1 
       (.I0(data0[1]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[2]_i_1 
       (.I0(data0[2]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[3]_i_1 
       (.I0(data0[3]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[4]_i_1 
       (.I0(data0[4]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[5]_i_1 
       (.I0(data0[5]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[6]_i_1 
       (.I0(data0[6]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[7]_i_1 
       (.I0(data0[7]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[8]_i_1 
       (.I0(data0[8]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[9]_i_1 
       (.I0(data0[9]),
        .I1(\count[17]_i_4_n_0 ),
        .O(\count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(count),
        .D(\count[0]_i_1_n_0 ),
        .Q(sel0[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk),
        .CE(count),
        .D(\count[10]_i_1_n_0 ),
        .Q(sel0[10]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk),
        .CE(count),
        .D(\count[11]_i_1_n_0 ),
        .Q(sel0[11]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(clk),
        .CE(count),
        .D(\count[12]_i_1_n_0 ),
        .Q(sel0[12]),
        .R(rst));
  CARRY4 \count_reg[12]_i_2 
       (.CI(\count_reg[8]_i_2_n_0 ),
        .CO({\count_reg[12]_i_2_n_0 ,\count_reg[12]_i_2_n_1 ,\count_reg[12]_i_2_n_2 ,\count_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(sel0[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(clk),
        .CE(count),
        .D(\count[13]_i_1_n_0 ),
        .Q(sel0[13]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(clk),
        .CE(count),
        .D(\count[14]_i_1_n_0 ),
        .Q(sel0[14]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[15] 
       (.C(clk),
        .CE(count),
        .D(\count[15]_i_1_n_0 ),
        .Q(sel0[15]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[16] 
       (.C(clk),
        .CE(count),
        .D(\count[16]_i_1_n_0 ),
        .Q(sel0[16]),
        .R(rst));
  CARRY4 \count_reg[16]_i_2 
       (.CI(\count_reg[12]_i_2_n_0 ),
        .CO({\count_reg[16]_i_2_n_0 ,\count_reg[16]_i_2_n_1 ,\count_reg[16]_i_2_n_2 ,\count_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(sel0[16:13]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[17] 
       (.C(clk),
        .CE(count),
        .D(\count[17]_i_2_n_0 ),
        .Q(sel0[17]),
        .R(rst));
  CARRY4 \count_reg[17]_i_3 
       (.CI(\count_reg[16]_i_2_n_0 ),
        .CO(\NLW_count_reg[17]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_reg[17]_i_3_O_UNCONNECTED [3:1],data0[17]}),
        .S({1'b0,1'b0,1'b0,sel0[17]}));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(count),
        .D(\count[1]_i_1_n_0 ),
        .Q(sel0[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(count),
        .D(\count[2]_i_1_n_0 ),
        .Q(sel0[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(count),
        .D(\count[3]_i_1_n_0 ),
        .Q(sel0[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(count),
        .D(\count[4]_i_1_n_0 ),
        .Q(sel0[4]),
        .R(rst));
  CARRY4 \count_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\count_reg[4]_i_2_n_0 ,\count_reg[4]_i_2_n_1 ,\count_reg[4]_i_2_n_2 ,\count_reg[4]_i_2_n_3 }),
        .CYINIT(sel0[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(sel0[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(count),
        .D(\count[5]_i_1_n_0 ),
        .Q(sel0[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(count),
        .D(\count[6]_i_1_n_0 ),
        .Q(sel0[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(count),
        .D(\count[7]_i_1_n_0 ),
        .Q(sel0[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(count),
        .D(\count[8]_i_1_n_0 ),
        .Q(sel0[8]),
        .R(rst));
  CARRY4 \count_reg[8]_i_2 
       (.CI(\count_reg[4]_i_2_n_0 ),
        .CO({\count_reg[8]_i_2_n_0 ,\count_reg[8]_i_2_n_1 ,\count_reg[8]_i_2_n_2 ,\count_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(sel0[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(count),
        .D(\count[9]_i_1_n_0 ),
        .Q(sel0[9]),
        .R(rst));
  LUT4 #(
    .INIT(16'hFD0C)) 
    trig_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(rst),
        .I3(trig),
        .O(trig_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    trig_reg
       (.C(clk),
        .CE(1'b1),
        .D(trig_i_1_n_0),
        .Q(trig),
        .R(1'b0));
endmodule

(* ADDR_OFFSET = "16'b1110000000000000" *) (* ADDR_WIDTH = "32" *) (* AR_DEPTH = "32" *) 
(* AW_DEPTH = "32" *) (* BAUD_GEN = "8'b00000000" *) (* BYTES = "8" *) 
(* CONTL_REG_WIDTH = "32" *) (* CR = "8'b00000100" *) (* CSR = "8'b00100000" *) 
(* CTRL_REG_WIDTH = "32" *) (* DATA = "3'b011" *) (* DATA_WIDTH = "64" *) 
(* DECODE = "3'b001" *) (* DONE = "2'b01" *) (* IDEL = "3'b000" *) 
(* IDR = "8'b00001100" *) (* ID_WIDTH = "4" *) (* IER = "8'b00001000" *) 
(* IMR = "8'b00010000" *) (* ISR = "8'b00010100" *) (* LEN_WIDTH = "8" *) 
(* PARITY = "3'b100" *) (* READ = "2'b10" *) (* READ_TX_FIFO = "3'b001" *) 
(* RESPONSE_WIDTH = "3" *) (* RX = "8'b00011100" *) (* R_DEPTH = "32" *) 
(* SIZE_WIDTH = "4" *) (* START = "3'b010" *) (* STATUS_REG_WIDTH = "32" *) 
(* STOP = "3'b101" *) (* TX = "8'b00011000" *) (* UART_RX_FIFO_DEPTH = "32" *) 
(* UART_TX_FIFO_DEPTH = "256" *) (* WRITE = "2'b11" *) (* W_DEPTH = "32" *) 
module UART_CONTROLLER
   (uart_clk,
    rst,
    rx_done,
    baud_rate,
    baud_en,
    sample_rate_o,
    rd_clk,
    tx_data,
    tx_data_valid,
    tx_addr,
    tx_fifo_mem_left,
    tx_ready,
    rx_data,
    rx_data_valid,
    rx_addr,
    rx_en,
    rx,
    tx);
  input uart_clk;
  input rst;
  output rx_done;
  output [30:0]baud_rate;
  output baud_en;
  output [4:0]sample_rate_o;
  input rd_clk;
  input [63:0]tx_data;
  input tx_data_valid;
  input [7:0]tx_addr;
  output [11:0]tx_fifo_mem_left;
  output tx_ready;
  output [63:0]rx_data;
  output rx_data_valid;
  input [7:0]rx_addr;
  input rx_en;
  input rx;
  output tx;

  wire \<const0> ;
  wire \FSM_onehot_uart_tx_state[4]_i_1_n_0 ;
  wire \FSM_onehot_uart_tx_state[5]_i_2_n_0 ;
  wire \FSM_onehot_uart_tx_state[5]_i_3_n_0 ;
  wire \FSM_onehot_uart_tx_state[5]_i_4_n_0 ;
  wire \FSM_onehot_uart_tx_state[5]_i_5_n_0 ;
  wire \FSM_onehot_uart_tx_state[5]_i_6_n_0 ;
  wire \FSM_onehot_uart_tx_state_reg_n_0_[0] ;
  wire \FSM_onehot_uart_tx_state_reg_n_0_[1] ;
  wire \FSM_onehot_uart_tx_state_reg_n_0_[2] ;
  wire \FSM_onehot_uart_tx_state_reg_n_0_[3] ;
  wire \FSM_onehot_uart_tx_state_reg_n_0_[4] ;
  wire \FSM_onehot_uart_tx_state_reg_n_0_[5] ;
  wire FSM_sequential_rx_fifo_state_i_1_n_0;
  wire FSM_sequential_rx_fifo_state_reg_n_0;
  wire \FSM_sequential_uart_rx_state[0]_i_1_n_0 ;
  wire \FSM_sequential_uart_rx_state[0]_i_2_n_0 ;
  wire \FSM_sequential_uart_rx_state[0]_i_3_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_10_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_11_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_12_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_13_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_15_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_16_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_17_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_18_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_19_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_1_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_20_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_21_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_22_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_24_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_25_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_26_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_27_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_28_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_29_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_2_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_30_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_31_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_32_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_33_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_34_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_35_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_36_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_37_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_38_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_39_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_3_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_7_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_8_n_0 ;
  wire \FSM_sequential_uart_rx_state[1]_i_9_n_0 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_14_n_0 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_14_n_1 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_14_n_2 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_14_n_3 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_23_n_0 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_23_n_1 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_23_n_2 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_23_n_3 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_4_n_1 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_4_n_2 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_4_n_3 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_5_n_0 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_5_n_1 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_5_n_2 ;
  wire \FSM_sequential_uart_rx_state_reg[1]_i_5_n_3 ;
  wire RxFIFO_i_1_n_0;
  wire RxFIFO_n_0;
  wire RxFIFO_n_66;
  wire RxFIFO_n_69;
  wire RxFIFO_n_70;
  wire RxFIFO_n_71;
  wire RxFIFO_n_72;
  wire RxFIFO_n_73;
  wire TxFIFO_i_1_n_0;
  wire TxFIFO_n_0;
  wire TxFIFO_n_10;
  wire TxFIFO_n_12;
  wire TxFIFO_n_13;
  wire TxFIFO_n_14;
  wire TxFIFO_n_15;
  wire TxFIFO_n_16;
  wire TxFIFO_n_17;
  wire TxFIFO_n_18;
  wire TxFIFO_n_19;
  wire baud_en;
  wire [30:1]\^baud_rate ;
  wire baud_reg0;
  wire \byte_counter[0]_i_1_n_0 ;
  wire \byte_counter[1]_i_1_n_0 ;
  wire \byte_counter[2]_i_1_n_0 ;
  wire \byte_counter[3]_i_1_n_0 ;
  wire \byte_counter[3]_i_2_n_0 ;
  wire \byte_counter[3]_i_3_n_0 ;
  wire [3:0]byte_counter__0;
  wire cntrl_reg;
  wire \cntrl_reg[0]_i_1_n_0 ;
  wire \cntrl_reg[1]_i_1_n_0 ;
  wire \cntrl_reg_reg_n_0_[0] ;
  wire \cntrl_reg_reg_n_0_[14] ;
  wire \cntrl_reg_reg_n_0_[15] ;
  wire \cntrl_reg_reg_n_0_[16] ;
  wire \cntrl_reg_reg_n_0_[17] ;
  wire \cntrl_reg_reg_n_0_[18] ;
  wire \cntrl_reg_reg_n_0_[27] ;
  wire \cntrl_reg_reg_n_0_[28] ;
  wire \cntrl_reg_reg_n_0_[29] ;
  wire \cntrl_reg_reg_n_0_[2] ;
  wire \cntrl_reg_reg_n_0_[30] ;
  wire \cntrl_reg_reg_n_0_[31] ;
  wire \cntrl_reg_reg_n_0_[3] ;
  wire \cntrl_reg_reg_n_0_[4] ;
  wire \cntrl_reg_reg_n_0_[7] ;
  wire \cntrl_reg_reg_n_0_[8] ;
  wire \cntrl_reg_reg_n_0_[9] ;
  wire [3:0]data_bits;
  wire \in_rx_data[63]_i_1_n_0 ;
  wire \in_rx_data_reg_n_0_[0] ;
  wire \in_rx_data_reg_n_0_[10] ;
  wire \in_rx_data_reg_n_0_[11] ;
  wire \in_rx_data_reg_n_0_[12] ;
  wire \in_rx_data_reg_n_0_[13] ;
  wire \in_rx_data_reg_n_0_[14] ;
  wire \in_rx_data_reg_n_0_[15] ;
  wire \in_rx_data_reg_n_0_[16] ;
  wire \in_rx_data_reg_n_0_[17] ;
  wire \in_rx_data_reg_n_0_[18] ;
  wire \in_rx_data_reg_n_0_[19] ;
  wire \in_rx_data_reg_n_0_[1] ;
  wire \in_rx_data_reg_n_0_[20] ;
  wire \in_rx_data_reg_n_0_[21] ;
  wire \in_rx_data_reg_n_0_[22] ;
  wire \in_rx_data_reg_n_0_[23] ;
  wire \in_rx_data_reg_n_0_[24] ;
  wire \in_rx_data_reg_n_0_[25] ;
  wire \in_rx_data_reg_n_0_[26] ;
  wire \in_rx_data_reg_n_0_[27] ;
  wire \in_rx_data_reg_n_0_[28] ;
  wire \in_rx_data_reg_n_0_[29] ;
  wire \in_rx_data_reg_n_0_[2] ;
  wire \in_rx_data_reg_n_0_[30] ;
  wire \in_rx_data_reg_n_0_[31] ;
  wire \in_rx_data_reg_n_0_[32] ;
  wire \in_rx_data_reg_n_0_[33] ;
  wire \in_rx_data_reg_n_0_[34] ;
  wire \in_rx_data_reg_n_0_[35] ;
  wire \in_rx_data_reg_n_0_[36] ;
  wire \in_rx_data_reg_n_0_[37] ;
  wire \in_rx_data_reg_n_0_[38] ;
  wire \in_rx_data_reg_n_0_[39] ;
  wire \in_rx_data_reg_n_0_[3] ;
  wire \in_rx_data_reg_n_0_[40] ;
  wire \in_rx_data_reg_n_0_[41] ;
  wire \in_rx_data_reg_n_0_[42] ;
  wire \in_rx_data_reg_n_0_[43] ;
  wire \in_rx_data_reg_n_0_[44] ;
  wire \in_rx_data_reg_n_0_[45] ;
  wire \in_rx_data_reg_n_0_[46] ;
  wire \in_rx_data_reg_n_0_[47] ;
  wire \in_rx_data_reg_n_0_[48] ;
  wire \in_rx_data_reg_n_0_[49] ;
  wire \in_rx_data_reg_n_0_[4] ;
  wire \in_rx_data_reg_n_0_[50] ;
  wire \in_rx_data_reg_n_0_[51] ;
  wire \in_rx_data_reg_n_0_[52] ;
  wire \in_rx_data_reg_n_0_[53] ;
  wire \in_rx_data_reg_n_0_[54] ;
  wire \in_rx_data_reg_n_0_[55] ;
  wire \in_rx_data_reg_n_0_[56] ;
  wire \in_rx_data_reg_n_0_[57] ;
  wire \in_rx_data_reg_n_0_[58] ;
  wire \in_rx_data_reg_n_0_[59] ;
  wire \in_rx_data_reg_n_0_[5] ;
  wire \in_rx_data_reg_n_0_[60] ;
  wire \in_rx_data_reg_n_0_[61] ;
  wire \in_rx_data_reg_n_0_[62] ;
  wire \in_rx_data_reg_n_0_[63] ;
  wire \in_rx_data_reg_n_0_[6] ;
  wire \in_rx_data_reg_n_0_[7] ;
  wire \in_rx_data_reg_n_0_[8] ;
  wire \in_rx_data_reg_n_0_[9] ;
  wire [7:0]in_tx_data;
  wire [63:0]out_rx_data;
  wire [7:0]out_tx_data;
  wire parity_bit;
  wire [31:0]r_IDR;
  wire r_IDR0;
  wire [0:0]r_IER;
  wire r_IER0;
  wire r_addr;
  wire \r_addr_reg_n_0_[0] ;
  wire \r_addr_reg_n_0_[1] ;
  wire \r_addr_reg_n_0_[2] ;
  wire \r_addr_reg_n_0_[3] ;
  wire \r_addr_reg_n_0_[4] ;
  wire \r_addr_reg_n_0_[5] ;
  wire \r_addr_reg_n_0_[6] ;
  wire \r_addr_reg_n_0_[7] ;
  wire \rd_bit_counter[0]_i_1_n_0 ;
  wire \rd_bit_counter[1]_i_1_n_0 ;
  wire \rd_bit_counter[1]_i_2_n_0 ;
  wire \rd_bit_counter[2]_i_1_n_0 ;
  wire \rd_bit_counter[2]_i_2_n_0 ;
  wire \rd_bit_counter[3]_i_1_n_0 ;
  wire \rd_bit_counter[3]_i_2_n_0 ;
  wire \rd_bit_counter[3]_i_3_n_0 ;
  wire \rd_bit_counter[3]_i_4_n_0 ;
  wire [3:0]rd_bit_counter__0;
  wire rd_clk;
  wire rst;
  wire rx;
  wire \rx_action_state[0]_i_1_n_0 ;
  wire \rx_action_state[0]_i_2_n_0 ;
  wire \rx_action_state_reg_n_0_[0] ;
  wire [7:0]rx_addr;
  wire [63:0]rx_data;
  wire \rx_data[0]_i_10_n_0 ;
  wire \rx_data[0]_i_1_n_0 ;
  wire \rx_data[0]_i_2_n_0 ;
  wire \rx_data[0]_i_3_n_0 ;
  wire \rx_data[0]_i_4_n_0 ;
  wire \rx_data[0]_i_5_n_0 ;
  wire \rx_data[0]_i_6_n_0 ;
  wire \rx_data[0]_i_7_n_0 ;
  wire \rx_data[0]_i_8_n_0 ;
  wire \rx_data[0]_i_9_n_0 ;
  wire \rx_data[10]_i_1_n_0 ;
  wire \rx_data[11]_i_1_n_0 ;
  wire \rx_data[12]_i_1_n_0 ;
  wire \rx_data[13]_i_1_n_0 ;
  wire \rx_data[14]_i_1_n_0 ;
  wire \rx_data[15]_i_1_n_0 ;
  wire \rx_data[16]_i_1_n_0 ;
  wire \rx_data[17]_i_1_n_0 ;
  wire \rx_data[18]_i_1_n_0 ;
  wire \rx_data[19]_i_1_n_0 ;
  wire \rx_data[1]_i_1_n_0 ;
  wire \rx_data[20]_i_1_n_0 ;
  wire \rx_data[21]_i_1_n_0 ;
  wire \rx_data[22]_i_1_n_0 ;
  wire \rx_data[23]_i_1_n_0 ;
  wire \rx_data[24]_i_1_n_0 ;
  wire \rx_data[25]_i_1_n_0 ;
  wire \rx_data[26]_i_1_n_0 ;
  wire \rx_data[27]_i_1_n_0 ;
  wire \rx_data[28]_i_1_n_0 ;
  wire \rx_data[29]_i_1_n_0 ;
  wire \rx_data[2]_i_1_n_0 ;
  wire \rx_data[30]_i_1_n_0 ;
  wire \rx_data[31]_i_1_n_0 ;
  wire \rx_data[3]_i_1_n_0 ;
  wire \rx_data[4]_i_1_n_0 ;
  wire \rx_data[5]_i_1_n_0 ;
  wire \rx_data[63]_i_1_n_0 ;
  wire \rx_data[63]_i_2_n_0 ;
  wire \rx_data[6]_i_1_n_0 ;
  wire \rx_data[7]_i_1_n_0 ;
  wire \rx_data[8]_i_1_n_0 ;
  wire \rx_data[9]_i_1_n_0 ;
  wire rx_data_valid;
  wire rx_data_valid_INST_0_i_1_n_0;
  wire rx_data_valid_INST_0_i_2_n_0;
  wire rx_data_valid_INST_0_i_3_n_0;
  wire rx_data_valid_INST_0_i_4_n_0;
  wire rx_done;
  wire rx_empty;
  wire rx_en;
  wire rx_fifo_rst;
  wire rx_fifo_status_1;
  wire rx_rd_en;
  wire [3:0]rx_trig;
  wire [4:1]\^sample_rate_o ;
  wire stop_bit;
  wire tx;
  wire \tx_action_state[0]_i_1_n_0 ;
  wire \tx_action_state[0]_i_2_n_0 ;
  wire \tx_action_state[0]_i_3_n_0 ;
  wire \tx_action_state_reg_n_0_[0] ;
  wire [7:0]tx_addr;
  wire [3:0]tx_byte_counter;
  wire \tx_byte_counter[0]_i_1_n_0 ;
  wire \tx_byte_counter[1]_i_1_n_0 ;
  wire \tx_byte_counter[2]_i_1_n_0 ;
  wire \tx_byte_counter[3]_i_1_n_0 ;
  wire \tx_byte_counter[3]_i_2_n_0 ;
  wire \tx_byte_counter[3]_i_3_n_0 ;
  wire \tx_byte_counter[3]_i_4_n_0 ;
  wire \tx_byte_counter[3]_i_5_n_0 ;
  wire [63:0]tx_data;
  wire tx_data_valid;
  wire tx_empty;
  wire [11:3]\^tx_fifo_mem_left ;
  wire \tx_fifo_mem_left[11]_INST_0_i_1_n_0 ;
  wire [1:0]tx_fifo_state;
  wire \tx_fifo_state[0]_i_1_n_0 ;
  wire \tx_fifo_state[1]_i_1_n_0 ;
  wire \tx_fifo_state[1]_i_2_n_0 ;
  wire tx_fifo_status_1;
  wire tx_i_10_n_0;
  wire tx_i_12_n_0;
  wire tx_i_13_n_0;
  wire tx_i_14_n_0;
  wire tx_i_15_n_0;
  wire tx_i_16_n_0;
  wire tx_i_17_n_0;
  wire tx_i_18_n_0;
  wire tx_i_19_n_0;
  wire tx_i_1_n_0;
  wire tx_i_2_n_0;
  wire tx_i_3_n_0;
  wire tx_i_5_n_0;
  wire tx_i_6_n_0;
  wire tx_i_8_n_0;
  wire tx_i_9_n_0;
  wire tx_ready;
  wire tx_ready_INST_0_i_1_n_0;
  wire tx_ready_INST_0_i_2_n_0;
  wire tx_ready_INST_0_i_3_n_0;
  wire tx_ready_INST_0_i_4_n_0;
  wire tx_reg_i_11_n_0;
  wire tx_reg_i_11_n_1;
  wire tx_reg_i_11_n_2;
  wire tx_reg_i_11_n_3;
  wire tx_reg_i_4_n_1;
  wire tx_reg_i_4_n_2;
  wire tx_reg_i_4_n_3;
  wire tx_reg_i_7_n_0;
  wire tx_reg_i_7_n_1;
  wire tx_reg_i_7_n_2;
  wire tx_reg_i_7_n_3;
  wire tx_wr_en;
  wire tx_wr_start_i_1_n_0;
  wire tx_wr_start_i_2_n_0;
  wire tx_wr_start_i_3_n_0;
  wire tx_wr_start_reg_n_0;
  wire uart_clk;
  wire [7:0]uart_rx_data;
  wire \uart_rx_data[0]_i_1_n_0 ;
  wire \uart_rx_data[1]_i_1_n_0 ;
  wire \uart_rx_data[2]_i_1_n_0 ;
  wire \uart_rx_data[3]_i_1_n_0 ;
  wire \uart_rx_data[3]_i_2_n_0 ;
  wire \uart_rx_data[4]_i_1_n_0 ;
  wire \uart_rx_data[4]_i_2_n_0 ;
  wire \uart_rx_data[5]_i_1_n_0 ;
  wire \uart_rx_data[5]_i_2_n_0 ;
  wire \uart_rx_data[6]_i_1_n_0 ;
  wire \uart_rx_data[6]_i_2_n_0 ;
  wire \uart_rx_data[7]_i_1_n_0 ;
  wire \uart_rx_data[7]_i_2_n_0 ;
  wire \uart_rx_data[7]_i_3_n_0 ;
  wire \uart_rx_data[7]_i_4_n_0 ;
  wire [1:0]uart_rx_state__0;
  wire uart_tx_state;
  wire w_addr;
  wire \w_addr_reg_n_0_[0] ;
  wire \w_addr_reg_n_0_[1] ;
  wire \w_addr_reg_n_0_[2] ;
  wire \w_addr_reg_n_0_[3] ;
  wire \w_addr_reg_n_0_[4] ;
  wire \w_addr_reg_n_0_[5] ;
  wire \w_addr_reg_n_0_[6] ;
  wire \w_addr_reg_n_0_[7] ;
  wire w_data;
  wire \w_data[0]_i_1_n_0 ;
  wire \w_data[10]_i_1_n_0 ;
  wire \w_data[11]_i_1_n_0 ;
  wire \w_data[12]_i_1_n_0 ;
  wire \w_data[13]_i_1_n_0 ;
  wire \w_data[14]_i_1_n_0 ;
  wire \w_data[15]_i_1_n_0 ;
  wire \w_data[16]_i_1_n_0 ;
  wire \w_data[17]_i_1_n_0 ;
  wire \w_data[18]_i_1_n_0 ;
  wire \w_data[19]_i_1_n_0 ;
  wire \w_data[1]_i_1_n_0 ;
  wire \w_data[20]_i_1_n_0 ;
  wire \w_data[21]_i_1_n_0 ;
  wire \w_data[22]_i_1_n_0 ;
  wire \w_data[23]_i_1_n_0 ;
  wire \w_data[24]_i_1_n_0 ;
  wire \w_data[25]_i_1_n_0 ;
  wire \w_data[26]_i_1_n_0 ;
  wire \w_data[27]_i_1_n_0 ;
  wire \w_data[28]_i_1_n_0 ;
  wire \w_data[29]_i_1_n_0 ;
  wire \w_data[2]_i_1_n_0 ;
  wire \w_data[30]_i_1_n_0 ;
  wire \w_data[31]_i_1_n_0 ;
  wire \w_data[32]_i_1_n_0 ;
  wire \w_data[33]_i_1_n_0 ;
  wire \w_data[34]_i_1_n_0 ;
  wire \w_data[35]_i_1_n_0 ;
  wire \w_data[36]_i_1_n_0 ;
  wire \w_data[37]_i_1_n_0 ;
  wire \w_data[38]_i_1_n_0 ;
  wire \w_data[39]_i_1_n_0 ;
  wire \w_data[3]_i_1_n_0 ;
  wire \w_data[40]_i_1_n_0 ;
  wire \w_data[41]_i_1_n_0 ;
  wire \w_data[42]_i_1_n_0 ;
  wire \w_data[43]_i_1_n_0 ;
  wire \w_data[44]_i_1_n_0 ;
  wire \w_data[45]_i_1_n_0 ;
  wire \w_data[46]_i_1_n_0 ;
  wire \w_data[47]_i_1_n_0 ;
  wire \w_data[48]_i_1_n_0 ;
  wire \w_data[49]_i_1_n_0 ;
  wire \w_data[4]_i_1_n_0 ;
  wire \w_data[50]_i_1_n_0 ;
  wire \w_data[51]_i_1_n_0 ;
  wire \w_data[52]_i_1_n_0 ;
  wire \w_data[53]_i_1_n_0 ;
  wire \w_data[54]_i_1_n_0 ;
  wire \w_data[55]_i_2_n_0 ;
  wire \w_data[5]_i_1_n_0 ;
  wire \w_data[63]_i_1_n_0 ;
  wire \w_data[6]_i_1_n_0 ;
  wire \w_data[7]_i_1_n_0 ;
  wire \w_data[8]_i_1_n_0 ;
  wire \w_data[9]_i_1_n_0 ;
  wire \w_data_reg_n_0_[0] ;
  wire \w_data_reg_n_0_[10] ;
  wire \w_data_reg_n_0_[11] ;
  wire \w_data_reg_n_0_[12] ;
  wire \w_data_reg_n_0_[13] ;
  wire \w_data_reg_n_0_[14] ;
  wire \w_data_reg_n_0_[15] ;
  wire \w_data_reg_n_0_[16] ;
  wire \w_data_reg_n_0_[17] ;
  wire \w_data_reg_n_0_[18] ;
  wire \w_data_reg_n_0_[19] ;
  wire \w_data_reg_n_0_[1] ;
  wire \w_data_reg_n_0_[20] ;
  wire \w_data_reg_n_0_[21] ;
  wire \w_data_reg_n_0_[22] ;
  wire \w_data_reg_n_0_[23] ;
  wire \w_data_reg_n_0_[24] ;
  wire \w_data_reg_n_0_[25] ;
  wire \w_data_reg_n_0_[26] ;
  wire \w_data_reg_n_0_[27] ;
  wire \w_data_reg_n_0_[28] ;
  wire \w_data_reg_n_0_[29] ;
  wire \w_data_reg_n_0_[2] ;
  wire \w_data_reg_n_0_[30] ;
  wire \w_data_reg_n_0_[31] ;
  wire \w_data_reg_n_0_[32] ;
  wire \w_data_reg_n_0_[33] ;
  wire \w_data_reg_n_0_[34] ;
  wire \w_data_reg_n_0_[35] ;
  wire \w_data_reg_n_0_[36] ;
  wire \w_data_reg_n_0_[37] ;
  wire \w_data_reg_n_0_[38] ;
  wire \w_data_reg_n_0_[39] ;
  wire \w_data_reg_n_0_[3] ;
  wire \w_data_reg_n_0_[40] ;
  wire \w_data_reg_n_0_[41] ;
  wire \w_data_reg_n_0_[42] ;
  wire \w_data_reg_n_0_[43] ;
  wire \w_data_reg_n_0_[44] ;
  wire \w_data_reg_n_0_[45] ;
  wire \w_data_reg_n_0_[46] ;
  wire \w_data_reg_n_0_[47] ;
  wire \w_data_reg_n_0_[48] ;
  wire \w_data_reg_n_0_[49] ;
  wire \w_data_reg_n_0_[4] ;
  wire \w_data_reg_n_0_[50] ;
  wire \w_data_reg_n_0_[51] ;
  wire \w_data_reg_n_0_[52] ;
  wire \w_data_reg_n_0_[53] ;
  wire \w_data_reg_n_0_[54] ;
  wire \w_data_reg_n_0_[55] ;
  wire \w_data_reg_n_0_[56] ;
  wire \w_data_reg_n_0_[57] ;
  wire \w_data_reg_n_0_[58] ;
  wire \w_data_reg_n_0_[59] ;
  wire \w_data_reg_n_0_[5] ;
  wire \w_data_reg_n_0_[60] ;
  wire \w_data_reg_n_0_[61] ;
  wire \w_data_reg_n_0_[62] ;
  wire \w_data_reg_n_0_[63] ;
  wire \w_data_reg_n_0_[6] ;
  wire \w_data_reg_n_0_[7] ;
  wire \w_data_reg_n_0_[8] ;
  wire \w_data_reg_n_0_[9] ;
  wire [3:2]wr_bit_counter;
  wire [31:31]wr_bit_counter2;
  wire \wr_bit_counter[0]_i_1_n_0 ;
  wire \wr_bit_counter[1]_i_1_n_0 ;
  wire \wr_bit_counter[1]_i_2_n_0 ;
  wire \wr_bit_counter[3]_i_1_n_0 ;
  wire \wr_bit_counter[3]_i_3_n_0 ;
  wire [3:0]wr_bit_counter__0;
  wire [3:0]\NLW_FSM_sequential_uart_rx_state_reg[1]_i_14_O_UNCONNECTED ;
  wire [3:0]\NLW_FSM_sequential_uart_rx_state_reg[1]_i_23_O_UNCONNECTED ;
  wire [3:0]\NLW_FSM_sequential_uart_rx_state_reg[1]_i_4_O_UNCONNECTED ;
  wire [3:0]\NLW_FSM_sequential_uart_rx_state_reg[1]_i_5_O_UNCONNECTED ;
  wire [5:5]NLW_RxFIFO_used_entries_UNCONNECTED;
  wire [3:0]NLW_tx_reg_i_11_O_UNCONNECTED;
  wire [3:3]NLW_tx_reg_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_tx_reg_i_4_O_UNCONNECTED;
  wire [3:0]NLW_tx_reg_i_7_O_UNCONNECTED;

  assign baud_rate[30:1] = \^baud_rate [30:1];
  assign baud_rate[0] = \<const0> ;
  assign sample_rate_o[4:1] = \^sample_rate_o [4:1];
  assign sample_rate_o[0] = \<const0> ;
  assign tx_fifo_mem_left[11:3] = \^tx_fifo_mem_left [11:3];
  assign tx_fifo_mem_left[2] = \<const0> ;
  assign tx_fifo_mem_left[1] = \<const0> ;
  assign tx_fifo_mem_left[0] = \<const0> ;
  (* SOFT_HLUTNM = "soft_lutpair230" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_uart_tx_state[4]_i_1 
       (.I0(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I1(parity_bit),
        .O(\FSM_onehot_uart_tx_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFCFCFFFCFAACFAA)) 
    \FSM_onehot_uart_tx_state[5]_i_1 
       (.I0(\FSM_onehot_uart_tx_state[5]_i_3_n_0 ),
        .I1(tx_reg_i_4_n_1),
        .I2(\FSM_onehot_uart_tx_state[5]_i_4_n_0 ),
        .I3(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_uart_tx_state_reg_n_0_[1] ),
        .I5(\FSM_onehot_uart_tx_state_reg_n_0_[2] ),
        .O(uart_tx_state));
  (* SOFT_HLUTNM = "soft_lutpair230" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \FSM_onehot_uart_tx_state[5]_i_2 
       (.I0(\FSM_onehot_uart_tx_state_reg_n_0_[4] ),
        .I1(parity_bit),
        .I2(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .O(\FSM_onehot_uart_tx_state[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h888A8A8AAAAAAAAA)) 
    \FSM_onehot_uart_tx_state[5]_i_3 
       (.I0(\FSM_onehot_uart_tx_state[5]_i_5_n_0 ),
        .I1(\FSM_onehot_uart_tx_state[5]_i_6_n_0 ),
        .I2(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .I3(\FSM_onehot_uart_tx_state_reg_n_0_[1] ),
        .I4(\FSM_onehot_uart_tx_state_reg_n_0_[4] ),
        .I5(stop_bit),
        .O(\FSM_onehot_uart_tx_state[5]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_onehot_uart_tx_state[5]_i_4 
       (.I0(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .I1(\FSM_onehot_uart_tx_state_reg_n_0_[4] ),
        .O(\FSM_onehot_uart_tx_state[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF202)) 
    \FSM_onehot_uart_tx_state[5]_i_5 
       (.I0(\cntrl_reg_reg_n_0_[3] ),
        .I1(tx_empty),
        .I2(\FSM_onehot_uart_tx_state_reg_n_0_[1] ),
        .I3(tx_fifo_status_1),
        .I4(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .I5(\FSM_onehot_uart_tx_state_reg_n_0_[4] ),
        .O(\FSM_onehot_uart_tx_state[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair197" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \FSM_onehot_uart_tx_state[5]_i_6 
       (.I0(wr_bit_counter__0[1]),
        .I1(wr_bit_counter__0[0]),
        .I2(wr_bit_counter__0[3]),
        .I3(wr_bit_counter__0[2]),
        .O(\FSM_onehot_uart_tx_state[5]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "IDEL:000001,READ_TX_FIFO:000010,START:000100,DATA:001000,STOP:100000,PARITY:010000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_uart_tx_state_reg[0] 
       (.C(uart_clk),
        .CE(uart_tx_state),
        .D(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .PRE(rst),
        .Q(\FSM_onehot_uart_tx_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "IDEL:000001,READ_TX_FIFO:000010,START:000100,DATA:001000,STOP:100000,PARITY:010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_uart_tx_state_reg[1] 
       (.C(uart_clk),
        .CE(uart_tx_state),
        .CLR(rst),
        .D(\FSM_onehot_uart_tx_state_reg_n_0_[0] ),
        .Q(\FSM_onehot_uart_tx_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "IDEL:000001,READ_TX_FIFO:000010,START:000100,DATA:001000,STOP:100000,PARITY:010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_uart_tx_state_reg[2] 
       (.C(uart_clk),
        .CE(uart_tx_state),
        .CLR(rst),
        .D(\FSM_onehot_uart_tx_state_reg_n_0_[1] ),
        .Q(\FSM_onehot_uart_tx_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "IDEL:000001,READ_TX_FIFO:000010,START:000100,DATA:001000,STOP:100000,PARITY:010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_uart_tx_state_reg[3] 
       (.C(uart_clk),
        .CE(uart_tx_state),
        .CLR(rst),
        .D(\FSM_onehot_uart_tx_state_reg_n_0_[2] ),
        .Q(\FSM_onehot_uart_tx_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "IDEL:000001,READ_TX_FIFO:000010,START:000100,DATA:001000,STOP:100000,PARITY:010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_uart_tx_state_reg[4] 
       (.C(uart_clk),
        .CE(uart_tx_state),
        .CLR(rst),
        .D(\FSM_onehot_uart_tx_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_uart_tx_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "IDEL:000001,READ_TX_FIFO:000010,START:000100,DATA:001000,STOP:100000,PARITY:010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_uart_tx_state_reg[5] 
       (.C(uart_clk),
        .CE(uart_tx_state),
        .CLR(rst),
        .D(\FSM_onehot_uart_tx_state[5]_i_2_n_0 ),
        .Q(\FSM_onehot_uart_tx_state_reg_n_0_[5] ));
  (* SOFT_HLUTNM = "soft_lutpair194" *) 
  LUT4 #(
    .INIT(16'h0072)) 
    FSM_sequential_rx_fifo_state_i_1
       (.I0(FSM_sequential_rx_fifo_state_reg_n_0),
        .I1(RxFIFO_n_0),
        .I2(\byte_counter[3]_i_3_n_0 ),
        .I3(rst),
        .O(FSM_sequential_rx_fifo_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDEL:0,WRITE:1," *) 
  FDRE #(
    .INIT(1'b0)) 
    FSM_sequential_rx_fifo_state_reg
       (.C(uart_clk),
        .CE(1'b1),
        .D(FSM_sequential_rx_fifo_state_i_1_n_0),
        .Q(FSM_sequential_rx_fifo_state_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hABABA8A8ABAAA8A8)) 
    \FSM_sequential_uart_rx_state[0]_i_1 
       (.I0(\FSM_sequential_uart_rx_state[0]_i_2_n_0 ),
        .I1(\FSM_sequential_uart_rx_state[1]_i_2_n_0 ),
        .I2(\FSM_sequential_uart_rx_state[0]_i_3_n_0 ),
        .I3(uart_rx_state__0[1]),
        .I4(uart_rx_state__0[0]),
        .I5(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .O(\FSM_sequential_uart_rx_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair185" *) 
  LUT5 #(
    .INIT(32'h00044444)) 
    \FSM_sequential_uart_rx_state[0]_i_2 
       (.I0(RxFIFO_n_66),
        .I1(\cntrl_reg_reg_n_0_[4] ),
        .I2(uart_rx_state__0[1]),
        .I3(parity_bit),
        .I4(uart_rx_state__0[0]),
        .O(\FSM_sequential_uart_rx_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair186" *) 
  LUT5 #(
    .INIT(32'hF7F3FFF7)) 
    \FSM_sequential_uart_rx_state[0]_i_3 
       (.I0(uart_rx_state__0[0]),
        .I1(\cntrl_reg_reg_n_0_[4] ),
        .I2(RxFIFO_n_66),
        .I3(uart_rx_state__0[1]),
        .I4(rx),
        .O(\FSM_sequential_uart_rx_state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7080308070C030C0)) 
    \FSM_sequential_uart_rx_state[1]_i_1 
       (.I0(\FSM_sequential_uart_rx_state[1]_i_2_n_0 ),
        .I1(uart_rx_state__0[0]),
        .I2(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ),
        .I3(uart_rx_state__0[1]),
        .I4(rx),
        .I5(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .O(\FSM_sequential_uart_rx_state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_10 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_11 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_12 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_13 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_15 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_16 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_17 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_18 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_19 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h00000020AAAAAAAA)) 
    \FSM_sequential_uart_rx_state[1]_i_2 
       (.I0(uart_rx_state__0[1]),
        .I1(rd_bit_counter__0[1]),
        .I2(rd_bit_counter__0[0]),
        .I3(rd_bit_counter__0[3]),
        .I4(rd_bit_counter__0[2]),
        .I5(stop_bit),
        .O(\FSM_sequential_uart_rx_state[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_20 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_21 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_21_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_22 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_24 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_25 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_25_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_26 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_26_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_27 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_28 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_29 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair186" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_uart_rx_state[1]_i_3 
       (.I0(\cntrl_reg_reg_n_0_[4] ),
        .I1(RxFIFO_n_66),
        .O(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_30 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_30_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_31 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_31_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_32 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_32_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_33 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'h55540001DDD54443)) 
    \FSM_sequential_uart_rx_state[1]_i_34 
       (.I0(rd_bit_counter__0[3]),
        .I1(data_bits[2]),
        .I2(data_bits[0]),
        .I3(data_bits[1]),
        .I4(data_bits[3]),
        .I5(rd_bit_counter__0[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_34_n_0 ));
  LUT4 #(
    .INIT(16'h4147)) 
    \FSM_sequential_uart_rx_state[1]_i_35 
       (.I0(rd_bit_counter__0[1]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(rd_bit_counter__0[0]),
        .O(\FSM_sequential_uart_rx_state[1]_i_35_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_36 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_36_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_uart_rx_state[1]_i_37 
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_37_n_0 ));
  LUT6 #(
    .INIT(64'h9990000600099990)) 
    \FSM_sequential_uart_rx_state[1]_i_38 
       (.I0(data_bits[3]),
        .I1(rd_bit_counter__0[3]),
        .I2(data_bits[0]),
        .I3(data_bits[1]),
        .I4(data_bits[2]),
        .I5(rd_bit_counter__0[2]),
        .O(\FSM_sequential_uart_rx_state[1]_i_38_n_0 ));
  LUT4 #(
    .INIT(16'h0960)) 
    \FSM_sequential_uart_rx_state[1]_i_39 
       (.I0(data_bits[1]),
        .I1(rd_bit_counter__0[1]),
        .I2(rd_bit_counter__0[0]),
        .I3(data_bits[0]),
        .O(\FSM_sequential_uart_rx_state[1]_i_39_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_6 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(wr_bit_counter2));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_7 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_8 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_uart_rx_state[1]_i_9 
       (.I0(data_bits[2]),
        .I1(data_bits[0]),
        .I2(data_bits[1]),
        .I3(data_bits[3]),
        .O(\FSM_sequential_uart_rx_state[1]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "IDEL:00,DATA:01,STOP:11,PARITY:10" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_uart_rx_state_reg[0] 
       (.C(uart_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_uart_rx_state[0]_i_1_n_0 ),
        .Q(uart_rx_state__0[0]));
  (* FSM_ENCODED_STATES = "IDEL:00,DATA:01,STOP:11,PARITY:10" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_uart_rx_state_reg[1] 
       (.C(uart_clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_uart_rx_state[1]_i_1_n_0 ),
        .Q(uart_rx_state__0[1]));
  CARRY4 \FSM_sequential_uart_rx_state_reg[1]_i_14 
       (.CI(\FSM_sequential_uart_rx_state_reg[1]_i_23_n_0 ),
        .CO({\FSM_sequential_uart_rx_state_reg[1]_i_14_n_0 ,\FSM_sequential_uart_rx_state_reg[1]_i_14_n_1 ,\FSM_sequential_uart_rx_state_reg[1]_i_14_n_2 ,\FSM_sequential_uart_rx_state_reg[1]_i_14_n_3 }),
        .CYINIT(1'b0),
        .DI({\FSM_sequential_uart_rx_state[1]_i_24_n_0 ,\FSM_sequential_uart_rx_state[1]_i_25_n_0 ,\FSM_sequential_uart_rx_state[1]_i_26_n_0 ,\FSM_sequential_uart_rx_state[1]_i_27_n_0 }),
        .O(\NLW_FSM_sequential_uart_rx_state_reg[1]_i_14_O_UNCONNECTED [3:0]),
        .S({\FSM_sequential_uart_rx_state[1]_i_28_n_0 ,\FSM_sequential_uart_rx_state[1]_i_29_n_0 ,\FSM_sequential_uart_rx_state[1]_i_30_n_0 ,\FSM_sequential_uart_rx_state[1]_i_31_n_0 }));
  CARRY4 \FSM_sequential_uart_rx_state_reg[1]_i_23 
       (.CI(1'b0),
        .CO({\FSM_sequential_uart_rx_state_reg[1]_i_23_n_0 ,\FSM_sequential_uart_rx_state_reg[1]_i_23_n_1 ,\FSM_sequential_uart_rx_state_reg[1]_i_23_n_2 ,\FSM_sequential_uart_rx_state_reg[1]_i_23_n_3 }),
        .CYINIT(1'b0),
        .DI({\FSM_sequential_uart_rx_state[1]_i_32_n_0 ,\FSM_sequential_uart_rx_state[1]_i_33_n_0 ,\FSM_sequential_uart_rx_state[1]_i_34_n_0 ,\FSM_sequential_uart_rx_state[1]_i_35_n_0 }),
        .O(\NLW_FSM_sequential_uart_rx_state_reg[1]_i_23_O_UNCONNECTED [3:0]),
        .S({\FSM_sequential_uart_rx_state[1]_i_36_n_0 ,\FSM_sequential_uart_rx_state[1]_i_37_n_0 ,\FSM_sequential_uart_rx_state[1]_i_38_n_0 ,\FSM_sequential_uart_rx_state[1]_i_39_n_0 }));
  CARRY4 \FSM_sequential_uart_rx_state_reg[1]_i_4 
       (.CI(\FSM_sequential_uart_rx_state_reg[1]_i_5_n_0 ),
        .CO({\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ,\FSM_sequential_uart_rx_state_reg[1]_i_4_n_1 ,\FSM_sequential_uart_rx_state_reg[1]_i_4_n_2 ,\FSM_sequential_uart_rx_state_reg[1]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({wr_bit_counter2,\FSM_sequential_uart_rx_state[1]_i_7_n_0 ,\FSM_sequential_uart_rx_state[1]_i_8_n_0 ,\FSM_sequential_uart_rx_state[1]_i_9_n_0 }),
        .O(\NLW_FSM_sequential_uart_rx_state_reg[1]_i_4_O_UNCONNECTED [3:0]),
        .S({\FSM_sequential_uart_rx_state[1]_i_10_n_0 ,\FSM_sequential_uart_rx_state[1]_i_11_n_0 ,\FSM_sequential_uart_rx_state[1]_i_12_n_0 ,\FSM_sequential_uart_rx_state[1]_i_13_n_0 }));
  CARRY4 \FSM_sequential_uart_rx_state_reg[1]_i_5 
       (.CI(\FSM_sequential_uart_rx_state_reg[1]_i_14_n_0 ),
        .CO({\FSM_sequential_uart_rx_state_reg[1]_i_5_n_0 ,\FSM_sequential_uart_rx_state_reg[1]_i_5_n_1 ,\FSM_sequential_uart_rx_state_reg[1]_i_5_n_2 ,\FSM_sequential_uart_rx_state_reg[1]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({\FSM_sequential_uart_rx_state[1]_i_15_n_0 ,\FSM_sequential_uart_rx_state[1]_i_16_n_0 ,\FSM_sequential_uart_rx_state[1]_i_17_n_0 ,\FSM_sequential_uart_rx_state[1]_i_18_n_0 }),
        .O(\NLW_FSM_sequential_uart_rx_state_reg[1]_i_5_O_UNCONNECTED [3:0]),
        .S({\FSM_sequential_uart_rx_state[1]_i_19_n_0 ,\FSM_sequential_uart_rx_state[1]_i_20_n_0 ,\FSM_sequential_uart_rx_state[1]_i_21_n_0 ,\FSM_sequential_uart_rx_state[1]_i_22_n_0 }));
  GND GND
       (.G(\<const0> ));
  (* BYTES = "8" *) 
  (* BYTE_POINTER_WIDTH = "8" *) 
  (* COUNTER_WIDTH = "5" *) 
  (* DATA_WIDTH = "64" *) 
  (* DEPTH = "32" *) 
  (* DONE = "2'b11" *) 
  (* IDEL = "2'b00" *) 
  (* READ = "2'b10" *) 
  (* WRITE = "2'b01" *) 
  UART_FIFO__parameterized0 RxFIFO
       (.empty(rx_empty),
        .full(RxFIFO_n_66),
        .rd_clk(rd_clk),
        .rd_data(out_rx_data),
        .rd_en(rx_rd_en),
        .rd_ready(rx_fifo_status_1),
        .rst(RxFIFO_i_1_n_0),
        .used_entries({NLW_RxFIFO_used_entries_UNCONNECTED[5],RxFIFO_n_69,RxFIFO_n_70,RxFIFO_n_71,RxFIFO_n_72,RxFIFO_n_73}),
        .wr_clk(uart_clk),
        .wr_data({\in_rx_data_reg_n_0_[63] ,\in_rx_data_reg_n_0_[62] ,\in_rx_data_reg_n_0_[61] ,\in_rx_data_reg_n_0_[60] ,\in_rx_data_reg_n_0_[59] ,\in_rx_data_reg_n_0_[58] ,\in_rx_data_reg_n_0_[57] ,\in_rx_data_reg_n_0_[56] ,\in_rx_data_reg_n_0_[55] ,\in_rx_data_reg_n_0_[54] ,\in_rx_data_reg_n_0_[53] ,\in_rx_data_reg_n_0_[52] ,\in_rx_data_reg_n_0_[51] ,\in_rx_data_reg_n_0_[50] ,\in_rx_data_reg_n_0_[49] ,\in_rx_data_reg_n_0_[48] ,\in_rx_data_reg_n_0_[47] ,\in_rx_data_reg_n_0_[46] ,\in_rx_data_reg_n_0_[45] ,\in_rx_data_reg_n_0_[44] ,\in_rx_data_reg_n_0_[43] ,\in_rx_data_reg_n_0_[42] ,\in_rx_data_reg_n_0_[41] ,\in_rx_data_reg_n_0_[40] ,\in_rx_data_reg_n_0_[39] ,\in_rx_data_reg_n_0_[38] ,\in_rx_data_reg_n_0_[37] ,\in_rx_data_reg_n_0_[36] ,\in_rx_data_reg_n_0_[35] ,\in_rx_data_reg_n_0_[34] ,\in_rx_data_reg_n_0_[33] ,\in_rx_data_reg_n_0_[32] ,\in_rx_data_reg_n_0_[31] ,\in_rx_data_reg_n_0_[30] ,\in_rx_data_reg_n_0_[29] ,\in_rx_data_reg_n_0_[28] ,\in_rx_data_reg_n_0_[27] ,\in_rx_data_reg_n_0_[26] ,\in_rx_data_reg_n_0_[25] ,\in_rx_data_reg_n_0_[24] ,\in_rx_data_reg_n_0_[23] ,\in_rx_data_reg_n_0_[22] ,\in_rx_data_reg_n_0_[21] ,\in_rx_data_reg_n_0_[20] ,\in_rx_data_reg_n_0_[19] ,\in_rx_data_reg_n_0_[18] ,\in_rx_data_reg_n_0_[17] ,\in_rx_data_reg_n_0_[16] ,\in_rx_data_reg_n_0_[15] ,\in_rx_data_reg_n_0_[14] ,\in_rx_data_reg_n_0_[13] ,\in_rx_data_reg_n_0_[12] ,\in_rx_data_reg_n_0_[11] ,\in_rx_data_reg_n_0_[10] ,\in_rx_data_reg_n_0_[9] ,\in_rx_data_reg_n_0_[8] ,\in_rx_data_reg_n_0_[7] ,\in_rx_data_reg_n_0_[6] ,\in_rx_data_reg_n_0_[5] ,\in_rx_data_reg_n_0_[4] ,\in_rx_data_reg_n_0_[3] ,\in_rx_data_reg_n_0_[2] ,\in_rx_data_reg_n_0_[1] ,\in_rx_data_reg_n_0_[0] }),
        .wr_en(FSM_sequential_rx_fifo_state_reg_n_0),
        .wr_ready(RxFIFO_n_0));
  (* SOFT_HLUTNM = "soft_lutpair181" *) 
  LUT1 #(
    .INIT(2'h1)) 
    RxFIFO_i_1
       (.I0(rx_fifo_rst),
        .O(RxFIFO_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair187" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    RxFIFO_i_2
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(\r_addr_reg_n_0_[2] ),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(rx_data_valid_INST_0_i_2_n_0),
        .O(rx_rd_en));
  (* BYTES = "1" *) 
  (* BYTE_POINTER_WIDTH = "11" *) 
  (* COUNTER_WIDTH = "8" *) 
  (* DATA_WIDTH = "8" *) 
  (* DEPTH = "256" *) 
  (* DONE = "2'b11" *) 
  (* IDEL = "2'b00" *) 
  (* READ = "2'b10" *) 
  (* WRITE = "2'b01" *) 
  UART_FIFO TxFIFO
       (.empty(tx_empty),
        .full(TxFIFO_n_10),
        .rd_clk(uart_clk),
        .rd_data(out_tx_data),
        .rd_en(\FSM_onehot_uart_tx_state_reg_n_0_[1] ),
        .rd_ready(tx_fifo_status_1),
        .rst(TxFIFO_i_1_n_0),
        .used_entries({TxFIFO_n_12,TxFIFO_n_13,TxFIFO_n_14,TxFIFO_n_15,TxFIFO_n_16,TxFIFO_n_17,TxFIFO_n_18,TxFIFO_n_19,\^tx_fifo_mem_left [3]}),
        .wr_clk(rd_clk),
        .wr_data(in_tx_data),
        .wr_en(tx_wr_en),
        .wr_ready(TxFIFO_n_0));
  (* SOFT_HLUTNM = "soft_lutpair184" *) 
  LUT1 #(
    .INIT(2'h1)) 
    TxFIFO_i_1
       (.I0(\cntrl_reg_reg_n_0_[0] ),
        .O(TxFIFO_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    TxFIFO_i_10
       (.I0(\w_data_reg_n_0_[0] ),
        .I1(rst),
        .O(in_tx_data[0]));
  (* SOFT_HLUTNM = "soft_lutpair225" *) 
  LUT2 #(
    .INIT(4'h8)) 
    TxFIFO_i_2
       (.I0(tx_fifo_state[1]),
        .I1(tx_fifo_state[0]),
        .O(tx_wr_en));
  (* SOFT_HLUTNM = "soft_lutpair194" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TxFIFO_i_3
       (.I0(\w_data_reg_n_0_[7] ),
        .I1(rst),
        .O(in_tx_data[7]));
  (* SOFT_HLUTNM = "soft_lutpair231" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TxFIFO_i_4
       (.I0(\w_data_reg_n_0_[6] ),
        .I1(rst),
        .O(in_tx_data[6]));
  (* SOFT_HLUTNM = "soft_lutpair231" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TxFIFO_i_5
       (.I0(\w_data_reg_n_0_[5] ),
        .I1(rst),
        .O(in_tx_data[5]));
  (* SOFT_HLUTNM = "soft_lutpair232" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TxFIFO_i_6
       (.I0(\w_data_reg_n_0_[4] ),
        .I1(rst),
        .O(in_tx_data[4]));
  (* SOFT_HLUTNM = "soft_lutpair232" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TxFIFO_i_7
       (.I0(\w_data_reg_n_0_[3] ),
        .I1(rst),
        .O(in_tx_data[3]));
  (* SOFT_HLUTNM = "soft_lutpair234" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TxFIFO_i_8
       (.I0(\w_data_reg_n_0_[2] ),
        .I1(rst),
        .O(in_tx_data[2]));
  (* SOFT_HLUTNM = "soft_lutpair234" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TxFIFO_i_9
       (.I0(\w_data_reg_n_0_[1] ),
        .I1(rst),
        .O(in_tx_data[1]));
  LUT5 #(
    .INIT(32'h00000008)) 
    \baud_reg[30]_i_1 
       (.I0(tx_ready_INST_0_i_2_n_0),
        .I1(\tx_action_state_reg_n_0_[0] ),
        .I2(\w_addr_reg_n_0_[2] ),
        .I3(\w_addr_reg_n_0_[4] ),
        .I4(\w_addr_reg_n_0_[3] ),
        .O(baud_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[10] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[10]),
        .Q(\^baud_rate [10]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[11] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[11]),
        .Q(\^baud_rate [11]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[12] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[12]),
        .Q(\^baud_rate [12]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[13] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[13]),
        .Q(\^baud_rate [13]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[14] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[14]),
        .Q(\^baud_rate [14]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[15] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[15]),
        .Q(\^baud_rate [15]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[16] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[16]),
        .Q(\^baud_rate [16]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[17] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[17]),
        .Q(\^baud_rate [17]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[18] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[18]),
        .Q(\^baud_rate [18]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[19] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[19]),
        .Q(\^baud_rate [19]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[1] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[1]),
        .Q(\^baud_rate [1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[20] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[20]),
        .Q(\^baud_rate [20]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[21] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[21]),
        .Q(\^baud_rate [21]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[22] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[22]),
        .Q(\^baud_rate [22]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[23] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[23]),
        .Q(\^baud_rate [23]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[24] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[24]),
        .Q(\^baud_rate [24]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[25] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[25]),
        .Q(\^baud_rate [25]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[26] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[26]),
        .Q(\^baud_rate [26]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[27] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[27]),
        .Q(\^baud_rate [27]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[28] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[28]),
        .Q(\^baud_rate [28]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[29] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[29]),
        .Q(\^baud_rate [29]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[2] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[2]),
        .Q(\^baud_rate [2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[30] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[30]),
        .Q(\^baud_rate [30]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[31] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[31]),
        .Q(baud_en),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[3] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[3]),
        .Q(\^baud_rate [3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[4] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[4]),
        .Q(\^baud_rate [4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[5] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[5]),
        .Q(\^baud_rate [5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[6] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[6]),
        .Q(\^baud_rate [6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[7] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[7]),
        .Q(\^baud_rate [7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[8] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[8]),
        .Q(\^baud_rate [8]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_reg_reg[9] 
       (.C(rd_clk),
        .CE(baud_reg0),
        .D(tx_data[9]),
        .Q(\^baud_rate [9]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair183" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \byte_counter[0]_i_1 
       (.I0(uart_rx_state__0[1]),
        .I1(\cntrl_reg_reg_n_0_[4] ),
        .I2(RxFIFO_n_66),
        .I3(byte_counter__0[0]),
        .O(\byte_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair183" *) 
  LUT5 #(
    .INIT(32'h00080800)) 
    \byte_counter[1]_i_1 
       (.I0(uart_rx_state__0[1]),
        .I1(\cntrl_reg_reg_n_0_[4] ),
        .I2(RxFIFO_n_66),
        .I3(byte_counter__0[0]),
        .I4(byte_counter__0[1]),
        .O(\byte_counter[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0040404040000000)) 
    \byte_counter[2]_i_1 
       (.I0(RxFIFO_n_66),
        .I1(\cntrl_reg_reg_n_0_[4] ),
        .I2(uart_rx_state__0[1]),
        .I3(byte_counter__0[0]),
        .I4(byte_counter__0[1]),
        .I5(byte_counter__0[2]),
        .O(\byte_counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8F0F8F0F8FFF8F0F)) 
    \byte_counter[3]_i_1 
       (.I0(\FSM_sequential_uart_rx_state[1]_i_2_n_0 ),
        .I1(rx),
        .I2(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ),
        .I3(uart_rx_state__0[0]),
        .I4(\byte_counter[3]_i_3_n_0 ),
        .I5(uart_rx_state__0[1]),
        .O(\byte_counter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F80000000000000)) 
    \byte_counter[3]_i_2 
       (.I0(byte_counter__0[2]),
        .I1(byte_counter__0[1]),
        .I2(byte_counter__0[0]),
        .I3(byte_counter__0[3]),
        .I4(uart_rx_state__0[1]),
        .I5(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ),
        .O(\byte_counter[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \byte_counter[3]_i_3 
       (.I0(byte_counter__0[1]),
        .I1(byte_counter__0[0]),
        .I2(byte_counter__0[3]),
        .I3(byte_counter__0[2]),
        .O(\byte_counter[3]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \byte_counter_reg[0] 
       (.C(uart_clk),
        .CE(\byte_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\byte_counter[0]_i_1_n_0 ),
        .Q(byte_counter__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \byte_counter_reg[1] 
       (.C(uart_clk),
        .CE(\byte_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\byte_counter[1]_i_1_n_0 ),
        .Q(byte_counter__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \byte_counter_reg[2] 
       (.C(uart_clk),
        .CE(\byte_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\byte_counter[2]_i_1_n_0 ),
        .Q(byte_counter__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \byte_counter_reg[3] 
       (.C(uart_clk),
        .CE(\byte_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\byte_counter[3]_i_2_n_0 ),
        .Q(byte_counter__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair191" *) 
  LUT4 #(
    .INIT(16'h22A2)) 
    \cntrl_reg[0]_i_1 
       (.I0(tx_data[0]),
        .I1(tx_empty),
        .I2(tx_data[1]),
        .I3(rx_empty),
        .O(\cntrl_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002000000)) 
    \cntrl_reg[13]_i_1 
       (.I0(tx_ready_INST_0_i_2_n_0),
        .I1(\w_addr_reg_n_0_[3] ),
        .I2(\w_addr_reg_n_0_[4] ),
        .I3(\w_addr_reg_n_0_[2] ),
        .I4(\tx_action_state_reg_n_0_[0] ),
        .I5(rst),
        .O(cntrl_reg));
  (* SOFT_HLUTNM = "soft_lutpair192" *) 
  LUT4 #(
    .INIT(16'h20F0)) 
    \cntrl_reg[1]_i_1 
       (.I0(tx_data[0]),
        .I1(tx_empty),
        .I2(tx_data[1]),
        .I3(rx_empty),
        .O(\cntrl_reg[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[0] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(\cntrl_reg[0]_i_1_n_0 ),
        .Q(\cntrl_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[10] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[10]),
        .Q(\^sample_rate_o [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[11] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[11]),
        .Q(\^sample_rate_o [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[12] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[12]),
        .Q(\^sample_rate_o [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[13] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[13]),
        .Q(\^sample_rate_o [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[14] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[14]),
        .Q(\cntrl_reg_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[15] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[15]),
        .Q(\cntrl_reg_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[16] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[16]),
        .Q(\cntrl_reg_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[17] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[17]),
        .Q(\cntrl_reg_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[18] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[18]),
        .Q(\cntrl_reg_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[19] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[19]),
        .Q(rx_trig[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[1] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(\cntrl_reg[1]_i_1_n_0 ),
        .Q(rx_fifo_rst),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[20] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[20]),
        .Q(rx_trig[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[21] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[21]),
        .Q(rx_trig[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[22] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[22]),
        .Q(rx_trig[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[23] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[23]),
        .Q(data_bits[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[24] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[24]),
        .Q(data_bits[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[25] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[25]),
        .Q(data_bits[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[26] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[26]),
        .Q(data_bits[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[27] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[27]),
        .Q(\cntrl_reg_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[28] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[28]),
        .Q(\cntrl_reg_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[29] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[29]),
        .Q(\cntrl_reg_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[2] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[2]),
        .Q(\cntrl_reg_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[30] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[30]),
        .Q(\cntrl_reg_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[31] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[31]),
        .Q(\cntrl_reg_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[3] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[3]),
        .Q(\cntrl_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[4] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[4]),
        .Q(\cntrl_reg_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[5] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[5]),
        .Q(stop_bit),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[6] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[6]),
        .Q(parity_bit),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[7] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[7]),
        .Q(\cntrl_reg_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[8] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[8]),
        .Q(\cntrl_reg_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cntrl_reg_reg[9] 
       (.C(rd_clk),
        .CE(cntrl_reg),
        .D(tx_data[9]),
        .Q(\cntrl_reg_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8A00000000000000)) 
    \in_rx_data[63]_i_1 
       (.I0(uart_rx_state__0[1]),
        .I1(\rd_bit_counter[3]_i_3_n_0 ),
        .I2(stop_bit),
        .I3(rx),
        .I4(uart_rx_state__0[0]),
        .I5(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ),
        .O(\in_rx_data[63]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[0] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[8] ),
        .Q(\in_rx_data_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[10] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[18] ),
        .Q(\in_rx_data_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[11] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[19] ),
        .Q(\in_rx_data_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[12] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[20] ),
        .Q(\in_rx_data_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[13] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[21] ),
        .Q(\in_rx_data_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[14] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[22] ),
        .Q(\in_rx_data_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[15] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[23] ),
        .Q(\in_rx_data_reg_n_0_[15] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[16] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[24] ),
        .Q(\in_rx_data_reg_n_0_[16] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[17] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[25] ),
        .Q(\in_rx_data_reg_n_0_[17] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[18] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[26] ),
        .Q(\in_rx_data_reg_n_0_[18] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[19] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[27] ),
        .Q(\in_rx_data_reg_n_0_[19] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[1] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[9] ),
        .Q(\in_rx_data_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[20] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[28] ),
        .Q(\in_rx_data_reg_n_0_[20] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[21] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[29] ),
        .Q(\in_rx_data_reg_n_0_[21] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[22] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[30] ),
        .Q(\in_rx_data_reg_n_0_[22] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[23] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[31] ),
        .Q(\in_rx_data_reg_n_0_[23] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[24] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[32] ),
        .Q(\in_rx_data_reg_n_0_[24] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[25] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[33] ),
        .Q(\in_rx_data_reg_n_0_[25] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[26] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[34] ),
        .Q(\in_rx_data_reg_n_0_[26] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[27] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[35] ),
        .Q(\in_rx_data_reg_n_0_[27] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[28] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[36] ),
        .Q(\in_rx_data_reg_n_0_[28] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[29] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[37] ),
        .Q(\in_rx_data_reg_n_0_[29] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[2] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[10] ),
        .Q(\in_rx_data_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[30] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[38] ),
        .Q(\in_rx_data_reg_n_0_[30] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[31] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[39] ),
        .Q(\in_rx_data_reg_n_0_[31] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[32] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[40] ),
        .Q(\in_rx_data_reg_n_0_[32] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[33] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[41] ),
        .Q(\in_rx_data_reg_n_0_[33] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[34] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[42] ),
        .Q(\in_rx_data_reg_n_0_[34] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[35] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[43] ),
        .Q(\in_rx_data_reg_n_0_[35] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[36] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[44] ),
        .Q(\in_rx_data_reg_n_0_[36] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[37] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[45] ),
        .Q(\in_rx_data_reg_n_0_[37] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[38] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[46] ),
        .Q(\in_rx_data_reg_n_0_[38] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[39] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[47] ),
        .Q(\in_rx_data_reg_n_0_[39] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[3] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[11] ),
        .Q(\in_rx_data_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[40] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[48] ),
        .Q(\in_rx_data_reg_n_0_[40] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[41] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[49] ),
        .Q(\in_rx_data_reg_n_0_[41] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[42] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[50] ),
        .Q(\in_rx_data_reg_n_0_[42] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[43] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[51] ),
        .Q(\in_rx_data_reg_n_0_[43] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[44] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[52] ),
        .Q(\in_rx_data_reg_n_0_[44] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[45] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[53] ),
        .Q(\in_rx_data_reg_n_0_[45] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[46] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[54] ),
        .Q(\in_rx_data_reg_n_0_[46] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[47] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[55] ),
        .Q(\in_rx_data_reg_n_0_[47] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[48] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[56] ),
        .Q(\in_rx_data_reg_n_0_[48] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[49] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[57] ),
        .Q(\in_rx_data_reg_n_0_[49] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[4] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[12] ),
        .Q(\in_rx_data_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[50] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[58] ),
        .Q(\in_rx_data_reg_n_0_[50] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[51] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[59] ),
        .Q(\in_rx_data_reg_n_0_[51] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[52] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[60] ),
        .Q(\in_rx_data_reg_n_0_[52] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[53] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[61] ),
        .Q(\in_rx_data_reg_n_0_[53] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[54] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[62] ),
        .Q(\in_rx_data_reg_n_0_[54] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[55] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[63] ),
        .Q(\in_rx_data_reg_n_0_[55] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[56] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(uart_rx_data[0]),
        .Q(\in_rx_data_reg_n_0_[56] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[57] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(uart_rx_data[1]),
        .Q(\in_rx_data_reg_n_0_[57] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[58] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(uart_rx_data[2]),
        .Q(\in_rx_data_reg_n_0_[58] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[59] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(uart_rx_data[3]),
        .Q(\in_rx_data_reg_n_0_[59] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[5] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[13] ),
        .Q(\in_rx_data_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[60] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(uart_rx_data[4]),
        .Q(\in_rx_data_reg_n_0_[60] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[61] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(uart_rx_data[5]),
        .Q(\in_rx_data_reg_n_0_[61] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[62] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(uart_rx_data[6]),
        .Q(\in_rx_data_reg_n_0_[62] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[63] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(uart_rx_data[7]),
        .Q(\in_rx_data_reg_n_0_[63] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[6] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[14] ),
        .Q(\in_rx_data_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[7] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[15] ),
        .Q(\in_rx_data_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[8] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[16] ),
        .Q(\in_rx_data_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \in_rx_data_reg[9] 
       (.C(uart_clk),
        .CE(\in_rx_data[63]_i_1_n_0 ),
        .CLR(rst),
        .D(\in_rx_data_reg_n_0_[17] ),
        .Q(\in_rx_data_reg_n_0_[9] ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \r_IDR[31]_i_1 
       (.I0(\w_addr_reg_n_0_[2] ),
        .I1(\tx_action_state_reg_n_0_[0] ),
        .I2(tx_ready_INST_0_i_2_n_0),
        .I3(\w_addr_reg_n_0_[4] ),
        .I4(\w_addr_reg_n_0_[3] ),
        .O(r_IDR0));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[0] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[0]),
        .Q(r_IDR[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[10] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[10]),
        .Q(r_IDR[10]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[11] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[11]),
        .Q(r_IDR[11]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[12] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[12]),
        .Q(r_IDR[12]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[13] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[13]),
        .Q(r_IDR[13]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[14] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[14]),
        .Q(r_IDR[14]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[15] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[15]),
        .Q(r_IDR[15]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[16] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[16]),
        .Q(r_IDR[16]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[17] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[17]),
        .Q(r_IDR[17]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[18] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[18]),
        .Q(r_IDR[18]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[19] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[19]),
        .Q(r_IDR[19]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[1] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[1]),
        .Q(r_IDR[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[20] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[20]),
        .Q(r_IDR[20]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[21] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[21]),
        .Q(r_IDR[21]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[22] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[22]),
        .Q(r_IDR[22]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[23] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[23]),
        .Q(r_IDR[23]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[24] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[24]),
        .Q(r_IDR[24]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[25] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[25]),
        .Q(r_IDR[25]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[26] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[26]),
        .Q(r_IDR[26]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[27] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[27]),
        .Q(r_IDR[27]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[28] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[28]),
        .Q(r_IDR[28]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[29] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[29]),
        .Q(r_IDR[29]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[2] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[2]),
        .Q(r_IDR[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[30] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[30]),
        .Q(r_IDR[30]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[31] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[31]),
        .Q(r_IDR[31]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[3] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[3]),
        .Q(r_IDR[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[4] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[4]),
        .Q(r_IDR[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[5] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[5]),
        .Q(r_IDR[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[6] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[6]),
        .Q(r_IDR[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[7] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[7]),
        .Q(r_IDR[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[8] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[8]),
        .Q(r_IDR[8]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \r_IDR_reg[9] 
       (.C(rd_clk),
        .CE(r_IDR0),
        .D(tx_data[9]),
        .Q(r_IDR[9]),
        .R(rst));
  LUT5 #(
    .INIT(32'h00400000)) 
    \r_IER[0]_i_1 
       (.I0(\w_addr_reg_n_0_[2] ),
        .I1(\tx_action_state_reg_n_0_[0] ),
        .I2(tx_ready_INST_0_i_2_n_0),
        .I3(\w_addr_reg_n_0_[4] ),
        .I4(\w_addr_reg_n_0_[3] ),
        .O(r_IER0));
  FDRE #(
    .INIT(1'b0)) 
    \r_IER_reg[0] 
       (.C(rd_clk),
        .CE(r_IER0),
        .D(tx_data[0]),
        .Q(r_IER),
        .R(rst));
  LUT3 #(
    .INIT(8'h04)) 
    \r_addr[7]_i_1 
       (.I0(\rx_action_state_reg_n_0_[0] ),
        .I1(rx_en),
        .I2(rst),
        .O(r_addr));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[0] 
       (.C(rd_clk),
        .CE(r_addr),
        .D(rx_addr[0]),
        .Q(\r_addr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[1] 
       (.C(rd_clk),
        .CE(r_addr),
        .D(rx_addr[1]),
        .Q(\r_addr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[2] 
       (.C(rd_clk),
        .CE(r_addr),
        .D(rx_addr[2]),
        .Q(\r_addr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[3] 
       (.C(rd_clk),
        .CE(r_addr),
        .D(rx_addr[3]),
        .Q(\r_addr_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[4] 
       (.C(rd_clk),
        .CE(r_addr),
        .D(rx_addr[4]),
        .Q(\r_addr_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[5] 
       (.C(rd_clk),
        .CE(r_addr),
        .D(rx_addr[5]),
        .Q(\r_addr_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[6] 
       (.C(rd_clk),
        .CE(r_addr),
        .D(rx_addr[6]),
        .Q(\r_addr_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[7] 
       (.C(rd_clk),
        .CE(r_addr),
        .D(rx_addr[7]),
        .Q(\r_addr_reg_n_0_[7] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000045400000)) 
    \rd_bit_counter[0]_i_1 
       (.I0(rd_bit_counter__0[0]),
        .I1(stop_bit),
        .I2(uart_rx_state__0[1]),
        .I3(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I4(\cntrl_reg_reg_n_0_[4] ),
        .I5(RxFIFO_n_66),
        .O(\rd_bit_counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000808A808)) 
    \rd_bit_counter[1]_i_1 
       (.I0(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ),
        .I1(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I2(uart_rx_state__0[1]),
        .I3(stop_bit),
        .I4(\rd_bit_counter[3]_i_3_n_0 ),
        .I5(\rd_bit_counter[1]_i_2_n_0 ),
        .O(\rd_bit_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair237" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \rd_bit_counter[1]_i_2 
       (.I0(rd_bit_counter__0[0]),
        .I1(rd_bit_counter__0[1]),
        .O(\rd_bit_counter[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000808A808)) 
    \rd_bit_counter[2]_i_1 
       (.I0(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ),
        .I1(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I2(uart_rx_state__0[1]),
        .I3(stop_bit),
        .I4(\rd_bit_counter[3]_i_3_n_0 ),
        .I5(\rd_bit_counter[2]_i_2_n_0 ),
        .O(\rd_bit_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair229" *) 
  LUT3 #(
    .INIT(8'h95)) 
    \rd_bit_counter[2]_i_2 
       (.I0(rd_bit_counter__0[2]),
        .I1(rd_bit_counter__0[1]),
        .I2(rd_bit_counter__0[0]),
        .O(\rd_bit_counter[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFD0FFFF)) 
    \rd_bit_counter[3]_i_1 
       (.I0(uart_rx_state__0[1]),
        .I1(rx),
        .I2(uart_rx_state__0[0]),
        .I3(RxFIFO_n_66),
        .I4(\cntrl_reg_reg_n_0_[4] ),
        .O(\rd_bit_counter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000808A808)) 
    \rd_bit_counter[3]_i_2 
       (.I0(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ),
        .I1(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I2(uart_rx_state__0[1]),
        .I3(stop_bit),
        .I4(\rd_bit_counter[3]_i_3_n_0 ),
        .I5(\rd_bit_counter[3]_i_4_n_0 ),
        .O(\rd_bit_counter[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair193" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \rd_bit_counter[3]_i_3 
       (.I0(rd_bit_counter__0[1]),
        .I1(rd_bit_counter__0[0]),
        .I2(rd_bit_counter__0[3]),
        .I3(rd_bit_counter__0[2]),
        .O(\rd_bit_counter[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair193" *) 
  LUT4 #(
    .INIT(16'h9555)) 
    \rd_bit_counter[3]_i_4 
       (.I0(rd_bit_counter__0[3]),
        .I1(rd_bit_counter__0[0]),
        .I2(rd_bit_counter__0[1]),
        .I3(rd_bit_counter__0[2]),
        .O(\rd_bit_counter[3]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rd_bit_counter_reg[0] 
       (.C(uart_clk),
        .CE(\rd_bit_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\rd_bit_counter[0]_i_1_n_0 ),
        .Q(rd_bit_counter__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_bit_counter_reg[1] 
       (.C(uart_clk),
        .CE(\rd_bit_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\rd_bit_counter[1]_i_1_n_0 ),
        .Q(rd_bit_counter__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_bit_counter_reg[2] 
       (.C(uart_clk),
        .CE(\rd_bit_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\rd_bit_counter[2]_i_1_n_0 ),
        .Q(rd_bit_counter__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_bit_counter_reg[3] 
       (.C(uart_clk),
        .CE(\rd_bit_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\rd_bit_counter[3]_i_2_n_0 ),
        .Q(rd_bit_counter__0[3]));
  LUT5 #(
    .INIT(32'h0300A8AA)) 
    \rx_action_state[0]_i_1 
       (.I0(rx_en),
        .I1(rx_data_valid_INST_0_i_1_n_0),
        .I2(rx_data_valid_INST_0_i_2_n_0),
        .I3(\rx_action_state[0]_i_2_n_0 ),
        .I4(\rx_action_state_reg_n_0_[0] ),
        .O(\rx_action_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair179" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \rx_action_state[0]_i_2 
       (.I0(\r_addr_reg_n_0_[4] ),
        .I1(\r_addr_reg_n_0_[2] ),
        .I2(\r_addr_reg_n_0_[3] ),
        .O(\rx_action_state[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_action_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\rx_action_state[0]_i_1_n_0 ),
        .Q(\rx_action_state_reg_n_0_[0] ),
        .R(rst));
  LUT5 #(
    .INIT(32'hAAABAAAA)) 
    \rx_data[0]_i_1 
       (.I0(\rx_data[0]_i_2_n_0 ),
        .I1(\rx_data[0]_i_3_n_0 ),
        .I2(\rx_data[0]_i_4_n_0 ),
        .I3(\rx_data[0]_i_5_n_0 ),
        .I4(\rx_data[0]_i_6_n_0 ),
        .O(\rx_data[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_data[0]_i_10 
       (.I0(r_IDR[26]),
        .I1(r_IDR[30]),
        .I2(r_IDR[22]),
        .I3(r_IDR[28]),
        .O(\rx_data[0]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair184" *) 
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[0]_i_2 
       (.I0(\cntrl_reg_reg_n_0_[0] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[0]),
        .O(\rx_data[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \rx_data[0]_i_3 
       (.I0(r_IDR[11]),
        .I1(r_IDR[21]),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(r_IDR[4]),
        .I4(r_IDR[29]),
        .I5(r_IDR[23]),
        .O(\rx_data[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \rx_data[0]_i_4 
       (.I0(r_IDR[15]),
        .I1(r_IDR[13]),
        .I2(r_IDR[17]),
        .I3(r_IDR[2]),
        .I4(\rx_data[0]_i_7_n_0 ),
        .O(\rx_data[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \rx_data[0]_i_5 
       (.I0(r_IDR[16]),
        .I1(r_IDR[6]),
        .I2(r_IDR[10]),
        .I3(r_IDR[3]),
        .I4(\rx_data[0]_i_8_n_0 ),
        .O(\rx_data[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rx_data[0]_i_6 
       (.I0(r_IDR[20]),
        .I1(r_IDR[0]),
        .I2(r_IDR[31]),
        .I3(r_IDR[24]),
        .I4(\rx_data[0]_i_9_n_0 ),
        .I5(\rx_data[0]_i_10_n_0 ),
        .O(\rx_data[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_data[0]_i_7 
       (.I0(r_IDR[1]),
        .I1(r_IDR[12]),
        .I2(r_IDR[14]),
        .I3(r_IDR[18]),
        .O(\rx_data[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_data[0]_i_8 
       (.I0(r_IDR[7]),
        .I1(r_IDR[8]),
        .I2(r_IDR[5]),
        .I3(r_IDR[19]),
        .O(\rx_data[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \rx_data[0]_i_9 
       (.I0(r_IER),
        .I1(r_IDR[27]),
        .I2(r_IDR[9]),
        .I3(r_IDR[25]),
        .O(\rx_data[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[10]_i_1 
       (.I0(\^sample_rate_o [1]),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[10]),
        .O(\rx_data[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[11]_i_1 
       (.I0(\^sample_rate_o [2]),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[11]),
        .O(\rx_data[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[12]_i_1 
       (.I0(\^sample_rate_o [3]),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[12]),
        .O(\rx_data[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[13]_i_1 
       (.I0(\^sample_rate_o [4]),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[13]),
        .O(\rx_data[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[14]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[14] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[14]),
        .O(\rx_data[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[15]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[15] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[15]),
        .O(\rx_data[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[16]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[16] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[16]),
        .O(\rx_data[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[17]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[17] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[17]),
        .O(\rx_data[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[18]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[18] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[18]),
        .O(\rx_data[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[19]_i_1 
       (.I0(rx_trig[0]),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[19]),
        .O(\rx_data[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair181" *) 
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[1]_i_1 
       (.I0(rx_fifo_rst),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[1]),
        .O(\rx_data[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[20]_i_1 
       (.I0(rx_trig[1]),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[20]),
        .O(\rx_data[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[21]_i_1 
       (.I0(rx_trig[2]),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[21]),
        .O(\rx_data[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair179" *) 
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[22]_i_1 
       (.I0(rx_trig[3]),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[22]),
        .O(\rx_data[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[23]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[23]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(data_bits[0]),
        .O(\rx_data[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[24]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[24]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(data_bits[1]),
        .O(\rx_data[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[25]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[25]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(data_bits[2]),
        .O(\rx_data[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[26]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[26]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(data_bits[3]),
        .O(\rx_data[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[27]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[27]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(\cntrl_reg_reg_n_0_[27] ),
        .O(\rx_data[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[28]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[28]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(\cntrl_reg_reg_n_0_[28] ),
        .O(\rx_data[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[29]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[29]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(\cntrl_reg_reg_n_0_[29] ),
        .O(\rx_data[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[2]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[2] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[2]),
        .O(\rx_data[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[30]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[30]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(\cntrl_reg_reg_n_0_[30] ),
        .O(\rx_data[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8F008000)) 
    \rx_data[31]_i_1 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(out_rx_data[31]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .I4(\cntrl_reg_reg_n_0_[31] ),
        .O(\rx_data[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[3]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[3] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[3]),
        .O(\rx_data[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[4]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[4] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[4]),
        .O(\rx_data[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[5]_i_1 
       (.I0(stop_bit),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[5]),
        .O(\rx_data[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000054)) 
    \rx_data[63]_i_1 
       (.I0(rst),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(rx_data_valid_INST_0_i_2_n_0),
        .I4(\r_addr_reg_n_0_[3] ),
        .O(\rx_data[63]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000051101110)) 
    \rx_data[63]_i_2 
       (.I0(rx_data_valid_INST_0_i_2_n_0),
        .I1(\r_addr_reg_n_0_[3] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[4] ),
        .I4(rx_data_valid_INST_0_i_1_n_0),
        .I5(rst),
        .O(\rx_data[63]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[6]_i_1 
       (.I0(parity_bit),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[6]),
        .O(\rx_data[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[7]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[7] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[7]),
        .O(\rx_data[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[8]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[8] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[8]),
        .O(\rx_data[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \rx_data[9]_i_1 
       (.I0(\cntrl_reg_reg_n_0_[9] ),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(out_rx_data[9]),
        .O(\rx_data[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[0]_i_1_n_0 ),
        .Q(rx_data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[10] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[10]_i_1_n_0 ),
        .Q(rx_data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[11] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[11]_i_1_n_0 ),
        .Q(rx_data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[12] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[12]_i_1_n_0 ),
        .Q(rx_data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[13] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[13]_i_1_n_0 ),
        .Q(rx_data[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[14] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[14]_i_1_n_0 ),
        .Q(rx_data[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[15] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[15]_i_1_n_0 ),
        .Q(rx_data[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[16] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[16]_i_1_n_0 ),
        .Q(rx_data[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[17] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[17]_i_1_n_0 ),
        .Q(rx_data[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[18] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[18]_i_1_n_0 ),
        .Q(rx_data[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[19] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[19]_i_1_n_0 ),
        .Q(rx_data[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[1]_i_1_n_0 ),
        .Q(rx_data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[20] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[20]_i_1_n_0 ),
        .Q(rx_data[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[21] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[21]_i_1_n_0 ),
        .Q(rx_data[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[22] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[22]_i_1_n_0 ),
        .Q(rx_data[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[23] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[23]_i_1_n_0 ),
        .Q(rx_data[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[24] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[24]_i_1_n_0 ),
        .Q(rx_data[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[25] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[25]_i_1_n_0 ),
        .Q(rx_data[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[26] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[26]_i_1_n_0 ),
        .Q(rx_data[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[27] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[27]_i_1_n_0 ),
        .Q(rx_data[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[28] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[28]_i_1_n_0 ),
        .Q(rx_data[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[29] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[29]_i_1_n_0 ),
        .Q(rx_data[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[2]_i_1_n_0 ),
        .Q(rx_data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[30] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[30]_i_1_n_0 ),
        .Q(rx_data[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[31] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[31]_i_1_n_0 ),
        .Q(rx_data[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[32] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[32]),
        .Q(rx_data[32]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[33] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[33]),
        .Q(rx_data[33]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[34] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[34]),
        .Q(rx_data[34]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[35] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[35]),
        .Q(rx_data[35]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[36] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[36]),
        .Q(rx_data[36]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[37] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[37]),
        .Q(rx_data[37]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[38] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[38]),
        .Q(rx_data[38]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[39] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[39]),
        .Q(rx_data[39]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[3]_i_1_n_0 ),
        .Q(rx_data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[40] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[40]),
        .Q(rx_data[40]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[41] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[41]),
        .Q(rx_data[41]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[42] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[42]),
        .Q(rx_data[42]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[43] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[43]),
        .Q(rx_data[43]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[44] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[44]),
        .Q(rx_data[44]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[45] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[45]),
        .Q(rx_data[45]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[46] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[46]),
        .Q(rx_data[46]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[47] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[47]),
        .Q(rx_data[47]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[48] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[48]),
        .Q(rx_data[48]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[49] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[49]),
        .Q(rx_data[49]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[4]_i_1_n_0 ),
        .Q(rx_data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[50] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[50]),
        .Q(rx_data[50]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[51] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[51]),
        .Q(rx_data[51]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[52] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[52]),
        .Q(rx_data[52]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[53] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[53]),
        .Q(rx_data[53]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[54] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[54]),
        .Q(rx_data[54]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[55] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[55]),
        .Q(rx_data[55]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[56] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[56]),
        .Q(rx_data[56]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[57] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[57]),
        .Q(rx_data[57]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[58] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[58]),
        .Q(rx_data[58]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[59] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[59]),
        .Q(rx_data[59]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[5]_i_1_n_0 ),
        .Q(rx_data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[60] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[60]),
        .Q(rx_data[60]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[61] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[61]),
        .Q(rx_data[61]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[62] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[62]),
        .Q(rx_data[62]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[63] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(out_rx_data[63]),
        .Q(rx_data[63]),
        .R(\rx_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[6]_i_1_n_0 ),
        .Q(rx_data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[7]_i_1_n_0 ),
        .Q(rx_data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[8]_i_1_n_0 ),
        .Q(rx_data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(rd_clk),
        .CE(\rx_data[63]_i_2_n_0 ),
        .D(\rx_data[9]_i_1_n_0 ),
        .Q(rx_data[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair187" *) 
  LUT5 #(
    .INIT(32'h000080FC)) 
    rx_data_valid_INST_0
       (.I0(rx_data_valid_INST_0_i_1_n_0),
        .I1(\r_addr_reg_n_0_[4] ),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .I4(rx_data_valid_INST_0_i_2_n_0),
        .O(rx_data_valid));
  LUT4 #(
    .INIT(16'h00D0)) 
    rx_data_valid_INST_0_i_1
       (.I0(rx_data_valid_INST_0_i_3_n_0),
        .I1(rx_data_valid_INST_0_i_4_n_0),
        .I2(rx_fifo_status_1),
        .I3(rx_empty),
        .O(rx_data_valid_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    rx_data_valid_INST_0_i_2
       (.I0(\r_addr_reg_n_0_[7] ),
        .I1(\r_addr_reg_n_0_[5] ),
        .I2(\r_addr_reg_n_0_[0] ),
        .I3(\rx_action_state_reg_n_0_[0] ),
        .I4(\r_addr_reg_n_0_[1] ),
        .I5(\r_addr_reg_n_0_[6] ),
        .O(rx_data_valid_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFEFFFEFE)) 
    rx_data_valid_INST_0_i_3
       (.I0(rx_trig[1]),
        .I1(rx_trig[2]),
        .I2(rx_trig[0]),
        .I3(RxFIFO_n_73),
        .I4(rx_trig[3]),
        .O(rx_data_valid_INST_0_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFFFFFE)) 
    rx_data_valid_INST_0_i_4
       (.I0(RxFIFO_n_72),
        .I1(RxFIFO_n_71),
        .I2(RxFIFO_n_70),
        .I3(RxFIFO_n_69),
        .I4(RxFIFO_n_73),
        .I5(rx_trig[3]),
        .O(rx_data_valid_INST_0_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair192" *) 
  LUT1 #(
    .INIT(2'h1)) 
    rx_done_INST_0
       (.I0(rx_empty),
        .O(rx_done));
  LUT4 #(
    .INIT(16'h22F0)) 
    \tx_action_state[0]_i_1 
       (.I0(tx_ready_INST_0_i_2_n_0),
        .I1(\tx_action_state[0]_i_2_n_0 ),
        .I2(tx_data_valid),
        .I3(\tx_action_state_reg_n_0_[0] ),
        .O(\tx_action_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF11FFFFFFFFF0FF)) 
    \tx_action_state[0]_i_2 
       (.I0(tx_fifo_state[1]),
        .I1(tx_fifo_state[0]),
        .I2(\tx_action_state[0]_i_3_n_0 ),
        .I3(\w_addr_reg_n_0_[2] ),
        .I4(\w_addr_reg_n_0_[3] ),
        .I5(\w_addr_reg_n_0_[4] ),
        .O(\tx_action_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair191" *) 
  LUT4 #(
    .INIT(16'hB0BB)) 
    \tx_action_state[0]_i_3 
       (.I0(rx_empty),
        .I1(tx_data[1]),
        .I2(tx_empty),
        .I3(tx_data[0]),
        .O(\tx_action_state[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tx_action_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\tx_action_state[0]_i_1_n_0 ),
        .Q(\tx_action_state_reg_n_0_[0] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair233" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \tx_byte_counter[0]_i_1 
       (.I0(tx_fifo_state[0]),
        .I1(tx_byte_counter[0]),
        .O(\tx_byte_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair195" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \tx_byte_counter[1]_i_1 
       (.I0(tx_byte_counter[0]),
        .I1(tx_byte_counter[1]),
        .I2(tx_fifo_state[0]),
        .O(\tx_byte_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair195" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \tx_byte_counter[2]_i_1 
       (.I0(tx_fifo_state[0]),
        .I1(tx_byte_counter[1]),
        .I2(tx_byte_counter[0]),
        .I3(tx_byte_counter[2]),
        .O(\tx_byte_counter[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4544)) 
    \tx_byte_counter[3]_i_1 
       (.I0(\tx_byte_counter[3]_i_3_n_0 ),
        .I1(\tx_byte_counter[3]_i_4_n_0 ),
        .I2(tx_fifo_state[1]),
        .I3(tx_fifo_state[0]),
        .O(\tx_byte_counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair182" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \tx_byte_counter[3]_i_2 
       (.I0(tx_byte_counter[0]),
        .I1(tx_byte_counter[1]),
        .I2(tx_byte_counter[2]),
        .I3(tx_byte_counter[3]),
        .I4(tx_fifo_state[0]),
        .O(\tx_byte_counter[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair182" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \tx_byte_counter[3]_i_3 
       (.I0(tx_byte_counter[2]),
        .I1(tx_byte_counter[1]),
        .I2(tx_byte_counter[0]),
        .I3(tx_fifo_state[0]),
        .I4(tx_byte_counter[3]),
        .O(\tx_byte_counter[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair188" *) 
  LUT5 #(
    .INIT(32'h0000FEFF)) 
    \tx_byte_counter[3]_i_4 
       (.I0(TxFIFO_n_13),
        .I1(\tx_fifo_mem_left[11]_INST_0_i_1_n_0 ),
        .I2(TxFIFO_n_14),
        .I3(TxFIFO_n_12),
        .I4(\tx_byte_counter[3]_i_5_n_0 ),
        .O(\tx_byte_counter[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair225" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \tx_byte_counter[3]_i_5 
       (.I0(tx_wr_start_reg_n_0),
        .I1(TxFIFO_n_10),
        .I2(tx_fifo_state[1]),
        .O(\tx_byte_counter[3]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tx_byte_counter_reg[0] 
       (.C(rd_clk),
        .CE(\tx_byte_counter[3]_i_1_n_0 ),
        .D(\tx_byte_counter[0]_i_1_n_0 ),
        .Q(tx_byte_counter[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \tx_byte_counter_reg[1] 
       (.C(rd_clk),
        .CE(\tx_byte_counter[3]_i_1_n_0 ),
        .D(\tx_byte_counter[1]_i_1_n_0 ),
        .Q(tx_byte_counter[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \tx_byte_counter_reg[2] 
       (.C(rd_clk),
        .CE(\tx_byte_counter[3]_i_1_n_0 ),
        .D(\tx_byte_counter[2]_i_1_n_0 ),
        .Q(tx_byte_counter[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \tx_byte_counter_reg[3] 
       (.C(rd_clk),
        .CE(\tx_byte_counter[3]_i_1_n_0 ),
        .D(\tx_byte_counter[3]_i_2_n_0 ),
        .Q(tx_byte_counter[3]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair227" *) 
  LUT3 #(
    .INIT(8'h56)) 
    \tx_fifo_mem_left[10]_INST_0 
       (.I0(TxFIFO_n_13),
        .I1(\tx_fifo_mem_left[11]_INST_0_i_1_n_0 ),
        .I2(TxFIFO_n_14),
        .O(\^tx_fifo_mem_left [10]));
  (* SOFT_HLUTNM = "soft_lutpair188" *) 
  LUT4 #(
    .INIT(16'hAAA9)) 
    \tx_fifo_mem_left[11]_INST_0 
       (.I0(TxFIFO_n_12),
        .I1(TxFIFO_n_14),
        .I2(\tx_fifo_mem_left[11]_INST_0_i_1_n_0 ),
        .I3(TxFIFO_n_13),
        .O(\^tx_fifo_mem_left [11]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \tx_fifo_mem_left[11]_INST_0_i_1 
       (.I0(TxFIFO_n_15),
        .I1(TxFIFO_n_17),
        .I2(\^tx_fifo_mem_left [3]),
        .I3(TxFIFO_n_19),
        .I4(TxFIFO_n_18),
        .I5(TxFIFO_n_16),
        .O(\tx_fifo_mem_left[11]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair226" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tx_fifo_mem_left[4]_INST_0 
       (.I0(\^tx_fifo_mem_left [3]),
        .I1(TxFIFO_n_19),
        .O(\^tx_fifo_mem_left [4]));
  (* SOFT_HLUTNM = "soft_lutpair226" *) 
  LUT3 #(
    .INIT(8'h56)) 
    \tx_fifo_mem_left[5]_INST_0 
       (.I0(TxFIFO_n_18),
        .I1(TxFIFO_n_19),
        .I2(\^tx_fifo_mem_left [3]),
        .O(\^tx_fifo_mem_left [5]));
  (* SOFT_HLUTNM = "soft_lutpair180" *) 
  LUT4 #(
    .INIT(16'h5556)) 
    \tx_fifo_mem_left[6]_INST_0 
       (.I0(TxFIFO_n_17),
        .I1(\^tx_fifo_mem_left [3]),
        .I2(TxFIFO_n_19),
        .I3(TxFIFO_n_18),
        .O(\^tx_fifo_mem_left [6]));
  (* SOFT_HLUTNM = "soft_lutpair180" *) 
  LUT5 #(
    .INIT(32'h55555556)) 
    \tx_fifo_mem_left[7]_INST_0 
       (.I0(TxFIFO_n_16),
        .I1(TxFIFO_n_18),
        .I2(TxFIFO_n_19),
        .I3(\^tx_fifo_mem_left [3]),
        .I4(TxFIFO_n_17),
        .O(\^tx_fifo_mem_left [7]));
  LUT6 #(
    .INIT(64'h5555555555555556)) 
    \tx_fifo_mem_left[8]_INST_0 
       (.I0(TxFIFO_n_15),
        .I1(TxFIFO_n_17),
        .I2(\^tx_fifo_mem_left [3]),
        .I3(TxFIFO_n_19),
        .I4(TxFIFO_n_18),
        .I5(TxFIFO_n_16),
        .O(\^tx_fifo_mem_left [8]));
  (* SOFT_HLUTNM = "soft_lutpair227" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tx_fifo_mem_left[9]_INST_0 
       (.I0(TxFIFO_n_14),
        .I1(\tx_fifo_mem_left[11]_INST_0_i_1_n_0 ),
        .O(\^tx_fifo_mem_left [9]));
  LUT6 #(
    .INIT(64'hFFCF5555CCCC4444)) 
    \tx_fifo_state[0]_i_1 
       (.I0(\tx_byte_counter[3]_i_3_n_0 ),
        .I1(\tx_byte_counter[3]_i_4_n_0 ),
        .I2(\tx_fifo_state[1]_i_2_n_0 ),
        .I3(TxFIFO_n_0),
        .I4(tx_fifo_state[1]),
        .I5(tx_fifo_state[0]),
        .O(\tx_fifo_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4447555544444444)) 
    \tx_fifo_state[1]_i_1 
       (.I0(\tx_byte_counter[3]_i_3_n_0 ),
        .I1(\tx_byte_counter[3]_i_4_n_0 ),
        .I2(\tx_fifo_state[1]_i_2_n_0 ),
        .I3(TxFIFO_n_0),
        .I4(tx_fifo_state[1]),
        .I5(tx_fifo_state[0]),
        .O(\tx_fifo_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    \tx_fifo_state[1]_i_2 
       (.I0(tx_ready_INST_0_i_2_n_0),
        .I1(tx_data[0]),
        .I2(\w_addr_reg_n_0_[3] ),
        .I3(\w_addr_reg_n_0_[4] ),
        .I4(\w_addr_reg_n_0_[2] ),
        .I5(\tx_action_state_reg_n_0_[0] ),
        .O(\tx_fifo_state[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tx_fifo_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\tx_fifo_state[0]_i_1_n_0 ),
        .Q(tx_fifo_state[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \tx_fifo_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\tx_fifo_state[1]_i_1_n_0 ),
        .Q(tx_fifo_state[1]),
        .R(rst));
  LUT6 #(
    .INIT(64'hFFFFFFFFF2F2FFF2)) 
    tx_i_1
       (.I0(\FSM_onehot_uart_tx_state_reg_n_0_[0] ),
        .I1(tx_i_3_n_0),
        .I2(\FSM_onehot_uart_tx_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I4(tx_reg_i_4_n_1),
        .I5(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .O(tx_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_10
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_10_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_12
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_12_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_13
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_13_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_14
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_14_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_15
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_15_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_16
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_16_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_17
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_17_n_0));
  LUT5 #(
    .INIT(32'h99999994)) 
    tx_i_18
       (.I0(wr_bit_counter__0[3]),
        .I1(data_bits[3]),
        .I2(data_bits[1]),
        .I3(data_bits[0]),
        .I4(data_bits[2]),
        .O(tx_i_18_n_0));
  LUT6 #(
    .INIT(64'h0000096090090000)) 
    tx_i_19
       (.I0(data_bits[2]),
        .I1(wr_bit_counter__0[2]),
        .I2(wr_bit_counter__0[1]),
        .I3(data_bits[1]),
        .I4(data_bits[0]),
        .I5(wr_bit_counter__0[0]),
        .O(tx_i_19_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFB800)) 
    tx_i_2
       (.I0(tx_i_5_n_0),
        .I1(wr_bit_counter__0[2]),
        .I2(tx_i_6_n_0),
        .I3(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_uart_tx_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .O(tx_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair190" *) 
  LUT2 #(
    .INIT(4'h2)) 
    tx_i_3
       (.I0(\cntrl_reg_reg_n_0_[3] ),
        .I1(tx_empty),
        .O(tx_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    tx_i_5
       (.I0(out_tx_data[7]),
        .I1(out_tx_data[6]),
        .I2(wr_bit_counter__0[1]),
        .I3(out_tx_data[5]),
        .I4(wr_bit_counter__0[0]),
        .I5(out_tx_data[4]),
        .O(tx_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    tx_i_6
       (.I0(out_tx_data[3]),
        .I1(out_tx_data[2]),
        .I2(wr_bit_counter__0[1]),
        .I3(out_tx_data[1]),
        .I4(wr_bit_counter__0[0]),
        .I5(out_tx_data[0]),
        .O(tx_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_8
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tx_i_9
       (.I0(data_bits[3]),
        .I1(data_bits[1]),
        .I2(data_bits[0]),
        .I3(data_bits[2]),
        .O(tx_i_9_n_0));
  LUT6 #(
    .INIT(64'h4C44CC4400000000)) 
    tx_ready_INST_0
       (.I0(tx_ready_INST_0_i_1_n_0),
        .I1(tx_ready_INST_0_i_2_n_0),
        .I2(tx_ready_INST_0_i_3_n_0),
        .I3(tx_ready_INST_0_i_4_n_0),
        .I4(\w_addr_reg_n_0_[2] ),
        .I5(\tx_action_state_reg_n_0_[0] ),
        .O(tx_ready));
  (* SOFT_HLUTNM = "soft_lutpair189" *) 
  LUT5 #(
    .INIT(32'hF3F3F3B3)) 
    tx_ready_INST_0_i_1
       (.I0(\w_addr_reg_n_0_[2] ),
        .I1(\w_addr_reg_n_0_[3] ),
        .I2(\w_addr_reg_n_0_[4] ),
        .I3(tx_fifo_state[1]),
        .I4(tx_fifo_state[0]),
        .O(tx_ready_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    tx_ready_INST_0_i_2
       (.I0(\w_addr_reg_n_0_[5] ),
        .I1(\w_addr_reg_n_0_[0] ),
        .I2(\w_addr_reg_n_0_[7] ),
        .I3(\w_addr_reg_n_0_[6] ),
        .I4(\w_addr_reg_n_0_[1] ),
        .O(tx_ready_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair190" *) 
  LUT4 #(
    .INIT(16'h4F44)) 
    tx_ready_INST_0_i_3
       (.I0(tx_empty),
        .I1(\cntrl_reg_reg_n_0_[0] ),
        .I2(rx_empty),
        .I3(rx_fifo_rst),
        .O(tx_ready_INST_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair189" *) 
  LUT2 #(
    .INIT(4'h1)) 
    tx_ready_INST_0_i_4
       (.I0(\w_addr_reg_n_0_[4] ),
        .I1(\w_addr_reg_n_0_[3] ),
        .O(tx_ready_INST_0_i_4_n_0));
  FDPE #(
    .INIT(1'b1)) 
    tx_reg
       (.C(uart_clk),
        .CE(tx_i_1_n_0),
        .D(tx_i_2_n_0),
        .PRE(rst),
        .Q(tx));
  CARRY4 tx_reg_i_11
       (.CI(1'b0),
        .CO({tx_reg_i_11_n_0,tx_reg_i_11_n_1,tx_reg_i_11_n_2,tx_reg_i_11_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_tx_reg_i_11_O_UNCONNECTED[3:0]),
        .S({tx_i_16_n_0,tx_i_17_n_0,tx_i_18_n_0,tx_i_19_n_0}));
  CARRY4 tx_reg_i_4
       (.CI(tx_reg_i_7_n_0),
        .CO({NLW_tx_reg_i_4_CO_UNCONNECTED[3],tx_reg_i_4_n_1,tx_reg_i_4_n_2,tx_reg_i_4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_tx_reg_i_4_O_UNCONNECTED[3:0]),
        .S({1'b0,tx_i_8_n_0,tx_i_9_n_0,tx_i_10_n_0}));
  CARRY4 tx_reg_i_7
       (.CI(tx_reg_i_11_n_0),
        .CO({tx_reg_i_7_n_0,tx_reg_i_7_n_1,tx_reg_i_7_n_2,tx_reg_i_7_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_tx_reg_i_7_O_UNCONNECTED[3:0]),
        .S({tx_i_12_n_0,tx_i_13_n_0,tx_i_14_n_0,tx_i_15_n_0}));
  LUT5 #(
    .INIT(32'hA0FCA000)) 
    tx_wr_start_i_1
       (.I0(\w_addr_reg_n_0_[4] ),
        .I1(rst),
        .I2(\tx_action_state_reg_n_0_[0] ),
        .I3(tx_wr_start_i_2_n_0),
        .I4(tx_wr_start_reg_n_0),
        .O(tx_wr_start_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000008300000000)) 
    tx_wr_start_i_2
       (.I0(tx_wr_start_i_3_n_0),
        .I1(\w_addr_reg_n_0_[3] ),
        .I2(\w_addr_reg_n_0_[4] ),
        .I3(rst),
        .I4(\w_addr_reg_n_0_[2] ),
        .I5(tx_ready_INST_0_i_2_n_0),
        .O(tx_wr_start_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair233" *) 
  LUT2 #(
    .INIT(4'h1)) 
    tx_wr_start_i_3
       (.I0(tx_fifo_state[1]),
        .I1(tx_fifo_state[0]),
        .O(tx_wr_start_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_wr_start_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(tx_wr_start_i_1_n_0),
        .Q(tx_wr_start_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h800000008000AAAA)) 
    \uart_rx_data[0]_i_1 
       (.I0(\uart_rx_data[7]_i_2_n_0 ),
        .I1(\uart_rx_data[4]_i_2_n_0 ),
        .I2(\uart_rx_data[3]_i_2_n_0 ),
        .I3(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I4(uart_rx_state__0[0]),
        .I5(rx),
        .O(\uart_rx_data[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4000000040440044)) 
    \uart_rx_data[1]_i_1 
       (.I0(uart_rx_state__0[1]),
        .I1(\FSM_sequential_uart_rx_state[1]_i_3_n_0 ),
        .I2(\rd_bit_counter[3]_i_3_n_0 ),
        .I3(uart_rx_state__0[0]),
        .I4(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I5(rx),
        .O(\uart_rx_data[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000AA80AA)) 
    \uart_rx_data[2]_i_1 
       (.I0(\uart_rx_data[7]_i_2_n_0 ),
        .I1(\uart_rx_data[3]_i_2_n_0 ),
        .I2(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I3(uart_rx_state__0[0]),
        .I4(\uart_rx_data[6]_i_2_n_0 ),
        .I5(rx),
        .O(\uart_rx_data[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h800000008000AAAA)) 
    \uart_rx_data[3]_i_1 
       (.I0(\uart_rx_data[7]_i_2_n_0 ),
        .I1(\uart_rx_data[7]_i_3_n_0 ),
        .I2(\uart_rx_data[3]_i_2_n_0 ),
        .I3(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I4(uart_rx_state__0[0]),
        .I5(rx),
        .O(\uart_rx_data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair236" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \uart_rx_data[3]_i_2 
       (.I0(rd_bit_counter__0[2]),
        .I1(rd_bit_counter__0[3]),
        .O(\uart_rx_data[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h800000008000AAAA)) 
    \uart_rx_data[4]_i_1 
       (.I0(\uart_rx_data[7]_i_2_n_0 ),
        .I1(\uart_rx_data[4]_i_2_n_0 ),
        .I2(\uart_rx_data[7]_i_4_n_0 ),
        .I3(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I4(uart_rx_state__0[0]),
        .I5(rx),
        .O(\uart_rx_data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair237" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \uart_rx_data[4]_i_2 
       (.I0(rd_bit_counter__0[0]),
        .I1(rd_bit_counter__0[1]),
        .O(\uart_rx_data[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h800000008000AAAA)) 
    \uart_rx_data[5]_i_1 
       (.I0(\uart_rx_data[7]_i_2_n_0 ),
        .I1(\uart_rx_data[5]_i_2_n_0 ),
        .I2(\uart_rx_data[7]_i_4_n_0 ),
        .I3(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I4(uart_rx_state__0[0]),
        .I5(rx),
        .O(\uart_rx_data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair229" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \uart_rx_data[5]_i_2 
       (.I0(rd_bit_counter__0[0]),
        .I1(rd_bit_counter__0[1]),
        .O(\uart_rx_data[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000AA80AA)) 
    \uart_rx_data[6]_i_1 
       (.I0(\uart_rx_data[7]_i_2_n_0 ),
        .I1(\uart_rx_data[7]_i_4_n_0 ),
        .I2(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I3(uart_rx_state__0[0]),
        .I4(\uart_rx_data[6]_i_2_n_0 ),
        .I5(rx),
        .O(\uart_rx_data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair235" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \uart_rx_data[6]_i_2 
       (.I0(rd_bit_counter__0[0]),
        .I1(rd_bit_counter__0[1]),
        .O(\uart_rx_data[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h800000008000AAAA)) 
    \uart_rx_data[7]_i_1 
       (.I0(\uart_rx_data[7]_i_2_n_0 ),
        .I1(\uart_rx_data[7]_i_3_n_0 ),
        .I2(\uart_rx_data[7]_i_4_n_0 ),
        .I3(\FSM_sequential_uart_rx_state_reg[1]_i_4_n_0 ),
        .I4(uart_rx_state__0[0]),
        .I5(rx),
        .O(\uart_rx_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair185" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \uart_rx_data[7]_i_2 
       (.I0(RxFIFO_n_66),
        .I1(\cntrl_reg_reg_n_0_[4] ),
        .I2(uart_rx_state__0[1]),
        .O(\uart_rx_data[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair235" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \uart_rx_data[7]_i_3 
       (.I0(rd_bit_counter__0[0]),
        .I1(rd_bit_counter__0[1]),
        .O(\uart_rx_data[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair236" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \uart_rx_data[7]_i_4 
       (.I0(rd_bit_counter__0[2]),
        .I1(rd_bit_counter__0[3]),
        .O(\uart_rx_data[7]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \uart_rx_data_reg[0] 
       (.C(uart_clk),
        .CE(\uart_rx_data[0]_i_1_n_0 ),
        .CLR(rst),
        .D(rx),
        .Q(uart_rx_data[0]));
  FDCE #(
    .INIT(1'b0)) 
    \uart_rx_data_reg[1] 
       (.C(uart_clk),
        .CE(\uart_rx_data[1]_i_1_n_0 ),
        .CLR(rst),
        .D(rx),
        .Q(uart_rx_data[1]));
  FDCE #(
    .INIT(1'b0)) 
    \uart_rx_data_reg[2] 
       (.C(uart_clk),
        .CE(\uart_rx_data[2]_i_1_n_0 ),
        .CLR(rst),
        .D(rx),
        .Q(uart_rx_data[2]));
  FDCE #(
    .INIT(1'b0)) 
    \uart_rx_data_reg[3] 
       (.C(uart_clk),
        .CE(\uart_rx_data[3]_i_1_n_0 ),
        .CLR(rst),
        .D(rx),
        .Q(uart_rx_data[3]));
  FDCE #(
    .INIT(1'b0)) 
    \uart_rx_data_reg[4] 
       (.C(uart_clk),
        .CE(\uart_rx_data[4]_i_1_n_0 ),
        .CLR(rst),
        .D(rx),
        .Q(uart_rx_data[4]));
  FDCE #(
    .INIT(1'b0)) 
    \uart_rx_data_reg[5] 
       (.C(uart_clk),
        .CE(\uart_rx_data[5]_i_1_n_0 ),
        .CLR(rst),
        .D(rx),
        .Q(uart_rx_data[5]));
  FDCE #(
    .INIT(1'b0)) 
    \uart_rx_data_reg[6] 
       (.C(uart_clk),
        .CE(\uart_rx_data[6]_i_1_n_0 ),
        .CLR(rst),
        .D(rx),
        .Q(uart_rx_data[6]));
  FDCE #(
    .INIT(1'b0)) 
    \uart_rx_data_reg[7] 
       (.C(uart_clk),
        .CE(\uart_rx_data[7]_i_1_n_0 ),
        .CLR(rst),
        .D(rx),
        .Q(uart_rx_data[7]));
  LUT2 #(
    .INIT(4'h1)) 
    \w_addr[7]_i_1 
       (.I0(\tx_action_state_reg_n_0_[0] ),
        .I1(rst),
        .O(w_addr));
  FDRE #(
    .INIT(1'b0)) 
    \w_addr_reg[0] 
       (.C(rd_clk),
        .CE(w_addr),
        .D(tx_addr[0]),
        .Q(\w_addr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_addr_reg[1] 
       (.C(rd_clk),
        .CE(w_addr),
        .D(tx_addr[1]),
        .Q(\w_addr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_addr_reg[2] 
       (.C(rd_clk),
        .CE(w_addr),
        .D(tx_addr[2]),
        .Q(\w_addr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_addr_reg[3] 
       (.C(rd_clk),
        .CE(w_addr),
        .D(tx_addr[3]),
        .Q(\w_addr_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_addr_reg[4] 
       (.C(rd_clk),
        .CE(w_addr),
        .D(tx_addr[4]),
        .Q(\w_addr_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_addr_reg[5] 
       (.C(rd_clk),
        .CE(w_addr),
        .D(tx_addr[5]),
        .Q(\w_addr_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_addr_reg[6] 
       (.C(rd_clk),
        .CE(w_addr),
        .D(tx_addr[6]),
        .Q(\w_addr_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_addr_reg[7] 
       (.C(rd_clk),
        .CE(w_addr),
        .D(tx_addr[7]),
        .Q(\w_addr_reg_n_0_[7] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair208" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[0]_i_1 
       (.I0(\w_data_reg_n_0_[8] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[0]),
        .O(\w_data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair199" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[10]_i_1 
       (.I0(\w_data_reg_n_0_[18] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[10]),
        .O(\w_data[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair198" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[11]_i_1 
       (.I0(\w_data_reg_n_0_[19] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[11]),
        .O(\w_data[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair228" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[12]_i_1 
       (.I0(\w_data_reg_n_0_[20] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[12]),
        .O(\w_data[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair201" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[13]_i_1 
       (.I0(\w_data_reg_n_0_[21] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[13]),
        .O(\w_data[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair202" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[14]_i_1 
       (.I0(\w_data_reg_n_0_[22] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[14]),
        .O(\w_data[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair203" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[15]_i_1 
       (.I0(\w_data_reg_n_0_[23] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[15]),
        .O(\w_data[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair206" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[16]_i_1 
       (.I0(\w_data_reg_n_0_[24] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[16]),
        .O(\w_data[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair204" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[17]_i_1 
       (.I0(\w_data_reg_n_0_[25] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[17]),
        .O(\w_data[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair216" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[18]_i_1 
       (.I0(\w_data_reg_n_0_[26] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[18]),
        .O(\w_data[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair217" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[19]_i_1 
       (.I0(\w_data_reg_n_0_[27] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[19]),
        .O(\w_data[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair222" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[1]_i_1 
       (.I0(\w_data_reg_n_0_[9] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[1]),
        .O(\w_data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair218" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[20]_i_1 
       (.I0(\w_data_reg_n_0_[28] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[20]),
        .O(\w_data[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair224" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[21]_i_1 
       (.I0(\w_data_reg_n_0_[29] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[21]),
        .O(\w_data[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair228" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[22]_i_1 
       (.I0(\w_data_reg_n_0_[30] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[22]),
        .O(\w_data[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair210" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[23]_i_1 
       (.I0(\w_data_reg_n_0_[31] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[23]),
        .O(\w_data[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair211" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[24]_i_1 
       (.I0(\w_data_reg_n_0_[32] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[24]),
        .O(\w_data[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair213" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[25]_i_1 
       (.I0(\w_data_reg_n_0_[33] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[25]),
        .O(\w_data[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair223" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[26]_i_1 
       (.I0(\w_data_reg_n_0_[34] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[26]),
        .O(\w_data[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair215" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[27]_i_1 
       (.I0(\w_data_reg_n_0_[35] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[27]),
        .O(\w_data[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair224" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[28]_i_1 
       (.I0(\w_data_reg_n_0_[36] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[28]),
        .O(\w_data[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair223" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[29]_i_1 
       (.I0(\w_data_reg_n_0_[37] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[29]),
        .O(\w_data[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair221" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[2]_i_1 
       (.I0(\w_data_reg_n_0_[10] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[2]),
        .O(\w_data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair222" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[30]_i_1 
       (.I0(\w_data_reg_n_0_[38] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[30]),
        .O(\w_data[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair221" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[31]_i_1 
       (.I0(\w_data_reg_n_0_[39] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[31]),
        .O(\w_data[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair220" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[32]_i_1 
       (.I0(\w_data_reg_n_0_[40] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[32]),
        .O(\w_data[32]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair220" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[33]_i_1 
       (.I0(\w_data_reg_n_0_[41] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[33]),
        .O(\w_data[33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair219" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[34]_i_1 
       (.I0(\w_data_reg_n_0_[42] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[34]),
        .O(\w_data[34]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair218" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[35]_i_1 
       (.I0(\w_data_reg_n_0_[43] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[35]),
        .O(\w_data[35]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair217" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[36]_i_1 
       (.I0(\w_data_reg_n_0_[44] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[36]),
        .O(\w_data[36]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair216" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[37]_i_1 
       (.I0(\w_data_reg_n_0_[45] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[37]),
        .O(\w_data[37]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair215" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[38]_i_1 
       (.I0(\w_data_reg_n_0_[46] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[38]),
        .O(\w_data[38]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair214" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[39]_i_1 
       (.I0(\w_data_reg_n_0_[47] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[39]),
        .O(\w_data[39]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair205" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[3]_i_1 
       (.I0(\w_data_reg_n_0_[11] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[3]),
        .O(\w_data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair213" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[40]_i_1 
       (.I0(\w_data_reg_n_0_[48] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[40]),
        .O(\w_data[40]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair212" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[41]_i_1 
       (.I0(\w_data_reg_n_0_[49] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[41]),
        .O(\w_data[41]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair211" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[42]_i_1 
       (.I0(\w_data_reg_n_0_[50] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[42]),
        .O(\w_data[42]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair210" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[43]_i_1 
       (.I0(\w_data_reg_n_0_[51] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[43]),
        .O(\w_data[43]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair209" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[44]_i_1 
       (.I0(\w_data_reg_n_0_[52] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[44]),
        .O(\w_data[44]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair208" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[45]_i_1 
       (.I0(\w_data_reg_n_0_[53] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[45]),
        .O(\w_data[45]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair207" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[46]_i_1 
       (.I0(\w_data_reg_n_0_[54] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[46]),
        .O(\w_data[46]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair206" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[47]_i_1 
       (.I0(\w_data_reg_n_0_[55] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[47]),
        .O(\w_data[47]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair205" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[48]_i_1 
       (.I0(\w_data_reg_n_0_[56] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[48]),
        .O(\w_data[48]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair204" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[49]_i_1 
       (.I0(\w_data_reg_n_0_[57] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[49]),
        .O(\w_data[49]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair219" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[4]_i_1 
       (.I0(\w_data_reg_n_0_[12] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[4]),
        .O(\w_data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair203" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[50]_i_1 
       (.I0(\w_data_reg_n_0_[58] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[50]),
        .O(\w_data[50]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair202" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[51]_i_1 
       (.I0(\w_data_reg_n_0_[59] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[51]),
        .O(\w_data[51]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair201" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[52]_i_1 
       (.I0(\w_data_reg_n_0_[60] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[52]),
        .O(\w_data[52]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair200" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[53]_i_1 
       (.I0(\w_data_reg_n_0_[61] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[53]),
        .O(\w_data[53]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair199" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[54]_i_1 
       (.I0(\w_data_reg_n_0_[62] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[54]),
        .O(\w_data[54]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000000F2)) 
    \w_data[55]_i_1 
       (.I0(tx_fifo_state[0]),
        .I1(tx_fifo_state[1]),
        .I2(\tx_byte_counter[3]_i_4_n_0 ),
        .I3(\tx_byte_counter[3]_i_3_n_0 ),
        .I4(rst),
        .O(w_data));
  (* SOFT_HLUTNM = "soft_lutpair198" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[55]_i_2 
       (.I0(\w_data_reg_n_0_[63] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[55]),
        .O(\w_data[55]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair214" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[5]_i_1 
       (.I0(\w_data_reg_n_0_[13] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[5]),
        .O(\w_data[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h10110000)) 
    \w_data[63]_i_1 
       (.I0(rst),
        .I1(\tx_byte_counter[3]_i_3_n_0 ),
        .I2(\tx_byte_counter[3]_i_4_n_0 ),
        .I3(tx_fifo_state[1]),
        .I4(tx_fifo_state[0]),
        .O(\w_data[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair212" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[6]_i_1 
       (.I0(\w_data_reg_n_0_[14] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[6]),
        .O(\w_data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair209" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[7]_i_1 
       (.I0(\w_data_reg_n_0_[15] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[7]),
        .O(\w_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair200" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[8]_i_1 
       (.I0(\w_data_reg_n_0_[16] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[8]),
        .O(\w_data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair207" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_data[9]_i_1 
       (.I0(\w_data_reg_n_0_[17] ),
        .I1(tx_fifo_state[0]),
        .I2(tx_data[9]),
        .O(\w_data[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[0] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[0]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[10] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[10]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[11] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[11]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[12] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[12]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[13] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[13]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[14] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[14]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[15] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[15]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[16] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[16]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[17] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[17]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[18] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[18]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[19] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[19]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[1] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[1]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[20] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[20]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[21] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[21]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[22] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[22]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[23] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[23]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[24] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[24]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[25] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[25]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[26] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[26]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[27] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[27]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[28] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[28]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[29] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[29]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[2] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[2]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[30] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[30]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[31] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[31]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[32] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[32]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[32] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[33] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[33]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[33] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[34] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[34]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[34] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[35] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[35]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[35] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[36] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[36]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[36] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[37] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[37]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[37] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[38] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[38]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[38] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[39] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[39]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[39] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[3] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[3]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[40] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[40]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[40] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[41] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[41]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[41] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[42] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[42]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[42] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[43] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[43]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[43] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[44] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[44]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[44] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[45] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[45]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[45] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[46] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[46]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[46] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[47] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[47]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[47] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[48] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[48]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[48] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[49] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[49]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[49] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[4] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[4]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[50] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[50]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[50] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[51] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[51]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[51] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[52] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[52]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[52] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[53] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[53]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[53] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[54] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[54]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[54] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[55] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[55]_i_2_n_0 ),
        .Q(\w_data_reg_n_0_[55] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[56] 
       (.C(rd_clk),
        .CE(w_data),
        .D(tx_data[56]),
        .Q(\w_data_reg_n_0_[56] ),
        .R(\w_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[57] 
       (.C(rd_clk),
        .CE(w_data),
        .D(tx_data[57]),
        .Q(\w_data_reg_n_0_[57] ),
        .R(\w_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[58] 
       (.C(rd_clk),
        .CE(w_data),
        .D(tx_data[58]),
        .Q(\w_data_reg_n_0_[58] ),
        .R(\w_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[59] 
       (.C(rd_clk),
        .CE(w_data),
        .D(tx_data[59]),
        .Q(\w_data_reg_n_0_[59] ),
        .R(\w_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[5] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[5]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[60] 
       (.C(rd_clk),
        .CE(w_data),
        .D(tx_data[60]),
        .Q(\w_data_reg_n_0_[60] ),
        .R(\w_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[61] 
       (.C(rd_clk),
        .CE(w_data),
        .D(tx_data[61]),
        .Q(\w_data_reg_n_0_[61] ),
        .R(\w_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[62] 
       (.C(rd_clk),
        .CE(w_data),
        .D(tx_data[62]),
        .Q(\w_data_reg_n_0_[62] ),
        .R(\w_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[63] 
       (.C(rd_clk),
        .CE(w_data),
        .D(tx_data[63]),
        .Q(\w_data_reg_n_0_[63] ),
        .R(\w_data[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[6] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[6]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[7] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[7]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[8] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[8]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_reg[9] 
       (.C(rd_clk),
        .CE(w_data),
        .D(\w_data[9]_i_1_n_0 ),
        .Q(\w_data_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair196" *) 
  LUT4 #(
    .INIT(16'h5504)) 
    \wr_bit_counter[0]_i_1 
       (.I0(wr_bit_counter__0[0]),
        .I1(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I2(tx_reg_i_4_n_1),
        .I3(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .O(\wr_bit_counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h280828083C3C2808)) 
    \wr_bit_counter[1]_i_1 
       (.I0(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .I1(wr_bit_counter__0[1]),
        .I2(wr_bit_counter__0[0]),
        .I3(\wr_bit_counter[1]_i_2_n_0 ),
        .I4(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I5(tx_reg_i_4_n_1),
        .O(\wr_bit_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair197" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \wr_bit_counter[1]_i_2 
       (.I0(wr_bit_counter__0[2]),
        .I1(wr_bit_counter__0[3]),
        .O(\wr_bit_counter[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7878787800007800)) 
    \wr_bit_counter[2]_i_1 
       (.I0(wr_bit_counter__0[0]),
        .I1(wr_bit_counter__0[1]),
        .I2(wr_bit_counter__0[2]),
        .I3(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I4(tx_reg_i_4_n_1),
        .I5(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .O(wr_bit_counter[2]));
  LUT3 #(
    .INIT(8'hEA)) 
    \wr_bit_counter[3]_i_1 
       (.I0(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I1(stop_bit),
        .I2(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .O(\wr_bit_counter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7878787800007800)) 
    \wr_bit_counter[3]_i_2 
       (.I0(\wr_bit_counter[3]_i_3_n_0 ),
        .I1(wr_bit_counter__0[2]),
        .I2(wr_bit_counter__0[3]),
        .I3(\FSM_onehot_uart_tx_state_reg_n_0_[3] ),
        .I4(tx_reg_i_4_n_1),
        .I5(\FSM_onehot_uart_tx_state_reg_n_0_[5] ),
        .O(wr_bit_counter[3]));
  (* SOFT_HLUTNM = "soft_lutpair196" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \wr_bit_counter[3]_i_3 
       (.I0(wr_bit_counter__0[0]),
        .I1(wr_bit_counter__0[1]),
        .O(\wr_bit_counter[3]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \wr_bit_counter_reg[0] 
       (.C(uart_clk),
        .CE(\wr_bit_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\wr_bit_counter[0]_i_1_n_0 ),
        .Q(wr_bit_counter__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_bit_counter_reg[1] 
       (.C(uart_clk),
        .CE(\wr_bit_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\wr_bit_counter[1]_i_1_n_0 ),
        .Q(wr_bit_counter__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_bit_counter_reg[2] 
       (.C(uart_clk),
        .CE(\wr_bit_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(wr_bit_counter[2]),
        .Q(wr_bit_counter__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_bit_counter_reg[3] 
       (.C(uart_clk),
        .CE(\wr_bit_counter[3]_i_1_n_0 ),
        .CLR(rst),
        .D(wr_bit_counter[3]),
        .Q(wr_bit_counter__0[3]));
endmodule

(* BYTES = "1" *) (* BYTE_POINTER_WIDTH = "11" *) (* COUNTER_WIDTH = "8" *) 
(* DATA_WIDTH = "8" *) (* DEPTH = "256" *) (* DONE = "2'b11" *) 
(* IDEL = "2'b00" *) (* READ = "2'b10" *) (* WRITE = "2'b01" *) 
module UART_FIFO
   (rst,
    wr_clk,
    wr_en,
    wr_data,
    wr_ready,
    rd_clk,
    rd_en,
    rd_data,
    rd_ready,
    full,
    empty,
    used_entries);
  input rst;
  input wr_clk;
  input wr_en;
  input [7:0]wr_data;
  output wr_ready;
  input rd_clk;
  input rd_en;
  output [7:0]rd_data;
  output rd_ready;
  output full;
  output empty;
  output [8:0]used_entries;

  wire \FSM_onehot_rd_state[0]_i_1_n_0 ;
  wire \FSM_onehot_rd_state[1]_i_1_n_0 ;
  wire \FSM_onehot_rd_state[2]_i_1_n_0 ;
  wire \FSM_onehot_rd_state_reg_n_0_[0] ;
  wire \FSM_onehot_rd_state_reg_n_0_[1] ;
  wire empty;
  wire empty_INST_0_i_1_n_0;
  wire empty_INST_0_i_2_n_0;
  wire empty_INST_0_i_3_n_0;
  wire empty_INST_0_n_2;
  wire empty_INST_0_n_3;
  wire full;
  wire full0;
  wire full_INST_0_i_1_n_2;
  wire full_INST_0_i_1_n_3;
  wire full_INST_0_i_2_n_0;
  wire full_INST_0_i_3_n_0;
  wire full_INST_0_i_4_n_0;
  wire full_INST_0_i_5_n_0;
  wire full_INST_0_i_6_n_0;
  wire mem_reg_i_1_n_0;
  wire mem_reg_i_2_n_0;
  wire mem_reg_i_3_n_0;
  wire [0:0]p_0_in;
  wire [6:1]p_0_in__0;
  wire rd_clk;
  wire [7:0]rd_data;
  wire rd_en;
  wire rd_pointer;
  wire \rd_pointer[1]_i_1_n_0 ;
  wire \rd_pointer[2]_i_1_n_0 ;
  wire \rd_pointer[3]_i_1_n_0 ;
  wire \rd_pointer[4]_i_1_n_0 ;
  wire \rd_pointer[5]_i_1_n_0 ;
  wire \rd_pointer[6]_i_1_n_0 ;
  wire \rd_pointer[6]_i_2_n_0 ;
  wire \rd_pointer[7]_i_1_n_0 ;
  wire [7:0]rd_pointer_reg;
  wire rd_ready;
  wire rst;
  wire [7:0]sync_1;
  wire \sync_1[7]_i_1_n_0 ;
  wire [8:0]used_entries;
  wire [8:0]used_entries0;
  wire [7:0]used_entries00_in;
  wire used_entries1;
  wire \used_entries[3]_INST_0_i_10_n_0 ;
  wire \used_entries[3]_INST_0_i_11_n_0 ;
  wire \used_entries[3]_INST_0_i_12_n_0 ;
  wire \used_entries[3]_INST_0_i_13_n_0 ;
  wire \used_entries[3]_INST_0_i_1_n_0 ;
  wire \used_entries[3]_INST_0_i_1_n_1 ;
  wire \used_entries[3]_INST_0_i_1_n_2 ;
  wire \used_entries[3]_INST_0_i_1_n_3 ;
  wire \used_entries[3]_INST_0_i_2_n_0 ;
  wire \used_entries[3]_INST_0_i_2_n_1 ;
  wire \used_entries[3]_INST_0_i_2_n_2 ;
  wire \used_entries[3]_INST_0_i_2_n_3 ;
  wire \used_entries[3]_INST_0_i_3_n_0 ;
  wire \used_entries[3]_INST_0_i_4_n_0 ;
  wire \used_entries[3]_INST_0_i_5_n_0 ;
  wire \used_entries[3]_INST_0_i_6_n_0 ;
  wire \used_entries[7]_INST_0_i_10_n_0 ;
  wire \used_entries[7]_INST_0_i_11_n_0 ;
  wire \used_entries[7]_INST_0_i_12_n_0 ;
  wire \used_entries[7]_INST_0_i_13_n_0 ;
  wire \used_entries[7]_INST_0_i_1_n_0 ;
  wire \used_entries[7]_INST_0_i_1_n_1 ;
  wire \used_entries[7]_INST_0_i_1_n_2 ;
  wire \used_entries[7]_INST_0_i_1_n_3 ;
  wire \used_entries[7]_INST_0_i_2_n_0 ;
  wire \used_entries[7]_INST_0_i_2_n_1 ;
  wire \used_entries[7]_INST_0_i_2_n_2 ;
  wire \used_entries[7]_INST_0_i_2_n_3 ;
  wire \used_entries[7]_INST_0_i_3_n_0 ;
  wire \used_entries[7]_INST_0_i_4_n_0 ;
  wire \used_entries[7]_INST_0_i_5_n_0 ;
  wire \used_entries[7]_INST_0_i_6_n_0 ;
  wire \used_entries[8]_INST_0_i_10_n_0 ;
  wire \used_entries[8]_INST_0_i_11_n_0 ;
  wire \used_entries[8]_INST_0_i_2_n_3 ;
  wire \used_entries[8]_INST_0_i_3_n_1 ;
  wire \used_entries[8]_INST_0_i_3_n_2 ;
  wire \used_entries[8]_INST_0_i_3_n_3 ;
  wire \used_entries[8]_INST_0_i_4_n_0 ;
  wire \used_entries[8]_INST_0_i_5_n_0 ;
  wire \used_entries[8]_INST_0_i_6_n_0 ;
  wire \used_entries[8]_INST_0_i_7_n_0 ;
  wire \used_entries[8]_INST_0_i_8_n_0 ;
  wire \used_entries[8]_INST_0_i_9_n_0 ;
  wire wr_clk;
  wire [7:0]wr_data;
  wire wr_en;
  wire \wr_pointer[0]_i_1_n_0 ;
  wire \wr_pointer[1]_i_1_n_0 ;
  wire \wr_pointer[2]_i_1_n_0 ;
  wire \wr_pointer[3]_i_1_n_0 ;
  wire \wr_pointer[4]_i_1_n_0 ;
  wire \wr_pointer[5]_i_1_n_0 ;
  wire \wr_pointer[6]_i_1_n_0 ;
  wire \wr_pointer[7]_i_1_n_0 ;
  wire \wr_pointer[7]_i_2_n_0 ;
  wire \wr_pointer[7]_i_3_n_0 ;
  wire \wr_pointer_reg_n_0_[0] ;
  wire \wr_pointer_reg_n_0_[1] ;
  wire \wr_pointer_reg_n_0_[2] ;
  wire \wr_pointer_reg_n_0_[3] ;
  wire \wr_pointer_reg_n_0_[4] ;
  wire \wr_pointer_reg_n_0_[5] ;
  wire \wr_pointer_reg_n_0_[6] ;
  wire \wr_pointer_reg_n_0_[7] ;
  wire wr_ready;
  wire \wr_state[0]_i_1_n_0 ;
  wire [3:3]NLW_empty_INST_0_CO_UNCONNECTED;
  wire [3:0]NLW_empty_INST_0_O_UNCONNECTED;
  wire [3:3]NLW_full_INST_0_i_1_CO_UNCONNECTED;
  wire [3:0]NLW_full_INST_0_i_1_O_UNCONNECTED;
  wire [15:0]NLW_mem_reg_DOADO_UNCONNECTED;
  wire [15:8]NLW_mem_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;
  wire [3:1]\NLW_used_entries[8]_INST_0_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_used_entries[8]_INST_0_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_used_entries[8]_INST_0_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_used_entries[8]_INST_0_i_2_O_UNCONNECTED ;
  wire [3:0]\NLW_used_entries[8]_INST_0_i_3_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hBABAAABAFFFFFFFF)) 
    \FSM_onehot_rd_state[0]_i_1 
       (.I0(rd_pointer),
        .I1(rd_en),
        .I2(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I4(empty),
        .I5(rst),
        .O(\FSM_onehot_rd_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF5E0F0E000000000)) 
    \FSM_onehot_rd_state[1]_i_1 
       (.I0(rd_pointer),
        .I1(rd_en),
        .I2(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I4(empty),
        .I5(rst),
        .O(\FSM_onehot_rd_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEA00FF0000000000)) 
    \FSM_onehot_rd_state[2]_i_1 
       (.I0(rd_pointer),
        .I1(rd_en),
        .I2(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I4(empty),
        .I5(rst),
        .O(\FSM_onehot_rd_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "IDEL:001,READ:010,DONE:100," *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_rd_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "IDEL:001,READ:010,DONE:100," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rd_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "IDEL:001,READ:010,DONE:100," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rd_state_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[2]_i_1_n_0 ),
        .Q(rd_pointer),
        .R(1'b0));
  CARRY4 empty_INST_0
       (.CI(1'b0),
        .CO({NLW_empty_INST_0_CO_UNCONNECTED[3],empty,empty_INST_0_n_2,empty_INST_0_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_empty_INST_0_O_UNCONNECTED[3:0]),
        .S({1'b0,empty_INST_0_i_1_n_0,empty_INST_0_i_2_n_0,empty_INST_0_i_3_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    empty_INST_0_i_1
       (.I0(\wr_pointer_reg_n_0_[7] ),
        .I1(rd_pointer_reg[7]),
        .I2(\wr_pointer_reg_n_0_[6] ),
        .I3(rd_pointer_reg[6]),
        .O(empty_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    empty_INST_0_i_2
       (.I0(\wr_pointer_reg_n_0_[3] ),
        .I1(rd_pointer_reg[3]),
        .I2(rd_pointer_reg[4]),
        .I3(\wr_pointer_reg_n_0_[4] ),
        .I4(rd_pointer_reg[5]),
        .I5(\wr_pointer_reg_n_0_[5] ),
        .O(empty_INST_0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    empty_INST_0_i_3
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[1]),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(rd_pointer_reg[2]),
        .I5(\wr_pointer_reg_n_0_[2] ),
        .O(empty_INST_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair164" *) 
  LUT2 #(
    .INIT(4'h8)) 
    full_INST_0
       (.I0(full0),
        .I1(rst),
        .O(full));
  CARRY4 full_INST_0_i_1
       (.CI(1'b0),
        .CO({NLW_full_INST_0_i_1_CO_UNCONNECTED[3],full0,full_INST_0_i_1_n_2,full_INST_0_i_1_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_full_INST_0_i_1_O_UNCONNECTED[3:0]),
        .S({1'b0,full_INST_0_i_2_n_0,full_INST_0_i_3_n_0,full_INST_0_i_4_n_0}));
  LUT5 #(
    .INIT(32'h82411482)) 
    full_INST_0_i_2
       (.I0(rd_pointer_reg[6]),
        .I1(\wr_pointer_reg_n_0_[7] ),
        .I2(rd_pointer_reg[7]),
        .I3(\wr_pointer_reg_n_0_[6] ),
        .I4(\wr_pointer[7]_i_3_n_0 ),
        .O(full_INST_0_i_2_n_0));
  LUT6 #(
    .INIT(64'h4100004110080410)) 
    full_INST_0_i_3
       (.I0(full_INST_0_i_5_n_0),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .I2(full_INST_0_i_6_n_0),
        .I3(rd_pointer_reg[4]),
        .I4(\wr_pointer_reg_n_0_[4] ),
        .I5(rd_pointer_reg[3]),
        .O(full_INST_0_i_3_n_0));
  LUT6 #(
    .INIT(64'h0482100010000482)) 
    full_INST_0_i_4
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .I4(rd_pointer_reg[2]),
        .I5(\wr_pointer_reg_n_0_[2] ),
        .O(full_INST_0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    full_INST_0_i_5
       (.I0(\wr_pointer_reg_n_0_[5] ),
        .I1(rd_pointer_reg[5]),
        .O(full_INST_0_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    full_INST_0_i_6
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .O(full_INST_0_i_6_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "768" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({1'b1,1'b1,\wr_pointer_reg_n_0_[7] ,\wr_pointer_reg_n_0_[6] ,\wr_pointer_reg_n_0_[5] ,\wr_pointer_reg_n_0_[4] ,\wr_pointer_reg_n_0_[3] ,\wr_pointer_reg_n_0_[2] ,\wr_pointer_reg_n_0_[1] ,\wr_pointer_reg_n_0_[0] ,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,rd_pointer_reg,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sync_1}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_mem_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO({NLW_mem_reg_DOBDO_UNCONNECTED[15:8],rd_data}),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(wr_ready),
        .ENBWREN(mem_reg_i_1_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(mem_reg_i_2_n_0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({mem_reg_i_3_n_0,mem_reg_i_3_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'h4F)) 
    mem_reg_i_1
       (.I0(empty),
        .I1(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I2(rst),
        .O(mem_reg_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    mem_reg_i_2
       (.I0(rst),
        .O(mem_reg_i_2_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    mem_reg_i_3
       (.I0(rst),
        .I1(full0),
        .O(mem_reg_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_pointer[0]_i_1 
       (.I0(rd_pointer_reg[0]),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair166" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pointer[1]_i_1 
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .O(\rd_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair166" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \rd_pointer[2]_i_1 
       (.I0(rd_pointer_reg[2]),
        .I1(rd_pointer_reg[1]),
        .I2(rd_pointer_reg[0]),
        .O(\rd_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \rd_pointer[3]_i_1 
       (.I0(rd_pointer_reg[3]),
        .I1(rd_pointer_reg[2]),
        .I2(rd_pointer_reg[0]),
        .I3(rd_pointer_reg[1]),
        .O(\rd_pointer[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \rd_pointer[4]_i_1 
       (.I0(rd_pointer_reg[4]),
        .I1(rd_pointer_reg[3]),
        .I2(rd_pointer_reg[1]),
        .I3(rd_pointer_reg[0]),
        .I4(rd_pointer_reg[2]),
        .O(\rd_pointer[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \rd_pointer[5]_i_1 
       (.I0(rd_pointer_reg[5]),
        .I1(rd_pointer_reg[4]),
        .I2(rd_pointer_reg[2]),
        .I3(rd_pointer_reg[0]),
        .I4(rd_pointer_reg[1]),
        .I5(rd_pointer_reg[3]),
        .O(\rd_pointer[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair167" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pointer[6]_i_1 
       (.I0(rd_pointer_reg[6]),
        .I1(\rd_pointer[6]_i_2_n_0 ),
        .O(\rd_pointer[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \rd_pointer[6]_i_2 
       (.I0(rd_pointer_reg[5]),
        .I1(rd_pointer_reg[4]),
        .I2(rd_pointer_reg[2]),
        .I3(rd_pointer_reg[0]),
        .I4(rd_pointer_reg[1]),
        .I5(rd_pointer_reg[3]),
        .O(\rd_pointer[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair167" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \rd_pointer[7]_i_1 
       (.I0(rd_pointer_reg[7]),
        .I1(rd_pointer_reg[6]),
        .I2(\rd_pointer[6]_i_2_n_0 ),
        .O(\rd_pointer[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[0] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(p_0_in),
        .Q(rd_pointer_reg[0]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[1] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[1]_i_1_n_0 ),
        .Q(rd_pointer_reg[1]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[2] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[2]_i_1_n_0 ),
        .Q(rd_pointer_reg[2]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[3] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[3]_i_1_n_0 ),
        .Q(rd_pointer_reg[3]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[4] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[4]_i_1_n_0 ),
        .Q(rd_pointer_reg[4]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[5] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[5]_i_1_n_0 ),
        .Q(rd_pointer_reg[5]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[6] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[6]_i_1_n_0 ),
        .Q(rd_pointer_reg[6]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[7] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[7]_i_1_n_0 ),
        .Q(rd_pointer_reg[7]),
        .R(mem_reg_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    rd_ready_INST_0
       (.I0(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .O(rd_ready));
  LUT2 #(
    .INIT(4'h2)) 
    \sync_1[7]_i_1 
       (.I0(wr_en),
        .I1(wr_ready),
        .O(\sync_1[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[0] 
       (.C(wr_clk),
        .CE(\sync_1[7]_i_1_n_0 ),
        .D(wr_data[0]),
        .Q(sync_1[0]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[1] 
       (.C(wr_clk),
        .CE(\sync_1[7]_i_1_n_0 ),
        .D(wr_data[1]),
        .Q(sync_1[1]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[2] 
       (.C(wr_clk),
        .CE(\sync_1[7]_i_1_n_0 ),
        .D(wr_data[2]),
        .Q(sync_1[2]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[3] 
       (.C(wr_clk),
        .CE(\sync_1[7]_i_1_n_0 ),
        .D(wr_data[3]),
        .Q(sync_1[3]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[4] 
       (.C(wr_clk),
        .CE(\sync_1[7]_i_1_n_0 ),
        .D(wr_data[4]),
        .Q(sync_1[4]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[5] 
       (.C(wr_clk),
        .CE(\sync_1[7]_i_1_n_0 ),
        .D(wr_data[5]),
        .Q(sync_1[5]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[6] 
       (.C(wr_clk),
        .CE(\sync_1[7]_i_1_n_0 ),
        .D(wr_data[6]),
        .Q(sync_1[6]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[7] 
       (.C(wr_clk),
        .CE(\sync_1[7]_i_1_n_0 ),
        .D(wr_data[7]),
        .Q(sync_1[7]),
        .R(mem_reg_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \used_entries[0]_INST_0 
       (.I0(used_entries00_in[0]),
        .I1(used_entries1),
        .I2(used_entries0[0]),
        .O(used_entries[0]));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \used_entries[1]_INST_0 
       (.I0(used_entries00_in[1]),
        .I1(used_entries1),
        .I2(used_entries0[1]),
        .O(used_entries[1]));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \used_entries[2]_INST_0 
       (.I0(used_entries00_in[2]),
        .I1(used_entries1),
        .I2(used_entries0[2]),
        .O(used_entries[2]));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \used_entries[3]_INST_0 
       (.I0(used_entries00_in[3]),
        .I1(used_entries1),
        .I2(used_entries0[3]),
        .O(used_entries[3]));
  CARRY4 \used_entries[3]_INST_0_i_1 
       (.CI(1'b0),
        .CO({\used_entries[3]_INST_0_i_1_n_0 ,\used_entries[3]_INST_0_i_1_n_1 ,\used_entries[3]_INST_0_i_1_n_2 ,\used_entries[3]_INST_0_i_1_n_3 }),
        .CYINIT(1'b1),
        .DI({\wr_pointer_reg_n_0_[3] ,\wr_pointer_reg_n_0_[2] ,\wr_pointer_reg_n_0_[1] ,\wr_pointer_reg_n_0_[0] }),
        .O(used_entries00_in[3:0]),
        .S({\used_entries[3]_INST_0_i_3_n_0 ,\used_entries[3]_INST_0_i_4_n_0 ,\used_entries[3]_INST_0_i_5_n_0 ,\used_entries[3]_INST_0_i_6_n_0 }));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[3]_INST_0_i_10 
       (.I0(rd_pointer_reg[3]),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .O(\used_entries[3]_INST_0_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[3]_INST_0_i_11 
       (.I0(rd_pointer_reg[2]),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .O(\used_entries[3]_INST_0_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[3]_INST_0_i_12 
       (.I0(rd_pointer_reg[1]),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .O(\used_entries[3]_INST_0_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[3]_INST_0_i_13 
       (.I0(rd_pointer_reg[0]),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .O(\used_entries[3]_INST_0_i_13_n_0 ));
  CARRY4 \used_entries[3]_INST_0_i_2 
       (.CI(1'b0),
        .CO({\used_entries[3]_INST_0_i_2_n_0 ,\used_entries[3]_INST_0_i_2_n_1 ,\used_entries[3]_INST_0_i_2_n_2 ,\used_entries[3]_INST_0_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI({p_0_in__0[3:1],\wr_pointer_reg_n_0_[0] }),
        .O(used_entries0[3:0]),
        .S({\used_entries[3]_INST_0_i_10_n_0 ,\used_entries[3]_INST_0_i_11_n_0 ,\used_entries[3]_INST_0_i_12_n_0 ,\used_entries[3]_INST_0_i_13_n_0 }));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[3]_INST_0_i_3 
       (.I0(rd_pointer_reg[3]),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .O(\used_entries[3]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[3]_INST_0_i_4 
       (.I0(rd_pointer_reg[2]),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .O(\used_entries[3]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[3]_INST_0_i_5 
       (.I0(rd_pointer_reg[1]),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .O(\used_entries[3]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[3]_INST_0_i_6 
       (.I0(rd_pointer_reg[0]),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .O(\used_entries[3]_INST_0_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \used_entries[3]_INST_0_i_7 
       (.I0(rd_pointer_reg[3]),
        .O(p_0_in__0[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \used_entries[3]_INST_0_i_8 
       (.I0(rd_pointer_reg[2]),
        .O(p_0_in__0[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \used_entries[3]_INST_0_i_9 
       (.I0(rd_pointer_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \used_entries[4]_INST_0 
       (.I0(used_entries00_in[4]),
        .I1(used_entries1),
        .I2(used_entries0[4]),
        .O(used_entries[4]));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \used_entries[5]_INST_0 
       (.I0(used_entries00_in[5]),
        .I1(used_entries1),
        .I2(used_entries0[5]),
        .O(used_entries[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \used_entries[6]_INST_0 
       (.I0(used_entries00_in[6]),
        .I1(used_entries1),
        .I2(used_entries0[6]),
        .O(used_entries[6]));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \used_entries[7]_INST_0 
       (.I0(used_entries00_in[7]),
        .I1(used_entries1),
        .I2(used_entries0[7]),
        .O(used_entries[7]));
  CARRY4 \used_entries[7]_INST_0_i_1 
       (.CI(\used_entries[3]_INST_0_i_1_n_0 ),
        .CO({\used_entries[7]_INST_0_i_1_n_0 ,\used_entries[7]_INST_0_i_1_n_1 ,\used_entries[7]_INST_0_i_1_n_2 ,\used_entries[7]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\wr_pointer_reg_n_0_[7] ,\wr_pointer_reg_n_0_[6] ,\wr_pointer_reg_n_0_[5] ,\wr_pointer_reg_n_0_[4] }),
        .O(used_entries00_in[7:4]),
        .S({\used_entries[7]_INST_0_i_3_n_0 ,\used_entries[7]_INST_0_i_4_n_0 ,\used_entries[7]_INST_0_i_5_n_0 ,\used_entries[7]_INST_0_i_6_n_0 }));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[7]_INST_0_i_10 
       (.I0(rd_pointer_reg[7]),
        .I1(\wr_pointer_reg_n_0_[7] ),
        .O(\used_entries[7]_INST_0_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[7]_INST_0_i_11 
       (.I0(rd_pointer_reg[6]),
        .I1(\wr_pointer_reg_n_0_[6] ),
        .O(\used_entries[7]_INST_0_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[7]_INST_0_i_12 
       (.I0(rd_pointer_reg[5]),
        .I1(\wr_pointer_reg_n_0_[5] ),
        .O(\used_entries[7]_INST_0_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[7]_INST_0_i_13 
       (.I0(rd_pointer_reg[4]),
        .I1(\wr_pointer_reg_n_0_[4] ),
        .O(\used_entries[7]_INST_0_i_13_n_0 ));
  CARRY4 \used_entries[7]_INST_0_i_2 
       (.CI(\used_entries[3]_INST_0_i_2_n_0 ),
        .CO({\used_entries[7]_INST_0_i_2_n_0 ,\used_entries[7]_INST_0_i_2_n_1 ,\used_entries[7]_INST_0_i_2_n_2 ,\used_entries[7]_INST_0_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\wr_pointer_reg_n_0_[7] ,p_0_in__0[6:4]}),
        .O(used_entries0[7:4]),
        .S({\used_entries[7]_INST_0_i_10_n_0 ,\used_entries[7]_INST_0_i_11_n_0 ,\used_entries[7]_INST_0_i_12_n_0 ,\used_entries[7]_INST_0_i_13_n_0 }));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[7]_INST_0_i_3 
       (.I0(rd_pointer_reg[7]),
        .I1(\wr_pointer_reg_n_0_[7] ),
        .O(\used_entries[7]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[7]_INST_0_i_4 
       (.I0(\wr_pointer_reg_n_0_[6] ),
        .I1(rd_pointer_reg[6]),
        .O(\used_entries[7]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[7]_INST_0_i_5 
       (.I0(rd_pointer_reg[5]),
        .I1(\wr_pointer_reg_n_0_[5] ),
        .O(\used_entries[7]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \used_entries[7]_INST_0_i_6 
       (.I0(\wr_pointer_reg_n_0_[4] ),
        .I1(rd_pointer_reg[4]),
        .O(\used_entries[7]_INST_0_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \used_entries[7]_INST_0_i_7 
       (.I0(rd_pointer_reg[6]),
        .O(p_0_in__0[6]));
  LUT1 #(
    .INIT(2'h1)) 
    \used_entries[7]_INST_0_i_8 
       (.I0(rd_pointer_reg[5]),
        .O(p_0_in__0[5]));
  LUT1 #(
    .INIT(2'h1)) 
    \used_entries[7]_INST_0_i_9 
       (.I0(rd_pointer_reg[4]),
        .O(p_0_in__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT3 #(
    .INIT(8'h3A)) 
    \used_entries[8]_INST_0 
       (.I0(used_entries0[8]),
        .I1(\used_entries[8]_INST_0_i_2_n_3 ),
        .I2(used_entries1),
        .O(used_entries[8]));
  CARRY4 \used_entries[8]_INST_0_i_1 
       (.CI(\used_entries[7]_INST_0_i_2_n_0 ),
        .CO({\NLW_used_entries[8]_INST_0_i_1_CO_UNCONNECTED [3:1],used_entries0[8]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_used_entries[8]_INST_0_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT4 #(
    .INIT(16'h9009)) 
    \used_entries[8]_INST_0_i_10 
       (.I0(rd_pointer_reg[2]),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .I2(rd_pointer_reg[3]),
        .I3(\wr_pointer_reg_n_0_[3] ),
        .O(\used_entries[8]_INST_0_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \used_entries[8]_INST_0_i_11 
       (.I0(rd_pointer_reg[1]),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .I2(rd_pointer_reg[0]),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .O(\used_entries[8]_INST_0_i_11_n_0 ));
  CARRY4 \used_entries[8]_INST_0_i_2 
       (.CI(\used_entries[7]_INST_0_i_1_n_0 ),
        .CO({\NLW_used_entries[8]_INST_0_i_2_CO_UNCONNECTED [3:1],\used_entries[8]_INST_0_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_used_entries[8]_INST_0_i_2_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 \used_entries[8]_INST_0_i_3 
       (.CI(1'b0),
        .CO({used_entries1,\used_entries[8]_INST_0_i_3_n_1 ,\used_entries[8]_INST_0_i_3_n_2 ,\used_entries[8]_INST_0_i_3_n_3 }),
        .CYINIT(1'b1),
        .DI({\used_entries[8]_INST_0_i_4_n_0 ,\used_entries[8]_INST_0_i_5_n_0 ,\used_entries[8]_INST_0_i_6_n_0 ,\used_entries[8]_INST_0_i_7_n_0 }),
        .O(\NLW_used_entries[8]_INST_0_i_3_O_UNCONNECTED [3:0]),
        .S({\used_entries[8]_INST_0_i_8_n_0 ,\used_entries[8]_INST_0_i_9_n_0 ,\used_entries[8]_INST_0_i_10_n_0 ,\used_entries[8]_INST_0_i_11_n_0 }));
  LUT4 #(
    .INIT(16'h22B2)) 
    \used_entries[8]_INST_0_i_4 
       (.I0(\wr_pointer_reg_n_0_[7] ),
        .I1(rd_pointer_reg[7]),
        .I2(\wr_pointer_reg_n_0_[6] ),
        .I3(rd_pointer_reg[6]),
        .O(\used_entries[8]_INST_0_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \used_entries[8]_INST_0_i_5 
       (.I0(\wr_pointer_reg_n_0_[5] ),
        .I1(rd_pointer_reg[5]),
        .I2(\wr_pointer_reg_n_0_[4] ),
        .I3(rd_pointer_reg[4]),
        .O(\used_entries[8]_INST_0_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \used_entries[8]_INST_0_i_6 
       (.I0(\wr_pointer_reg_n_0_[3] ),
        .I1(rd_pointer_reg[3]),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(rd_pointer_reg[2]),
        .O(\used_entries[8]_INST_0_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \used_entries[8]_INST_0_i_7 
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(rd_pointer_reg[1]),
        .I2(\wr_pointer_reg_n_0_[0] ),
        .I3(rd_pointer_reg[0]),
        .O(\used_entries[8]_INST_0_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \used_entries[8]_INST_0_i_8 
       (.I0(rd_pointer_reg[6]),
        .I1(\wr_pointer_reg_n_0_[6] ),
        .I2(rd_pointer_reg[7]),
        .I3(\wr_pointer_reg_n_0_[7] ),
        .O(\used_entries[8]_INST_0_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \used_entries[8]_INST_0_i_9 
       (.I0(rd_pointer_reg[4]),
        .I1(\wr_pointer_reg_n_0_[4] ),
        .I2(rd_pointer_reg[5]),
        .I3(\wr_pointer_reg_n_0_[5] ),
        .O(\used_entries[8]_INST_0_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair168" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \wr_pointer[0]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .O(\wr_pointer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair168" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pointer[1]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \wr_pointer[2]_i_1 
       (.I0(\wr_pointer_reg_n_0_[2] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \wr_pointer[3]_i_1 
       (.I0(\wr_pointer_reg_n_0_[3] ),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .I2(\wr_pointer_reg_n_0_[0] ),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \wr_pointer[4]_i_1 
       (.I0(\wr_pointer_reg_n_0_[4] ),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .I4(\wr_pointer_reg_n_0_[2] ),
        .O(\wr_pointer[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \wr_pointer[5]_i_1 
       (.I0(\wr_pointer_reg_n_0_[5] ),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .I4(\wr_pointer_reg_n_0_[2] ),
        .I5(\wr_pointer_reg_n_0_[4] ),
        .O(\wr_pointer[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair165" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \wr_pointer[6]_i_1 
       (.I0(\wr_pointer_reg_n_0_[6] ),
        .I1(\wr_pointer[7]_i_3_n_0 ),
        .O(\wr_pointer[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \wr_pointer[7]_i_1 
       (.I0(wr_ready),
        .I1(full0),
        .O(\wr_pointer[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair165" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \wr_pointer[7]_i_2 
       (.I0(\wr_pointer_reg_n_0_[7] ),
        .I1(\wr_pointer[7]_i_3_n_0 ),
        .I2(\wr_pointer_reg_n_0_[6] ),
        .O(\wr_pointer[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \wr_pointer[7]_i_3 
       (.I0(\wr_pointer_reg_n_0_[4] ),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .I2(\wr_pointer_reg_n_0_[0] ),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(\wr_pointer_reg_n_0_[3] ),
        .I5(\wr_pointer_reg_n_0_[5] ),
        .O(\wr_pointer[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[0] 
       (.C(wr_clk),
        .CE(\wr_pointer[7]_i_1_n_0 ),
        .D(\wr_pointer[0]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[0] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[1] 
       (.C(wr_clk),
        .CE(\wr_pointer[7]_i_1_n_0 ),
        .D(\wr_pointer[1]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[1] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[2] 
       (.C(wr_clk),
        .CE(\wr_pointer[7]_i_1_n_0 ),
        .D(\wr_pointer[2]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[2] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[3] 
       (.C(wr_clk),
        .CE(\wr_pointer[7]_i_1_n_0 ),
        .D(\wr_pointer[3]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[3] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[4] 
       (.C(wr_clk),
        .CE(\wr_pointer[7]_i_1_n_0 ),
        .D(\wr_pointer[4]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[4] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[5] 
       (.C(wr_clk),
        .CE(\wr_pointer[7]_i_1_n_0 ),
        .D(\wr_pointer[5]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[5] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[6] 
       (.C(wr_clk),
        .CE(\wr_pointer[7]_i_1_n_0 ),
        .D(\wr_pointer[6]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[6] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[7] 
       (.C(wr_clk),
        .CE(\wr_pointer[7]_i_1_n_0 ),
        .D(\wr_pointer[7]_i_2_n_0 ),
        .Q(\wr_pointer_reg_n_0_[7] ),
        .R(mem_reg_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair164" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \wr_state[0]_i_1 
       (.I0(wr_ready),
        .I1(wr_en),
        .I2(rst),
        .O(\wr_state[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_state_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\wr_state[0]_i_1_n_0 ),
        .Q(wr_ready),
        .R(1'b0));
endmodule

(* BYTES = "8" *) (* BYTE_POINTER_WIDTH = "8" *) (* COUNTER_WIDTH = "5" *) 
(* DATA_WIDTH = "64" *) (* DEPTH = "32" *) (* DONE = "2'b11" *) 
(* IDEL = "2'b00" *) (* ORIG_REF_NAME = "UART_FIFO" *) (* READ = "2'b10" *) 
(* WRITE = "2'b01" *) 
module UART_FIFO__parameterized0
   (rst,
    wr_clk,
    wr_en,
    wr_data,
    wr_ready,
    rd_clk,
    rd_en,
    rd_data,
    rd_ready,
    full,
    empty,
    used_entries);
  input rst;
  input wr_clk;
  input wr_en;
  input [63:0]wr_data;
  output wr_ready;
  input rd_clk;
  input rd_en;
  output [63:0]rd_data;
  output rd_ready;
  output full;
  output empty;
  output [5:0]used_entries;

  wire \<const0> ;
  wire \FSM_onehot_rd_state[0]_i_1_n_0 ;
  wire \FSM_onehot_rd_state[1]_i_1_n_0 ;
  wire \FSM_onehot_rd_state[2]_i_1_n_0 ;
  wire \FSM_onehot_rd_state[2]_i_2_n_0 ;
  wire \FSM_onehot_rd_state[2]_i_3_n_0 ;
  wire \FSM_onehot_rd_state_reg_n_0_[0] ;
  wire \FSM_onehot_rd_state_reg_n_0_[1] ;
  wire empty;
  wire empty_INST_0_i_1_n_0;
  wire full;
  wire full_INST_0_i_1_n_0;
  wire full_INST_0_i_2_n_0;
  wire full_INST_0_i_3_n_0;
  wire mem_reg_i_1_n_0;
  wire mem_reg_i_2_n_0;
  wire mem_reg_i_3_n_0;
  wire mem_reg_i_4_n_0;
  wire [0:0]p_0_in;
  wire rd_clk;
  wire [63:0]rd_data;
  wire rd_en;
  wire rd_pointer;
  wire \rd_pointer[1]_i_1_n_0 ;
  wire \rd_pointer[2]_i_1_n_0 ;
  wire \rd_pointer[3]_i_1_n_0 ;
  wire \rd_pointer[4]_i_1_n_0 ;
  wire [4:0]rd_pointer_reg;
  wire rd_ready;
  wire rst;
  wire [63:0]sync_1;
  wire \sync_1[63]_i_1_n_0 ;
  wire [4:0]\^used_entries ;
  wire \used_entries[4]_INST_0_i_1_n_0 ;
  wire wr_clk;
  wire [63:0]wr_data;
  wire wr_en;
  wire \wr_pointer[0]_i_1_n_0 ;
  wire \wr_pointer[1]_i_1_n_0 ;
  wire \wr_pointer[2]_i_1_n_0 ;
  wire \wr_pointer[3]_i_1_n_0 ;
  wire \wr_pointer[4]_i_1_n_0 ;
  wire \wr_pointer[4]_i_2_n_0 ;
  wire \wr_pointer_reg_n_0_[0] ;
  wire \wr_pointer_reg_n_0_[1] ;
  wire \wr_pointer_reg_n_0_[2] ;
  wire \wr_pointer_reg_n_0_[3] ;
  wire \wr_pointer_reg_n_0_[4] ;
  wire wr_ready;
  wire \wr_state[0]_i_1_n_0 ;
  wire NLW_mem_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_SBITERR_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_RDADDRECC_UNCONNECTED;

  assign used_entries[5] = \<const0> ;
  assign used_entries[4:0] = \^used_entries [4:0];
  (* SOFT_HLUTNM = "soft_lutpair175" *) 
  LUT4 #(
    .INIT(16'hE2FF)) 
    \FSM_onehot_rd_state[0]_i_1 
       (.I0(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_rd_state[2]_i_2_n_0 ),
        .I2(rd_pointer),
        .I3(rst),
        .O(\FSM_onehot_rd_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair174" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \FSM_onehot_rd_state[1]_i_1 
       (.I0(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_rd_state[2]_i_2_n_0 ),
        .I2(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I3(rst),
        .O(\FSM_onehot_rd_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair174" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \FSM_onehot_rd_state[2]_i_1 
       (.I0(rd_pointer),
        .I1(\FSM_onehot_rd_state[2]_i_2_n_0 ),
        .I2(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I3(rst),
        .O(\FSM_onehot_rd_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFD0D0D0)) 
    \FSM_onehot_rd_state[2]_i_2 
       (.I0(\FSM_onehot_rd_state[2]_i_3_n_0 ),
        .I1(empty_INST_0_i_1_n_0),
        .I2(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .I4(rd_en),
        .I5(rd_pointer),
        .O(\FSM_onehot_rd_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair169" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_onehot_rd_state[2]_i_3 
       (.I0(rd_pointer_reg[2]),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .I2(rd_pointer_reg[1]),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .O(\FSM_onehot_rd_state[2]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "IDEL:001,READ:010,DONE:100," *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_rd_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "IDEL:001,READ:010,DONE:100," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rd_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "IDEL:001,READ:010,DONE:100," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rd_state_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rd_state[2]_i_1_n_0 ),
        .Q(rd_pointer),
        .R(1'b0));
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair169" *) 
  LUT5 #(
    .INIT(32'h00009009)) 
    empty_INST_0
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(rd_pointer_reg[1]),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .I3(rd_pointer_reg[2]),
        .I4(empty_INST_0_i_1_n_0),
        .O(empty));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    empty_INST_0_i_1
       (.I0(rd_pointer_reg[3]),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .I2(\wr_pointer_reg_n_0_[0] ),
        .I3(rd_pointer_reg[0]),
        .I4(\wr_pointer_reg_n_0_[4] ),
        .I5(rd_pointer_reg[4]),
        .O(empty_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h000000002A80802A)) 
    full_INST_0
       (.I0(rst),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(rd_pointer_reg[2]),
        .I4(\wr_pointer_reg_n_0_[2] ),
        .I5(full_INST_0_i_1_n_0),
        .O(full));
  LUT6 #(
    .INIT(64'hF6FFFFF9FFF6F6FF)) 
    full_INST_0_i_1
       (.I0(\wr_pointer_reg_n_0_[4] ),
        .I1(rd_pointer_reg[4]),
        .I2(full_INST_0_i_2_n_0),
        .I3(full_INST_0_i_3_n_0),
        .I4(rd_pointer_reg[3]),
        .I5(\wr_pointer_reg_n_0_[3] ),
        .O(full_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair173" *) 
  LUT4 #(
    .INIT(16'hF69F)) 
    full_INST_0_i_2
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(rd_pointer_reg[1]),
        .I2(\wr_pointer_reg_n_0_[0] ),
        .I3(rd_pointer_reg[0]),
        .O(full_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair177" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    full_INST_0_i_3
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(\wr_pointer_reg_n_0_[1] ),
        .I2(\wr_pointer_reg_n_0_[2] ),
        .O(full_INST_0_i_3_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "511" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "63" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "480" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "63" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    mem_reg
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,rd_pointer_reg,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,\wr_pointer_reg_n_0_[4] ,\wr_pointer_reg_n_0_[3] ,\wr_pointer_reg_n_0_[2] ,\wr_pointer_reg_n_0_[1] ,\wr_pointer_reg_n_0_[0] ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_mem_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(rd_clk),
        .CLKBWRCLK(wr_clk),
        .DBITERR(NLW_mem_reg_DBITERR_UNCONNECTED),
        .DIADI(sync_1[31:0]),
        .DIBDI(sync_1[63:32]),
        .DIPADIP({1'b1,1'b1,1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO(rd_data[31:0]),
        .DOBDO(rd_data[63:32]),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_mem_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(mem_reg_i_1_n_0),
        .ENBWREN(wr_ready),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_mem_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(mem_reg_i_2_n_0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0,mem_reg_i_3_n_0}));
  LUT2 #(
    .INIT(4'hB)) 
    mem_reg_i_1
       (.I0(mem_reg_i_4_n_0),
        .I1(rst),
        .O(mem_reg_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    mem_reg_i_2
       (.I0(rst),
        .O(mem_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'hEBBEBEBEFFFFFFFF)) 
    mem_reg_i_3
       (.I0(full_INST_0_i_1_n_0),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .I2(rd_pointer_reg[2]),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .I4(\wr_pointer_reg_n_0_[0] ),
        .I5(rst),
        .O(mem_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'h8AA8AAAAAAAA8AA8)) 
    mem_reg_i_4
       (.I0(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I1(empty_INST_0_i_1_n_0),
        .I2(rd_pointer_reg[2]),
        .I3(\wr_pointer_reg_n_0_[2] ),
        .I4(rd_pointer_reg[1]),
        .I5(\wr_pointer_reg_n_0_[1] ),
        .O(mem_reg_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_pointer[0]_i_1 
       (.I0(rd_pointer_reg[0]),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair176" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pointer[1]_i_1 
       (.I0(rd_pointer_reg[1]),
        .I1(rd_pointer_reg[0]),
        .O(\rd_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair176" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \rd_pointer[2]_i_1 
       (.I0(rd_pointer_reg[2]),
        .I1(rd_pointer_reg[1]),
        .I2(rd_pointer_reg[0]),
        .O(\rd_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair172" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rd_pointer[3]_i_1 
       (.I0(rd_pointer_reg[0]),
        .I1(rd_pointer_reg[1]),
        .I2(rd_pointer_reg[2]),
        .I3(rd_pointer_reg[3]),
        .O(\rd_pointer[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair172" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \rd_pointer[4]_i_1 
       (.I0(rd_pointer_reg[4]),
        .I1(rd_pointer_reg[0]),
        .I2(rd_pointer_reg[1]),
        .I3(rd_pointer_reg[2]),
        .I4(rd_pointer_reg[3]),
        .O(\rd_pointer[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[0] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(p_0_in),
        .Q(rd_pointer_reg[0]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[1] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[1]_i_1_n_0 ),
        .Q(rd_pointer_reg[1]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[2] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[2]_i_1_n_0 ),
        .Q(rd_pointer_reg[2]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[3] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[3]_i_1_n_0 ),
        .Q(rd_pointer_reg[3]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_pointer_reg[4] 
       (.C(rd_clk),
        .CE(rd_pointer),
        .D(\rd_pointer[4]_i_1_n_0 ),
        .Q(rd_pointer_reg[4]),
        .R(mem_reg_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair175" *) 
  LUT2 #(
    .INIT(4'h1)) 
    rd_ready_INST_0
       (.I0(\FSM_onehot_rd_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_rd_state_reg_n_0_[0] ),
        .O(rd_ready));
  LUT2 #(
    .INIT(4'h2)) 
    \sync_1[63]_i_1 
       (.I0(wr_en),
        .I1(wr_ready),
        .O(\sync_1[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[0] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[0]),
        .Q(sync_1[0]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[10] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[10]),
        .Q(sync_1[10]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[11] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[11]),
        .Q(sync_1[11]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[12] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[12]),
        .Q(sync_1[12]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[13] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[13]),
        .Q(sync_1[13]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[14] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[14]),
        .Q(sync_1[14]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[15] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[15]),
        .Q(sync_1[15]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[16] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[16]),
        .Q(sync_1[16]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[17] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[17]),
        .Q(sync_1[17]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[18] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[18]),
        .Q(sync_1[18]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[19] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[19]),
        .Q(sync_1[19]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[1] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[1]),
        .Q(sync_1[1]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[20] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[20]),
        .Q(sync_1[20]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[21] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[21]),
        .Q(sync_1[21]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[22] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[22]),
        .Q(sync_1[22]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[23] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[23]),
        .Q(sync_1[23]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[24] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[24]),
        .Q(sync_1[24]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[25] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[25]),
        .Q(sync_1[25]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[26] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[26]),
        .Q(sync_1[26]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[27] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[27]),
        .Q(sync_1[27]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[28] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[28]),
        .Q(sync_1[28]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[29] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[29]),
        .Q(sync_1[29]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[2] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[2]),
        .Q(sync_1[2]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[30] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[30]),
        .Q(sync_1[30]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[31] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[31]),
        .Q(sync_1[31]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[32] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[32]),
        .Q(sync_1[32]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[33] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[33]),
        .Q(sync_1[33]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[34] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[34]),
        .Q(sync_1[34]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[35] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[35]),
        .Q(sync_1[35]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[36] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[36]),
        .Q(sync_1[36]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[37] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[37]),
        .Q(sync_1[37]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[38] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[38]),
        .Q(sync_1[38]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[39] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[39]),
        .Q(sync_1[39]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[3] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[3]),
        .Q(sync_1[3]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[40] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[40]),
        .Q(sync_1[40]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[41] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[41]),
        .Q(sync_1[41]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[42] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[42]),
        .Q(sync_1[42]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[43] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[43]),
        .Q(sync_1[43]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[44] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[44]),
        .Q(sync_1[44]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[45] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[45]),
        .Q(sync_1[45]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[46] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[46]),
        .Q(sync_1[46]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[47] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[47]),
        .Q(sync_1[47]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[48] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[48]),
        .Q(sync_1[48]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[49] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[49]),
        .Q(sync_1[49]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[4] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[4]),
        .Q(sync_1[4]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[50] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[50]),
        .Q(sync_1[50]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[51] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[51]),
        .Q(sync_1[51]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[52] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[52]),
        .Q(sync_1[52]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[53] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[53]),
        .Q(sync_1[53]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[54] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[54]),
        .Q(sync_1[54]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[55] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[55]),
        .Q(sync_1[55]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[56] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[56]),
        .Q(sync_1[56]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[57] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[57]),
        .Q(sync_1[57]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[58] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[58]),
        .Q(sync_1[58]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[59] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[59]),
        .Q(sync_1[59]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[5] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[5]),
        .Q(sync_1[5]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[60] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[60]),
        .Q(sync_1[60]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[61] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[61]),
        .Q(sync_1[61]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[62] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[62]),
        .Q(sync_1[62]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[63] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[63]),
        .Q(sync_1[63]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[6] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[6]),
        .Q(sync_1[6]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[7] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[7]),
        .Q(sync_1[7]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[8] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[8]),
        .Q(sync_1[8]),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \sync_1_reg[9] 
       (.C(wr_clk),
        .CE(\sync_1[63]_i_1_n_0 ),
        .D(wr_data[9]),
        .Q(sync_1[9]),
        .R(mem_reg_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair178" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \used_entries[0]_INST_0 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .I1(rd_pointer_reg[0]),
        .O(\^used_entries [0]));
  (* SOFT_HLUTNM = "soft_lutpair173" *) 
  LUT4 #(
    .INIT(16'h2DD2)) 
    \used_entries[1]_INST_0 
       (.I0(rd_pointer_reg[0]),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(rd_pointer_reg[1]),
        .I3(\wr_pointer_reg_n_0_[1] ),
        .O(\^used_entries [1]));
  LUT6 #(
    .INIT(64'h6696666699996696)) 
    \used_entries[2]_INST_0 
       (.I0(rd_pointer_reg[2]),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .I2(rd_pointer_reg[0]),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .I4(rd_pointer_reg[1]),
        .I5(\wr_pointer_reg_n_0_[1] ),
        .O(\^used_entries [2]));
  (* SOFT_HLUTNM = "soft_lutpair170" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \used_entries[3]_INST_0 
       (.I0(rd_pointer_reg[3]),
        .I1(\wr_pointer_reg_n_0_[3] ),
        .I2(\used_entries[4]_INST_0_i_1_n_0 ),
        .O(\^used_entries [3]));
  (* SOFT_HLUTNM = "soft_lutpair170" *) 
  LUT5 #(
    .INIT(32'h96996696)) 
    \used_entries[4]_INST_0 
       (.I0(rd_pointer_reg[4]),
        .I1(\wr_pointer_reg_n_0_[4] ),
        .I2(rd_pointer_reg[3]),
        .I3(\wr_pointer_reg_n_0_[3] ),
        .I4(\used_entries[4]_INST_0_i_1_n_0 ),
        .O(\^used_entries [4]));
  LUT6 #(
    .INIT(64'h4D44FFFF00004D44)) 
    \used_entries[4]_INST_0_i_1 
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(rd_pointer_reg[1]),
        .I2(\wr_pointer_reg_n_0_[0] ),
        .I3(rd_pointer_reg[0]),
        .I4(\wr_pointer_reg_n_0_[2] ),
        .I5(rd_pointer_reg[2]),
        .O(\used_entries[4]_INST_0_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_pointer[0]_i_1 
       (.I0(\wr_pointer_reg_n_0_[0] ),
        .O(\wr_pointer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair178" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pointer[1]_i_1 
       (.I0(\wr_pointer_reg_n_0_[1] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .O(\wr_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair177" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \wr_pointer[2]_i_1 
       (.I0(\wr_pointer_reg_n_0_[2] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .O(\wr_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair171" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \wr_pointer[3]_i_1 
       (.I0(\wr_pointer_reg_n_0_[3] ),
        .I1(\wr_pointer_reg_n_0_[2] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(\wr_pointer_reg_n_0_[0] ),
        .O(\wr_pointer[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF090F060F060F060)) 
    \wr_pointer[4]_i_1 
       (.I0(\wr_pointer_reg_n_0_[2] ),
        .I1(rd_pointer_reg[2]),
        .I2(wr_ready),
        .I3(full_INST_0_i_1_n_0),
        .I4(\wr_pointer_reg_n_0_[1] ),
        .I5(\wr_pointer_reg_n_0_[0] ),
        .O(\wr_pointer[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair171" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \wr_pointer[4]_i_2 
       (.I0(\wr_pointer_reg_n_0_[4] ),
        .I1(\wr_pointer_reg_n_0_[0] ),
        .I2(\wr_pointer_reg_n_0_[1] ),
        .I3(\wr_pointer_reg_n_0_[2] ),
        .I4(\wr_pointer_reg_n_0_[3] ),
        .O(\wr_pointer[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[0] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[0]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[0] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[1] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[1]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[1] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[2] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[2]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[2] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[3] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[3]_i_1_n_0 ),
        .Q(\wr_pointer_reg_n_0_[3] ),
        .R(mem_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_pointer_reg[4] 
       (.C(wr_clk),
        .CE(\wr_pointer[4]_i_1_n_0 ),
        .D(\wr_pointer[4]_i_2_n_0 ),
        .Q(\wr_pointer_reg_n_0_[4] ),
        .R(mem_reg_i_2_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    \wr_state[0]_i_1 
       (.I0(wr_ready),
        .I1(wr_en),
        .I2(rst),
        .O(\wr_state[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_state_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\wr_state[0]_i_1_n_0 ),
        .Q(wr_ready),
        .R(1'b0));
endmodule

(* ADDR_WIDTH = "32" *) (* AW_DEPTH = "32" *) (* DATA_WIDTH = "64" *) 
(* ID_WIDTH = "4" *) (* LEN_WIDTH = "8" *) (* RESPONSE_WIDTH = "3" *) 
(* SIZE_WIDTH = "4" *) (* W_DEPTH = "32" *) 
module WRITE_BUFFER
   (Aclk,
    areset,
    awvalid,
    awaddr,
    awsize,
    awlen,
    awburst,
    awid,
    awready,
    awfull,
    awempty,
    rd_clk,
    addr_read,
    out_addr,
    addr_read_ready,
    wvalid,
    in_wdata,
    in_wstrb,
    wlast,
    wready,
    read_wdata,
    out_wdata_ready,
    w_full,
    w_empty,
    out_wdata);
  input Aclk;
  input areset;
  input awvalid;
  input [31:0]awaddr;
  input [3:0]awsize;
  input [7:0]awlen;
  input [1:0]awburst;
  input [3:0]awid;
  output awready;
  output awfull;
  output awempty;
  input rd_clk;
  input addr_read;
  output [49:0]out_addr;
  output addr_read_ready;
  input wvalid;
  input [63:0]in_wdata;
  input [7:0]in_wstrb;
  input wlast;
  output wready;
  input read_wdata;
  output out_wdata_ready;
  output w_full;
  output w_empty;
  output [63:0]out_wdata;

  wire \<const0> ;
  wire Aclk;
  wire addr_read;
  wire addr_read_ready;
  wire areset;
  wire [31:0]awaddr;
  wire [1:0]awburst;
  wire awempty;
  wire [3:0]awid;
  wire [7:0]awlen;
  wire awready;
  wire [3:0]awsize;
  wire awvalid;
  wire [63:0]in_wdata;
  wire [7:0]in_wstrb;
  wire [49:0]out_addr;
  wire [63:0]out_wdata;
  wire out_wdata_ready;
  wire rd_clk;
  wire read_wdata;
  wire w_empty;
  wire wready;
  wire wvalid;
  wire NLW_AW_FIFO_INST_awfull_UNCONNECTED;
  wire NLW_W_FIFO_INST_w_full_UNCONNECTED;

  assign awfull = \<const0> ;
  assign w_full = \<const0> ;
  (* ADDR_WIDTH = "32" *) 
  (* AW_DEPTH = "32" *) 
  (* AW_FIFO_WIDTH = "50" *) 
  (* DATA_WIDTH = "64" *) 
  (* ID_WIDTH = "4" *) 
  (* LEN_WIDTH = "8" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* SIZE_WIDTH = "4" *) 
  AW_FIFO AW_FIFO_INST
       (.Aclk(Aclk),
        .addr_read(addr_read),
        .addr_read_ready(addr_read_ready),
        .areset(areset),
        .awaddr(awaddr),
        .awburst(awburst),
        .awempty(awempty),
        .awfull(NLW_AW_FIFO_INST_awfull_UNCONNECTED),
        .awid(awid),
        .awlen(awlen),
        .awready(awready),
        .awsize(awsize),
        .awvalid(awvalid),
        .out_addr(out_addr),
        .rd_clk(rd_clk));
  GND GND
       (.G(\<const0> ));
  (* ADDR_WIDTH = "32" *) 
  (* DATA_WIDTH = "64" *) 
  (* ID_WIDTH = "4" *) 
  (* LEN_WIDTH = "8" *) 
  (* RESPONSE_WIDTH = "3" *) 
  (* SIZE_WIDTH = "4" *) 
  (* WDATA_FIFO_WIDTH = "73" *) 
  (* W_DEPTH = "32" *) 
  W_FIFO W_FIFO_INST
       (.aclk(Aclk),
        .areset(areset),
        .out_data_ready(out_wdata_ready),
        .out_wdata(out_wdata),
        .rd_clk(rd_clk),
        .read_wdata(read_wdata),
        .w_empty(w_empty),
        .w_full(NLW_W_FIFO_INST_w_full_UNCONNECTED),
        .wfifo_wdata(in_wdata),
        .wfifo_wstrb(in_wstrb),
        .wlast(1'b0),
        .wready(wready),
        .wvalid(wvalid));
endmodule

(* ADDRESS_UPDATE = "3'b101" *) (* ADDR_OFFSET = "16'b1110000000000000" *) (* ADDR_WIDTH = "32" *) 
(* ALIGN_BITS = "2" *) (* AR_DEPTH = "32" *) (* AW_DEPTH = "32" *) 
(* AW_FIFO_WIDTH = "50" *) (* BASE_ADDRESS = "16'b1110000100000000" *) (* BYTES_WIDTH = "3" *) 
(* CONTL_REG_WIDTH = "32" *) (* CRTL = "2'b10" *) (* CTRL_REG_ADDR = "8" *) 
(* DATA_BYTES = "8" *) (* DATA_WIDTH = "64" *) (* DECERR = "3'b011" *) 
(* DECODE = "3'b010" *) (* END_OFFSET = "16'b0000100000010000" *) (* IDEL = "3'b000" *) 
(* ID_WIDTH = "4" *) (* INTRPT_REG_ADDR = "12" *) (* INTRT = "2'b11" *) 
(* IN_VALID_ADDR = "3'b110" *) (* LEN_WIDTH = "8" *) (* NEW_DATA = "3'b100" *) 
(* OFFSET_START_BITS = "8" *) (* OKAY = "0" *) (* READ_TX_ADDR = "3'b111" *) 
(* READ_TX_DATA = "3'b001" *) (* RESPONSE_WIDTH = "3" *) (* R_DEPTH = "32" *) 
(* SEND_DATA = "3'b011" *) (* SIZE_WIDTH = "4" *) (* SLVERR = "3'b010" *) 
(* START_OFFSET = "16'b0000000000000000" *) (* STATUS_REG_ADDR = "4" *) (* STATUS_REG_WIDTH = "32" *) 
(* STS = "2'b01" *) (* TOTAL_BYTES = "2315" *) (* TX_ADDRESS_OFFSET_END = "2064" *) 
(* TX_ADDRESS_OFFSET_START = "16" *) (* UART_RX_FIFO_DEPTH = "32" *) (* UART_TX_FIFO_DEPTH = "256" *) 
(* W_DEPTH = "32" *) 
module WRITE_BUFFER_CONTROLLER
   (rd_clk,
    rst,
    addr_read,
    out_addr,
    awempty,
    addr_read_ready,
    read_wdata,
    out_data_ready,
    w_empty,
    out_wdata,
    bvalid,
    bresp,
    bid,
    bready,
    tx_data,
    tx_data_valid,
    addr,
    tx_fifo_mem_left,
    tx_ready);
  input rd_clk;
  input rst;
  output addr_read;
  input [49:0]out_addr;
  input awempty;
  input addr_read_ready;
  output read_wdata;
  input out_data_ready;
  input w_empty;
  input [63:0]out_wdata;
  output bvalid;
  output [2:0]bresp;
  output [3:0]bid;
  input bready;
  output [63:0]tx_data;
  output tx_data_valid;
  output [7:0]addr;
  input [11:0]tx_fifo_mem_left;
  input tx_ready;

  wire \<const0> ;
  wire [3:0]B;
  wire CEB2;
  wire [7:0]addr;
  wire \addr[0]_i_1_n_0 ;
  wire \addr[1]_i_1_n_0 ;
  wire \addr[2]_i_1_n_0 ;
  wire \addr[3]_i_1_n_0 ;
  wire \addr[4]_i_1_n_0 ;
  wire \addr[5]_i_1_n_0 ;
  wire \addr[6]_i_1_n_0 ;
  wire \addr[7]_i_1_n_0 ;
  wire \addr[7]_i_2_n_0 ;
  wire \addr[7]_i_3_n_0 ;
  wire \addr[7]_i_4_n_0 ;
  wire addr_read;
  wire addr_read_ready;
  wire awempty;
  wire beat_count3;
  wire [31:31]beat_count4;
  wire \beat_count[1]_i_1_n_0 ;
  wire \beat_count[3]_i_10_n_0 ;
  wire \beat_count[3]_i_12_n_0 ;
  wire \beat_count[3]_i_13_n_0 ;
  wire \beat_count[3]_i_14_n_0 ;
  wire \beat_count[3]_i_15_n_0 ;
  wire \beat_count[3]_i_17_n_0 ;
  wire \beat_count[3]_i_18_n_0 ;
  wire \beat_count[3]_i_19_n_0 ;
  wire \beat_count[3]_i_20_n_0 ;
  wire \beat_count[3]_i_21_n_0 ;
  wire \beat_count[3]_i_22_n_0 ;
  wire \beat_count[3]_i_23_n_0 ;
  wire \beat_count[3]_i_24_n_0 ;
  wire \beat_count[3]_i_25_n_0 ;
  wire \beat_count[3]_i_26_n_0 ;
  wire \beat_count[3]_i_27_n_0 ;
  wire \beat_count[3]_i_28_n_0 ;
  wire \beat_count[3]_i_3_n_0 ;
  wire \beat_count[3]_i_4_n_0 ;
  wire \beat_count[3]_i_7_n_0 ;
  wire \beat_count[3]_i_8_n_0 ;
  wire \beat_count[3]_i_9_n_0 ;
  wire \beat_count_reg[3]_i_11_n_0 ;
  wire \beat_count_reg[3]_i_11_n_1 ;
  wire \beat_count_reg[3]_i_11_n_2 ;
  wire \beat_count_reg[3]_i_11_n_3 ;
  wire \beat_count_reg[3]_i_16_n_0 ;
  wire \beat_count_reg[3]_i_16_n_1 ;
  wire \beat_count_reg[3]_i_16_n_2 ;
  wire \beat_count_reg[3]_i_16_n_3 ;
  wire \beat_count_reg[3]_i_5_n_1 ;
  wire \beat_count_reg[3]_i_5_n_2 ;
  wire \beat_count_reg[3]_i_5_n_3 ;
  wire \beat_count_reg[3]_i_6_n_0 ;
  wire \beat_count_reg[3]_i_6_n_1 ;
  wire \beat_count_reg[3]_i_6_n_2 ;
  wire \beat_count_reg[3]_i_6_n_3 ;
  wire \beat_count_reg_n_0_[0] ;
  wire \beat_count_reg_n_0_[1] ;
  wire \beat_count_reg_n_0_[2] ;
  wire \beat_count_reg_n_0_[3] ;
  wire [3:0]bid;
  wire bready;
  wire [1:1]\^bresp ;
  wire \bresp[1]_i_10_n_0 ;
  wire \bresp[1]_i_11_n_0 ;
  wire \bresp[1]_i_13_n_0 ;
  wire \bresp[1]_i_14_n_0 ;
  wire \bresp[1]_i_15_n_0 ;
  wire \bresp[1]_i_16_n_0 ;
  wire \bresp[1]_i_17_n_0 ;
  wire \bresp[1]_i_18_n_0 ;
  wire \bresp[1]_i_19_n_0 ;
  wire \bresp[1]_i_1_n_0 ;
  wire \bresp[1]_i_20_n_0 ;
  wire \bresp[1]_i_22_n_0 ;
  wire \bresp[1]_i_23_n_0 ;
  wire \bresp[1]_i_24_n_0 ;
  wire \bresp[1]_i_25_n_0 ;
  wire \bresp[1]_i_26_n_0 ;
  wire \bresp[1]_i_27_n_0 ;
  wire \bresp[1]_i_28_n_0 ;
  wire \bresp[1]_i_29_n_0 ;
  wire \bresp[1]_i_2_n_0 ;
  wire \bresp[1]_i_30_n_0 ;
  wire \bresp[1]_i_31_n_0 ;
  wire \bresp[1]_i_32_n_0 ;
  wire \bresp[1]_i_33_n_0 ;
  wire \bresp[1]_i_34_n_0 ;
  wire \bresp[1]_i_35_n_0 ;
  wire \bresp[1]_i_36_n_0 ;
  wire \bresp[1]_i_37_n_0 ;
  wire \bresp[1]_i_4_n_0 ;
  wire \bresp[1]_i_5_n_0 ;
  wire \bresp[1]_i_6_n_0 ;
  wire \bresp[1]_i_8_n_0 ;
  wire \bresp_reg[1]_i_12_n_0 ;
  wire \bresp_reg[1]_i_12_n_1 ;
  wire \bresp_reg[1]_i_12_n_2 ;
  wire \bresp_reg[1]_i_12_n_3 ;
  wire \bresp_reg[1]_i_21_n_0 ;
  wire \bresp_reg[1]_i_21_n_1 ;
  wire \bresp_reg[1]_i_21_n_2 ;
  wire \bresp_reg[1]_i_21_n_3 ;
  wire \bresp_reg[1]_i_9_n_0 ;
  wire \bresp_reg[1]_i_9_n_1 ;
  wire \bresp_reg[1]_i_9_n_2 ;
  wire \bresp_reg[1]_i_9_n_3 ;
  wire bvalid;
  wire bvalid_i_1_n_0;
  wire bvalid_i_2_n_0;
  wire bvalid_i_3_n_0;
  wire [49:0]out_addr;
  wire out_data_ready;
  wire [7:0]p_0_in;
  wire [7:0]r_addr;
  wire r_addr1;
  wire r_addr2_n_100;
  wire r_addr2_n_101;
  wire r_addr2_n_102;
  wire r_addr2_n_103;
  wire r_addr2_n_104;
  wire r_addr2_n_105;
  wire r_addr2_n_74;
  wire r_addr2_n_75;
  wire r_addr2_n_76;
  wire r_addr2_n_77;
  wire r_addr2_n_78;
  wire r_addr2_n_79;
  wire r_addr2_n_80;
  wire r_addr2_n_81;
  wire r_addr2_n_82;
  wire r_addr2_n_83;
  wire r_addr2_n_84;
  wire r_addr2_n_85;
  wire r_addr2_n_86;
  wire r_addr2_n_87;
  wire r_addr2_n_88;
  wire r_addr2_n_89;
  wire r_addr2_n_90;
  wire r_addr2_n_91;
  wire r_addr2_n_92;
  wire r_addr2_n_93;
  wire r_addr2_n_94;
  wire r_addr2_n_95;
  wire r_addr2_n_96;
  wire r_addr2_n_97;
  wire r_addr2_n_98;
  wire r_addr2_n_99;
  wire \r_addr[3]_i_10_n_0 ;
  wire \r_addr[3]_i_11_n_0 ;
  wire \r_addr[3]_i_12_n_0 ;
  wire \r_addr[3]_i_13_n_0 ;
  wire \r_addr[3]_i_14_n_0 ;
  wire \r_addr[3]_i_15_n_0 ;
  wire \r_addr[3]_i_4_n_0 ;
  wire \r_addr[3]_i_5_n_0 ;
  wire \r_addr[3]_i_6_n_0 ;
  wire \r_addr[3]_i_7_n_0 ;
  wire \r_addr[3]_i_8_n_0 ;
  wire \r_addr[3]_i_9_n_0 ;
  wire \r_addr[7]_i_10_n_0 ;
  wire \r_addr[7]_i_11_n_0 ;
  wire \r_addr[7]_i_12_n_0 ;
  wire \r_addr[7]_i_13_n_0 ;
  wire \r_addr[7]_i_14_n_0 ;
  wire \r_addr[7]_i_16_n_0 ;
  wire \r_addr[7]_i_17_n_0 ;
  wire \r_addr[7]_i_18_n_0 ;
  wire \r_addr[7]_i_19_n_0 ;
  wire \r_addr[7]_i_1_n_0 ;
  wire \r_addr[7]_i_21_n_0 ;
  wire \r_addr[7]_i_22_n_0 ;
  wire \r_addr[7]_i_23_n_0 ;
  wire \r_addr[7]_i_24_n_0 ;
  wire \r_addr[7]_i_25_n_0 ;
  wire \r_addr[7]_i_26_n_0 ;
  wire \r_addr[7]_i_27_n_0 ;
  wire \r_addr[7]_i_28_n_0 ;
  wire \r_addr[7]_i_29_n_0 ;
  wire \r_addr[7]_i_30_n_0 ;
  wire \r_addr[7]_i_31_n_0 ;
  wire \r_addr[7]_i_32_n_0 ;
  wire \r_addr[7]_i_33_n_0 ;
  wire \r_addr[7]_i_35_n_0 ;
  wire \r_addr[7]_i_36_n_0 ;
  wire \r_addr[7]_i_37_n_0 ;
  wire \r_addr[7]_i_38_n_0 ;
  wire \r_addr[7]_i_39_n_0 ;
  wire \r_addr[7]_i_40_n_0 ;
  wire \r_addr[7]_i_41_n_0 ;
  wire \r_addr[7]_i_42_n_0 ;
  wire \r_addr[7]_i_43_n_0 ;
  wire \r_addr[7]_i_44_n_0 ;
  wire \r_addr[7]_i_45_n_0 ;
  wire \r_addr[7]_i_46_n_0 ;
  wire \r_addr[7]_i_47_n_0 ;
  wire \r_addr[7]_i_48_n_0 ;
  wire \r_addr[7]_i_49_n_0 ;
  wire \r_addr[7]_i_4_n_0 ;
  wire \r_addr[7]_i_50_n_0 ;
  wire \r_addr[7]_i_51_n_0 ;
  wire \r_addr[7]_i_52_n_0 ;
  wire \r_addr[7]_i_53_n_0 ;
  wire \r_addr[7]_i_54_n_0 ;
  wire \r_addr[7]_i_55_n_0 ;
  wire \r_addr[7]_i_7_n_0 ;
  wire \r_addr[7]_i_8_n_0 ;
  wire \r_addr[7]_i_9_n_0 ;
  wire \r_addr_reg[3]_i_2_n_0 ;
  wire \r_addr_reg[3]_i_2_n_1 ;
  wire \r_addr_reg[3]_i_2_n_2 ;
  wire \r_addr_reg[3]_i_2_n_3 ;
  wire \r_addr_reg[3]_i_3_n_0 ;
  wire \r_addr_reg[3]_i_3_n_1 ;
  wire \r_addr_reg[3]_i_3_n_2 ;
  wire \r_addr_reg[3]_i_3_n_3 ;
  wire \r_addr_reg[3]_i_3_n_4 ;
  wire \r_addr_reg[3]_i_3_n_5 ;
  wire \r_addr_reg[3]_i_3_n_6 ;
  wire \r_addr_reg[3]_i_3_n_7 ;
  wire \r_addr_reg[7]_i_15_n_1 ;
  wire \r_addr_reg[7]_i_15_n_2 ;
  wire \r_addr_reg[7]_i_15_n_3 ;
  wire \r_addr_reg[7]_i_15_n_4 ;
  wire \r_addr_reg[7]_i_15_n_5 ;
  wire \r_addr_reg[7]_i_15_n_6 ;
  wire \r_addr_reg[7]_i_15_n_7 ;
  wire \r_addr_reg[7]_i_20_n_0 ;
  wire \r_addr_reg[7]_i_20_n_1 ;
  wire \r_addr_reg[7]_i_20_n_2 ;
  wire \r_addr_reg[7]_i_20_n_3 ;
  wire \r_addr_reg[7]_i_34_n_0 ;
  wire \r_addr_reg[7]_i_34_n_1 ;
  wire \r_addr_reg[7]_i_34_n_2 ;
  wire \r_addr_reg[7]_i_34_n_3 ;
  wire \r_addr_reg[7]_i_3_n_1 ;
  wire \r_addr_reg[7]_i_3_n_2 ;
  wire \r_addr_reg[7]_i_3_n_3 ;
  wire \r_addr_reg[7]_i_5_n_1 ;
  wire \r_addr_reg[7]_i_5_n_2 ;
  wire \r_addr_reg[7]_i_5_n_3 ;
  wire \r_addr_reg[7]_i_6_n_0 ;
  wire \r_addr_reg[7]_i_6_n_1 ;
  wire \r_addr_reg[7]_i_6_n_2 ;
  wire \r_addr_reg[7]_i_6_n_3 ;
  wire \r_addr_reg_n_0_[0] ;
  wire \r_addr_reg_n_0_[1] ;
  wire \r_addr_reg_n_0_[2] ;
  wire \r_addr_reg_n_0_[3] ;
  wire \r_addr_reg_n_0_[4] ;
  wire \r_addr_reg_n_0_[5] ;
  wire \r_addr_reg_n_0_[6] ;
  wire \r_addr_reg_n_0_[7] ;
  wire rd_clk;
  wire read_wdata;
  wire rst;
  wire state2;
  wire state3_i_10_n_0;
  wire state3_i_11_n_0;
  wire state3_i_12_n_0;
  wire state3_i_13_n_0;
  wire state3_i_14_n_0;
  wire state3_i_15_n_0;
  wire state3_i_16_n_0;
  wire state3_i_1_n_0;
  wire state3_i_2_n_0;
  wire state3_i_3_n_0;
  wire state3_i_4_n_0;
  wire state3_i_5_n_0;
  wire state3_i_6_n_0;
  wire state3_i_7_n_0;
  wire state3_i_8_n_0;
  wire state3_i_9_n_0;
  wire state3_n_100;
  wire state3_n_101;
  wire state3_n_102;
  wire state3_n_103;
  wire state3_n_104;
  wire state3_n_105;
  wire state3_n_81;
  wire state3_n_82;
  wire state3_n_83;
  wire state3_n_84;
  wire state3_n_85;
  wire state3_n_86;
  wire state3_n_87;
  wire state3_n_88;
  wire state3_n_89;
  wire state3_n_90;
  wire state3_n_91;
  wire state3_n_92;
  wire state3_n_93;
  wire state3_n_94;
  wire state3_n_95;
  wire state3_n_96;
  wire state3_n_97;
  wire state3_n_98;
  wire state3_n_99;
  wire \state[0]_i_1_n_0 ;
  wire \state[0]_i_2_n_0 ;
  wire \state[0]_i_3_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_3_n_0 ;
  wire \state[1]_i_4_n_0 ;
  wire \state[2]_i_10_n_0 ;
  wire \state[2]_i_11_n_0 ;
  wire \state[2]_i_12_n_0 ;
  wire \state[2]_i_1_n_0 ;
  wire \state[2]_i_2_n_0 ;
  wire \state[2]_i_3_n_0 ;
  wire \state[2]_i_4_n_0 ;
  wire \state[2]_i_5_n_0 ;
  wire \state[2]_i_6_n_0 ;
  wire \state[2]_i_7_n_0 ;
  wire \state[2]_i_8_n_0 ;
  wire \state[2]_i_9_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire tx_data_valid;
  wire tx_data_valid_INST_0_i_1_n_0;
  wire tx_data_valid_INST_0_i_1_n_1;
  wire tx_data_valid_INST_0_i_1_n_2;
  wire tx_data_valid_INST_0_i_1_n_3;
  wire tx_data_valid_INST_0_i_2_n_0;
  wire tx_data_valid_INST_0_i_3_n_0;
  wire tx_data_valid_INST_0_i_4_n_0;
  wire tx_data_valid_INST_0_i_5_n_0;
  wire tx_data_valid_INST_0_i_6_n_0;
  wire tx_data_valid_INST_0_i_7_n_0;
  wire [11:0]tx_fifo_mem_left;
  wire tx_ready;
  wire w_empty;
  wire [3:0]\NLW_beat_count_reg[3]_i_11_O_UNCONNECTED ;
  wire [3:0]\NLW_beat_count_reg[3]_i_16_O_UNCONNECTED ;
  wire [3:0]\NLW_beat_count_reg[3]_i_5_O_UNCONNECTED ;
  wire [3:0]\NLW_beat_count_reg[3]_i_6_O_UNCONNECTED ;
  wire [3:0]\NLW_bresp_reg[1]_i_12_O_UNCONNECTED ;
  wire [3:0]\NLW_bresp_reg[1]_i_21_O_UNCONNECTED ;
  wire [3:1]\NLW_bresp_reg[1]_i_7_CO_UNCONNECTED ;
  wire [3:0]\NLW_bresp_reg[1]_i_7_O_UNCONNECTED ;
  wire [3:0]\NLW_bresp_reg[1]_i_9_O_UNCONNECTED ;
  wire NLW_r_addr2_CARRYCASCOUT_UNCONNECTED;
  wire NLW_r_addr2_MULTSIGNOUT_UNCONNECTED;
  wire NLW_r_addr2_OVERFLOW_UNCONNECTED;
  wire NLW_r_addr2_PATTERNBDETECT_UNCONNECTED;
  wire NLW_r_addr2_PATTERNDETECT_UNCONNECTED;
  wire NLW_r_addr2_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_r_addr2_ACOUT_UNCONNECTED;
  wire [17:0]NLW_r_addr2_BCOUT_UNCONNECTED;
  wire [3:0]NLW_r_addr2_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_r_addr2_P_UNCONNECTED;
  wire [47:0]NLW_r_addr2_PCOUT_UNCONNECTED;
  wire [3:3]\NLW_r_addr_reg[7]_i_15_CO_UNCONNECTED ;
  wire [3:0]\NLW_r_addr_reg[7]_i_20_O_UNCONNECTED ;
  wire [3:0]\NLW_r_addr_reg[7]_i_3_O_UNCONNECTED ;
  wire [3:0]\NLW_r_addr_reg[7]_i_34_O_UNCONNECTED ;
  wire [3:3]\NLW_r_addr_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_r_addr_reg[7]_i_6_O_UNCONNECTED ;
  wire NLW_state3_CARRYCASCOUT_UNCONNECTED;
  wire NLW_state3_MULTSIGNOUT_UNCONNECTED;
  wire NLW_state3_OVERFLOW_UNCONNECTED;
  wire NLW_state3_PATTERNBDETECT_UNCONNECTED;
  wire NLW_state3_PATTERNDETECT_UNCONNECTED;
  wire NLW_state3_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_state3_ACOUT_UNCONNECTED;
  wire [17:0]NLW_state3_BCOUT_UNCONNECTED;
  wire [3:0]NLW_state3_CARRYOUT_UNCONNECTED;
  wire [47:25]NLW_state3_P_UNCONNECTED;
  wire [47:0]NLW_state3_PCOUT_UNCONNECTED;
  wire [3:0]NLW_tx_data_valid_INST_0_i_1_O_UNCONNECTED;

  assign bresp[2] = \<const0> ;
  assign bresp[1] = \^bresp [1];
  assign bresp[0] = \<const0> ;
  assign tx_data[63] = \<const0> ;
  assign tx_data[62] = \<const0> ;
  assign tx_data[61] = \<const0> ;
  assign tx_data[60] = \<const0> ;
  assign tx_data[59] = \<const0> ;
  assign tx_data[58] = \<const0> ;
  assign tx_data[57] = \<const0> ;
  assign tx_data[56] = \<const0> ;
  assign tx_data[55] = \<const0> ;
  assign tx_data[54] = \<const0> ;
  assign tx_data[53] = \<const0> ;
  assign tx_data[52] = \<const0> ;
  assign tx_data[51] = \<const0> ;
  assign tx_data[50] = \<const0> ;
  assign tx_data[49] = \<const0> ;
  assign tx_data[48] = \<const0> ;
  assign tx_data[47] = \<const0> ;
  assign tx_data[46] = \<const0> ;
  assign tx_data[45] = \<const0> ;
  assign tx_data[44] = \<const0> ;
  assign tx_data[43] = \<const0> ;
  assign tx_data[42] = \<const0> ;
  assign tx_data[41] = \<const0> ;
  assign tx_data[40] = \<const0> ;
  assign tx_data[39] = \<const0> ;
  assign tx_data[38] = \<const0> ;
  assign tx_data[37] = \<const0> ;
  assign tx_data[36] = \<const0> ;
  assign tx_data[35] = \<const0> ;
  assign tx_data[34] = \<const0> ;
  assign tx_data[33] = \<const0> ;
  assign tx_data[32] = \<const0> ;
  assign tx_data[31] = \<const0> ;
  assign tx_data[30] = \<const0> ;
  assign tx_data[29] = \<const0> ;
  assign tx_data[28] = \<const0> ;
  assign tx_data[27] = \<const0> ;
  assign tx_data[26] = \<const0> ;
  assign tx_data[25] = \<const0> ;
  assign tx_data[24] = \<const0> ;
  assign tx_data[23] = \<const0> ;
  assign tx_data[22] = \<const0> ;
  assign tx_data[21] = \<const0> ;
  assign tx_data[20] = \<const0> ;
  assign tx_data[19] = \<const0> ;
  assign tx_data[18] = \<const0> ;
  assign tx_data[17] = \<const0> ;
  assign tx_data[16] = \<const0> ;
  assign tx_data[15] = \<const0> ;
  assign tx_data[14] = \<const0> ;
  assign tx_data[13] = \<const0> ;
  assign tx_data[12] = \<const0> ;
  assign tx_data[11] = \<const0> ;
  assign tx_data[10] = \<const0> ;
  assign tx_data[9] = \<const0> ;
  assign tx_data[8] = \<const0> ;
  assign tx_data[7] = \<const0> ;
  assign tx_data[6] = \<const0> ;
  assign tx_data[5] = \<const0> ;
  assign tx_data[4] = \<const0> ;
  assign tx_data[3] = \<const0> ;
  assign tx_data[2] = \<const0> ;
  assign tx_data[1] = \<const0> ;
  assign tx_data[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \addr[0]_i_1 
       (.I0(out_addr[0]),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\r_addr_reg_n_0_[0] ),
        .O(\addr[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \addr[1]_i_1 
       (.I0(out_addr[1]),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\r_addr_reg_n_0_[1] ),
        .O(\addr[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \addr[2]_i_1 
       (.I0(out_addr[2]),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\r_addr_reg_n_0_[2] ),
        .O(\addr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \addr[3]_i_1 
       (.I0(out_addr[3]),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\r_addr_reg_n_0_[3] ),
        .O(\addr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \addr[4]_i_1 
       (.I0(out_addr[4]),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\r_addr_reg_n_0_[4] ),
        .O(\addr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \addr[5]_i_1 
       (.I0(out_addr[5]),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\r_addr_reg_n_0_[5] ),
        .O(\addr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \addr[6]_i_1 
       (.I0(out_addr[6]),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\r_addr_reg_n_0_[6] ),
        .O(\addr[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h45)) 
    \addr[7]_i_1 
       (.I0(rst),
        .I1(\addr[7]_i_3_n_0 ),
        .I2(\addr[7]_i_4_n_0 ),
        .O(\addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \addr[7]_i_2 
       (.I0(out_addr[7]),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\r_addr_reg_n_0_[7] ),
        .O(\addr[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT5 #(
    .INIT(32'h000AC000)) 
    \addr[7]_i_3 
       (.I0(out_data_ready),
        .I1(beat_count4),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[2] ),
        .O(\addr[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT4 #(
    .INIT(16'hFFFB)) 
    \addr[7]_i_4 
       (.I0(\bresp[1]_i_4_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .O(\addr[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'h80)) 
    addr_read_INST_0
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .O(addr_read));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[0] 
       (.C(rd_clk),
        .CE(\addr[7]_i_1_n_0 ),
        .D(\addr[0]_i_1_n_0 ),
        .Q(addr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[1] 
       (.C(rd_clk),
        .CE(\addr[7]_i_1_n_0 ),
        .D(\addr[1]_i_1_n_0 ),
        .Q(addr[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[2] 
       (.C(rd_clk),
        .CE(\addr[7]_i_1_n_0 ),
        .D(\addr[2]_i_1_n_0 ),
        .Q(addr[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[3] 
       (.C(rd_clk),
        .CE(\addr[7]_i_1_n_0 ),
        .D(\addr[3]_i_1_n_0 ),
        .Q(addr[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[4] 
       (.C(rd_clk),
        .CE(\addr[7]_i_1_n_0 ),
        .D(\addr[4]_i_1_n_0 ),
        .Q(addr[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[5] 
       (.C(rd_clk),
        .CE(\addr[7]_i_1_n_0 ),
        .D(\addr[5]_i_1_n_0 ),
        .Q(addr[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[6] 
       (.C(rd_clk),
        .CE(\addr[7]_i_1_n_0 ),
        .D(\addr[6]_i_1_n_0 ),
        .Q(addr[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[7] 
       (.C(rd_clk),
        .CE(\addr[7]_i_1_n_0 ),
        .D(\addr[7]_i_2_n_0 ),
        .Q(addr[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \beat_count[0]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\beat_count_reg_n_0_[0] ),
        .O(B[0]));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \beat_count[1]_i_1 
       (.I0(\beat_count_reg_n_0_[1] ),
        .I1(\beat_count_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\beat_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \beat_count[2]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\beat_count_reg_n_0_[0] ),
        .I2(\beat_count_reg_n_0_[1] ),
        .I3(\beat_count_reg_n_0_[2] ),
        .O(B[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000400F)) 
    \beat_count[3]_i_1 
       (.I0(\beat_count[3]_i_3_n_0 ),
        .I1(tx_ready),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .I5(\beat_count[3]_i_4_n_0 ),
        .O(CEB2));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_10 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_12 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_13 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_14 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_14_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_15 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_17 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_17_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_18 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_18_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_19 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \beat_count[3]_i_2 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\beat_count_reg_n_0_[1] ),
        .I2(\beat_count_reg_n_0_[0] ),
        .I3(\beat_count_reg_n_0_[2] ),
        .I4(\beat_count_reg_n_0_[3] ),
        .O(B[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_20 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFBAAAAAAAE)) 
    \beat_count[3]_i_21 
       (.I0(out_addr[43]),
        .I1(\bresp[1]_i_5_n_0 ),
        .I2(out_addr[41]),
        .I3(out_addr[40]),
        .I4(out_addr[39]),
        .I5(out_addr[42]),
        .O(\beat_count[3]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEEEEEEEEEB)) 
    \beat_count[3]_i_22 
       (.I0(out_addr[41]),
        .I1(out_addr[40]),
        .I2(out_addr[38]),
        .I3(out_addr[36]),
        .I4(out_addr[37]),
        .I5(out_addr[39]),
        .O(\beat_count[3]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h44444441D4D4D447)) 
    \beat_count[3]_i_23 
       (.I0(\beat_count_reg_n_0_[3] ),
        .I1(out_addr[39]),
        .I2(out_addr[38]),
        .I3(out_addr[36]),
        .I4(out_addr[37]),
        .I5(\beat_count_reg_n_0_[2] ),
        .O(\beat_count[3]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h0D13)) 
    \beat_count[3]_i_24 
       (.I0(\beat_count_reg_n_0_[0] ),
        .I1(out_addr[36]),
        .I2(\beat_count_reg_n_0_[1] ),
        .I3(out_addr[37]),
        .O(\beat_count[3]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h0000000055565555)) 
    \beat_count[3]_i_25 
       (.I0(out_addr[42]),
        .I1(out_addr[39]),
        .I2(out_addr[40]),
        .I3(out_addr[41]),
        .I4(\bresp[1]_i_5_n_0 ),
        .I5(out_addr[43]),
        .O(\beat_count[3]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h000000000001FFFE)) 
    \beat_count[3]_i_26 
       (.I0(out_addr[39]),
        .I1(out_addr[37]),
        .I2(out_addr[36]),
        .I3(out_addr[38]),
        .I4(out_addr[40]),
        .I5(out_addr[41]),
        .O(\beat_count[3]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h9990000600099990)) 
    \beat_count[3]_i_27 
       (.I0(out_addr[39]),
        .I1(\beat_count_reg_n_0_[3] ),
        .I2(out_addr[36]),
        .I3(out_addr[37]),
        .I4(out_addr[38]),
        .I5(\beat_count_reg_n_0_[2] ),
        .O(\beat_count[3]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'h4224)) 
    \beat_count[3]_i_28 
       (.I0(\beat_count_reg_n_0_[0] ),
        .I1(out_addr[36]),
        .I2(out_addr[37]),
        .I3(\beat_count_reg_n_0_[1] ),
        .O(\beat_count[3]_i_28_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \beat_count[3]_i_3 
       (.I0(tx_data_valid_INST_0_i_1_n_0),
        .I1(beat_count4),
        .O(\beat_count[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0400000000000000)) 
    \beat_count[3]_i_4 
       (.I0(beat_count4),
        .I1(beat_count3),
        .I2(w_empty),
        .I3(\state[2]_i_9_n_0 ),
        .I4(\state_reg_n_0_[2] ),
        .I5(out_data_ready),
        .O(\beat_count[3]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_7 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_8 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \beat_count[3]_i_9 
       (.I0(beat_count4),
        .O(\beat_count[3]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \beat_count_reg[0] 
       (.C(rd_clk),
        .CE(CEB2),
        .D(B[0]),
        .Q(\beat_count_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \beat_count_reg[1] 
       (.C(rd_clk),
        .CE(CEB2),
        .D(\beat_count[1]_i_1_n_0 ),
        .Q(\beat_count_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \beat_count_reg[2] 
       (.C(rd_clk),
        .CE(CEB2),
        .D(B[2]),
        .Q(\beat_count_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \beat_count_reg[3] 
       (.C(rd_clk),
        .CE(CEB2),
        .D(B[3]),
        .Q(\beat_count_reg_n_0_[3] ),
        .R(rst));
  CARRY4 \beat_count_reg[3]_i_11 
       (.CI(\beat_count_reg[3]_i_16_n_0 ),
        .CO({\beat_count_reg[3]_i_11_n_0 ,\beat_count_reg[3]_i_11_n_1 ,\beat_count_reg[3]_i_11_n_2 ,\beat_count_reg[3]_i_11_n_3 }),
        .CYINIT(1'b0),
        .DI({beat_count4,beat_count4,beat_count4,beat_count4}),
        .O(\NLW_beat_count_reg[3]_i_11_O_UNCONNECTED [3:0]),
        .S({\beat_count[3]_i_17_n_0 ,\beat_count[3]_i_18_n_0 ,\beat_count[3]_i_19_n_0 ,\beat_count[3]_i_20_n_0 }));
  CARRY4 \beat_count_reg[3]_i_16 
       (.CI(1'b0),
        .CO({\beat_count_reg[3]_i_16_n_0 ,\beat_count_reg[3]_i_16_n_1 ,\beat_count_reg[3]_i_16_n_2 ,\beat_count_reg[3]_i_16_n_3 }),
        .CYINIT(1'b0),
        .DI({\beat_count[3]_i_21_n_0 ,\beat_count[3]_i_22_n_0 ,\beat_count[3]_i_23_n_0 ,\beat_count[3]_i_24_n_0 }),
        .O(\NLW_beat_count_reg[3]_i_16_O_UNCONNECTED [3:0]),
        .S({\beat_count[3]_i_25_n_0 ,\beat_count[3]_i_26_n_0 ,\beat_count[3]_i_27_n_0 ,\beat_count[3]_i_28_n_0 }));
  CARRY4 \beat_count_reg[3]_i_5 
       (.CI(\beat_count_reg[3]_i_6_n_0 ),
        .CO({beat_count3,\beat_count_reg[3]_i_5_n_1 ,\beat_count_reg[3]_i_5_n_2 ,\beat_count_reg[3]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({beat_count4,beat_count4,beat_count4,beat_count4}),
        .O(\NLW_beat_count_reg[3]_i_5_O_UNCONNECTED [3:0]),
        .S({\beat_count[3]_i_7_n_0 ,\beat_count[3]_i_8_n_0 ,\beat_count[3]_i_9_n_0 ,\beat_count[3]_i_10_n_0 }));
  CARRY4 \beat_count_reg[3]_i_6 
       (.CI(\beat_count_reg[3]_i_11_n_0 ),
        .CO({\beat_count_reg[3]_i_6_n_0 ,\beat_count_reg[3]_i_6_n_1 ,\beat_count_reg[3]_i_6_n_2 ,\beat_count_reg[3]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({beat_count4,beat_count4,beat_count4,beat_count4}),
        .O(\NLW_beat_count_reg[3]_i_6_O_UNCONNECTED [3:0]),
        .S({\beat_count[3]_i_12_n_0 ,\beat_count[3]_i_13_n_0 ,\beat_count[3]_i_14_n_0 ,\beat_count[3]_i_15_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bid_reg[0] 
       (.C(rd_clk),
        .CE(\bresp[1]_i_1_n_0 ),
        .D(out_addr[44]),
        .Q(bid[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bid_reg[1] 
       (.C(rd_clk),
        .CE(\bresp[1]_i_1_n_0 ),
        .D(out_addr[45]),
        .Q(bid[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bid_reg[2] 
       (.C(rd_clk),
        .CE(\bresp[1]_i_1_n_0 ),
        .D(out_addr[46]),
        .Q(bid[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bid_reg[3] 
       (.C(rd_clk),
        .CE(\bresp[1]_i_1_n_0 ),
        .D(out_addr[47]),
        .Q(bid[3]),
        .R(rst));
  LUT6 #(
    .INIT(64'h0E0FC0000E00C000)) 
    \bresp[1]_i_1 
       (.I0(beat_count4),
        .I1(tx_data_valid_INST_0_i_1_n_0),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(\bresp[1]_i_4_n_0 ),
        .O(\bresp[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \bresp[1]_i_10 
       (.I0(state3_n_81),
        .O(\bresp[1]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hEFFFFFFF)) 
    \bresp[1]_i_11 
       (.I0(out_addr[0]),
        .I1(out_addr[1]),
        .I2(out_addr[31]),
        .I3(out_addr[29]),
        .I4(out_addr[30]),
        .O(\bresp[1]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bresp[1]_i_13 
       (.I0(state3_n_82),
        .I1(state3_n_83),
        .O(\bresp[1]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bresp[1]_i_14 
       (.I0(state3_n_84),
        .I1(state3_n_85),
        .O(\bresp[1]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bresp[1]_i_15 
       (.I0(state3_n_86),
        .I1(state3_n_87),
        .O(\bresp[1]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bresp[1]_i_16 
       (.I0(state3_n_88),
        .I1(state3_n_89),
        .O(\bresp[1]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \bresp[1]_i_17 
       (.I0(state3_n_83),
        .I1(state3_n_82),
        .O(\bresp[1]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \bresp[1]_i_18 
       (.I0(state3_n_85),
        .I1(state3_n_84),
        .O(\bresp[1]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \bresp[1]_i_19 
       (.I0(state3_n_87),
        .I1(state3_n_86),
        .O(\bresp[1]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \bresp[1]_i_2 
       (.I0(\state_reg_n_0_[1] ),
        .I1(beat_count4),
        .I2(\state_reg_n_0_[0] ),
        .O(\bresp[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \bresp[1]_i_20 
       (.I0(state3_n_89),
        .I1(state3_n_88),
        .O(\bresp[1]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bresp[1]_i_22 
       (.I0(state3_n_90),
        .I1(state3_n_91),
        .O(\bresp[1]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bresp[1]_i_23 
       (.I0(state3_n_92),
        .I1(state3_n_93),
        .O(\bresp[1]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \bresp[1]_i_24 
       (.I0(state3_n_94),
        .I1(tx_fifo_mem_left[11]),
        .I2(state3_n_95),
        .I3(tx_fifo_mem_left[10]),
        .O(\bresp[1]_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \bresp[1]_i_25 
       (.I0(state3_n_96),
        .I1(tx_fifo_mem_left[9]),
        .I2(state3_n_97),
        .I3(tx_fifo_mem_left[8]),
        .O(\bresp[1]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \bresp[1]_i_26 
       (.I0(state3_n_91),
        .I1(state3_n_90),
        .O(\bresp[1]_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \bresp[1]_i_27 
       (.I0(state3_n_93),
        .I1(state3_n_92),
        .O(\bresp[1]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \bresp[1]_i_28 
       (.I0(tx_fifo_mem_left[11]),
        .I1(state3_n_94),
        .I2(tx_fifo_mem_left[10]),
        .I3(state3_n_95),
        .O(\bresp[1]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \bresp[1]_i_29 
       (.I0(tx_fifo_mem_left[9]),
        .I1(state3_n_96),
        .I2(tx_fifo_mem_left[8]),
        .I3(state3_n_97),
        .O(\bresp[1]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \bresp[1]_i_3 
       (.I0(out_addr[42]),
        .I1(out_addr[43]),
        .I2(out_addr[39]),
        .I3(out_addr[40]),
        .I4(out_addr[41]),
        .I5(\bresp[1]_i_5_n_0 ),
        .O(beat_count4));
  LUT4 #(
    .INIT(16'h22B2)) 
    \bresp[1]_i_30 
       (.I0(state3_n_98),
        .I1(tx_fifo_mem_left[7]),
        .I2(state3_n_99),
        .I3(tx_fifo_mem_left[6]),
        .O(\bresp[1]_i_30_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \bresp[1]_i_31 
       (.I0(state3_n_100),
        .I1(tx_fifo_mem_left[5]),
        .I2(state3_n_101),
        .I3(tx_fifo_mem_left[4]),
        .O(\bresp[1]_i_31_n_0 ));
  LUT3 #(
    .INIT(8'hB2)) 
    \bresp[1]_i_32 
       (.I0(state3_n_102),
        .I1(tx_fifo_mem_left[3]),
        .I2(state3_n_103),
        .O(\bresp[1]_i_32_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bresp[1]_i_33 
       (.I0(state3_n_104),
        .I1(state3_n_105),
        .O(\bresp[1]_i_33_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \bresp[1]_i_34 
       (.I0(tx_fifo_mem_left[7]),
        .I1(state3_n_98),
        .I2(tx_fifo_mem_left[6]),
        .I3(state3_n_99),
        .O(\bresp[1]_i_34_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \bresp[1]_i_35 
       (.I0(tx_fifo_mem_left[5]),
        .I1(state3_n_100),
        .I2(tx_fifo_mem_left[4]),
        .I3(state3_n_101),
        .O(\bresp[1]_i_35_n_0 ));
  LUT3 #(
    .INIT(8'h41)) 
    \bresp[1]_i_36 
       (.I0(state3_n_103),
        .I1(tx_fifo_mem_left[3]),
        .I2(state3_n_102),
        .O(\bresp[1]_i_36_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \bresp[1]_i_37 
       (.I0(state3_n_105),
        .I1(state3_n_104),
        .O(\bresp[1]_i_37_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT5 #(
    .INIT(32'hFFFF0040)) 
    \bresp[1]_i_4 
       (.I0(\bresp[1]_i_6_n_0 ),
        .I1(out_addr[3]),
        .I2(state2),
        .I3(out_addr[5]),
        .I4(\bresp[1]_i_8_n_0 ),
        .O(\bresp[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \bresp[1]_i_5 
       (.I0(out_addr[37]),
        .I1(out_addr[36]),
        .I2(out_addr[38]),
        .O(\bresp[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    \bresp[1]_i_6 
       (.I0(out_addr[0]),
        .I1(out_addr[1]),
        .I2(out_addr[7]),
        .I3(out_addr[4]),
        .I4(out_addr[2]),
        .I5(out_addr[6]),
        .O(\bresp[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000001)) 
    \bresp[1]_i_8 
       (.I0(out_addr[26]),
        .I1(out_addr[28]),
        .I2(out_addr[24]),
        .I3(out_addr[27]),
        .I4(out_addr[25]),
        .I5(\bresp[1]_i_11_n_0 ),
        .O(\bresp[1]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bresp_reg[1] 
       (.C(rd_clk),
        .CE(\bresp[1]_i_1_n_0 ),
        .D(\bresp[1]_i_2_n_0 ),
        .Q(\^bresp ),
        .R(rst));
  CARRY4 \bresp_reg[1]_i_12 
       (.CI(\bresp_reg[1]_i_21_n_0 ),
        .CO({\bresp_reg[1]_i_12_n_0 ,\bresp_reg[1]_i_12_n_1 ,\bresp_reg[1]_i_12_n_2 ,\bresp_reg[1]_i_12_n_3 }),
        .CYINIT(1'b0),
        .DI({\bresp[1]_i_22_n_0 ,\bresp[1]_i_23_n_0 ,\bresp[1]_i_24_n_0 ,\bresp[1]_i_25_n_0 }),
        .O(\NLW_bresp_reg[1]_i_12_O_UNCONNECTED [3:0]),
        .S({\bresp[1]_i_26_n_0 ,\bresp[1]_i_27_n_0 ,\bresp[1]_i_28_n_0 ,\bresp[1]_i_29_n_0 }));
  CARRY4 \bresp_reg[1]_i_21 
       (.CI(1'b0),
        .CO({\bresp_reg[1]_i_21_n_0 ,\bresp_reg[1]_i_21_n_1 ,\bresp_reg[1]_i_21_n_2 ,\bresp_reg[1]_i_21_n_3 }),
        .CYINIT(1'b0),
        .DI({\bresp[1]_i_30_n_0 ,\bresp[1]_i_31_n_0 ,\bresp[1]_i_32_n_0 ,\bresp[1]_i_33_n_0 }),
        .O(\NLW_bresp_reg[1]_i_21_O_UNCONNECTED [3:0]),
        .S({\bresp[1]_i_34_n_0 ,\bresp[1]_i_35_n_0 ,\bresp[1]_i_36_n_0 ,\bresp[1]_i_37_n_0 }));
  CARRY4 \bresp_reg[1]_i_7 
       (.CI(\bresp_reg[1]_i_9_n_0 ),
        .CO({\NLW_bresp_reg[1]_i_7_CO_UNCONNECTED [3:1],state2}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,state3_n_81}),
        .O(\NLW_bresp_reg[1]_i_7_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\bresp[1]_i_10_n_0 }));
  CARRY4 \bresp_reg[1]_i_9 
       (.CI(\bresp_reg[1]_i_12_n_0 ),
        .CO({\bresp_reg[1]_i_9_n_0 ,\bresp_reg[1]_i_9_n_1 ,\bresp_reg[1]_i_9_n_2 ,\bresp_reg[1]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({\bresp[1]_i_13_n_0 ,\bresp[1]_i_14_n_0 ,\bresp[1]_i_15_n_0 ,\bresp[1]_i_16_n_0 }),
        .O(\NLW_bresp_reg[1]_i_9_O_UNCONNECTED [3:0]),
        .S({\bresp[1]_i_17_n_0 ,\bresp[1]_i_18_n_0 ,\bresp[1]_i_19_n_0 ,\bresp[1]_i_20_n_0 }));
  LUT6 #(
    .INIT(64'hD414FFFFFC3C0000)) 
    bvalid_i_1
       (.I0(bready),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(bvalid_i_2_n_0),
        .I4(bvalid_i_3_n_0),
        .I5(bvalid),
        .O(bvalid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT4 #(
    .INIT(16'h4777)) 
    bvalid_i_2
       (.I0(tx_ready),
        .I1(beat_count4),
        .I2(bvalid),
        .I3(bready),
        .O(bvalid_i_2_n_0));
  LUT6 #(
    .INIT(64'h0FF000C000AF00AF)) 
    bvalid_i_3
       (.I0(\bresp[1]_i_4_n_0 ),
        .I1(beat_count4),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(tx_data_valid_INST_0_i_1_n_0),
        .I5(\state_reg_n_0_[0] ),
        .O(bvalid_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    bvalid_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(bvalid_i_1_n_0),
        .Q(bvalid),
        .R(rst));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    r_addr2
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,state3_i_1_n_0,state3_i_2_n_0,state3_i_3_n_0,state3_i_4_n_0,state3_i_5_n_0,state3_i_6_n_0,state3_i_7_n_0,state3_i_8_n_0,state3_i_9_n_0,state3_i_10_n_0,state3_i_11_n_0,state3_i_12_n_0,state3_i_13_n_0,state3_i_14_n_0,state3_i_15_n_0,state3_i_16_n_0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_r_addr2_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out_addr[43:36]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_r_addr2_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out_addr[31:0]}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_r_addr2_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_r_addr2_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_r_addr2_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_r_addr2_OVERFLOW_UNCONNECTED),
        .P({NLW_r_addr2_P_UNCONNECTED[47:32],r_addr2_n_74,r_addr2_n_75,r_addr2_n_76,r_addr2_n_77,r_addr2_n_78,r_addr2_n_79,r_addr2_n_80,r_addr2_n_81,r_addr2_n_82,r_addr2_n_83,r_addr2_n_84,r_addr2_n_85,r_addr2_n_86,r_addr2_n_87,r_addr2_n_88,r_addr2_n_89,r_addr2_n_90,r_addr2_n_91,r_addr2_n_92,r_addr2_n_93,r_addr2_n_94,r_addr2_n_95,r_addr2_n_96,r_addr2_n_97,r_addr2_n_98,r_addr2_n_99,r_addr2_n_100,r_addr2_n_101,r_addr2_n_102,r_addr2_n_103,r_addr2_n_104,r_addr2_n_105}),
        .PATTERNBDETECT(NLW_r_addr2_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_r_addr2_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_r_addr2_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_r_addr2_UNDERFLOW_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_addr[0]_i_1 
       (.I0(r_addr[0]),
        .I1(\state_reg_n_0_[0] ),
        .I2(out_addr[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_addr[1]_i_1 
       (.I0(r_addr[1]),
        .I1(\state_reg_n_0_[0] ),
        .I2(out_addr[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_addr[2]_i_1 
       (.I0(r_addr[2]),
        .I1(\state_reg_n_0_[0] ),
        .I2(out_addr[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_addr[3]_i_1 
       (.I0(r_addr[3]),
        .I1(\state_reg_n_0_[0] ),
        .I2(out_addr[3]),
        .O(p_0_in[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \r_addr[3]_i_10 
       (.I0(\beat_count_reg_n_0_[0] ),
        .I1(out_addr[34]),
        .I2(out_addr[35]),
        .I3(out_addr[33]),
        .I4(out_addr[32]),
        .O(\r_addr[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAA6AAAAAAAAA)) 
    \r_addr[3]_i_11 
       (.I0(\r_addr[3]_i_8_n_0 ),
        .I1(out_addr[33]),
        .I2(out_addr[32]),
        .I3(out_addr[35]),
        .I4(out_addr[34]),
        .I5(\beat_count_reg_n_0_[0] ),
        .O(\r_addr[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h00000CFA00000C0A)) 
    \r_addr[3]_i_12 
       (.I0(\beat_count_reg_n_0_[2] ),
        .I1(\beat_count_reg_n_0_[1] ),
        .I2(out_addr[33]),
        .I3(out_addr[32]),
        .I4(\r_addr[3]_i_15_n_0 ),
        .I5(\beat_count_reg_n_0_[0] ),
        .O(\r_addr[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000A0C)) 
    \r_addr[3]_i_13 
       (.I0(\beat_count_reg_n_0_[0] ),
        .I1(\beat_count_reg_n_0_[1] ),
        .I2(out_addr[33]),
        .I3(out_addr[32]),
        .I4(out_addr[35]),
        .I5(out_addr[34]),
        .O(\r_addr[3]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \r_addr[3]_i_14 
       (.I0(out_addr[34]),
        .I1(out_addr[35]),
        .I2(out_addr[32]),
        .I3(out_addr[33]),
        .I4(\beat_count_reg_n_0_[0] ),
        .O(\r_addr[3]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[3]_i_15 
       (.I0(out_addr[34]),
        .I1(out_addr[35]),
        .O(\r_addr[3]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \r_addr[3]_i_4 
       (.I0(out_addr[48]),
        .I1(out_addr[49]),
        .I2(\r_addr_reg_n_0_[3] ),
        .I3(\r_addr_reg[3]_i_3_n_4 ),
        .O(\r_addr[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \r_addr[3]_i_5 
       (.I0(out_addr[48]),
        .I1(out_addr[49]),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(\r_addr_reg[3]_i_3_n_5 ),
        .O(\r_addr[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \r_addr[3]_i_6 
       (.I0(out_addr[48]),
        .I1(out_addr[49]),
        .I2(\r_addr_reg_n_0_[1] ),
        .I3(\r_addr_reg[3]_i_3_n_6 ),
        .O(\r_addr[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \r_addr[3]_i_7 
       (.I0(out_addr[48]),
        .I1(out_addr[49]),
        .I2(\r_addr_reg_n_0_[0] ),
        .I3(\r_addr_reg[3]_i_3_n_7 ),
        .O(\r_addr[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h000C0A0F000C0A00)) 
    \r_addr[3]_i_8 
       (.I0(\beat_count_reg_n_0_[1] ),
        .I1(\beat_count_reg_n_0_[2] ),
        .I2(\r_addr[3]_i_15_n_0 ),
        .I3(out_addr[33]),
        .I4(out_addr[32]),
        .I5(\beat_count_reg_n_0_[3] ),
        .O(\r_addr[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000002300000020)) 
    \r_addr[3]_i_9 
       (.I0(\beat_count_reg_n_0_[1] ),
        .I1(out_addr[33]),
        .I2(out_addr[32]),
        .I3(out_addr[35]),
        .I4(out_addr[34]),
        .I5(\beat_count_reg_n_0_[2] ),
        .O(\r_addr[3]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_addr[4]_i_1 
       (.I0(r_addr[4]),
        .I1(\state_reg_n_0_[0] ),
        .I2(out_addr[4]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_addr[5]_i_1 
       (.I0(r_addr[5]),
        .I1(\state_reg_n_0_[0] ),
        .I2(out_addr[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_addr[6]_i_1 
       (.I0(r_addr[6]),
        .I1(\state_reg_n_0_[0] ),
        .I2(out_addr[6]),
        .O(p_0_in[6]));
  LUT6 #(
    .INIT(64'h0000054055555555)) 
    \r_addr[7]_i_1 
       (.I0(rst),
        .I1(r_addr1),
        .I2(out_addr[49]),
        .I3(out_addr[48]),
        .I4(\r_addr[7]_i_4_n_0 ),
        .I5(\addr[7]_i_4_n_0 ),
        .O(\r_addr[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_10 
       (.I0(r_addr2_n_80),
        .I1(r_addr2_n_81),
        .O(\r_addr[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_11 
       (.I0(r_addr2_n_75),
        .I1(r_addr2_n_74),
        .O(\r_addr[7]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_12 
       (.I0(r_addr2_n_77),
        .I1(r_addr2_n_76),
        .O(\r_addr[7]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_13 
       (.I0(r_addr2_n_79),
        .I1(r_addr2_n_78),
        .O(\r_addr[7]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_14 
       (.I0(r_addr2_n_81),
        .I1(r_addr2_n_80),
        .O(\r_addr[7]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hA6AA)) 
    \r_addr[7]_i_16 
       (.I0(\r_addr_reg[7]_i_15_n_4 ),
        .I1(out_addr[48]),
        .I2(out_addr[49]),
        .I3(\r_addr_reg_n_0_[7] ),
        .O(\r_addr[7]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \r_addr[7]_i_17 
       (.I0(out_addr[48]),
        .I1(out_addr[49]),
        .I2(\r_addr_reg_n_0_[6] ),
        .I3(\r_addr_reg[7]_i_15_n_5 ),
        .O(\r_addr[7]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \r_addr[7]_i_18 
       (.I0(out_addr[48]),
        .I1(out_addr[49]),
        .I2(\r_addr_reg_n_0_[5] ),
        .I3(\r_addr_reg[7]_i_15_n_6 ),
        .O(\r_addr[7]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \r_addr[7]_i_19 
       (.I0(out_addr[48]),
        .I1(out_addr[49]),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(\r_addr_reg[7]_i_15_n_7 ),
        .O(\r_addr[7]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_addr[7]_i_2 
       (.I0(r_addr[7]),
        .I1(\state_reg_n_0_[0] ),
        .I2(out_addr[7]),
        .O(p_0_in[7]));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_21 
       (.I0(r_addr2_n_82),
        .I1(r_addr2_n_83),
        .O(\r_addr[7]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_22 
       (.I0(r_addr2_n_84),
        .I1(r_addr2_n_85),
        .O(\r_addr[7]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_23 
       (.I0(r_addr2_n_86),
        .I1(r_addr2_n_87),
        .O(\r_addr[7]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_24 
       (.I0(r_addr2_n_88),
        .I1(r_addr2_n_89),
        .O(\r_addr[7]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_25 
       (.I0(r_addr2_n_83),
        .I1(r_addr2_n_82),
        .O(\r_addr[7]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_26 
       (.I0(r_addr2_n_85),
        .I1(r_addr2_n_84),
        .O(\r_addr[7]_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_27 
       (.I0(r_addr2_n_87),
        .I1(r_addr2_n_86),
        .O(\r_addr[7]_i_27_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_28 
       (.I0(r_addr2_n_89),
        .I1(r_addr2_n_88),
        .O(\r_addr[7]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    \r_addr[7]_i_29 
       (.I0(\beat_count_reg_n_0_[0] ),
        .I1(out_addr[33]),
        .I2(out_addr[32]),
        .I3(out_addr[35]),
        .I4(out_addr[34]),
        .I5(\r_addr[7]_i_43_n_0 ),
        .O(\r_addr[7]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB0008000)) 
    \r_addr[7]_i_30 
       (.I0(\beat_count_reg_n_0_[0] ),
        .I1(out_addr[32]),
        .I2(out_addr[33]),
        .I3(\r_addr[7]_i_44_n_0 ),
        .I4(\beat_count_reg_n_0_[1] ),
        .I5(\r_addr[7]_i_45_n_0 ),
        .O(\r_addr[7]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hBEAAAEAABAAAAAAA)) 
    \r_addr[7]_i_31 
       (.I0(\r_addr[7]_i_46_n_0 ),
        .I1(out_addr[33]),
        .I2(out_addr[32]),
        .I3(\r_addr[7]_i_44_n_0 ),
        .I4(\beat_count_reg_n_0_[1] ),
        .I5(\beat_count_reg_n_0_[0] ),
        .O(\r_addr[7]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCECFCCCCCECCC)) 
    \r_addr[7]_i_32 
       (.I0(\beat_count_reg_n_0_[0] ),
        .I1(\r_addr[7]_i_47_n_0 ),
        .I2(\r_addr[7]_i_44_n_0 ),
        .I3(out_addr[32]),
        .I4(out_addr[33]),
        .I5(\beat_count_reg_n_0_[1] ),
        .O(\r_addr[7]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    \r_addr[7]_i_33 
       (.I0(\beat_count_reg_n_0_[0] ),
        .I1(out_addr[33]),
        .I2(out_addr[32]),
        .I3(out_addr[35]),
        .I4(out_addr[34]),
        .I5(\r_addr[7]_i_43_n_0 ),
        .O(\r_addr[7]_i_33_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_35 
       (.I0(r_addr2_n_90),
        .I1(r_addr2_n_91),
        .O(\r_addr[7]_i_35_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_36 
       (.I0(r_addr2_n_92),
        .I1(r_addr2_n_93),
        .O(\r_addr[7]_i_36_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_37 
       (.I0(r_addr2_n_94),
        .I1(r_addr2_n_95),
        .O(\r_addr[7]_i_37_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_38 
       (.I0(r_addr2_n_96),
        .I1(r_addr2_n_97),
        .O(\r_addr[7]_i_38_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_39 
       (.I0(r_addr2_n_91),
        .I1(r_addr2_n_90),
        .O(\r_addr[7]_i_39_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \r_addr[7]_i_4 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[2] ),
        .O(\r_addr[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_40 
       (.I0(r_addr2_n_93),
        .I1(r_addr2_n_92),
        .O(\r_addr[7]_i_40_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_41 
       (.I0(r_addr2_n_95),
        .I1(r_addr2_n_94),
        .O(\r_addr[7]_i_41_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_addr[7]_i_42 
       (.I0(r_addr2_n_97),
        .I1(r_addr2_n_96),
        .O(\r_addr[7]_i_42_n_0 ));
  LUT6 #(
    .INIT(64'h0A0C0F000A0C0000)) 
    \r_addr[7]_i_43 
       (.I0(\beat_count_reg_n_0_[1] ),
        .I1(\beat_count_reg_n_0_[2] ),
        .I2(\r_addr[3]_i_15_n_0 ),
        .I3(out_addr[32]),
        .I4(out_addr[33]),
        .I5(\beat_count_reg_n_0_[3] ),
        .O(\r_addr[7]_i_43_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r_addr[7]_i_44 
       (.I0(out_addr[34]),
        .I1(out_addr[35]),
        .O(\r_addr[7]_i_44_n_0 ));
  LUT6 #(
    .INIT(64'h000000000C000A00)) 
    \r_addr[7]_i_45 
       (.I0(\beat_count_reg_n_0_[3] ),
        .I1(\beat_count_reg_n_0_[2] ),
        .I2(out_addr[35]),
        .I3(out_addr[34]),
        .I4(out_addr[32]),
        .I5(out_addr[33]),
        .O(\r_addr[7]_i_45_n_0 ));
  LUT6 #(
    .INIT(64'h0000000C0000A000)) 
    \r_addr[7]_i_46 
       (.I0(\beat_count_reg_n_0_[3] ),
        .I1(\beat_count_reg_n_0_[2] ),
        .I2(out_addr[33]),
        .I3(out_addr[32]),
        .I4(out_addr[35]),
        .I5(out_addr[34]),
        .O(\r_addr[7]_i_46_n_0 ));
  LUT6 #(
    .INIT(64'h000000C800000008)) 
    \r_addr[7]_i_47 
       (.I0(\beat_count_reg_n_0_[3] ),
        .I1(out_addr[33]),
        .I2(out_addr[32]),
        .I3(out_addr[35]),
        .I4(out_addr[34]),
        .I5(\beat_count_reg_n_0_[2] ),
        .O(\r_addr[7]_i_47_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \r_addr[7]_i_48 
       (.I0(r_addr2_n_98),
        .I1(\r_addr_reg_n_0_[7] ),
        .I2(r_addr2_n_99),
        .I3(\r_addr_reg_n_0_[6] ),
        .O(\r_addr[7]_i_48_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \r_addr[7]_i_49 
       (.I0(r_addr2_n_100),
        .I1(\r_addr_reg_n_0_[5] ),
        .I2(r_addr2_n_101),
        .I3(\r_addr_reg_n_0_[4] ),
        .O(\r_addr[7]_i_49_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \r_addr[7]_i_50 
       (.I0(r_addr2_n_102),
        .I1(\r_addr_reg_n_0_[3] ),
        .I2(r_addr2_n_103),
        .I3(\r_addr_reg_n_0_[2] ),
        .O(\r_addr[7]_i_50_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \r_addr[7]_i_51 
       (.I0(r_addr2_n_104),
        .I1(\r_addr_reg_n_0_[1] ),
        .I2(r_addr2_n_105),
        .I3(\r_addr_reg_n_0_[0] ),
        .O(\r_addr[7]_i_51_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \r_addr[7]_i_52 
       (.I0(\r_addr_reg_n_0_[7] ),
        .I1(r_addr2_n_98),
        .I2(\r_addr_reg_n_0_[6] ),
        .I3(r_addr2_n_99),
        .O(\r_addr[7]_i_52_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \r_addr[7]_i_53 
       (.I0(\r_addr_reg_n_0_[5] ),
        .I1(r_addr2_n_100),
        .I2(\r_addr_reg_n_0_[4] ),
        .I3(r_addr2_n_101),
        .O(\r_addr[7]_i_53_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \r_addr[7]_i_54 
       (.I0(\r_addr_reg_n_0_[3] ),
        .I1(r_addr2_n_102),
        .I2(\r_addr_reg_n_0_[2] ),
        .I3(r_addr2_n_103),
        .O(\r_addr[7]_i_54_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \r_addr[7]_i_55 
       (.I0(\r_addr_reg_n_0_[1] ),
        .I1(r_addr2_n_104),
        .I2(\r_addr_reg_n_0_[0] ),
        .I3(r_addr2_n_105),
        .O(\r_addr[7]_i_55_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_7 
       (.I0(r_addr2_n_74),
        .I1(r_addr2_n_75),
        .O(\r_addr[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_8 
       (.I0(r_addr2_n_76),
        .I1(r_addr2_n_77),
        .O(\r_addr[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_addr[7]_i_9 
       (.I0(r_addr2_n_78),
        .I1(r_addr2_n_79),
        .O(\r_addr[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[0] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_0_in[0]),
        .Q(\r_addr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[1] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_0_in[1]),
        .Q(\r_addr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[2] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_0_in[2]),
        .Q(\r_addr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[3] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_0_in[3]),
        .Q(\r_addr_reg_n_0_[3] ),
        .R(1'b0));
  CARRY4 \r_addr_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\r_addr_reg[3]_i_2_n_0 ,\r_addr_reg[3]_i_2_n_1 ,\r_addr_reg[3]_i_2_n_2 ,\r_addr_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr_reg[3]_i_3_n_4 ,\r_addr_reg[3]_i_3_n_5 ,\r_addr_reg[3]_i_3_n_6 ,\r_addr_reg[3]_i_3_n_7 }),
        .O(r_addr[3:0]),
        .S({\r_addr[3]_i_4_n_0 ,\r_addr[3]_i_5_n_0 ,\r_addr[3]_i_6_n_0 ,\r_addr[3]_i_7_n_0 }));
  CARRY4 \r_addr_reg[3]_i_3 
       (.CI(1'b0),
        .CO({\r_addr_reg[3]_i_3_n_0 ,\r_addr_reg[3]_i_3_n_1 ,\r_addr_reg[3]_i_3_n_2 ,\r_addr_reg[3]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[3]_i_8_n_0 ,\r_addr[3]_i_9_n_0 ,\r_addr[3]_i_10_n_0 ,1'b0}),
        .O({\r_addr_reg[3]_i_3_n_4 ,\r_addr_reg[3]_i_3_n_5 ,\r_addr_reg[3]_i_3_n_6 ,\r_addr_reg[3]_i_3_n_7 }),
        .S({\r_addr[3]_i_11_n_0 ,\r_addr[3]_i_12_n_0 ,\r_addr[3]_i_13_n_0 ,\r_addr[3]_i_14_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[4] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_0_in[4]),
        .Q(\r_addr_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[5] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_0_in[5]),
        .Q(\r_addr_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[6] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_0_in[6]),
        .Q(\r_addr_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_addr_reg[7] 
       (.C(rd_clk),
        .CE(\r_addr[7]_i_1_n_0 ),
        .D(p_0_in[7]),
        .Q(\r_addr_reg_n_0_[7] ),
        .R(1'b0));
  CARRY4 \r_addr_reg[7]_i_15 
       (.CI(\r_addr_reg[3]_i_3_n_0 ),
        .CO({\NLW_r_addr_reg[7]_i_15_CO_UNCONNECTED [3],\r_addr_reg[7]_i_15_n_1 ,\r_addr_reg[7]_i_15_n_2 ,\r_addr_reg[7]_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\r_addr[7]_i_29_n_0 }),
        .O({\r_addr_reg[7]_i_15_n_4 ,\r_addr_reg[7]_i_15_n_5 ,\r_addr_reg[7]_i_15_n_6 ,\r_addr_reg[7]_i_15_n_7 }),
        .S({\r_addr[7]_i_30_n_0 ,\r_addr[7]_i_31_n_0 ,\r_addr[7]_i_32_n_0 ,\r_addr[7]_i_33_n_0 }));
  CARRY4 \r_addr_reg[7]_i_20 
       (.CI(\r_addr_reg[7]_i_34_n_0 ),
        .CO({\r_addr_reg[7]_i_20_n_0 ,\r_addr_reg[7]_i_20_n_1 ,\r_addr_reg[7]_i_20_n_2 ,\r_addr_reg[7]_i_20_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[7]_i_35_n_0 ,\r_addr[7]_i_36_n_0 ,\r_addr[7]_i_37_n_0 ,\r_addr[7]_i_38_n_0 }),
        .O(\NLW_r_addr_reg[7]_i_20_O_UNCONNECTED [3:0]),
        .S({\r_addr[7]_i_39_n_0 ,\r_addr[7]_i_40_n_0 ,\r_addr[7]_i_41_n_0 ,\r_addr[7]_i_42_n_0 }));
  CARRY4 \r_addr_reg[7]_i_3 
       (.CI(\r_addr_reg[7]_i_6_n_0 ),
        .CO({r_addr1,\r_addr_reg[7]_i_3_n_1 ,\r_addr_reg[7]_i_3_n_2 ,\r_addr_reg[7]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[7]_i_7_n_0 ,\r_addr[7]_i_8_n_0 ,\r_addr[7]_i_9_n_0 ,\r_addr[7]_i_10_n_0 }),
        .O(\NLW_r_addr_reg[7]_i_3_O_UNCONNECTED [3:0]),
        .S({\r_addr[7]_i_11_n_0 ,\r_addr[7]_i_12_n_0 ,\r_addr[7]_i_13_n_0 ,\r_addr[7]_i_14_n_0 }));
  CARRY4 \r_addr_reg[7]_i_34 
       (.CI(1'b0),
        .CO({\r_addr_reg[7]_i_34_n_0 ,\r_addr_reg[7]_i_34_n_1 ,\r_addr_reg[7]_i_34_n_2 ,\r_addr_reg[7]_i_34_n_3 }),
        .CYINIT(1'b1),
        .DI({\r_addr[7]_i_48_n_0 ,\r_addr[7]_i_49_n_0 ,\r_addr[7]_i_50_n_0 ,\r_addr[7]_i_51_n_0 }),
        .O(\NLW_r_addr_reg[7]_i_34_O_UNCONNECTED [3:0]),
        .S({\r_addr[7]_i_52_n_0 ,\r_addr[7]_i_53_n_0 ,\r_addr[7]_i_54_n_0 ,\r_addr[7]_i_55_n_0 }));
  CARRY4 \r_addr_reg[7]_i_5 
       (.CI(\r_addr_reg[3]_i_2_n_0 ),
        .CO({\NLW_r_addr_reg[7]_i_5_CO_UNCONNECTED [3],\r_addr_reg[7]_i_5_n_1 ,\r_addr_reg[7]_i_5_n_2 ,\r_addr_reg[7]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\r_addr_reg[7]_i_15_n_5 ,\r_addr_reg[7]_i_15_n_6 ,\r_addr_reg[7]_i_15_n_7 }),
        .O(r_addr[7:4]),
        .S({\r_addr[7]_i_16_n_0 ,\r_addr[7]_i_17_n_0 ,\r_addr[7]_i_18_n_0 ,\r_addr[7]_i_19_n_0 }));
  CARRY4 \r_addr_reg[7]_i_6 
       (.CI(\r_addr_reg[7]_i_20_n_0 ),
        .CO({\r_addr_reg[7]_i_6_n_0 ,\r_addr_reg[7]_i_6_n_1 ,\r_addr_reg[7]_i_6_n_2 ,\r_addr_reg[7]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({\r_addr[7]_i_21_n_0 ,\r_addr[7]_i_22_n_0 ,\r_addr[7]_i_23_n_0 ,\r_addr[7]_i_24_n_0 }),
        .O(\NLW_r_addr_reg[7]_i_6_O_UNCONNECTED [3:0]),
        .S({\r_addr[7]_i_25_n_0 ,\r_addr[7]_i_26_n_0 ,\r_addr[7]_i_27_n_0 ,\r_addr[7]_i_28_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'h34)) 
    read_wdata_INST_0
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[2] ),
        .O(read_wdata));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(0),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(0),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("TRUE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    state3
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_state3_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,state3_i_1_n_0,state3_i_2_n_0,state3_i_3_n_0,state3_i_4_n_0,state3_i_5_n_0,state3_i_6_n_0,state3_i_7_n_0,state3_i_8_n_0,state3_i_9_n_0,state3_i_10_n_0,state3_i_11_n_0,state3_i_12_n_0,state3_i_13_n_0,state3_i_14_n_0,state3_i_15_n_0,state3_i_16_n_0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_state3_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_state3_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_state3_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out_addr[43:36]}),
        .INMODE({1'b0,1'b0,1'b1,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_state3_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_state3_OVERFLOW_UNCONNECTED),
        .P({NLW_state3_P_UNCONNECTED[47:25],state3_n_81,state3_n_82,state3_n_83,state3_n_84,state3_n_85,state3_n_86,state3_n_87,state3_n_88,state3_n_89,state3_n_90,state3_n_91,state3_n_92,state3_n_93,state3_n_94,state3_n_95,state3_n_96,state3_n_97,state3_n_98,state3_n_99,state3_n_100,state3_n_101,state3_n_102,state3_n_103,state3_n_104,state3_n_105}),
        .PATTERNBDETECT(NLW_state3_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_state3_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_state3_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_state3_UNDERFLOW_UNCONNECTED));
  LUT4 #(
    .INIT(16'h8000)) 
    state3_i_1
       (.I0(out_addr[35]),
        .I1(out_addr[34]),
        .I2(out_addr[33]),
        .I3(out_addr[32]),
        .O(state3_i_1_n_0));
  LUT4 #(
    .INIT(16'h0040)) 
    state3_i_10
       (.I0(out_addr[35]),
        .I1(out_addr[34]),
        .I2(out_addr[33]),
        .I3(out_addr[32]),
        .O(state3_i_10_n_0));
  LUT4 #(
    .INIT(16'h0040)) 
    state3_i_11
       (.I0(out_addr[35]),
        .I1(out_addr[34]),
        .I2(out_addr[32]),
        .I3(out_addr[33]),
        .O(state3_i_11_n_0));
  LUT4 #(
    .INIT(16'h0100)) 
    state3_i_12
       (.I0(out_addr[33]),
        .I1(out_addr[32]),
        .I2(out_addr[35]),
        .I3(out_addr[34]),
        .O(state3_i_12_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    state3_i_13
       (.I0(out_addr[34]),
        .I1(out_addr[35]),
        .I2(out_addr[32]),
        .I3(out_addr[33]),
        .O(state3_i_13_n_0));
  LUT4 #(
    .INIT(16'h0100)) 
    state3_i_14
       (.I0(out_addr[34]),
        .I1(out_addr[35]),
        .I2(out_addr[32]),
        .I3(out_addr[33]),
        .O(state3_i_14_n_0));
  LUT4 #(
    .INIT(16'h0100)) 
    state3_i_15
       (.I0(out_addr[34]),
        .I1(out_addr[35]),
        .I2(out_addr[33]),
        .I3(out_addr[32]),
        .O(state3_i_15_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    state3_i_16
       (.I0(out_addr[33]),
        .I1(out_addr[32]),
        .I2(out_addr[35]),
        .I3(out_addr[34]),
        .O(state3_i_16_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    state3_i_2
       (.I0(out_addr[35]),
        .I1(out_addr[34]),
        .I2(out_addr[33]),
        .I3(out_addr[32]),
        .O(state3_i_2_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    state3_i_3
       (.I0(out_addr[35]),
        .I1(out_addr[34]),
        .I2(out_addr[32]),
        .I3(out_addr[33]),
        .O(state3_i_3_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    state3_i_4
       (.I0(out_addr[33]),
        .I1(out_addr[32]),
        .I2(out_addr[35]),
        .I3(out_addr[34]),
        .O(state3_i_4_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    state3_i_5
       (.I0(out_addr[33]),
        .I1(out_addr[32]),
        .I2(out_addr[35]),
        .I3(out_addr[34]),
        .O(state3_i_5_n_0));
  LUT4 #(
    .INIT(16'h0020)) 
    state3_i_6
       (.I0(out_addr[33]),
        .I1(out_addr[32]),
        .I2(out_addr[35]),
        .I3(out_addr[34]),
        .O(state3_i_6_n_0));
  LUT4 #(
    .INIT(16'h0020)) 
    state3_i_7
       (.I0(out_addr[32]),
        .I1(out_addr[33]),
        .I2(out_addr[35]),
        .I3(out_addr[34]),
        .O(state3_i_7_n_0));
  LUT4 #(
    .INIT(16'h0010)) 
    state3_i_8
       (.I0(out_addr[33]),
        .I1(out_addr[32]),
        .I2(out_addr[35]),
        .I3(out_addr[34]),
        .O(state3_i_8_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    state3_i_9
       (.I0(out_addr[35]),
        .I1(out_addr[34]),
        .I2(out_addr[33]),
        .I3(out_addr[32]),
        .O(state3_i_9_n_0));
  LUT6 #(
    .INIT(64'hEAFFFFFFBAFF0000)) 
    \state[0]_i_1 
       (.I0(\state[0]_i_2_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\addr[7]_i_4_n_0 ),
        .I4(\state[2]_i_3_n_0 ),
        .I5(\state_reg_n_0_[0] ),
        .O(\state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4445444444444444)) 
    \state[0]_i_2 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state[0]_i_3_n_0 ),
        .I2(beat_count4),
        .I3(tx_data_valid_INST_0_i_1_n_0),
        .I4(\state_reg_n_0_[0] ),
        .I5(\state_reg_n_0_[1] ),
        .O(\state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \state[0]_i_3 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(w_empty),
        .I3(awempty),
        .O(\state[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \state[1]_i_1 
       (.I0(\state[1]_i_2_n_0 ),
        .I1(\state[2]_i_3_n_0 ),
        .I2(\state_reg_n_0_[1] ),
        .O(\state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000033333333C4F7)) 
    \state[1]_i_2 
       (.I0(\state[1]_i_3_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\bresp[1]_i_8_n_0 ),
        .I3(\state[1]_i_4_n_0 ),
        .I4(\state_reg_n_0_[0] ),
        .I5(\state_reg_n_0_[2] ),
        .O(\state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \state[1]_i_3 
       (.I0(out_addr[5]),
        .I1(state2),
        .I2(out_addr[3]),
        .I3(\bresp[1]_i_6_n_0 ),
        .O(\state[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state[1]_i_4 
       (.I0(awempty),
        .I1(w_empty),
        .O(\state[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \state[2]_i_1 
       (.I0(\state[2]_i_2_n_0 ),
        .I1(\state[2]_i_3_n_0 ),
        .I2(\state_reg_n_0_[2] ),
        .O(\state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \state[2]_i_10 
       (.I0(bready),
        .I1(bvalid),
        .O(\state[2]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \state[2]_i_11 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .O(\state[2]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT5 #(
    .INIT(32'hBB3333F3)) 
    \state[2]_i_12 
       (.I0(addr_read_ready),
        .I1(\state_reg_n_0_[2] ),
        .I2(out_data_ready),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .O(\state[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAEAAFAAAAEA)) 
    \state[2]_i_2 
       (.I0(\state[0]_i_2_n_0 ),
        .I1(\bresp[1]_i_8_n_0 ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .I5(tx_data_valid_INST_0_i_1_n_0),
        .O(\state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFD00FDFDFC00FC00)) 
    \state[2]_i_3 
       (.I0(\state[2]_i_4_n_0 ),
        .I1(\state[2]_i_5_n_0 ),
        .I2(\state[2]_i_6_n_0 ),
        .I3(\state[2]_i_7_n_0 ),
        .I4(\state[2]_i_8_n_0 ),
        .I5(\state[2]_i_9_n_0 ),
        .O(\state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAABAAA)) 
    \state[2]_i_4 
       (.I0(\bresp[1]_i_8_n_0 ),
        .I1(out_addr[5]),
        .I2(state2),
        .I3(out_addr[3]),
        .I4(\bresp[1]_i_6_n_0 ),
        .I5(\state[2]_i_10_n_0 ),
        .O(\state[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000F011)) 
    \state[2]_i_5 
       (.I0(awempty),
        .I1(w_empty),
        .I2(out_data_ready),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(\state_reg_n_0_[2] ),
        .O(\state[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4544404440444044)) 
    \state[2]_i_6 
       (.I0(\state[2]_i_11_n_0 ),
        .I1(tx_ready),
        .I2(beat_count4),
        .I3(tx_data_valid_INST_0_i_1_n_0),
        .I4(bready),
        .I5(bvalid),
        .O(\state[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF40004444)) 
    \state[2]_i_7 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(bvalid),
        .I3(bready),
        .I4(tx_data_valid_INST_0_i_1_n_0),
        .I5(\state[2]_i_12_n_0 ),
        .O(\state[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \state[2]_i_8 
       (.I0(w_empty),
        .I1(beat_count3),
        .I2(beat_count4),
        .O(\state[2]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state[2]_i_9 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .O(\state[2]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\state[2]_i_1_n_0 ),
        .Q(\state_reg_n_0_[2] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    tx_data_valid_INST_0
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(tx_data_valid_INST_0_i_1_n_0),
        .O(tx_data_valid));
  CARRY4 tx_data_valid_INST_0_i_1
       (.CI(1'b0),
        .CO({tx_data_valid_INST_0_i_1_n_0,tx_data_valid_INST_0_i_1_n_1,tx_data_valid_INST_0_i_1_n_2,tx_data_valid_INST_0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,tx_data_valid_INST_0_i_2_n_0,tx_data_valid_INST_0_i_3_n_0}),
        .O(NLW_tx_data_valid_INST_0_i_1_O_UNCONNECTED[3:0]),
        .S({tx_data_valid_INST_0_i_4_n_0,tx_data_valid_INST_0_i_5_n_0,tx_data_valid_INST_0_i_6_n_0,tx_data_valid_INST_0_i_7_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    tx_data_valid_INST_0_i_2
       (.I0(\beat_count_reg_n_0_[3] ),
        .I1(out_addr[39]),
        .I2(\beat_count_reg_n_0_[2] ),
        .I3(out_addr[38]),
        .O(tx_data_valid_INST_0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    tx_data_valid_INST_0_i_3
       (.I0(\beat_count_reg_n_0_[1] ),
        .I1(out_addr[37]),
        .I2(\beat_count_reg_n_0_[0] ),
        .I3(out_addr[36]),
        .O(tx_data_valid_INST_0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tx_data_valid_INST_0_i_4
       (.I0(out_addr[43]),
        .I1(out_addr[42]),
        .O(tx_data_valid_INST_0_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tx_data_valid_INST_0_i_5
       (.I0(out_addr[40]),
        .I1(out_addr[41]),
        .O(tx_data_valid_INST_0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    tx_data_valid_INST_0_i_6
       (.I0(out_addr[39]),
        .I1(\beat_count_reg_n_0_[3] ),
        .I2(out_addr[38]),
        .I3(\beat_count_reg_n_0_[2] ),
        .O(tx_data_valid_INST_0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    tx_data_valid_INST_0_i_7
       (.I0(out_addr[37]),
        .I1(\beat_count_reg_n_0_[1] ),
        .I2(out_addr[36]),
        .I3(\beat_count_reg_n_0_[0] ),
        .O(tx_data_valid_INST_0_i_7_n_0));
endmodule

(* ADDR_WIDTH = "32" *) (* DATA_WIDTH = "64" *) (* ID_WIDTH = "4" *) 
(* LEN_WIDTH = "8" *) (* RESPONSE_WIDTH = "3" *) (* SIZE_WIDTH = "4" *) 
(* WDATA_FIFO_WIDTH = "73" *) (* W_DEPTH = "32" *) 
module W_FIFO
   (aclk,
    areset,
    wvalid,
    wfifo_wdata,
    wfifo_wstrb,
    wlast,
    wready,
    rd_clk,
    read_wdata,
    out_data_ready,
    w_full,
    w_empty,
    out_wdata);
  input aclk;
  input areset;
  input wvalid;
  input [63:0]wfifo_wdata;
  input [7:0]wfifo_wstrb;
  input wlast;
  output wready;
  input rd_clk;
  input read_wdata;
  output out_data_ready;
  output w_full;
  output w_empty;
  output [63:0]out_wdata;

  wire \<const0> ;
  wire aclk;
  wire areset;
  wire out_data_ready;
  wire [63:0]out_wdata;
  wire rd_clk;
  wire read_wdata;
  wire w_empty;
  wire [63:0]wfifo_wdata;
  wire [7:0]wfifo_wstrb;
  wire wready;
  wire wvalid;
  wire NLW_W_FIFO_INST_full_UNCONNECTED;
  wire [72:64]NLW_W_FIFO_INST_rd_data_UNCONNECTED;

  assign w_full = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* BYTES = "9" *) 
  (* BYTE_POINTER_WIDTH = "8" *) 
  (* COUNTER_WIDTH = "5" *) 
  (* DATA_WIDTH = "73" *) 
  (* DEPTH = "32" *) 
  (* IDEL = "2'b00" *) 
  (* READ = "2'b10" *) 
  (* WRITE = "2'b01" *) 
  FIFO__parameterized0 W_FIFO_INST
       (.empty(w_empty),
        .full(NLW_W_FIFO_INST_full_UNCONNECTED),
        .rd_clk(rd_clk),
        .rd_data({NLW_W_FIFO_INST_rd_data_UNCONNECTED[72:64],out_wdata}),
        .rd_en(read_wdata),
        .rd_ready(out_data_ready),
        .rst(areset),
        .wr_clk(aclk),
        .wr_data({1'b0,wfifo_wstrb,wfifo_wdata}),
        .wr_en(wvalid),
        .wr_ready(wready));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
