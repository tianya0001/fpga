module mux_3to8(a, b, c, out);

	input a;	// 输入a
	input b;	// 输入b
	input c;	// 输入c
	
	output reg [7:0] out;	// 输出端口

	// 当a,b,c中任意一个信号发生变化时，执行always块中的程序
	always@(a,b,c)begin
		case({a,b,c})
			3'b000: out = 8'b0000_0001;
			3'b001: out = 8'b0000_0010;
			3'b010: out = 8'b0000_0100;
			3'b011: out = 8'b0000_1000;
			3'b100: out = 8'b0001_0000;
			3'b101: out = 8'b0010_0000;
			3'b110: out = 8'b0100_0000;
			3'b111: out = 8'b1000_0000;
			default: out = 8'b0000_0001;
		endcase
	end

endmodule