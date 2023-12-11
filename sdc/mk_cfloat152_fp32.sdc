###############################################################################
# Created by write_sdc
###############################################################################
current_design mk_cfloat152_fp32
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name CLK -period 15.0000 [get_ports {CLK}]
set_clock_transition 0.1500 [get_clocks {CLK}]
set_clock_uncertainty 0.2500 CLK
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {RST_N}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {bias_in_bias[0]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {bias_in_bias[1]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {bias_in_bias[2]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {bias_in_bias[3]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {bias_in_bias[4]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {bias_in_bias[5]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {cfloat152_in_cfloat_in[0]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {cfloat152_in_cfloat_in[1]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {cfloat152_in_cfloat_in[2]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {cfloat152_in_cfloat_in[3]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {cfloat152_in_cfloat_in[4]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {cfloat152_in_cfloat_in[5]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {cfloat152_in_cfloat_in[6]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {cfloat152_in_cfloat_in[7]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[0]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[10]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[11]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[12]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[13]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[14]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[15]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[16]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[17]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[18]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[19]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[1]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[20]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[21]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[22]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[23]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[24]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[25]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[26]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[27]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[28]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[29]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[2]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[30]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[31]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[3]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[4]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[5]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[6]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[7]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[8]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {fp32_out[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {fp32_out[31]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[30]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[29]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[28]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[27]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[26]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[25]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[24]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[23]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[22]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[21]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[20]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[19]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[18]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[17]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[16]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[15]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[14]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[13]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[12]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[11]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[10]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[9]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[8]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[7]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[6]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[5]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[4]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[3]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[2]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[1]}]
set_load -pin_load 0.0334 [get_ports {fp32_out[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {CLK}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {RST_N}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {bias_in_bias[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {bias_in_bias[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {bias_in_bias[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {bias_in_bias[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {bias_in_bias[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {bias_in_bias[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfloat152_in_cfloat_in[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfloat152_in_cfloat_in[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfloat152_in_cfloat_in[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfloat152_in_cfloat_in[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfloat152_in_cfloat_in[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfloat152_in_cfloat_in[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfloat152_in_cfloat_in[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfloat152_in_cfloat_in[0]}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 6.0000 [current_design]