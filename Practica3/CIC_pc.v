module CIC_pc
#(parameter Win=16, // Input length
  parameter Wg=22) // Guard bits

  (input signed [Win-1:0] i_data,  		// Data input
   input clk,
   input rst,
   input val_in,  						// Validation input
   output val_out,						// Validation output
   output signed [Win+Wg-1:0] o_data);	// Data output
   
//// Insertar la descripción del modulo
//// Modulo CIC_pc: Top del filtro interpolador CIC usando generate

wire val_wire [0:7];

wire [Win+Wg-1:0] data_int_wire [0:3];

wire [(Win-1)+N:0] data_comb_wire [0:3];

genvar c;

generate 
	begin
//COMB
	for(c=0; c < 3; c= c+1) 
	begin : CIC
 			COMB #(.Win(Win + c)) COMB0 (.data_in(data_comb_wire[c]),
											.clk(clk),
               						.rst(rst), 
											.val_in(val_wire[c]),
											.val_out(val_wire[c+1]),
											.data_out(data_comb_wire[c+1]));


//INT		

			INT #(.Win(Win), .Wg(Wg)) INT0 (.data_in(data_int_wire[c]),
													.clk(clk),
													.rst(rst), 
													.val_in(val_wire[c+4]),
													.val_out(val_wire[c+5]),
													.data_out(data_int_wire[c+1]));		
		end			


	end
endgenerate

// R_INT
			R_INT #(.Win(Win+3))  R_INT0 (.data_in(data_comb_wire[3]),
												.clk(clk),
												.rst(rst), 
												.val_in(val_wire[3]),
												.val_out(val_wire[4]),
												.data_out(data_int_wire[0]));			

	
assign 	val_wire[0] = val_in ;
assign 	val_out = val_wire[7];
assign	data_comb_wire [0] = i_data;
assign 	o_data = data_int_wire [3];

endmodule 




