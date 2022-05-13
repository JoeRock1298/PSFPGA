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
	parameter idle_r = 3'b000, start = 3'b001, busy = 3'b010, shift = 3'b011, load = 3'b100;

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

	always @(posedge clk) 
	begin
		if (rst)
			count <= 4'h0;	
		else
			begin
				if ((start == 1'b1) && (txbusy == 1'b1))
					count <= count + 1;
					while (txbusy == 1'b1);
				else if ((rxrdy == 1'b1) && (count < 4'hA))

			end
	end

// Defining next_state logic
	always @(state, txbusy, start_rd) 
	begin
		next_state <= idle_r;
		case(state)
			idle_w:
				if ((txbusy == 1'b0) && (start_rd == 1'b1)) 
					next_state <= start;
				else 
					next_state <= idle_r;
			start:
				if (txbusy == 1'b1)
					next_state <= busy;
				else 
					next_state <= busy;
			busy:
				if ((txbusy == 1'b0) && (count == 0)) 
					next_state <= shift;					
				else if ((txbusy == 1'b0) && (count == 1))
					next_state <= load;		
				else 
					next_state <= busy;	
			shift:
				if (txbusy == 1'b1) 
					next_state <= busy;
				else 
					next_state <= shift;
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
			start:
			begin
				txena = 1'b1;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b010;
			end
			busy:
			begin
				txena = 1'b0;
				load_txregs = 1'b0;
 				shift_txregs = 1'b0;
				done_rd = 1'b0;
				rd_leds = 3'b011;
			end
			shift:
			begin
				txena = 1'b1;
				load_txregs = 1'b0;
 				shift_txregs = 1'b1;
				done_rd = 1'b0;
				rd_leds = 3'b100;
			end
			load:
			begin
				txena = 1'b0;
				load_txregs = 1'b1;
 				shift_txregs = 1'b0;
				done_rd = 1'b1;
				rd_leds = 3'b101;
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