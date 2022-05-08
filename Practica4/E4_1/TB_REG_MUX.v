`timescale 1ns/1ps

module TB_REG_MUX();
// CONFIGURABLE PARAMETERS ///////////////////////////////////
parameter Num_coef = 5;
parameter Win = 16;
// END CONFIGURABLE PARAMETERS ///////////////////////////////

parameter PER=10; // CLOCK PERIOD

// Variables de entrada
reg signed [Win-1:0] din;
reg [log2(Num_coef)-1:0] sel;
reg clk;
reg ce;

// Variables de salida
wire signed [Win-1:0] dout;

// contadores de ciclos
integer i = 0;

// Address
integer selector = 0;

always #(PER/2) clk = !clk;

always #(PER) i = i + 1 ;

REG_MUX /*#(.Win(Win), .Num_coef(Num_coef)) */UUT 
			(.din(din),
			.sel(sel),
			.clk(clk),
			.ce(ce),
			.dout(dout));

initial	
	begin
		clk = 1'b1;
		ce = 1'b0;
		#(2*PER);
		$display("Simulation started");
		// adding new vales to the SR
		value_in (5);
		#(PER*2)
		value_in (6);
		#(PER*2)
		value_in (10);
		#(PER*2)
		read_SR();
		#(PER*2)
		value_in (0);
		#(PER*2)
		value_in (-8);
		#(PER*2)
		value_in (-20);
		#(PER*2)
		read_SR();
		$display("Simulation finished");
		#(PER*2) $stop;
	end

task value_in ( input signed [Win-1:0] value);
	begin
		ce = 1'b1;
		din = value;
		#(PER) ce = 1'b0;
		din = 0;
	end
endtask

task read_SR ( );
	begin
		for ( selector = 0; selector < Num_coef; selector = selector + 1) 
		begin
			@(posedge clk)
			begin
				sel = selector;
				$display("%d", selector);
			end	
		end
		selector = 0;
		sel = selector;
	end
endtask

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