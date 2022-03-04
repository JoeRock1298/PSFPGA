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
// 		3 señales: rampa, cuadrada y sinusoidal. La sinusoidal se  genera direccionando una ROM que almacena un cuarto
//		de onda de la señal sinusoidal.
// Sus funcionalidades son:
//      - clk, entrada de reloj.
//      - rst_ac, reset síncrono del acumulador (activo a nivel bajo).
//      - ena_ac, clock enable del acumulador (activo a nivel bajo).
//	- val_in, Entrada de validación del paso del acumulador.
//	- P, paso del acumulador.
//		- sin_wave, señal sinusoidal de frecuencia fo=P*fclk/2^M.
//		- sqr_wave, señal cuadrada de frecuencia fo=P*fclk/2^M.
//		- ramp_wave, señalrampa de frecuencia fo=P*fclk/2^M.
//		- val_out, señal de validación de la muestra de salida.
//
// -------------------------------------------------------------------------------------------------------------------------
//      Versión: V1.0                   | Fecha Modificación: 03/03/2022
//
//      Autor: Jose Luis Rocabado Rocha
//		Autor: Gianmarco Sangoi Da Roza
//
// ------------------------------------------------------------------------------------------------------------------------
module DDS_test
#(parameter M=27,
  parameter L=15,
  parameter W=14)
(
input [M-1:0] P,
input val_in,
input rst_ac, ena_ac,
input clk,
output reg signed [W-1:0] sqr_wave,
output reg signed [W-1:0] ramp_wave,
output reg signed [W-1:0] sin_wave,
output val_out
);

	//Auxiliar wires variables
	wire [M-1:0] accumulated_phase;
	wire [L-3:0] addr_rom;
	wire [W-1:0] half_sin;
	wire [W-1:0] aux_sin;

	//Auxiliar register for pipelining
	reg val_pipe1, val_pipe2, val_pipe3, val_pipe4; 
	reg [L-3:0] addr_rom_pipe;
	(* ramstyle = "logic" *)  reg [W-1:0] ramp_pipe1, ramp_pipe2;


	//Parameter
	localparam pos_sat = {W{1'b1}} >> 1, neg_sat = ~pos_sat + 1'b1;

	//Adder instantiation
	accumulator #(.n(M)) phase_accumulator (.iCLK(clk),
						.iRESET(rst_ac),
				 		.iENABLE(ena_ac),
				 		.iP(P),
						.oQ(accumulated_phase));

	//Definition of the square wave
	always @(posedge clk )
			if(ramp_pipe2[W-1]) // MSB == 1 -> sign bit
				sqr_wave <= neg_sat; //0.9999
			else
				sqr_wave <= pos_sat; //-0.9999 (Symetric saturation output)
		
	//Definition of the ramp wave
	always @(posedge clk )
		begin
			ramp_pipe1 <= accumulated_phase[M-1:M-W];
			ramp_pipe2 <= ramp_pipe1;
			ramp_wave <= ramp_pipe2;
		end
		
	//Definition of the sinusoidal wave
	preprocesado #(.L(L)) pre_pro (.trunc_phase(accumulated_phase[M-1:M-L]),
								   . ADDR_ROM (addr_rom));

	//Pipelining 
	always @(posedge clk )
			addr_rom_pipe <= addr_rom;

	rom_mem #(.DATA_WIDTH (W), .ADDR_WIDTH (L-2)) rom_sin (.addr(addr_rom_pipe),
																 .clk(clk),
																 .q(half_sin));

	postprocesado #(.W(W)) post_pro (.L_MSB(ramp_pipe2[W-1]), // this correspond to the L_MSB
									 .half_sin(half_sin),
									 .sin_wave(aux_sin));

	always @(posedge clk )
		sin_wave <= aux_sin;

	// Adding latency to val_in variable
	always @(posedge clk )
		begin
			val_pipe1 <= val_in;
			val_pipe2 <= val_pipe1;
			val_pipe3 <= val_pipe2;
			val_pipe4 <= val_pipe3;
		end
	
	assign val_out = val_pipe4;

endmodule 

module rom_mem
#(parameter DATA_WIDTH=14, parameter ADDR_WIDTH=13)
(
	input [(ADDR_WIDTH-1):0] addr,
	input clk, 
	output reg [(DATA_WIDTH-1):0] q
);

	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

	initial
		begin
			if ((DATA_WIDTH == 14)&(ADDR_WIDTH == 13))
				$readmemh("rom_dds_L15_W14.txt", rom);
			else	if ((DATA_WIDTH == 16)&(ADDR_WIDTH == 13))
				$readmemh("rom_dds_L15_W16.txt", rom);
			else	if ((DATA_WIDTH == 16)&(ADDR_WIDTH == 4))
				$readmemh("rom_dds_L6_W16.txt", rom);
		end


	always @ (posedge clk)
		q <= rom[addr];
	
endmodule
