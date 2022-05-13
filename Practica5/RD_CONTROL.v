module RD_CONTROL
(
	input txbusy,
	input start_rd,
	input rst, 
	input clk,
	output txena,
	output load_txregs,
	output shift_txregs,
	output done_rd,
	output [2:0] rd_leds
	);

// Changing the state encoding type to user define
    (*syn_encoding="user"*)

// Declare states
	parameter idle_r = 3'b000, start = 3'b001, start = 3'b010, shift = 3'b011, load = 3'b100;

 // Declare state registers
	reg [2:0] state, next_state;

 // Defining state trancision
	always @(posedge clk) 
	begin
		if (rst)
			state <= idle_r;	
		else
			state <= next_state;	
	end

 // Defining counter for bits
	reg [3:0] count  = 4'h0;

	always @(posedge clk) 
	begin
		if (rst)
			count <= 4'h0;	
		else
			begin
				if (count > 4'hA)
					count <= 4'h0;
				else if ((rxrdy == 1'b1) && (count < 4'hA))
					count <= count + 1;
			end
	end

// Defining next_state logic
	always @(state, txbusy, start_rd) 
	begin
		next_state <= idle_r;
		case(state)
			idle_w:
				if ((rxrdy == 1'b1) && (start_wr == 1'b1)) 
					next_state <= shift;
				else if (count == 4'hA) 
					next_state <= load;
				else 
					next_state <= idle_r;
			shift:
				if (rxrdy == 1'b1)
					next_state <= shift;
				else if (count == 4'hA)
					next_state <= load;
				else 
					next_state <= idle_r;
			load:
					next_state <= idle_r;
			default:
				next_state <= idle_r;
		endcase
	end

 // Defining output logic
	always @(state) 
	begin
		case (state)
			idle_r:
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
				wr_leds = 3'b011;
			end
			load:
			begin
				shift_rxregs = 1'b0;
 				load_confregs = 1'b1;
				done_wr = 1'b1;
				wr_leds = 3'b010;
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