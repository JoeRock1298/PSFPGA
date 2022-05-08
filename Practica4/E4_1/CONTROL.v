module CONTROL
# (parameter Num_coef = 17)
( input val_in,
 input clk,
 input rst,
 output [log2(Num_coef)-1:0] addr,
 output reg ce_Reg,
 output reg rst_Acc,
 output reg ce_Acc,
 output reg val_out
);
 
 // changing the state encoding type to user define
    (*syn_encoding="user"*)
 
 // Declare states
	parameter ini_filter = 2'b00, start_filter = 2'b01, end_filter = 2'b10;
	
 // Declare state registers
	reg [1:0] state, next_state;

 // Registering the outputs since the addressed values requires and aditional clock cycle
 // except of rst_Acc since we can clear the adder in the last state
 reg ce_Acc_aux, ce_Reg_aux, val_out_aux, rst_Acc_aux;

 // Defining counter for a timed FSM
	reg [log2(Num_coef)-1:0] timer = 0;
	localparam timeout = Num_coef - 1;
	
	always @(posedge clk) 
	begin
		if (rst)
			timer <= 0;	
		else
			if (state == start_filter)
				timer <= timer + 1'b1;
			else
				timer <= 0;
	end
 
 // Defining next_state logic
	always @(state, val_in, timer) 
	begin
		next_state <= ini_filter;
		case(state)
			ini_filter:
				if (val_in) // waiting for a new value to start filtering process
					next_state <= start_filter;
				else
					next_state <= ini_filter;
			start_filter:
				if (timer < timeout) // waiting for the 16 coeficients 
					next_state <= start_filter;
				else // when last coeficient iteration
					next_state <= end_filter;
			end_filter:
				next_state <= ini_filter; // Last state to capture the filtered value
			default:
				next_state <= ini_filter;
		endcase
	end

 // Defining state trancision
	always @(posedge clk ) 
	begin
		if (rst)
			state <= ini_filter;	
		else
			state <= next_state;	
	end

 // Defining output logic
	always @(state) 
	begin
		case (state)
			ini_filter:
			begin
				ce_Reg_aux = 0;
 				rst_Acc_aux = 1;
				ce_Acc_aux = 0;
				val_out_aux = 0;
			end
			start_filter:
			begin
				ce_Reg_aux = 0;
 				rst_Acc_aux = 0;
				ce_Acc_aux = 1;
				val_out_aux = 0;
			end
			end_filter:
			begin
				ce_Reg_aux = 1;
 				rst_Acc_aux = 0;
				ce_Acc_aux = 1;
				val_out_aux = 1;
			end	 
			default:
			begin
				ce_Reg = 0;
 				rst_Acc_aux = 1;
				ce_Acc_aux = 0;
				val_out_aux = 0;
			end 
		endcase	
	end

	assign addr = timer;

	always @(posedge clk ) 
	begin
		ce_Acc <= ce_Acc_aux;
		ce_Reg <= ce_Reg_aux;
		val_out <= val_out_aux;
		rst_Acc <= rst_Acc_aux;
	end

 //Defining log2 function
	function integer log2;
		input integer value;
   		begin
     		value = value-1;
     		for (log2=0; value>0; log2=log2+1)
       			value = value>>1;
   		end
	endfunction

endmodule 