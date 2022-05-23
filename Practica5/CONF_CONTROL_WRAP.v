module CONF_CONTROL_WRAP
	(
	input rxsd,
	input rst,
	input clk,
	output reg txsd,
	output reg [8:0] sleds,
	output reg [7:0] r_control,
	output reg [23:0] r_frec_mod,
	output reg [23:0] r_frec_por,
	output reg [15:0] r_im_am,
	output reg[15:0] r_im_fm,
	output reg [7:0] view_rxdw
);

    reg rxsd_reg;
    reg rst_reg; 
    wire txsd_wire;
    wire [8:0] sleds_wire;
    wire [7:0] r_control_wire;
    wire [23:0] r_frec_mod_wire;
    wire [23:0] r_frec_por_wire;
    wire [15:0] r_im_am_wire;
    wire [15:0] r_im_fm_wire;
    wire [7:0] view_rxdw_wire;


    always@(posedge clk) 	
	begin
		rxsd_reg <= rxsd;
		rst_reg <= rst;
      txsd <= txsd_wire;
     	sleds <= sleds_wire;   
		r_control <= r_control_wire;
		r_frec_mod <= r_frec_mod_wire;
		r_frec_por <= r_frec_por_wire;
		r_im_am <= r_im_am_wire;
		r_im_fm <= r_im_fm_wire;
		view_rxdw <= view_rxdw_wire;
	end

    CONF_CONTROL CONF_CONTROL1 (.rxsd(rxsd_reg),
			                    .rst(rst_reg),
			                    .txsd(txsd_wire),
			                    .sleds(sleds_wire),
			                    .r_control(r_control_wire),
			                    .r_frec_mod(r_frec_mod_wire),
                             .r_frec_por(r_frec_por_wire),
                             .r_im_am(r_im_am_wire),
                             .r_im_fm(r_im_fm_wire),
                             .view_rxdw(view_rxdw_wire)
			                    );
endmodule
