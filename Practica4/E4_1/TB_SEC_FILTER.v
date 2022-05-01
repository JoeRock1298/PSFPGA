`timescale 1ns / 1ps

module TB_SEC_FILTER;
// CLOCK PERIOD
parameter PER = 10; 

//Configuring parameters
parameter Win = 16;
parameter Wc = 18;
parameter Num_coef = 17;

// Estimulos
reg clk;
reg rst;
reg val_in;
reg signed [Win - 1 : 0] din;

// Monitorizacion
/* salida precision completa */
//wire signed [Win+Wc-1:0] dout_wire;
//reg signed [Win+Wc-1:0] dout_M, dout_F;
/* salida truncada a 19 bits */
wire signed [Win+2:0] dout_wire;
reg signed [Win+2:0] dout_M, dout_F;
wire val_out;

// contadores y control
integer error_cnt; // contador de errores
integer sample_cnt; // contador de muestras
reg load_data;  // Inicio de lectura de datos 
reg end_sim; // Indicación de simulación on/off

// Gestion I/O texto
integer data_in_file, data_out_file; //File handlers
integer scan_data_in, scan_data_out; //fscanf error status
integer din_wave; //Variables to save read data
//Variables to save read data  
/* salida precision completa */
//reg signed [Win+Wc-1:0] dout_wave;
/* salida truncada a 19 bits */
reg signed [Win+2:0] dout_wave; 

// clock
 always #(PER/2) clk = !clk&end_sim;
 
// Instancia la uut
	SEC_FILTER #(.Win(Win), .Wc(Wc), .Num_coef(Num_coef)) uut 
		(
		.din(din),
		.clk(clk),
		.val_in(val_in),
		.rst(rst),
		.val_out(val_out),
		.dout(dout_wire)
		);

// Proceso initial
// Proceso de configuración del sistema
initial begin
    data_in_file = $fopen("s_FC_CIC_in.txt", "r");
    data_out_file = $fopen("s_FC_CIC_out1.txt", "r");
	//Initiating the model
	clk = 1'b1;
	val_in = 1'b0;
	sample_cnt = 0;
    error_cnt = 0;
	load_data = 0;
	rst = 1'b1;
	end_sim = 1'b1;
	#(10 * PER);
	load_data = 1;
	rst = #(PER/10) 1'b0;
   end      
   
// Proceso de lectura de datos de entrada
always@(posedge clk)
     if (load_data)
         begin
             scan_data_in = $fscanf(data_in_file, "%b\n", din_wave);
             din <= din_wave;
             val_in <= #(PER/10)  1'b1;
			 val_in <= #(PER+PER/10)  1'b0;
			 repeat(20) @(posedge clk);
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
						scan_data_out = $fscanf(data_out_file, "%b\n", dout_wave);
						dout_F <= #(PER/10) dout_wave;
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

