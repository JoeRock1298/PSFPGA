module CIC_wrap
	(
	input [15:0] i_data,
	input val_in,
	input rst, 
	input clk,
	output reg signed [15:0] o_data,
	output reg val_out
	);

reg signed [15:0] i_data_reg;
reg val_in_reg;
reg rst_reg; 
wire signed [15:0] o_data_wire;
wire val_out_wire;

always@(posedge clk) 	
	begin
		i_data_reg <= i_data;
		val_in_reg <= val_in;
		rst_reg <= rst;
		o_data <= o_data_wire;
		val_out <= val_out_wire;
	end
		
	CIC #(.Win(16),.Wg(22)) CIC1
			(.i_data(i_data_reg),
			.val_in(val_in_reg),
			.rst(rst_reg),
			.clk(clk),
			.o_data(o_data_wire),
			.val_out(val_out_wire)
			);
endmodule
