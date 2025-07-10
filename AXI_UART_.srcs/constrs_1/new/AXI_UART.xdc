create_clock -period 13.000 -name aclk -waveform {0.000 6.500} [get_ports aclk]
create_clock -period 20.000 -name rd_clk -waveform {0.000 9.000} [get_ports rd_clk]
create_generated_clock -name BAUD_CLK_GEN/sample_clk_reg_n_0 -source [get_ports rd_clk] -divide_by 40 [get_pins BAUD_CLK_GEN/sample_clk_reg/Q]
create_generated_clock -name BAUD_CLK_GEN/uart_clk_o -source [get_pins BAUD_CLK_GEN/sample_clk_reg/Q] -divide_by 16 [get_pins BAUD_CLK_GEN/uart_clk_o_reg/Q]

# Mark unrelated clocks as asynchronous
set_input_delay -clock [get_clocks aclk] -min -add_delay 0.700 [get_ports \
    "in_addr[*]" \
    "axi_in_data[*]" \
    r_trigger \
    trigger \
    "in_id[*]" \
    "in_len[*]" \
    "in_size[*]" \
    burst_type ]

set_input_delay -clock [get_clocks aclk] -min -add_delay 0.700 [get_ports \
    "in_addr[*]" \
    "axi_in_data[*]" \
    r_trigger \
    trigger \
    "in_id[*]" \
    "in_len[*]" \
    "in_size[*]" \
    burst_type  ]


#set_output_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports rx_done_uart rvalid_out rlast_out ar_read_ready arfull arempty wr_r_fifo r_tx read_data_out[*] read_resp[*]  read_id[*] wvalid_o tx_data_valid ]
#set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports rx_done_uart rvalid_out rlast_out ar_read_ready arfull arempty wr_r_fifo r_tx read_data_out[*] read_resp[*]  read_id[*] wvalid_o tx_data_valid  ]

#set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports read_data_out[*]  ar_addr_out[*] axi_out_data[*] write_resp[*] write_id[*] tx_fifo_mem_left[*] tx_ready ]
#set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports read_data_out[*]  ar_addr_out[*] axi_out_data[*] write_resp[*] write_id[*] tx_fifo_mem_left[*] tx_ready ]



set_false_path -from [get_clocks rd_clk] -to [get_clocks aclk]
set_false_path -from [get_clocks aclk] -to [get_clocks rd_clk]

set_false_path -from [get_clocks BAUD_CLK_GEN/uart_clk_o] -to [get_clocks aclk]
set_false_path -from [get_clocks aclk] -to [get_clocks BAUD_CLK_GEN/uart_clk_o]

create_clock -period 12800.000 -name VIRTUAL_BAUD_CLK_GEN/uart_clk_o -waveform {0.000 6400.000}

set_input_delay -clock [get_clocks  VIRTUAL_BAUD_CLK_GEN/uart_clk_o] -min -add_delay 0.700 [get_ports r_rx ]
set_input_delay -clock [get_clocks  VIRTUAL_BAUD_CLK_GEN/uart_clk_o] -min -add_delay 0.700 [get_ports r_rx ]
 
set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports {axi_in_data[*]}]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {axi_in_data[*]}]
set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports {burst_type[*]}]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {burst_type[*]}]
set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports {in_addr[*]}]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {in_addr[*]}]
set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports {in_id[*]}]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {in_id[*]}]
set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports {in_len[*]}]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {in_len[*]}]
set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports {in_size[*]}]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {in_size[*]}]
set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports {in_strb[*]}]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {in_strb[*]}]

set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports areset]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports areset]
set_input_delay -clock [get_clocks rd_clk] -min -add_delay 1.000 [get_ports areset]
set_input_delay -clock [get_clocks rd_clk] -max -add_delay 0.000 [get_ports areset]

set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports r_trigger]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports r_trigger]
set_input_delay -clock [get_clocks aclk] -min -add_delay 1.000 [get_ports trigger]
set_input_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports trigger]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports {ar_addr_out[*]}]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports {ar_addr_out[*]}]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports {axi_out_data[*]}]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports {axi_out_data[*]}]
set_output_delay -clock [get_clocks aclk] -min -add_delay 0.000 [get_ports {read_data_out[*]}]
set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {read_data_out[*]}]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports {read_data_out[*]}]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports {read_data_out[*]}]
set_output_delay -clock [get_clocks aclk] -min -add_delay 0.000 [get_ports {read_id[*]}]
set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {read_id[*]}]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports {read_id[*]}]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports {read_id[*]}]
set_output_delay -clock [get_clocks aclk] -min -add_delay 0.000 [get_ports {read_resp[*]}]
set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports {read_resp[*]}]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports {read_resp[*]}]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports {read_resp[*]}]

set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports {tx_fifo_mem_left[*]}]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports {tx_fifo_mem_left[*]}]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports {write_id[*]}]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports {write_id[*]}]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports {write_resp[*]}]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports {write_resp[*]}]


set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports A]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports A]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports ar_read_ready]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports ar_read_ready]
set_output_delay -clock [get_clocks aclk] -min -add_delay 0.000 [get_ports arempty]
set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports arempty]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports arempty]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports arempty]
set_output_delay -clock [get_clocks aclk] -min -add_delay 0.000 [get_ports arfull]
set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports arfull]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports arfull]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports arfull]

set_output_delay -clock [get_clocks aclk] -min -add_delay 0.000 [get_ports rlast_out]
set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports rlast_out]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports rlast_out]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports rlast_out]
set_output_delay -clock [get_clocks aclk] -min -add_delay 0.000 [get_ports rvalid_out]
set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports rvalid_out]

set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports rx_done_uart]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports rx_done_uart]
set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports tx_data_valid]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports tx_data_valid]

set_output_delay -clock [get_clocks rd_clk] -min -add_delay 0.000 [get_ports tx_ready]
set_output_delay -clock [get_clocks rd_clk] -max -add_delay 1.000 [get_ports tx_ready]
set_output_delay -clock [get_clocks aclk] -min -add_delay 0.000 [get_ports wvalid_o]
set_output_delay -clock [get_clocks aclk] -max -add_delay 2.000 [get_ports wvalid_o]
