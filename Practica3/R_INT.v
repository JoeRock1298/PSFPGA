module R_INT
#(parameter Win=19)
  (input signed [Win-1:0] data_in,
   input clk,
   input rst,
   input val_in,  					// Validation input
   output reg val_out,					// Validation output
   output reg signed [Win-1:0] data_out);

	//// Insertar la descripción del modulo
  //// Modulo R_INT: Deja salir lo de la entrada cada 2000 muestras (val_in = 1), sino es 0.

always@(posedge clk)
    begin
    if (rst)
      begin
       data_out <= {Win{1'b0}}; 
       val_out <= 1'b0;
       end
    else	
      if (val_in)
        begin
          data_out <= data_in;
          val_out <= 1'b1; 
        end   
      else
        begin
          data_out <= 1'b0;
          val_out <= val_out;
        end 
  end

endmodule
			

   