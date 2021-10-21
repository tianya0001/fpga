transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/fpga/c04_counter_ipcore/rtl/ip {F:/fpga/c04_counter_ipcore/rtl/ip/counter.v}
vlog -vlog01compat -work work +incdir+F:/fpga/c04_counter_ipcore/rtl {F:/fpga/c04_counter_ipcore/rtl/counter_ipcore.v}

vlog -vlog01compat -work work +incdir+F:/fpga/c04_counter_ipcore/prj/../testbench {F:/fpga/c04_counter_ipcore/prj/../testbench/counter_ipcore_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  counter_ipcore_tb

add wave *
view structure
view signals
run -all
