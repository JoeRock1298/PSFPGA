`timescale 1ns / 1ps

module TB_DP_MOD;
// CLOCK PERIOD
parameter PER=10; 

// Estimulos
reg clk;
reg rst;
reg val_in;
reg c_fm_am;
//reg signed [15:0] o_data;
reg signed [15:0] i_data;
// by default the variables are unsigned
reg [23:0] frec_por;
reg [15:0] im_am;
reg [15:0] im_fm;

// Monitorizacion
wire signed [15:0] o_data_wire;
reg signed [15:0] o_data_M, o_data_F;
wire val_out;

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
	DP_MOD uut 
		(
		.i_data(i_data),
		.rst(rst),
		.clk(clk),
		.val_in(val_in),
		.c_fm_am(c_fm_am), // Control modo fm/am
		.frec_por(frec_por),
		.im_am(im_am),
		.im_fm(im_fm),
		.o_data(o_data_wire),
		.val_out(val_out)
		);

// Proceso initial
// Proceso de configuración del sistema
initial begin
    data_in_file = $fopen("i_data.txt", "r");
    data_out_file = $fopen("o_data.txt", "r");
	data_conf_file = $fopen("configuration.txt", "r");
	//Configuring the model
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	c_fm_am = data_conf;
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	frec_por = data_conf;
	scan_data_conf = $fscanf(data_conf_file, "%b\n", data_conf);
	im_am = data_conf;
	scan_data_conf = $fscanf(data_conf_file, "%b", data_conf);
	im_fm = data_conf;
	//Initiating the model
	clk = 1'b1;
	val_in = 1'b0;
	sample_cnt = 0;
    error_cnt = 0;
	load_data = 0;
	rst = 1'b1;
	end_sim = 1'b1;
	#(10*PER);
	load_data = 1;
   end      
   
// Proceso de lectura de datos de entrada
always@(posedge clk)
     if (load_data)
         begin
             scan_data_in = $fscanf(data_in_file, "%b\n", i_data_wave);
             i_data <= i_data_wave;
             val_in <= #(PER/10)  1'b1;
			 rst <= #(PER/10) 1'b0;
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
						o_data_F <= #(PER/10) o_data_wave;
						o_data_M <= #(PER/10) o_data_wire;
					end
			end
			
// Contador de errores y muestras
always@(o_data_F, o_data_M)
    begin
	   if (o_data_F != o_data_M)
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

