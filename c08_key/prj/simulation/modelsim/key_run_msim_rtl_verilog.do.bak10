transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/fpga/c08_key/rtl {F:/fpga/c08_key/rtl/key.v}

vlog -vlog01compat -work work +incdir+F:/fpga/c08_key/prj/../testbench {F:/fpga/c08_key/prj/../testbench/key_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  key_tb

add wave *
view structure
view signals
run -all
