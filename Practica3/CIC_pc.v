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
//// Modulo CIC_pc: Top del filtro interpolador CIC usando generate

genvar i;

generate 

	for(i=0; i < 3; i= i+1) 
		begin 
			wire val_wire [0:7];
			wire [Win+Wg-1:0] data_in_int_wire [0:2];
			wire [Win+Wg-1:0] data_out_int_wire [0:2];
			wire [(Win-1)+i:0] data_comb_wire [0:2];
			wire [(Win-1)+i:0] data_out_comb_wire [0:2];
//COMB
 			COMB #(.Win(Win+i)) COMB (.data_in(data_in_comb_wire[i]),
   									.clk(clk),
               						.rst(rst), 
	 								.val_in(val_wire[i]),
									.val_out(val_wire[i+1]),
            			  			.data_out((data_out_comb_wire[i+1]));
//INT
			INT #(.Win(Win), .Wg(Wg)) INT (.data_in(data_in_int_wire[i]),
   							        	.clk(clk),
               	        				.rst(rst), 
								        .val_in(val_wire[i+4]),
								        .val_out(val_wire[i+5]),
                       				 	.data_out(data_out_int_wire[i+1]));					
// R_INT
			if (i == 0)
			begin 
 				R_INT #(.Win(Win+3))  R_INT (.data_in(data_out_comb_wire[3]),
   											.clk(clk),
                	  						.rst(rst), 
	 										.val_in(val_wire[3]),
											.val_out(val_wire[4]),
                   							.data_out(data_in_int_wire[0]));	
			end								
		end
endgenerate
	
assign 	val_in = val_wire[0];
assign 	val_out = val_wire[7];
assign	data_in_wire = data_in_comb_wire [0];
assign 	data_out_wire = data_out_int_wire [3];

endmodule 




