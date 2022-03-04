
module mult_add(
input signed [7:0] a,b,c,
input clk,
input val_in,
output signed [15:0] s,
output reg rdy_out
);

	// Val in shift reg
	reg [0:1] shift_reg;
	reg signed[15:0] mult_s;
	reg signed [14:0] c_pipe;
	reg signed [15:0] result;
	
	always@(posedge clk)
	begin
		{shift_reg[1],rdy_out} <= {val_in,shift_reg[1]};
		mult_s <= a*b;
		c_pipe <= c << 7;
		result <= c_pipe + mult_s;
	end
	
	assign s = result;	

endmodule 