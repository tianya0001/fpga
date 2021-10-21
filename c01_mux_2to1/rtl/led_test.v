module led_test(a, b, key_in, led_out);
	
	input a;	// 输入端口A
	input b;	// 输入端口B
		
	input key_in;	// 按键输入，实现通道的选择
	
	output led_out;	// LED控制端口


	// 当key_in = 0时，led_out = a
	assign led_out = (key_in == 0) ? a : b;
endmodule
	
	




