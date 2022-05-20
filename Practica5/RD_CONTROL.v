module RD_CONTROL
(
	input txbusy,
	input start_rd,
	input rst, 
	input clk,
	output reg txena,
	output reg load_txregs,
	output reg shift_txregs,
	output reg done_rd,
	output reg [2:0] rd_leds
	);

// Changing the state encoding type to user define
    (*syn_encoding="user"*)

// Declare states
	parameter idle_r = 3'b000, load = 3'b001, write = 3'b010, rest = 3'b011, shift = 3'b100, exit= 3'b101;

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
				else if (state == exit)
					count <= 4'h0;
				else 
					count <= count;
			end
	end

// Defining next_state logic
	always @(state, txbusy, start_rd, count) 
	begin
		next_state <= idle_r;
		case(state)
			idle_r:
				if ((txbusy == 1'b0) && (start_rd == 1'b1)) 
					next_state <= load;
				else 
					next_state <= idle_r;
			load: 
				next_state <= write;
			write:
				next_state <= rest;	
			rest:
				if ((txbusy == 1'b0)) 
					next_state <= rest;
				else 
					next_state <= shift;
			shift:
				if (count == count_end) 
					next_state <= exit;
				else 
					next_state <= write;				
			exit:
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
				txena = 1'b0;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b001;
			end
			load:
			begin
				txena = 1'b0;
				load_txregs = 1'b1;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b010;
			end			
			write:
			begin
				txena = 1'b1;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b011;
			end
			rest:
			begin
				txena = 1'b1;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b100;
			end
			shift:
			begin
				txena = 1'b0;
				load_txregs = 1'b0;
 				shift_txregs = 1'b1;
				done_rd = 1'b0;
				rd_leds = 3'b101;
			end	
			exit:
			begin
				txena = 1'b0;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b1;
				rd_leds = 3'b110;
			end	 
			default:
			begin
				txena = 1'b0;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b111;
			end 
		endcase	
	end
endmodule 