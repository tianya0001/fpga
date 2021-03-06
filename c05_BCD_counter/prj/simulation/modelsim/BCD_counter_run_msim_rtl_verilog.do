transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/fpga/c05_BCD_counter/rtl {F:/fpga/c05_BCD_counter/rtl/BCD_counter.v}
vlog -vlog01compat -work work +incdir+F:/fpga/c05_BCD_counter/rtl {F:/fpga/c05_BCD_counter/rtl/BCD_counter_top.v}

vlog -vlog01compat -work work +incdir+F:/fpga/c05_BCD_counter/prj/../testbench {F:/fpga/c05_BCD_counter/prj/../testbench/BCD_counter_top_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  BCD_counter_top_tb

add wave *
view structure
view signals
run -all
