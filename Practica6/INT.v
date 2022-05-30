
module INT 
#(parameter Win=16,					// Input
	parameter Wg= 22) 					// Crecimiento del dato
  (input signed [Wg+Win-1:0] data_in, 	// Input data
   input clk,
   input rst,
   input val_in,  					// Validation input
   output reg val_out,					// Validation output
   output reg signed [Wg+Win-1:0] data_out);// Output data

	//// Insertar la descripción del modulo
  //// Modulo INT: La salida es la suma de la entrada con la misma salida retrasda
	
  always@(posedge clk)
    begin
    if (rst)
      begin
       data_out <= 0; 
       val_out <= 0;
       end
    else	
      if (val_in)
        begin
          data_out <= data_in + data_out;
          val_out <= val_in; 
        end   
      else
        begin
          data_out <= data_out;
          val_out <= val_out;
        end 
  end

endmodule 