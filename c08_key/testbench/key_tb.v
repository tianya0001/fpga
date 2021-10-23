`timescale 1ns/1ns
`define clock_priod	20


module key_tb;

	reg clk;
	reg rst;
	reg key_in;
	
	wire key_state;

	key u0(	.clk(clk), 
				.rst(rst), 
				.key_in(key_in), 
				.key_state(key_state)
			);

	initial begin 
		clk = 1'b1;
		key_in = 1'b1;
	end
	
	always#(`clock_priod / 2) clk = ~clk;
	
	initial begin
		rst  = 0;
		#(`clock_priod * 5);
		rst = 1;
		#(`clock_priod * 5);
		
		// 抖动
		repeat(10) begin
			#(`clock_priod);
			key_in = ~key_in;
		end
		// 抖动停止
		#(`clock_priod);
		key_in = 0;
		#(`clock_priod * 200);
	end
	
endmodule

