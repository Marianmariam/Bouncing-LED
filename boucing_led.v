module bouncing_led(
    input            clk_i,
    input            rst_n_i,
    output reg [9:0] led_o

);


reg[32-1:0] tick ='d0;
reg enable = 1'b0;

reg direction_i; // 0 = left, 1 = right
always @(posedge clk_i or negedge rst_n_i) begin
    if (~rst_n_i) 
        led_o <= 10'b1;
     else begin
        if (enable) begin
            if (direction_i)
                led_o <= led_o >> 1;
             else 
                led_o <= led_o << 1;
            
        end
    end
end

always @(posedge clk_i or negedge rst_n_i) begin
    if (~rst_n_i) 
        direction_i <= 1'b0;    // initial direction to left
    else if (enable)begin
		if (led_o == 10'b0100000000)
			direction_i <= 1'b1;    //cand ajunge la 10 de 1, se schimba directia in dreapta
		else if (led_o == 10'b0000000010)
			direction_i <= 1'b0;    //cand ajunge la 10 de 0, se schimba directia in stanga
	end
end

always @(posedge clk_i or negedge rst_n_i) begin
	if(~rst_n_i)
		tick <= 0;
	else if (tick == 'd25000000)
		tick <= 0;
	else 
		tick <= tick + 1;
end

always @(posedge clk_i or negedge rst_n_i) begin
	if(~rst_n_i)
		enable <= 1'b0;
	else if (enable)
		enable <= 1'b0;
	else if (tick == 'd25000000)begin
		enable <= 1'b1;
		

	end
end

endmodule
