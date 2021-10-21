transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/fpga/c07_Hello/rtl {F:/fpga/c07_Hello/rtl/Hell.v}

vlog -vlog01compat -work work +incdir+F:/fpga/c07_Hello/prj/../testbench {F:/fpga/c07_Hello/prj/../testbench/Hell_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Hell_tb

add wave *
view structure
view signals
run 10 us
