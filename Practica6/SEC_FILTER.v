module SEC_FILTER
#(parameter Win=16,    // Cuantificacion de la entrada y salida
  parameter Wc = 18,   // Cuantificacion coeficientes
  parameter Num_coef=17)   // Numero de coeficientes
  (input  signed [Win-1:0] din, // entrada
   input  clk, 
   input val_in,
   input rst,
   output reg val_out,
   //output reg signed [Win+Wc-1:0] dout); // salida precision completa
   //output reg signed [Win+2:0] dout); // salida truncada a 19 bits
   // for a S[18,15] output: 
   output reg signed [18 - 1:0] dout);
	
  	//Wires
	wire ce_Reg_wire;
	wire ce_ACC_wire;
	wire rst_ACC_wire;
	wire val_out_wire;
	wire signed [Wc-1:0] coef_wire;
	wire signed [Win-1:0] din_wire;
	wire [log2(Num_coef)-1:0] addr_wire;
	wire signed [Win+Wc-1:0] dout_wire; // salida precision completa
	
	//Modules
	MULT_ACC #(.Win(Win), .Wc(Wc)) MULT_ACC0(.din(din_wire),
					        .coef(coef_wire),
					        .clk(clk),
					        .rst(rst_ACC_wire),
					        .ce(ce_ACC_wire),
						.dout(dout_wire));
		
	REG_MUX #(.Win(Win), .Num_coef(Num_coef)) REG_MUX0(.din(din),
					     		.sel(addr_wire),
								.clk(clk),
								.ce(val_in),
								.dout(din_wire));
				   
	ROM #(.Num_coef(Num_coef), .Wc(Wc)) ROM0(.addr(addr_wire),
						 .clk(clk),
						 .data(coef_wire));
						 
	CONTROL #(.Num_coef(Num_coef)) CONTROL0(.val_in(val_in),
						.val_out(val_out_wire),
						.clk(clk),
						.rst(rst),
						.addr(addr_wire),
						.ce_Reg(ce_Reg_wire),
		  				.rst_Acc(rst_ACC_wire),
		   				.ce_Acc(ce_ACC_wire));
	//Register Output Control
	 always @(posedge clk ) 
	 begin
		if (ce_Reg_wire)
			//dout <= dout_wire; [33:0] -> 34bits ; [33:16]
			dout <= dout_wire [Win + Wc - 1 : Win + Wc - 18];
			//dout <= dout_wire [Win + Wc : Win + Wc - 18 + 1];
		else
			dout <= dout;
 	 end

	//Valout connection
	always @(posedge clk ) 
	begin
		val_out <= val_out_wire;
	end

	//Defining log2 function
	function integer log2;
   		input integer value;
   		begin
     		value = value-1;
     		for (log2=0; value>0; log2=log2+1)
       			value = value>>1;
   		end
 	endfunction
	
endmodule
