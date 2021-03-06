`timescale 1ns/1ns

`define clock_period	20

module BCD_counter_tb;

	reg clk;
	reg cin;
	reg rstn;
	
	wire cout;
	wire [3:0]q;

	BCD_counter cnt0(
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
		repeat(30)begin
			cin = 1'b1;
			#`clock_period;
			cin = 1'b0;
			#(`clock_period*5);
		end
		
		#(`clock_period * 200);
		$stop;
		
	end
	
endmodule