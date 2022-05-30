`timescale 1ns / 1ps

module TB_DP_COMPLETMOD;
// CLOCK PERIOD
parameter PER = 10; 

// Estimulos
reg clk;
reg rst;
reg val_in;
reg signed [16 - 1 : 0] i_data;
reg c_fm_am; // Control modo fm/am
reg [2 - 1 : 0] c_source; // Selecccion fuente  de señal moduladora
reg c_comp_dac; // Control multiplexor de compensación DAC
reg [24 - 1 : 0] frec_mod;
reg [24 - 1 : 0] frec_por;
reg [16 - 1 : 0] im_am;
reg [16 - 1 : 0] im_fm;

// Monitorizacion
/* salida truncada a 14 bits */
wire signed [14 - 1 :0] dout_wire;
wire val_out;

reg signed [14 - 1 :0] dout_M, dout_F;


// contadores y control
integer error_cnt; // contador de errores
integer sample_cnt; // contador de muestras
reg load_data;  // Inicio de lectura de datos 
reg end_sim; // Indicación de simulación on/off

// Gestion I/O texto
integer data_in_file, data_out_file, data_conf_file; //File handlers
integer scan_data_in, scan_data_out, scan_data_conf; //fscanf error status
integer i_data_wave, o_data_wave, data_conf; //Variables to save read data 

// clock
 always #(PER/2) clk = !clk&end_sim;
 
// Instancia la uut
	DP_COMPLETMOD uut 
		(
		.i_data(i_data),
		.rst(rst),
		.clk(clk),
		.val_in(val_in),
		.c_fm_am(c_fm_am),
		.c_source(c_source),
		.c_comp_dac( ),
		.frec_mod(frec_mod),
		.frec_por(frec_por),
		.im_am(im_am),
		.im_fm(im_fm),
		.o_data(dout_wire),
		.val_out(val_out)
		);

// Proceso initial
// Proceso de configuración del sistema
initial begin
	data_conf_file = $fopen("configuration.txt", "r");
    data_in_file = $fopen("input_signal.txt", "r");
    data_out_file = $fopen("output_signal.txt", "r");
	//Initiating the model
	clk = 1'b1;
	val_in = 1'b0;
	sample_cnt = 0;
    error_cnt = 0;
	load_data = 0;
	rst = 1'b1;
	end_sim = 1'b1;
	// Configuring the model
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	c_fm_am = data_conf;
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	c_source = data_conf;
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	frec_mod = data_conf;
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	frec_por = data_conf;
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	im_am = data_conf;
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	im_fm = data_conf;
	// Starting simulation
	#(10 * PER);
	load_data = 1;
	rst = #(PER/10) 1'b0;
   end      
   
// Proceso de lectura de datos de entrada
always@(posedge clk)
     if (load_data)
         begin
             scan_data_in = $fscanf(data_in_file, "%b\n", i_data_wave);
             i_data <= i_data_wave;
             val_in <= #(PER/10)  1'b1;
			 val_in <= #(PER+PER/10)  1'b0;
			 #((2000) * PER) // Generating the sampling  
             if ($feof(data_in_file))
				begin
					val_in <= #(PER+PER/10)  1'b0;
					load_data <= #(PER/10) 1'b0;
					end_sim = #(5*PER) 1'b0;
					#(4*PER) $stop;
				end
         end
		 
// Proceso de lectura de salida 
always@(posedge clk)
       if (val_out)
			begin
				sample_cnt = sample_cnt +1;
				if (!$feof(data_out_file))
					begin
						scan_data_out = $fscanf(data_out_file, "%b\n", o_data_wave);
						dout_F <= #(PER/10) o_data_wave;
						dout_M <= #(PER/10) dout_wire;
					end
			end
			
// Contador de errores y muestras
always@(dout_F, dout_M)
    begin
	   if (dout_F != dout_M)
			begin
				error_cnt = error_cnt + 1;
				$display("Error in sample number ","%d", sample_cnt);
			end   
	end	
	
// Fin de simulación
always@(end_sim)
	if (!end_sim)
		begin
			$display("Number of checked samples ","%d", sample_cnt);	
			$display("Number of errors ","%d", error_cnt);
		end

endmodule

