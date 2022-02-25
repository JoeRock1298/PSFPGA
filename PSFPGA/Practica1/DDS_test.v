module DDS_test
#(parameter M=16,
  parameter L=6,
  parameter W=16)
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
	wire [L-3:0] ADDR_ROM;
	wire [W-1:0] half_sin;
	wire [W-1:0] aux_sin;

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
		if(accumulated_phase[M-1]) // MSB == 1
			sqr_wave <= neg_sat; //0.9999
		else
			sqr_wave <= pos_sat; //-0.9999 (Symetric saturation output)

	//Definition of the ramp wave
	always @(posedge clk )
		ramp_wave <= accumulated_phase[M-1:M-W];

	//Definition of the sinusoidal wave
	preprocesado #(.L(L)) pre_pro (.trunc_phase(accumulated_phase[M-1:M-L]),
								   . ADDR_ROM (ADDR_ROM));

	rom_mem #(.DATA_WIDTH (W), .ADDR_WIDTH (L-2)) rom_sin (.addr(ADDR_ROM),
																 .clk(clk),
																 .q(half_sin));

	postprocesado #(.W(W)) post_pro (.L_MSB(accumulated_phase[M-1]),
									 .half_sin(half_sin),
									 .sin_wave(aux_sin));

	always @(posedge clk )
		sin_wave <= aux_sin;

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
