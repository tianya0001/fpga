module BCD_counter_top(Clk, Cin, Rst_n, Cout, q);

	input Clk;		// 计数时钟
	input Cin;		// 进位输入
	input Rst_n;	// 复位
	
	output Cout;	// 进位输出
	output [11:0]q;// 计数输出
	
	wire Cout0;
	wire Cout1;
	
	wire [3:0] q0, q1, q2;
	
	//reg [3:0]cnt;	// 计数寄存器

	assign q = {q2,q1,q0};	// 位拼接
	
	BCD_counter cnt0(
					.Clk(Clk), 
					.Cin(Cin), 
					.Rst_n(Rst_n), 
					.Cout(Cout0), 
					.q(q0)
	);
	
	BCD_counter cnt1(
					.Clk(Clk), 
					.Cin(Cout0), 
					.Rst_n(Rst_n), 
					.Cout(Cout1), 
					.q(q1)
	);
	
	BCD_counter cnt2(
					.Clk(Clk), 
					.Cin(Cout1), 
					.Rst_n(Rst_n), 
					.Cout(Cout), 
					.q(q2)
	);
	
	
endmodule
