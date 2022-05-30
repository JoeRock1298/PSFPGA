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

	/*********** Wire definitions ***********/
	// DDS
	wire signed [16 - 1:0] sqr_wave, ramp_wave, sin_wave;
	wire DDS_val_out;

	// Source MUX
	wire signed [16 - 1 : 0] i_smux [3:0];
	wire signed [16 - 1 : 0] o_smux;

	// COMP CIC
	wire signed [18 - 1 : 0] COMP_CIC_dout;
	wire COMP_CIC_val_out;

	// CIC
	wire signed [16 - 1 : 0] CIC_dout;
	wire CIC_val_out;

	// DP_MOD
	wire signed [16 - 1: 0] DP_MOD_out; // I take 14 bits.
	wire DP_MOD_reset;
	wire DP_MOD_val_out;

	/*********** Module instantiation ***********/

	// DDS test -> acc always enabled
	DDS_test #( .M(24),
  				.L(15),
  				.W(16))
			DDS ( .P(frec_mod),
				  .val_in(val_in),
				  .rst_ac(rst), 
				  .ena_ac(1'b1),
				  .clk(clk),
				  .sqr_wave(sqr_wave),
				  .ramp_wave(ramp_wave),
				  .sin_wave(sin_wave),
				  .val_out(DDS_val_out));

	// Source MUX (check for any needed register)
	assign i_smux[0] = sin_wave; // 00
	assign i_smux[1] = ramp_wave; // 01
	assign i_smux[2] = sqr_wave; // 10
	assign i_smux[3] = i_data; // 11

	assign o_smux = i_smux[c_source];

	// COMP CIC 
	// (Lab guide says its uput is S[18:15] instead of S[19:16]----->I did it, check please. Line 54 SEC_FILTER.V
	// also, seems that coef cuantification is diferent) CHANGE IT-----> Why u say its different i dont see it, that value give u the profesor, no?
	// The matlab code uses a S[17,16] bit cuantification.
	SEC_FILTER #( .Win(16),
				  .Wc(17), 
				  .Num_coef(17))
		CIC_comp ( .din(o_smux), // entrada
				   .clk(clk), 
				   .val_in(DDS_val_out),
				   .rst(rst),
				   .val_out(COMP_CIC_val_out),
				   .dout(COMP_CIC_dout));

	// CIC (code changed to parametrize truncated values)
	CIC #( .Win(18), // Input length
  		   .Wg(22),// Guard bits
		   .N(3), // numero de etapas
		   .Wout(16))
  		CIC_int ( .i_data(COMP_CIC_dout), // Data input
   				  .clk(clk),
				  .rst(rst),
				  .val_in(COMP_CIC_val_out),  // Validation input
				  .val_out(CIC_val_out),	// Validation output
				  .o_data(CIC_dout));	// Data output
	
	// Reset for DP_MOD (or gate)
	assign DP_MOD_reset = rst | !CIC_val_out; // Check this shitty code jajaja (PD: the reset with an OR i remember its a must)

	// Configurable FM-AM Data-path
	DP_MOD (.idata(CIC_dout),
			.rst(DP_MOD_reset),
			.clk(clk),
			.val_in(CIC_val_out),
			.c_fm_am(c_fm_am),
			.frec_por(frec_por),
			.im_am(im_am),
			.im_fm(im_fm),
			.o_data(DP_MOD_out),
			.val_out(DP_MOD_val_out));
	
	// Output
	assign o_data = DP_MOD_out[16 - 1 : 16 - 14 ]; //[15 : 2] -> S[14:13]


endmodule
	