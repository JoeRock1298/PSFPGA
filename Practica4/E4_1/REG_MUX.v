


module REG_MUX
#(parameter Win=16, // Cuantificación de la entrada y salida
  parameter Num_coef = 17) // Numero de datos a procesar
  (input  signed [Win-1:0] din  , // entrada
   input  [log2(Num_coef)-1:0] sel, // selector del mux
   input  clk, 
   input ce,
   output reg signed [Win-1:0] dout); // salida 



 function integer log2;
   input integer value;
   begin
     value = value-1;
     for (log2=0; value>0; log2=log2+1)
       value = value>>1;
   end
 endfunction
endmodule
			

   