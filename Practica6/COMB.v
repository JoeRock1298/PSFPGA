module COMB 
#(parameter Win=16) // Input length
  (input signed [Win-1:0] data_in,
   input clk,
   input rst,
   input val_in,  					    // Validation input
   output reg val_out,					// Validation output
   output reg signed  [Win - 1:0] data_out); 
	 // Win is already considering the growth for generete compatibility, thus d_out is same as d_in
	//// Insertar la descripción del modulo
  //// Modulo COMB: La salida es la resta de la entrada con la misma entrada retrasada

reg signed  [Win-1:0] data_in_reg = 0;

always @(posedge clk)
  begin
    if (rst)
      begin
       data_out <= 0; 
       val_out <= 1'b0;
       data_in_reg <= 0;
       end
    else	
    begin
      if (val_in)
        begin
          data_in_reg <= data_in;
          data_out <= data_in - (data_in_reg);
          val_out <= val_in; 
        end   
      else
        begin
          data_out <= data_out;
          data_in_reg <= data_in_reg;
          val_out <= val_in;
        end 
    end
  end

endmodule 
