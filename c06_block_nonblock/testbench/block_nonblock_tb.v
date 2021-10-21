`timescale 1ns/1ns

`define clock_period	20

module block_nonblock_tb;

	reg Clk;
	reg Rst;
	reg a;
	reg b;
	reg c;
	wire [1:0] out;

	block_nonblock u0(Clk, Rst, a, b, c, out);

	initial Clk = 1;
	
	always#(`clock_period/2) Clk = ~Clk;
	
	initial begin
		Rst = 1'b0;
		a = 1'b0;
		b = 1'b0;
		c = 1'b0;
		
		#(`clock_period * 10 + 1);
		Rst = 1'b1;
		
		#(`clock_period * 10 + 1);
		a = 1'b0; b = 1'b0; c = 1'b0;
		
		#(`clock_period * 10 + 1);
		a = 1'b0; b = 1'b0; c = 1'b1;
		
		#(`clock_period * 10 + 1);
		a = 1'b0; b = 1'b1; c = 1'b0;
		
		#(`clock_period * 10 + 1);
		a = 1'b0; b = 1'b1; c = 1'b1;
		
		#(`clock_period * 10 + 1);
		a = 1'b1; b = 1'b0; c = 1'b0;
		
		#(`clock_period * 10 + 1);
		a = 1'b1; b = 1'b0; c = 1'b1;
		
		#(`clock_period * 10 + 1);
		a = 1'b1; b = 1'b1; c = 1'b0;
		
		#(`clock_period * 10 + 1);
		a = 1'b1; b = 1'b1; c = 1'b1;
		
		#(`clock_period * 20);
		#(`clock_period * 20);
		
		$stop;
	end

endmodule
