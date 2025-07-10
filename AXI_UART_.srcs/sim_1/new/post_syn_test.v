`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2025 17:33:58
// Design Name: 
// Module Name: AXI_TOP_TEST  
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


`timescale 1ns / 1ps

  module POST_SYN_AXI_TOP_TEST;

    // Parameters
    parameter ADDR_WIDTH = 32;
    parameter DATA_WIDTH = 64;
    parameter ID_WIDTH = 4;
    parameter SIZE_WIDTH = 4;
    parameter LEN_WIDTH = 8;
    parameter RESPONSE_WIDTH = 3;

    // Clock and reset
    reg aclk = 0;
    reg areset = 0;
    reg rd_clk =0;
    reg [7:0] D;
    reg [63:0] write_mem [0:32];
    
    

    always #10 aclk = ~aclk;  // 100 MHz clock
    always #15 rd_clk = ~rd_clk;

    // Testbench inputs
    reg trigger;
    reg [ADDR_WIDTH-1:0] in_addr;
    reg [ID_WIDTH-1:0] in_id;
    reg [LEN_WIDTH-1:0] in_len;
    reg [SIZE_WIDTH-1:0] in_size;
    reg [1:0] burst_type;
    reg [(DATA_WIDTH/8)-1:0] in_strb;
    reg [DATA_WIDTH-1:0] in_data;
    wire [DATA_WIDTH-1:0] out_data;
    // Unused ports for simplicity
    reg r_trigger = 0;
    wire addr_read = 0;
    wire addr_read_ready;

    // Connect wires for monitoring AW channel
    wire [ADDR_WIDTH-1:0] awaddr;
    wire [ID_WIDTH-1:0] awid;
    wire [SIZE_WIDTH-1:0] awsize;
    wire [1:0] awburst;
    wire [LEN_WIDTH-1:0] awlen;
    wire wvalid;
    wire awready;
    wire rvalid,rx_done;
    wire tx;
    // Instantiate DUT (Top module)
    AXI_TOP_WRAPPER #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .RESPONSE_WIDTH(RESPONSE_WIDTH)
    ) dut (
        .trigger(trigger),
        .r_trigger(r_trigger),
        .aclk(aclk),
        .areset(areset),
        .rd_clk(rd_clk),
//        .addr_read(addr_read),
        .in_addr(in_addr),
        .in_id(in_id),
        .in_len(in_len),
        .in_size(in_size),
        .burst_type(burst_type),
        .in_strb(in_strb),
//          .addr_read_ready(addr_read_ready),
        .wvalid_o(wvalid),
        .axi_in_data(in_data),
        .rx_done_uart(rx_done),
        .rvalid_out(rvalid),
        .rlast_out(rlast),
        .axi_out_data(out_data),
        .r_tx(tx),
        .r_rx(tx)
    );
reg        tx_fifo_rst;
reg        rx_fifo_rst;
reg        tx_enable;
reg        rx_enable;
reg        stop_bit;
reg        parity_bit;
reg [4:0]  sample_rate;
reg [4:0]  tx_trig;
reg [3:0]  rx_trig;
reg [3:0]  data_bits;
reg write=0;
reg [63:0] cntrl_reg;
reg [4:0] write_count =1;
integer a=0;


initial begin
    // Assign values
    tx_fifo_rst  = 1'b1;
    rx_fifo_rst  = 1'b1;
    tx_enable    = 1'b1;
    rx_enable    = 1'b1;
    stop_bit     = 1'b0;        // 1 stop bit
    parity_bit   = 1'b0;        // no parity
    sample_rate  = 5'd16;
    tx_trig      = 5'd8;
    rx_trig      = 4'd8;
    data_bits    = 4'd8;

    

    // Combine all into cntrl_reg
    cntrl_reg = 64'd0;  // Clear first

    cntrl_reg[0]  = tx_fifo_rst;
    cntrl_reg[1]  = rx_fifo_rst;
    cntrl_reg[3]  = tx_enable;
    cntrl_reg[4]  = rx_enable;
    cntrl_reg[5]  = stop_bit;
    cntrl_reg[6]  = parity_bit;

    cntrl_reg[13:9]   = sample_rate;
    cntrl_reg[18:14]  = tx_trig;
    cntrl_reg[22:19]  = rx_trig;
    cntrl_reg[26:23]  = data_bits;

    // Remaining bits [63:27] are reserved and left as 0
end
reg start =0;
wire [4:0] last = count -1;
    initial begin
        $readmemh("C:/Users/demon/AppData/Roaming/Xilinx/Vivado/input.hex", write_mem);
        $display("Starting AW channel test...");
        a=write_mem[0];
        D = 8'h41;
        $display("DF===== %0c",D);
        // Reset logic
        areset = 1;
        trigger = 0;
        in_addr = 0;
        in_id = 0;
        in_len = 0;
        burst_type = 0;
        in_strb = 0;
        #30;
        areset = 0;
        #30;
    
    
        
        // Set up AW transaction
        in_addr = 32'hE100_0000;
        in_id = 4'h3;
        in_len = 8'h01;  // 2 transfers
        burst_type = 2'b01; // INCR
        in_strb = 8'hFF;
        trigger = 1;
        in_size = 2;
        in_data = {32'h0,32'h8000_0012};
        #70;
        trigger = 0;
        @(posedge wvalid)
        
        in_data = cntrl_reg;
        @(posedge wvalid)
        write =1;
       

        // Wait for awvalid & awready handshake
        @(posedge rx_done)
        @(posedge aclk)
        r_trigger =1;
        in_addr = 32'hE100_001c;
        in_id = 4'h3;
        in_len = write_mem[0]-1;  // 5 transfers
        burst_type = 2'b00; // INCR
        in_strb = 8'hFF;
        #20;
        r_trigger = 0;
        
        
        @(posedge rlast)
        #100000
        
        $writememh("C:/Users/demon/AppData/Roaming/Xilinx/Vivado/filename.hex", mem, start, last);
        $finish;
    end
    reg [63:0] mem [0:32];
    
    reg [4:0] count =1;
    initial 
        begin
        mem[0] = write_mem[0];
            forever
                begin
                    @(posedge rvalid)
                    mem[count] = out_data;
                    count = count +1;
                end
        end
        
        reg write_2 =0;
        reg [3:0] valid_count = 1;
    initial
        begin
                @(posedge write)
                
                 trigger = 1;
                 in_addr = 32'hA100_0018;
                 in_id = 4'h3;
                 in_len = (write_mem[0]);  // 5 transfers
                 burst_type = 2'b00; // INCR
                 in_strb = 8'hFF;
                 in_data = write_mem[write_count];
                 write_count = write_count+1;
                  #30;
                  trigger=0;
        
                    repeat(write_mem[0]+5)
                        begin
                            
                            if(write_count <= write_mem[0])
                            begin
                                @(posedge wvalid)
                                in_data = write_mem[write_count];
                                write_count = write_count+1;
                            end
                            else
                                begin
                                    @(posedge aclk)
                                    write_count = write_count+1;
                                end
                            if(write_count == write_mem[0]+4)
                                begin
                                   write_2 = 1; 
                                end
                        end
               
            end

    initial
        begin
             @(posedge write_2)
                
                 trigger = 1;
                 in_addr = 32'hE100_0018;
                 in_id = 4'h3;
                 in_len = (write_mem[0]);  // 5 transfers
                 burst_type = 2'b00; // INCR
                 in_strb = 8'hFF;
                 in_data = write_mem[write_count];
                 write_count = write_count+1;
                  #30;
                  trigger=0;
        
                    repeat(write_mem[0])
                        begin
                            @(posedge wvalid)
                            in_data = write_mem[valid_count];
                            valid_count = valid_count+1;
                           
                        end
        end


endmodule