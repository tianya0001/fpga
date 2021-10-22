module key(clk, rst, key_in, key_flag, key_state);

	input			clk;
	input			rst;
	input			key_in;

	output reg	key_flag;
	output reg	key_state;
	
	localparam
		IDLE =		4'b0001,
		FILTER0 =	4'b0010,
		DOWN =		4'b0100,
		FILTER1 =	4'b1000;
	
	reg[3:0]		state;
	
	reg 			key_temp0, key_temp1;
	wire 			pedge, nedge;
	
	reg[19:0] 	cnt;			// 计数器寄存器
	reg 			cnt_en;		// 计数器使能寄存器
	reg 			cnt_full;	// 计数满标志
	
	always@(posedge clk or posedge rst) begin
		if(!rst) begin
			state <= IDLE;		// 状态复位到IDLE
			cnt_en <= 1'b0;	// 计数器停止计时
			cnt <= 20'd0;		// 计数器清零
		end
		else begin
			
			/* 状态机 */
			case(state)
				IDLE: begin
					// IDLE状态下，
					// 如果按键按下，状态切换到FILTER0，计数器开始计数
					if(!key_in) begin
						state <= FILTER0;
						cnt_en <= 1'b1;
					end
					else begin	// 否则状态保持为IDLE，计数器停止计数，计数器清零
						state <= IDLE;
						cnt_en <= 1'b0;
						cnt <= 20'd0;
					end
				end
				
				FILTER0: begin
					if(cnt >= 20'd999_999 && (!key_in)) begin
						// 如果计数满，并且按键被按下，
						// 状态切换为DOWN，停止计时，计数器清零
						state <= DOWN;
						cnt_en <= 1'b0;
						cnt <= cnt_en <= 1'b0;
					end
					else if(cnt <= 20'd999_999)
				end
				
			endcase
			
			/* 如果计数使能，则开始计数 */
			if(cnt_en) begin
				cnt <= cnt + 1'b1;
			end
		end
	end
	
endmodule
