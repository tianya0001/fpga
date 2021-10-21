`timescale 1ns/1ns
`define clock_period	20

module Hell_tb;

	reg Clk;
	reg Rst;
	reg[7:0] ASCII;
	
	wire led;


	Hell u0(	.Clk(Clk), 
				.Rst(Rst), 
				.data(ASCII), 
				.led(led)
			);

	initial  Clk = 1;
	
	always#(`clock_period / 2) Clk = ~Clk;
	
	initial begin
		Rst = 0;
		#(`clock_period * 200);
		Rst = 1;
		#(`clock_period * 200);
		forever begin
			ASCII = "I";
			#(`clock_period);
			ASCII = "A";
			#(`clock_period);
			
			ASCII = "H";
			#(`clock_period);
			ASCII = "E";
			#(`clock_period);
			ASCII = "A";
			#(`clock_period);
			
			ASCII = "H";
			#(`clock_period);
			ASCII = "E";
			#(`clock_period);
			ASCII = "L";
			#(`clock_period);
			ASCII = "L";
			#(`clock_period);
			ASCII = "O";
			#(`clock_period);
			
			ASCII = "I";
			#(`clock_period);
		end
		
	end

endmodule
