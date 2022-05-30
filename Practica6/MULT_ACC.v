
module MULT_ACC
#(parameter Win=16,    		// Cuantificacion de la entrada y salida
  parameter Wc = 18) 		// Cuantificacion coeficientes
  (input  signed [Win-1:0] din  , // entrada
   input   signed [Wc-1:0] coef , // coeficiente
   input  clk, 
   input rst,                // reset del acumulador
   input ce,				// habiliatacion del acumulador
   //output signed [Win+Wc-1:0] dout); // salida Win+Wc
   output signed [Win+Wc:0] dout);
   // For the full AM-FM model, we need a dout of S[34,31] for a S[16,15] input * S[17,16] coef.

  //Auxiliar variables
  /*wire signed [Win+Wc-1:0] mult_res;
  reg signed [Win+Wc-1:0] mult_res_reg; // register for segmentation, adds aditional delay to the operation
  reg signed [Win+Wc-1:0] acc_res; // acumulator register */
  wire signed [Win + Wc : 0] mult_res;
  reg signed [Win + Wc : 0] mult_res_reg;
  reg signed [Win + Wc : 0] acc_res; // acumulator register

  //Definiendo la MAC sin segmentación, es posible que se necesite posteriormente
  //Realizando la multiplicación
  assign mult_res = din * coef;
  assign dout = (ce)? acc_res + mult_res_reg : dout;
  //acumulador
  always @(posedge clk ) begin
    if (rst) 
    begin
      acc_res <= 0;
      mult_res_reg <= 0;
    end
    else if(ce)
    begin
      acc_res <= dout;
      mult_res_reg <= mult_res;
    end
    
  end
		
endmodule
			

   