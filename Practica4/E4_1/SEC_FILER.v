module SEC_FILTER
#(parameter Win=16,    // Cuantificacion de la entrada y salida
  parameter Wc = 18,   // Cuantificacion coeficientes
  parameter Num_coef=17)   // Numero de coeficientes
  (input  signed [Win-1:0] din, // entrada
   input  clk, 
   input val_in,
   input rst,
   output reg val_out,
   output reg signed [Win+Wc-1:0] dout); // salida precision completa
   //output reg signed [Win+2:0] dout); // salida truncada a 19 bits
	
  //Wires

	//Modules
	MULT_ACC #(.Win(Win), .Wc(Wc)) MULT_ACC0(.din(),
					        .coef(),
					        .clk(clk),
					        .rst(),
					        .ce(),
					        .dout());
		
	REG_MUX #(.Win(Win), .Num_coef(Num_coef)) REG_MUX0(.din(),
					     		   .sel(),
					       		   .clk(),
					      		   .ce(),
					       		   .dout());
				   
	ROM #(.Win(Win), .Wc(WC)) ROM0(.addr(),
				       .clk(),
				       .data());
						 
	CONTROL #(.Num_coef(Num_coef)) CONTROL0(.val_in(),
					        .val_out(),
					        .clk(),
					        .rst(),
					        .ce(),
					        .addr())
						.ce_Reg(),
		  				.rst_ACC(),
		   				.ce_ACC());

endmodule
