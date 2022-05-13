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
	parameter idle_w = 2'b00, shift = 2'b01, load = 2'b10;

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
		next_state <= idle_w;
		case(state)
			idle_w:
				if ((rxrdy == 1'b1) && (start_wr == 1'b1)) 
					next_state <= shift;
				else if (count > count_end) 
					next_state <= load;
				else 
					next_state <= idle_w;
			shift:
				if (rxrdy == 1'b1)
					next_state <= shift;
				else if (count > count_end)
					next_state <= load;
				else 
					next_state <= idle_w;
			load:
					next_state <= idle_w;
			default:
				next_state <= idle_w;
		endcase
	end

 // Defining output logic
	always @(state) 
	begin
		case (state)
			idle_w:
			begin
				shift_rxregs = 1'b0;
 				load_confregs = 1'b0;
				done_wr = 1'b0;
				wr_leds = 3'b001;
			end
			shift:
			begin
				shift_rxregs = 1'b1;
 				load_confregs = 1'b0;
				done_wr = 1'b0;
				wr_leds = 3'b010;
			end
			load:
			begin
				shift_rxregs = 1'b0;
 				load_confregs = 1'b1;
				done_wr = 1'b1;
				wr_leds = 3'b011;
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