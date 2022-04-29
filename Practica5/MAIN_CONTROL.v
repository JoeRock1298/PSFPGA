module MAIN_CONTROL
(
	input rxrdy,
	input [7:0] rxdw,
	input done_wr, 
	input done_rd,
	input rst, 
	input clk,
	output start_wr, 
	output start_rd,
	output [2:0] sleds 
);

endmodule
