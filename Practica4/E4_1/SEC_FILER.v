module SEC_FILTER
#(parameter Win=16,    // Cuantificacion de la entrada y salida
  parameter Wc = 18,   // Cuantificacion coeficientes
  parameter Num_coef=17)   // Numero de coeficientes
  (input  signed [Win-1:0] din, // entrada
   input  clk, 
   input val_in,
   input rst,
   output reg val_out,
   output reg signed [Win+Wc-1:0] dout); // salida precision completa
   //output reg signed [Win+2:0] dout); // salida truncada a 19 bits
	
  	//Wires
	wire ce_Reg_wire;
	wire ce_ACC_wire;
	wire rst_ACC_wire;
	wire coef_wire;
	wire din_wire;
	wire [log2(Num_coef)-1:0] addr_wire;
	
	//Register
	reg signed [Win+Wc-1:0] out_reg;
	
	//Modules
	MULT_ACC #(.Win(Win), .Wc(Wc)) MULT_ACC0(.din(din_wire),
					        .coef(coef_wire),
					        .clk(clk),
					        .rst(rst_ACC_wire),
					        .ce(ce_ACC_wire),
						.dout(out_reg));
		
	REG_MUX #(.Win(Win), .Num_coef(Num_coef)) REG_MUX0(.din(din),
					     		   .sel(addr_wire),
							   .clk(clk),
							   .ce(val_in),
							   .dout(din_wire));
				   
	ROM #(.Num_coef(Num_coef), .Wc(WC)) ROM0(.addr(addr_wire),
						 .clk(clk),
						 .data(coef_wire));
						 
	CONTROL #(.Num_coef(Num_coef)) CONTROL0(.val_in(val_in),
						.val_out(val_out),
						.clk(clk),
						.rst(rst),
						.addr(addr_wire))
						.ce_Reg(ce_ACC_wire),
		  				.rst_ACC(rst_ACC_wire),
		   				.ce_ACC());
	//Register Output Control
	 always @(posedge clk ) begin
		 if (ce_ACC == 1)
			 dout <= out_reg;
		 else if(ce_ACC == 0)
			 dout <= 0;
 	 end

endmodule
