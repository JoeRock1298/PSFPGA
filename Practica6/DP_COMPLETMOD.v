module DP_COMPLETMOD
	(
	input signed [15:0] i_data,
	input rst,
	input clk,
	input val_in,
	input c_fm_am, // Control modo fm/am
	input [1:0] c_source, // Selecccion fuente  de señal moduladora
	input c_comp_dac, // Control multiplexor de compensación DAC
	input [23:0] frec_mod,
	input [23:0] frec_por,
	input [15:0] im_am,
	input [15:0] im_fm,
	output signed [13:0] o_data,
	output val_out
	);
	

	
	endmodule
	