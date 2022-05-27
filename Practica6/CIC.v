module CIC
#(parameter Win=16, // Input length
  parameter Wg=22,// Guard bits
  parameter N = 3, // numero de etapas (Se resta 1))
  parameter Wout = 16) // Output length
  (input signed [Win-1:0] i_data,  		// Data input
   input clk,
   input rst,
   input val_in,  						// Validation input
   output val_out,						// Validation output
   output signed [Wout-1:0] o_data);	// Data output
   
// Insertar la descripción del modulo
// Modulo CIC: Top del filtro interpolador CIC usando generate con truncamiento

wire val_wire [0:7];
wire [(Win + Wg - 1):0] data_int_wire [0:3];
wire [(Win + N - 1):0] data_comb_wire [0:3];
// Generete section

genvar c;
generate
	begin
	for(c=0; c < 3; c= c+1)
		begin : CIC
			//COMB
 			COMB #(.Win(Win + N)) COMB0 (.data_in(data_comb_wire[c]),
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
R_INT #(.Win(Win + N), .Wg(Wg))  R_INT0 (.data_in(data_comb_wire[3]),
							.clk(clk),
							.rst(rst),
							.val_in(val_wire[3]),
							.val_out(val_wire[4]),
							.data_out(data_int_wire[0]));
assign 	val_wire[0] = val_in ;
assign 	val_out = val_wire[7];
assign	data_comb_wire [0] = i_data;
// This way the truncated value is parametrized, independant of the Win
// input [18,15] -> output [16,15], [win + wg -1 = 39:0] -> [37:22]
assign 	o_data = data_int_wire [3] [ (Win + Wg - 2 - 1) : (Win + Wg - 2 - Wout)];

endmodule 




