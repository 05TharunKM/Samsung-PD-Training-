set target_library [list sky130_fd_sc_hd__tt_025C_1v80.db avsdpll.db  avsddac.db]
set link_library [list  sky130_fd_sc_hd__tt_025C_1v80.db avsdpll.db  avsddac.db] 
set symbol_library ""

read_file -format verilog {vsdbabysoc.v}
#read_file {vsdbabysoc.v mythcore_test.v} -autoread -format verilog -top vsdbabysoc

read_verilog rvmyth.v
read_verilog clk_gate.v

read_lib -lib avsdpll.lib
read_lib  -lib avsddac.lib

analyze -library WORK -format verilog {vsdbabysoc.v}
elaborate vsdbabysoc -architecture verilog -library WORK
analyze {}

set_units -time ns
create_clock [get_pins {pll/CLK}] -name clk -period 10
set_max_area 8000;
set_max_fanout 5 vsdbabysoc;
set_max_transition 10 vsdbabysoc
#set_min_delay -max 10 -clock[get_clk myclk] [get_ports OUT]
set_max_delay 10 -from dac/OUT -to [get_ports OUT]


#set_input_delay[expr 0.34][all_inputs]



#set_clock_latency -source 2 [get_clocks clk];
#set_clock_latency 1 [get_clocks clk];
set_clock_uncertainty -setup 0.5 [get_clocks clk];
set_clock_uncertainty -hold 0.5 [get_clocks clk];

set_input_delay -max 4 -clock [get_clocks clk] [get_ports VCO_IN];
set_input_delay -max 4 -clock [get_clocks clk] [get_ports ENb_CP];
set_input_delay -min 1 -clock [get_clocks clk] [get_ports VCO_IN];
set_input_delay -min 1 -clock [get_clocks clk] [get_ports ENb_CP];

set_input_transition -max 0.4 [get_ports ENb_CP];
set_input_transition -max 0.4 [get_ports VCO_IN];
set_input_transition -min 0.1 [get_ports ENb_CP];
set_input_transition -min 0.1 [get_ports VCO_IN];





set_load -max 0.5 [get_ports OUT];
set_load -min 0.5 [get_ports OUT];

check_design

compile_ultra

file mkdir report
write -hierarchy -format verilog -output /home/tharun.m/Desktop/Day11/VSDBabySoC_ICC2/report/vsdbabysoc_gtlvl.v
write_sdc -nosplit -version 2.0 /home/tharun.m/Desktop/Day11/VSDBabySoC_ICC2/vsdbabysoc.sdc
report_area -hierarchy > /home/tharun.m/Desktop/Day11/VSDBabySoC_ICC2/report/vsdbabysoc.area
report_timing > /home/tharun.m/Desktop/Day11/VSDBabySoC_ICC2/report/vsdbabysoc.timing
report_power -hierarchy > /home/tharun.m/Desktop/Day11/VSDBabySoC_ICC2/report/vsdbabysoc.power

gui_start

