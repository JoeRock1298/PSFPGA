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
reg [7:0] reg_tx [10:0];
reg [7:0] reg_rx [10:0];
reg [7:0] reg_conf [10:0];
reg delay;

integer i;

// Shift Register RX
always @(posedge clk) 
begin
	reg_rx[0] <= rxdw;
	if (shift_rxregs)
	begin
		for (i = 10; i > 0; i= i-1)
			reg_rx[i] <= reg_rx[i-1];
	end
end 

// Configuration Register
// ADD latency for proper funtion
always @(posedge clk)
begin
	delay = load_confregs;
end

always @(posedge clk) 
begin
	if (delay)
	begin 
		for(i = 0; i < 11; i = i + 1)
			reg_conf[i] <= reg_rx[i];
	end 
end 

// Shift Register TX
assign txdw = reg_tx[10];

always @(posedge clk) 
begin
	if (load_txregs == 1'b1)
	begin 
		for(i = 0; i < 11; i = i + 1)
			reg_tx[i] <= reg_conf[i];
	end
	else if (shift_txregs == 1'b1)
	begin 
		for (i = 10; i > 0; i= i-1)
			reg_tx[i] <= reg_tx[i-1];
	end 
end 

// Write
assign r_control = reg_conf[0];
assign r_im_fm = {reg_conf[1],reg_conf[2]};
assign r_im_am = {reg_conf[3],reg_conf[4]};
assign r_frec_por = {reg_conf[5],reg_conf[6],reg_conf[7]};
assign r_frec_mod = {reg_conf[8],reg_conf[9],reg_conf[10]};

endmodule 
