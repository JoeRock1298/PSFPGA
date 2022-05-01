`timescale 1ns/1ps

module TB_CONTROL();
// CONFIGURABLE PARAMETERS ///////////////////////////////////
parameter Num_coef = 17;
// END CONFIGURABLE PARAMETERS ///////////////////////////////

parameter PER=10; // CLOCK PERIOD

// Variables de entrada
reg rst;
reg clk;
reg val_in;

// Variables de salida
wire ce_Reg, rst_Acc, ce_Acc, val_out;
wire [log2(Num_coef) - 1:0] addr;

// contadores de ciclos
integer i = 0;

always #(PER/2) clk = !clk;

always #(PER) i = i + 1 ;

CONTROL #(.Num_coef(Num_coef)) UUT 
			(.val_in(val_in),
			.clk(clk),
			.rst(rst),
			.addr(addr),
			.ce_Reg(ce_Reg),
			.rst_Acc(rst_Acc),
			.ce_Acc(ce_Acc),
			.val_out(val_out));
// Simulando un ciclo de control entero
initial	
	begin
		clk = 1'b1;
		val_in = 1'b0;
		rst = 1'b1;
		#(10*PER);
		rst = 1'b0;
		$display("Simulation started");
		val_in = #(PER/10) 1'b1;
		val_in = #(PER + PER/10) 1'b0;
		$display("Simulation finished");
		#(PER*20) $stop;
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