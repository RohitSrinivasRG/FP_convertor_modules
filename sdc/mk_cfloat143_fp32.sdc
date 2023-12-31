###############################################################################
# Created by write_sdc
###############################################################################
current_design mk_cfloat143_fp32
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name CLK -period 15.0000 [get_ports {CLK}]
set_clock_transition 0.1500 [get_clocks {CLK}]
set_clock_uncertainty 0.2500 CLK
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {RST_N}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_bias[0]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_bias[1]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_bias[2]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_bias[3]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_bias[4]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_bias[5]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_cfloat143_in[0]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_cfloat143_in[1]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_cfloat143_in[2]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_cfloat143_in[3]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_cfloat143_in[4]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_cfloat143_in[5]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_cfloat143_in[6]}]
set_input_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {convert_cfloat143_fp32_cfloat143_in[7]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[0]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[10]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[11]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[12]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[13]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[14]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[15]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[16]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[17]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[18]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[19]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[1]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[20]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[21]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[22]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[23]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[24]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[25]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[26]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[27]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[28]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[29]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[2]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[30]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[31]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[3]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[4]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[5]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[6]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[7]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[8]}]
set_output_delay 3.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {get_fp32[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {get_fp32[31]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[30]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[29]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[28]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[27]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[26]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[25]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[24]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[23]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[22]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[21]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[20]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[19]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[18]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[17]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[16]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[15]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[14]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[13]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[12]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[11]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[10]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[9]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[8]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[7]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[6]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[5]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[4]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[3]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[2]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[1]}]
set_load -pin_load 0.0334 [get_ports {get_fp32[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {CLK}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {RST_N}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_bias[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_bias[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_bias[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_bias[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_bias[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_bias[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_cfloat143_in[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_cfloat143_in[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_cfloat143_in[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_cfloat143_in[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_cfloat143_in[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_cfloat143_in[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_cfloat143_in[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {convert_cfloat143_fp32_cfloat143_in[0]}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 6.0000 [current_design]
