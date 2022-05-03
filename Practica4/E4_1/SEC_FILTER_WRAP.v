module SEC_FILTER_WRAP
    (
        input signed [15:0] din, // entrada
        input clk, 
        input val_in,
        input rst,
        output reg val_out,
        output reg signed [18:0] dout // salida truncada a 19 bits
    );

    reg signed [15:0] din_reg;
    reg val_in_reg; 
    reg rst_reg;
    wire val_out_wire;
    wire signed [18:0] dout_wire;

    always@(posedge clk) 	
	begin
		din_reg <= din;
		val_in_reg <= val_in;
		rst_reg <= rst;
		dout <= dout_wire;
		val_out <= val_out_wire;
	end

    SEC_FILTER #(.Win(16), .Wc(18), .Num_coef(17)) SEC_FILTER1
    			(.din(din_reg),
			    .val_in(val_in_reg),
			    .rst(rst_reg),
			    .clk(clk),
			    .dout(dout_wire),
			    .val_out(val_out_wire)
			    );
endmodule
