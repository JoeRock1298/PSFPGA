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
	
	// Definition of auxiliar variables
	reg signed [23:0] im_fm_mux_x_i_data; //Register 1
	reg signed [23:0] frec_por_sum_res; //Register 2
	reg signed [15:0] o_data_aux; //Register 3
	reg signed [16:0] im_fm_mux; //Register 4 [a-:b] ->-:b = numero de bits a coger a partir de a 
	reg rst_pipe1, rst_pipe2; //Register 5, 6
	reg signed [16:0] am_mux; //register 7
	reg signed [15:0] i_data_pipe1, i_data_pipe2,i_data_pipe3; //Register 8, 9, 10
	reg signed [15:0] im_am_x_i_data_pipe_3; //Register 11
	reg signed [16:0] uno_sum; //Register 12

	// Defining AM/FM selector
	always @(posedge clk ) 
		if(c_fm_am)
			begin
				im_fm_mux <= im_fm; // ajustar a la 
				am_mux <= 2'b01 << 15;
			end
		else
			begin
				im_fm_mux <= 1'b0;
				am_mux <= uno_sum >> 1; //escalado -> división por 2
			end

	// Defining FM path
	always @(posedge clk ) 
		begin
			im_fm_mux_x_i_data <= im_fm_mux * i_data ;
		end

 	DDS #(.M(24),.L(15),.W(16)) D1 (.P( ),
									.rst_AC(  ), 
									.en_AC( ),
									.clk( ),
									.sin_wave());

endmodule 