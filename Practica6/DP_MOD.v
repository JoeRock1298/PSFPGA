// -------------------------------------------------------------------------------------------------------------------------
// Universitat Politècnica de València
// Escuela Técnica Superior de Ingenieros de Telecomunicación
// -------------------------------------------------------------------------------------------------------------------------
// Sistemas Digitales Programables
// Curso 2021 - 2022
// -------------------------------------------------------------------------------------------------------------------------
// Nombre del archivo: DDS_test.v
//
// Descripción: Este código Verilog implementa el proceso de Síntesis Digital Directa (DDS) de forma parametrizable generando 
// 		una señal sinusoidal. La sinusoidal se  genera direccionando una ROM que almacena un cuarto de onda de 
//		la señal sinusoidal.
// Sus funcionalidades son:
//      - clk, entrada de reloj.
//      - rst_ac, reset síncrono del acumulador (activo a nivel bajo).
//      - ena_ac, clock enable del acumulador (activo a nivel bajo).
//	- val_in, Entrada de validación del paso del acumulador.
//	- P, paso del acumulador.
//		- sin_wave, señal sinusoidal de frecuencia fo=P*fclk/2^M.
//		- val_out, señal de validación de la muestra de salida.
//
// -------------------------------------------------------------------------------------------------------------------------
//      Versión: V1.0                   | Fecha Modificación: 03/04/2022
//
//      Autor: Jose Luis Rocabado Rocha
//	Autor: Gianmarco Sangoi Da Roza
//
// ------------------------------------------------------------------------------------------------------------------------

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

	//Val_in shifit register variables
	reg [0:6] val_in_pipeline;
	integer i;

	// Auxiliar wires
	wire signed [16:0] im_am_aux;
	wire signed [32:0] fm_mult;
	wire signed [32:0] am_mult;
	wire signed [15:0] DDS_out;
	wire signed [32:0] mult_out;

	// Defining AM/FM selector
	// 4, 7 registers
	always @(posedge clk ) 
		if(c_fm_am)
			begin
				im_fm_mux <= im_fm; // ajustar a la 
				am_mux <= $signed({1'b0, (1 <<< 15)});
			end
		else
			begin
				im_fm_mux <= 1'b0;
				am_mux <= uno_sum >>> 1; //escalado -> división por 2
			end

	// Defining FM path
	//  1 register
	assign fm_mult = im_fm_mux * i_data;

	always @(posedge clk ) 
		begin
			im_fm_mux_x_i_data <= fm_mult >>> 7;
		end

	// 2 register
	always @(posedge clk ) 
		begin
			frec_por_sum_res <= frec_por + im_fm_mux_x_i_data ;
		end

	// Defining AM path
	// 8,9,10 registers
	always @(posedge clk ) 
		begin
			i_data_pipe1 <= i_data;
			i_data_pipe2 <= i_data_pipe1;
			i_data_pipe3 <= i_data_pipe2;
		end

	//  11 register
	assign im_am_aux = $signed({1'b0, im_am});
	assign am_mult = i_data_pipe3 * im_am_aux;

	always @(posedge clk ) 
		begin
			im_am_x_i_data_pipe_3 <= am_mult >>> 15 ;
		end

	//  12 register
	always @(posedge clk ) 
		begin
			uno_sum <= im_am_x_i_data_pipe_3 + $signed({1'b0, (1 <<< 15)});
		end

	// Defining Output 
	//  3 register
	assign mult_out = DDS_out * am_mux;

	always @(posedge clk ) 
		begin
			o_data_aux <= mult_out >>> 15;
		end
	
	assign o_data = o_data_aux;

	//Defining DDS reset shiftregister
	// 5, 6 registers
	always @(posedge clk)
	begin
		rst_pipe1 <= rst;
		rst_pipe2 <= rst_pipe1;
	end

	// DDS
 	DDS #(.M(24),.L(15),.W(16)) D1 (.P(frec_por_sum_res),
	 								.val_in(),
									.rst_ac(rst_pipe2), 
									.ena_ac(1'b1),
									.clk(clk),
									.sin_wave(DDS_out),
									.val_out());

	//Val_out_sinc
	always @(posedge clk)
	begin
		val_in_pipeline [0] <= val_in;
		for (i = 0; i < 6; i = i + 1)
		begin
		  val_in_pipeline[i + 1] <= val_in_pipeline[i];
		end
	end

	assign val_out = val_in_pipeline[6];

endmodule 