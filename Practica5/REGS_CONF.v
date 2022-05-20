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
reg [77:0] reg_tx = 0;
reg [77:0] reg_rx = 0;
reg [77:0] reg_conf = 0;

// Shift Register RX
assign reg_rx[77:69] = rxdw;

always @(clk, shift_rxregs) 
begin
	if (shift_rxregs == 1'b1)
		reg_rx <= reg_rx >>> 8;
	else 
		reg_rx <= reg_rx;
end 

// Configuration Register
always @(clk, load_confregs) 
begin
	if (load_confregs == 1'b1)
		reg_conf <= reg_rx;
	else 
		reg_conf <= reg_conf;
end 
	
// Shift Register TX
assign txdw = reg_tx[7:0];

always @(clk, load_confregs, shift_txregs) 
begin
	if (load_txregs == 1'b1)
		reg_tx <= reg_conf;
	else if (shift_txregs == 1'b1)
		reg_tx <= reg_tx >>> 8;
	else 
		reg_tx <= reg_tx;	
end 

// Write

assign reg_rx[77:69] = rxdw;


endmodule 
