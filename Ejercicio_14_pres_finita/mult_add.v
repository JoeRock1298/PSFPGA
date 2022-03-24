
module mult_add(
input signed [7:0] a,b,c,
input clk,
input val_in,
output signed [7:0] s,
output reg rdy_out
);

	// Val in shift reg
	reg [0:1] shift_reg;
	reg signed [15:0] mult_s;
	wire signed [8:0] mult_s_trunc;
	reg signed [7:0] c_pipe;
	reg signed [9:0] result;
	
	assign mult_s_trunc = mult_s[15:15-8];

	always@(posedge clk)
	begin
		{shift_reg[1],rdy_out} <= {val_in,shift_reg[1]};
		mult_s <= (a*b);
		c_pipe <= c;
		result <= (c_pipe + mult_s_trunc);
	end
	
	assign s = result[8:8-7];	

endmodule 