


module REG_MUX
#(parameter Win=16, // Cuantificación de la entrada y salida
  parameter Num_coef = 17) // Numero de datos a procesar
  (input  signed [Win-1:0] din  , // entrada
   input  [log2(Num_coef)-1:0] sel, // selector del mux
   input  clk, 
   input ce,
   output reg signed [Win-1:0] dout); // salida 

  //register implementation. We use a M9k memory to reduce the implementation area.
  reg [Win - 1 : 0] SR_9k [Num_coef - 1 : 0] = 0; // Maybe we need a reset input as well.
  integer i;

  always @(posedge clk ) 
  begin
    if (ce) 
    begin
      for (i = Num_coef - 1; i > 0; i = i - 1) begin
        SR_9k[i] <= SR_9k[i-1];
      end
      SR_9k[0] <= din; 
    end
    dout <= SR_9k[sel];
  end

 function integer log2;
   input integer value;
   begin
     value = value-1;
     for (log2=0; value>0; log2=log2+1)
       value = value>>1;
   end
 endfunction

endmodule
			

   