
module MULT_ACC
#(parameter Win=16,    		// Cuantificacion de la entrada y salida
  parameter Wc = 18) 		// Cuantificacion coeficientes
  (input  signed [Win-1:0] din  , // entrada
   input   signed [Wc-1:0] coef , // coeficiente
   input  clk, 
   input rst,                // reset del acumulador
   input ce,				// habiliatacion del acumulador
   output signed [Win+Wc-1:0] dout); // salida Win+Wc


		
endmodule
			

   