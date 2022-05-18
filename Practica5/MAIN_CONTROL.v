module MAIN_CONTROL
(
	input rxrdy,
	input [7:0] rxdw,
	input done_wr, 
	input done_rd,
	input rst, 
	input clk,
	output reg start_wr, 
	output reg start_rd,
	output reg [2:0] sleds 
);

 // Changing the state encoding type to user define
    (*syn_encoding="user"*)
 
 // Declare states
	parameter idle = 2'b00, write = 2'b01, read = 2'b10;
	
 // Declare state registers
	reg [1:0] state, next_state;

 // Defining state trancision
	always @(posedge clk ) 
	begin
		if (rst)
			state <= idle;	
		else
			state <= next_state;	
	end

// Defining next_state logic
	always @(state, rxrdy, rxdw, done_wr, done_rd) 
	begin
		next_state <= idle;
		case(state)
			idle:
				if ((rxrdy == 1'b1) && (rxdw == 8'h0F)) 
					next_state <= write;
				else if ((rxrdy == 1'b1) && (rxdw == 8'hF0)) 
					next_state <= read;
				else 
					next_state <= idle;
			write:
				if (done_wr) 
					next_state <= idle;
				else 
					next_state <= write;
			read:
				if (done_rd)
					next_state <= idle;
				else 
					next_state <= read;
			default:
				next_state <= idle;
		endcase
	end

 // Defining output logic
	always @(state) 
	begin
		// Señales de start deben ser un pulso?
		case (state)
			idle:
			begin
				start_wr = 1'b0;
 				start_rd = 1'b0;
				sleds = 3'b001;
			end
			write:
			begin
				start_wr = 1'b1;
 				start_rd = 1'b0;
				sleds = 3'b011;
			end
			read:
			begin
				start_wr = 1'b0;
 				start_rd = 1'b1;
				sleds = 3'b010;
			end	 
			default:
			begin
				start_wr = 1'b0;
 				start_rd = 1'b0;
				sleds = 3'b111;
			end 
		endcase	
	end
endmodule

