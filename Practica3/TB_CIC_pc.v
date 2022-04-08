`timescale 1ns / 1ps

module TB_CIC_pc;
// CLOCK PERIOD
parameter PER = 10; 
parameter R_val = 2000;

//Configuring parameters
parameter Win = 16;
parameter Wg = 22;
parameter N = 3; // COMB/INT #stages

// Estimulos
reg clk;
reg rst;
reg val_in;
reg signed [(Win + N - 1):0] i_data; // we use 19 bits to have compatibility with generate command

// Monitorizacion
wire signed [(Win + Wg - 1):0] o_data_wire;
reg signed [(Win + Wg - 1):0] o_data_M, o_data_F;
wire val_out;

// contadores y control
integer error_cnt; // contador de errores
integer sample_cnt; // contador de muestras
reg load_data;  // Inicio de lectura de datos 
reg end_sim; // Indicación de simulación on/off

// Gestion I/O texto
integer data_in_file, data_out_file; //File handlers
integer scan_data_in, scan_data_out; //fscanf error status
integer i_data_wave; //Variables to save read data 
reg signed [(Win + Wg - 1):0] o_data_wave; //Variables to save read data 

// clock
 always #(PER/2) clk = !clk&end_sim;
 
// Instancia la uut
	CIC_pc #(.Win(Win), .Wg(Wg), .N(N)) uut 
		(
		.i_data(i_data),
		.clk(clk),
		.rst(rst),
		.val_in(val_in),
		.val_out(val_out),
		.o_data(o_data_wire)
		);

// Proceso initial
// Proceso de configuración del sistema
initial begin
    data_in_file = $fopen("s_CIC_in.txt", "r");
    data_out_file = $fopen("s_CIC_out.txt", "r");
	//Initiating the model
	clk = 1'b1;
	val_in = 1'b0;
	sample_cnt = 0;
    error_cnt = 0;
	load_data = 0;
	rst = 1'b1;
	end_sim = 1'b1;
	#(R_val * PER);
	load_data = 1;
	rst = #(PER/10) 1'b0;
   end      
   
// Proceso de lectura de datos de entrada
always@(posedge clk)
     if (load_data)
         begin
             scan_data_in = $fscanf(data_in_file, "%d\n", i_data_wave);
             i_data <= i_data_wave;
             val_in <= #(PER/10)  1'b1;
			 val_in <= #(PER+PER/10)  1'b0;
			 repeat(R_val -1) @(posedge clk);
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

