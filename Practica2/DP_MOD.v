module DP_MOD
	(
	input signed [15:0] i_data,
	input rst,
	input clk,
	input val_in,
	input c_fm_am, // Control modo fm/am
	input [23:0] frec_por,
	input [15:0] im_am,
	input [15:0] im_fm,
	output signed [15:0] o_data,
	output val_out
	);
	
	
	
	
 DDS #(.M(24),.L(15),.W(16)) D1
		(
		.P( ),
		.rst_AC(  ), 
		.en_AC( ),
		.clk( ),
		.sin_wave()
		);

endmodule 