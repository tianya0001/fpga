module BCD_counter(Clk, Cin, Rst_n, Cout, q);

	input Clk;		// 计数时钟
	input Cin;		// 进位输入
	input Rst_n;	// 复位
	
	output Cout;	// 进位输出
	output [3:0]q;	// 计数输出
	
	reg [3:0]cnt;	// 计数寄存器
	
	
	// 计数
	always@(posedge Clk or negedge Rst_n)
	begin
		if(Rst_n == 1'b0)
			cnt <= 4'b0000;
		else if(Cin == 1'b1) begin
			if(cnt == 4'd9)
				cnt <= 4'd0;
			else
				cnt <= cnt + 1'b1;
		end
		else
			cnt <= cnt;
	end
	
	// 进位
	assign Cout = (Cin == 1'b1 && cnt == 4'd9);

	

	assign q = cnt;
	
endmodule



