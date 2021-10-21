module Hell(Clk, Rst, data, led);

	input Clk;	// 50MHz时钟 
	input Rst;	// 低电平复位
	
	input[7:0]	data;

	output reg led;

	localparam
		CHECK_H =	5'b0_0001,
		CHECK_E =	5'b0_0010,
		CHECK_L1 =	5'b0_0100,
		CHECK_L2 =	5'b0_1000,
		CHECK_O =	5'b1_0000;
	
	reg[4:0]	state;
	
	initial led = 1'b1;
	
	// 一段式状态机，两段式状态机，三段式状态机
	//    ^使用^					 		 ^效率高^
	
	always@(posedge Clk or negedge Rst)
	if(!Rst) begin
		state <= CHECK_H;
		led <= 1'b1;
	end
	else begin
		case(state)
			CHECK_H:
				if(data == "H")
					state <= CHECK_E;
				else
					state <= CHECK_H;
			
			CHECK_E:
				if(data == "E")
					state <= CHECK_L1;
				else
					state <= CHECK_H;
					
			CHECK_L1:
				if(data == "L")
					state <= CHECK_L2;
				else
					state <= CHECK_H;
					
			CHECK_L2:
				if(data == "L")
					state <= CHECK_O;
				else
					state <= CHECK_H;
					
			CHECK_O:
				begin
					state <= CHECK_H;
					if(data == "O")
						led <= ~led;
					else 
						led <= led;
				end
				
			default: state <= CHECK_H;
		endcase
	end
	
endmodule
