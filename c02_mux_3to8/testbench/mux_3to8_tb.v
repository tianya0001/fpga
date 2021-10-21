`timescale 1ns/1ps



module mux_3to8_tb;
	
	reg a;
	reg b;
	reg c;
	
	wire [7:0] out;

	
	mux_3to8 u0(
		.a(a), 
		.b(b), 
		.c(c), 
		.out(out)
	);
	
	initial begin
		a = 0; b = 0; c = 0;
		#100
		a = 0; b = 0; c = 1;
		#100
		a = 0; b = 1; c = 0;
		#100
		a = 0; b = 1; c = 1;
		#100
		a = 1; b = 0; c = 0;
		#100
		a = 1; b = 0; c = 1;
		#100
		a = 1; b = 1; c = 0;
		#100
		a = 1; b = 1; c = 1;
		#100
		$stop;
	end
	
endmodule