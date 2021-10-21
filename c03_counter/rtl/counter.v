module counter(clk50M, RSTn, led);

	input clk50M;	// 系统时钟50MHz
	input RSTn;		// 复位按键
	
	output reg led;		// LED
	
	reg [24:0] cnt;	// 计数寄存器
	
	// 计数进程
	always@(posedge clk50M or negedge RSTn)
	if(RSTn == 1'b0)
		cnt <= 25'd0;
	else if(cnt == 25'd24_999_999)
		cnt <= 25'd0;
	else
		cnt <= cnt + 1'b1;
		
	// LED输出控制进程
	always@(posedge clk50M or negedge RSTn)
	if(RSTn == 1'b0)
		led <= 1'b1;
	else if(cnt == 25'd24_999_999)
		led = ~led;
	else
		led <= led;

endmodule 