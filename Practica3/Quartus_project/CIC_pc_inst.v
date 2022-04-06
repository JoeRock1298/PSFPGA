module CIC_pc_inst
#(parameter Win=16, // Input length
  parameter Wg=22) // Guard bits) 

  (input signed [Win-1:0] i_data,  		// Data input
   input clk,
   input rst,
   input val_in,  						// Validation input
   output val_out,						// Validation output
   output signed [Win+Wg-1:0] o_data);	// Data output
   
//// Insertar la descripción del modulo
//// Modulo CIC_pc: Top del filtro interpolador CIC usando generate

wire [(Win-1)+1:0]data_wire1;
wire [(Win-1)+2:0]data_wire2;
wire [(Win-1)+3:0]data_wire3;

wire [(Win-1)+3:0]data_wire4;

wire [(Win+Wg)-1:0]data_wire5;
wire [(Win+Wg)-1:0]data_wire6;

wire val_wire1;
wire val_wire2;
wire val_wire3;
wire val_wire4;
wire val_wire5;
wire val_wire6;
wire val_wire7;


//COMB
COMB #(.Win(Win)) COMB0 (.data_in(i_data),
											.clk(clk),
               						.rst(rst), 
											.val_in(val_in),
											.val_out(val_wire1),
											.data_out(data_wire1));
											
COMB #(.Win(Win+1)) COMB1 (.data_in(data_wire1),
											.clk(clk),
               						.rst(rst), 
											.val_in(val_wire1),
											.val_out(val_wire2),
											.data_out(data_wire2));
											
COMB #(.Win(Win+2)) COMB2 (.data_in(data_wire2),
											.clk(clk),
               						.rst(rst), 
											.val_in(val_wire2),
											.val_out(val_wire3),
											.data_out(data_wire3));																										
//INT		
INT #(.Win(Win+3),.Wg(Wg)) INT0 (.data_in(data_wire4),
													.clk(clk),
													.rst(rst), 
													.val_in(val_wire4),
													.val_out(val_wire5),
													.data_out(data_wire5));		
INT #(.Win(Win+Wg),.Wg(Wg)) INT1 (.data_in(data_wire5),
													.clk(clk),
													.rst(rst), 
													.val_in(val_wire5),
													.val_out(val_wire6),
													.data_out(data_wire6));
INT #(.Win(Win+Wg),.Wg(Wg)) INT2 (.data_in(data_wire6),
													.clk(clk),
													.rst(rst), 
													.val_in(val_wire6),
													.val_out(val_out),
													.data_out(o_data));	
// R_INT
R_INT #(.Win(Win+3))  R_INT0 (.data_in(data_wire3),
												.clk(clk),
												.rst(rst), 
												.val_in(val_wire3),
												.val_out(val_wire4),
												.data_out(data_wire4));			


endmodule 