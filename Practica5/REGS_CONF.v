module REGS_CONF
	(
	input [7:0] rxdw, 		// rx dw from RS232
	input  clk, 			// clk 
	input  load_confregs, 	// load configuration registers
	input  shift_rxregs, 	// shift rx registers
	input  load_txregs, 	// load conf_regs in tx_regs
	input  shift_txregs, 	// shift tx registers
	output [7:0] txdw, 		// tx dw to RS232
	output [7:0] r_control,
	output [23:0] r_frec_mod,
	output [23:0] r_frec_por,
	output [15:0] r_im_am,
	output [15:0] r_im_fm
	);

// Registos 
reg [77:0] reg_tx, reg_rx, reg_conf;

always @(clk, shift_rxregs) 
	if (shift_rxregs == 1'b1)
		begin
		reg_conf <= rxdw >>> 8;
		end
	
end



endmodule 
