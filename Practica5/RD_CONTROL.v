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
	parameter idle_r = 2'b00, busy = 2'b01, shift = 2'b010, load = 2'b11;

 // Declare state registers
	reg [1:0] state, next_state;

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
				else if (state == load)
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
					next_state <= busy;
				else 
					next_state <= idle_r;
			busy:
				if ((count < count_end) && (txbusy == 1'b0))
					next_state <= shift;					
				else if ((count >= count_end) && (txbusy == 1'b0))
					next_state <= load;		
				else 
					next_state <= busy;	
			shift:
				next_state <= busy;
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
				txena = 1'b0;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b001;
			end
			busy:
			begin
				txena = 1'b0;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b010;
			end
			shift:
			begin
				txena = 1'b1;
				load_txregs = 1'b0;
 				shift_txregs = 1'b1;
				done_rd = 1'b0;
				rd_leds = 3'b011;
			end
			load:
			begin
				txena = 1'b0;
				load_txregs = 1'b1;
 				shift_txregs = 1'b0;
				done_rd = 1'b1;
				rd_leds = 3'b100;
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