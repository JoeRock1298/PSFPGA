module COMB 
#(parameter Win=16) // Input length
  (input signed [Win-1:0] data_in,
   input clk,
   input rst,
   input val_in,  					    // Validation input
   output reg val_out,					// Validation output
   output reg signed  [Win:0] data_out);
	
	//// Insertar la descripción del modulo
  //// Modulo COMB: La salida es la resta de la entrada con la misma entrada retrasada

reg signed  [Win-1:0] data_in_reg;

always @(posedge clk)
  begin
    data_in_reg <= data_in;
    if (rst)
      begin
       data_out <= {Win{1'b0}}; 
       val_out <= 1'b0;
       end
    else	
      if (val_in)
        begin
          data_out <= data_in - (data_in_reg);
          val_out <= 1'b1; 
        end   
      else
        begin
          data_out <= data_out;
          val_out <= val_out;
        end 
  end

endmodule 
