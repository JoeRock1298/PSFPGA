module WR_CONTROL
(
	input rxrdy,
	input start_wr,
	input rst, 
	input clk,
	output reg shift_rxregs,
	output reg load_confregs,
	output reg done_wr,
	output reg [2:0] wr_leds
	);

// Changing the state encoding type to user define
    (*syn_encoding="user"*)

// Declare states
	parameter start = 2'b00, idle_w = 2'b01, shift = 2'b10, load = 2'b11;

 // Declare state registers
	reg [1:0] state, next_state;

 // Defining state trancision
	always @(posedge clk) 
	begin
		if (rst)
			state <= idle_w;	
		else
			state <= next_state;	
	end

 // Defining counter for bytes
	reg [3:0] count  = 4'h0;
	localparam count_end = 4'hA;

	always @(posedge clk) 
	begin
		if (rst)
			count <= 4'h0;	
		else
			begin
				if (state == shift)
					count <= count + 1'b1;
				else if (state == load)
					count <= 4'h0;
				else 
					count <= count;
			end
	end

// Defining next_state logic
	always @(state, rxrdy, start_wr, count) 
	begin
		next_state <= start;
		case(state)
			start:
				if (start_wr == 1'b1)
					next_state <= idle_w;
				else 
					next_state <= start;
			idle_w:
				if ((count == count_end) && (rxrdy == 1'b1))
					next_state <= load;
				else if  (rxrdy == 1'b1) 
					next_state <= shift;
				else 
					next_state <= idle_w;
			shift:
				if (rxrdy == 1'b1)
					next_state <= shift;
				else if ((count == count_end) && (rxrdy == 1'b1))
					next_state <= load;
				else 
					next_state <= idle_w;
			load:
					next_state <= start;
			default:
				next_state <= start;
		endcase
	end

 // Defining output logic
	always @(state) 
	begin
		case (state)
			start:
			begin
				shift_rxregs = 1'b0;
 				load_confregs = 1'b0;
				done_wr = 1'b0;
				wr_leds = 3'b001;
			end
			idle_w:
			begin
				shift_rxregs = 1'b0;
 				load_confregs = 1'b0;
				done_wr = 1'b0;
				wr_leds = 3'b010;
			end
			shift:
			begin
				shift_rxregs = 1'b1;
 				load_confregs = 1'b0;
				done_wr = 1'b0;
				wr_leds = 3'b011;
			end
			load:
			begin
				shift_rxregs = 1'b0;
 				load_confregs = 1'b1;
				done_wr = 1'b1;
				wr_leds = 3'b100;
			end	 
			default:
			begin
				shift_rxregs = 1'b0;
 				load_confregs = 1'b0;
				done_wr = 1'b0;
				wr_leds = 3'b111;
			end 
		endcase	
	end
	
endmodule 