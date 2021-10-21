`timescale 1ns/1ps	// 定义仿真精度，延时整数部分单位为1ns，延时小数部分最大精度为1ps

module led_test_tb;

	// 激励信号定义，对应连接到待测试模块的输入端口
	reg signed_a;
	reg signed_b;
	reg signed_c;
	
	// 待测试信号定义，连接到待测试模块的输出
	wire led;
	
	// 例化待测试模块
	led_test led_test0(
		.a(signed_a), 
		.b(signed_b), 
		.key_in(signed_c), 
		.led_out(led)
	);
	
	// 产生激励
	initial begin
		signed_a = 0; signed_b = 0; signed_c = 0;
		#100	// 延时100ns
		signed_a = 0; signed_b = 0; signed_c = 1;
		#100	// 延时100ns
		signed_a = 0; signed_b = 1; signed_c = 0;
		#100	// 延时100ns
		signed_a = 0; signed_b = 1; signed_c = 1;
		#100	// 延时100ns
		signed_a = 1; signed_b = 0; signed_c = 0;
		#100	// 延时100ns
		signed_a = 1; signed_b = 0; signed_c = 1;
		#100	// 延时100ns
		signed_a = 1; signed_b = 1; signed_c = 0;
		#100	// 延时100ns
		signed_a = 1; signed_b = 1; signed_c = 1;
		
		#200
		$stop;	// 系统函数(停止仿真)
	end

endmodule
