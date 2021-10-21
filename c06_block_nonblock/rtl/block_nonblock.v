module block_nonblock(Clk, Rst, a, b, c, out);

	input Clk;
	input Rst;
	input a, b, c;
	
	output reg [1:0] out;

	// out = a + b + c;
	
	// d = a + b
	// out = d + c
	reg [1:0]	d;
	
	always@(posedge Clk or negedge Rst)
	if(!Rst)
		out = 2'b0;
	else begin
		out <= a + b + c;
	end
	
endmodule


