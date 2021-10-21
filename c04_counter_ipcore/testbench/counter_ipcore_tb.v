`timescale 1ns/1ps
`define clk_period	20

module counter_ipcore_tb;

	reg cin;
	reg clk;
	
	wire cout;
	wire [3:0] q;
	
	counter_ipcore c0(
		.clk(clk), 
		.q(q), 
		.cin(cin), 
		.cout(cout)
	);
	
	initial clk = 1;
	
	always #(`clk_period/2) clk = ~clk;
	
	initial begin
		repeat(20) begin
			cin = 0;
			#(`clk_period * 4) cin = 1;
			#(`clk_period) cin = 0;
		end
		#(`clk_period*200);
		
		$stop;
	end

endmodule