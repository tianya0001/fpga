transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/fpga/c06_block_nonblock/rtl {F:/fpga/c06_block_nonblock/rtl/block_nonblock.v}

vlog -vlog01compat -work work +incdir+F:/fpga/c06_block_nonblock/prj/../testbench {F:/fpga/c06_block_nonblock/prj/../testbench/block_nonblock_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  block_nonblock_tb

add wave *
view structure
view signals
run -all
