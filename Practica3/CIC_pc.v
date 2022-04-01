module CIC_pc
#(parameter Win=16, // Input length
  parameter Wg=22)  // Guard bits

  (input signed [Win-1:0] i_data,  		// Data input
   input clk,
   input rst,
   input val_in,  						// Validation input
   output val_out,						// Validation output
   output signed [Win+Wg-1:0] o_data);	// Data output

	//// Insertar la descripción del modulo
  //// Modulo CIC_pc: Top del filtro interpolador CIC

  //Auxiliar wires variables

	// COMB
 	COMB #(.Win(Win)) COMB1 (.data_in(i_data),
   								.clk(clk),
                	.rst(rst), 
	 								.val_in(),
									.val_out(),
                  .data_out());
 	COMB #(.Win(Win+1)) COMB2 (.data_in(),
   								  .clk(clk),
                	  .rst(rst), 
	 								  .val_in(),
									  .val_out(),
                    .data_out());
 	COMB #(.Win(Win+2)) COMB3 (.data_in(),
   								  .clk(clk),
                	  .rst(rst), 
	 								  .val_in(),
									  .val_out(),
                    .data_out());

// R_INT
 	R_INT #(.Win(Win+3))  R_INT1 (.data_in(),
   								  .clk(clk),
                	  .rst(rst), 
	 								  .val_in(),
									  .val_out(),
                    .data_out());

// INT
 	INT #(.Win(Win), .Wg(Wg)) INT1 (.data_in(i_data),
   								        .clk(clk),
                	        .rst(rst), 
	 								        .val_in(),
									        .val_out(),
                          .data_out());
 	INT #(.Win(Win), .Wg(Wg)) INT2 (.data_in(i_data),
   								        .clk(clk),
                	        .rst(rst), 
	 								        .val_in(),
									        .val_out(),
                          .data_out());
 	INT #(.Win(Win), .Wg(Wg)) INT3 (.data_in(i_data),
   								        .clk(clk),
                	        .rst(rst), 
	 								        .val_in(),
									        .val_out(),
                          .data_out());

	endmodule 




