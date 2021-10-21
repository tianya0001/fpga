`timescale 1ns/1ps

`define clock_period 20

module counter_tb;

	reg clk;
	reg rst;
	
	wire led;
	
	counter u0(
		.clk50M(clk),
		.RSTn(rst),
		.led(led)
	);
	
	initial clk = 1;
	
	always #(`clock_period / 2) clk = ~clk;
	
	initial begin
		rst = 1'b0;
		#(`clock_period * 200);
		rst = 1'b1;
		#2000000000;
		$stop;
	end
	
	
endmodule