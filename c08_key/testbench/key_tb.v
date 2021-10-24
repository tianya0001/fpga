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
		#(`clock_priod * 50);
		rst = 1;
		#(`clock_priod * 500);
		
		repeat(2) begin
			// 按下抖动
			repeat(100) begin
				#(`clock_priod * 1000);
				key_in = ~key_in;
			end
			
			// 按下保持
			#(`clock_priod);
			key_in = 0;
			#(`clock_priod * 1000*1000);
			
			// 弹起抖动
			repeat(100) begin
				#(`clock_priod * 1000);
				key_in = ~key_in;
			end
			
			// 弹起保持
			#(`clock_priod * 100);
			key_in = 1;
			#(`clock_priod * 1000*1000);
		end
		
		$stop;
	end
	
endmodule

