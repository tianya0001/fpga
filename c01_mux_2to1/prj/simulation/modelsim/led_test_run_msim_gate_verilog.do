transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {led_test_6_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+F:/fpga/c01_mux_2to1/prj/../testbench {F:/fpga/c01_mux_2to1/prj/../testbench/led_test_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  led_test_tb

add wave *
view structure
view signals
run -all
