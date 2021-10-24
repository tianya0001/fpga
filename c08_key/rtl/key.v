module key(clk, rst, key_in, key_state);

	input			clk;
	input			rst;
	input			key_in;

	output reg	key_state;
	
	localparam
		IDLE =		4'b0001,
		FILTER0 =	4'b0010,
		DOWN =		4'b0100,
		FILTER1 =	4'b1000;
	
	reg[3:0]		state;
	
	reg 			key_temp0, key_temp1;
	wire 			pedge, nedge;
	
	reg[20:0] 	cnt;			// 计数器寄存器
	reg 			cnt_en;		// 计数器使能寄存器
	reg 			cnt_full;	// 计数满标志
	
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			state <= IDLE;		// 状态复位到IDLE
			cnt_en <= 1'b0;	// 计数器停止计时
			cnt <= 20'd0;		// 计数器清零
		end
		else begin
			
			/* 状态机 */
			case(state)
				
				IDLE: begin
					// IDLE状态下，key_state = 0
					key_state <= 1'b0;
					// 计数器禁用，计数值清零
					cnt_en <= 1'b0;
					cnt <= 20'd0;
					// IDLE状态下，如果按键按下，状态切换到FILTER0
					if(!key_in) begin
						state <= FILTER0;
					end
					else begin	// 否则状态保持为IDLE
						state <= IDLE;
					end
				end
				
				FILTER0: begin
					// 如果处于FILTER0状态，key_state = 0，开启定时器计数
					key_state <= 1'b0;
					cnt_en <= 1'b1;
					if(cnt_full && (!key_in)) begin
						// 如果按键按下超过20ms并且按键处于按下的状态，则切换到DOWN状态
						state <= DOWN;
					end
					else if(!cnt_full) begin
						// 如果计数未满，状态保持为FILTER0
						state <= FILTER0;
					end
					else if(cnt_full && key_in) begin
						// 如果计数已满，按键处于松开状态，状态切换到IDLE
						state <= IDLE;
					end
					else begin
						// 其他，状态保持
						state <= FILTER0;
					end
				end
				
				DOWN: begin
					// DOWN状态，key_state = 1，禁用计数器，计数器清零
					key_state <= 1'b1;
					cnt_en <= 1'b0;
					cnt <= 20'd0;
					if(key_in) begin
						// 如果按键松开，状态切换到FILTER1
						state <= FILTER1;
					end
					else begin
						// 其他情况状态保持
						state <= DOWN;
					end
				end
				
				FILTER1: begin
					// FILTER1状态下，定时器开启，key_state = 1;
					key_state <= 1'b1;
					cnt_en <= 1'b1;
					
					if(cnt_full && (!key_in)) begin
						// 如果计数已满，按键保持按下，状态回到DOWN
						state <= DOWN;
					end
					else if(cnt_full && key_in) begin
						// 如果计数已满，按键松开状态切换到IDLE
						state <= IDLE;
					end
					else if(!cnt_full) begin
						// 如果计数未满，状态保持为FILTER1
						state <= FILTER1;
					end
					else begin
						// 其他意外情况，状态保持为FILTER1
						state <= FILTER1;
					end
				end
				
				default: begin
					// 意外情况，状态回到IDLE
					state <= IDLE;
				end
				
			endcase
			
			/* 如果计数使能，则开始计数 */
			if(cnt_en) begin
				cnt <= cnt + 1'b1;
			end
			
			/* 计数满标志更新 */
			if(cnt >= 20'd999_999) begin
				cnt_full <= 1'b1;
			end
			else begin
				cnt_full <= 1'b0;
			end
		end
	end
	
endmodule
