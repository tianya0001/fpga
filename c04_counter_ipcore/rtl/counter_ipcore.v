module counter_ipcore(clk, q, cin, cout);

	input cin;
	input clk;
	
	output [3:0] q;
	output cout;
	
	counter u0(
		.cin(cin),
		.clock(clk),
		.cout(cout),
		.q(q)
	);

endmodule