
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

  signed reg [Wg+Win-1:0] data_out_reg;
	
  always@(posedge clk)
    begin
    data_out_reg <= data_out;
    if (rst)
      begin
       data_out <= {Wg+Win{1'b0}}; 
       val_out <= 1'b0;
       end
    else	
      if (val_in)
        begin
          data_out <= data_in + data_out_reg;
          val_out <= 1'b1; 
        end   
      else
        begin
          data_out <= data_out;
          val_out <= val_out;
        end 
  end

endmodule 