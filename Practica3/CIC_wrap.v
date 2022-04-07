module DP_MOD_wrap
	(
	input [15:0] i_data,
	input val_in,
	input rst, 
	input clk,
	input c_fm_am,
	input [15:0] im_am,
	input [15:0] im_fm,
	input [23:0] freq_por,
	output reg signed [15:0] o_data,
	output reg val_out
	);

reg signed [15:0] i_data_reg;
reg val_in_reg;
reg rst_reg; reg c_fm_am_reg;
reg unsigned [16:0] im_am_reg;
reg unsigned [16:0] im_fm_reg;
reg signed [23:0] freq_por_reg;
wire signed [15:0] o_data_wire;
wire val_out_wire;

always@(posedge clk) 	
	begin
		i_data_reg <= i_data;
		val_in_reg <= val_in;
		rst_reg <= rst;
		c_fm_am_reg <= c_fm_am;
		im_am_reg <= im_am;
		im_fm_reg <= im_fm;
		freq_por_reg <= freq_por;
		o_data <= o_data_wire;
		val_out <= val_out_wire;
	end
		
	
DP_MOD #(.M(24),.L(15),.W(16)) DP_MOD1
			(.i_data(i_data_reg),
			.val_in(val_in_reg),
			.rst(rst_reg),
			.c_fm_am(c_fm_am_reg),
			.clk(clk),
			.im_am(im_am_reg),
			.im_fm(im_fm_reg),
			.freq_por(freq_por_reg),
			.o_data(o_data_wire),
			.val_out(val_out_wire)
			);
