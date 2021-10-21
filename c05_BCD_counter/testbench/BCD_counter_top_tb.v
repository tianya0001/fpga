`timescale 1ns/1ns

`define clock_period	20

module BCD_counter_top_tb;

	reg clk;
	reg cin;
	reg rstn;
	
	wire cout;
	wire [11:0]q;

	BCD_counter_top cnt0(
					.Clk(clk), 
					.Cin(cin), 
					.Rst_n(rstn), 
					.Cout(cout), 
					.q(q)
	);

	initial clk = 1'b1;
	always# (`clock_period/2) clk = ~clk;
	
	initial begin
		rstn = 1'b0;
		cin = 1'b0;
		#(`clock_period * 200);
		rstn = 1'b1;
		#(`clock_period * 200);
		cin = 1'b1;
		
		#(`clock_period * 5000);
		$stop;
		
	end
	
endmodule