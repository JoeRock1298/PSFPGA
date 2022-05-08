`timescale 1ns/1ps

module TB_ROM();
// CONFIGURABLE PARAMETERS ///////////////////////////////////
parameter Num_coef = 17;
parameter Wc = 18;
// END CONFIGURABLE PARAMETERS ///////////////////////////////

parameter PER=10; // CLOCK PERIOD

// Variables de entrada
reg [log2(Num_coef)-1:0] addr;
reg clk, val_out;

// Variables de salida
wire signed [Wc-1:0] dout_wire;
reg signed [Wc-1:0] dout_M, dout_F;

// contadores y control
integer error_cnt; // contador de errores
integer sample_cnt; // contador de muestras
reg load_data;  // Inicio de lectura de datos 
reg end_sim; // Indicación de simulación on/off

// Gestion I/O texto
integer parameters_file; //File handlers
integer scan_parameters; //fscanf error status
integer parameters_wave; //Variables to save read data 

// contadores de ciclos
integer i = 0;

// Address
integer selector = 0;

always #(PER/2) clk = !clk&end_sim;

always #(PER) i = i + 1 ;

ROM /*#(.Wc(Wc), .Num_coef(Num_coef))*/ UUT 
			(.addr(addr),
			.clk(clk),
			.data(dout_wire));

initial	
	begin
		parameters_file = $fopen("C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1/coef.txt", "r");
		clk = 1'b1;
		sample_cnt = 0;
    	error_cnt = 0;
		selector = 0;
		addr = 0;
		load_data = 0;
		val_out = 1'b0;
		end_sim = 1'b1;
		#(2*PER);
		$display("Simulation started");
		load_data = 1;
	end

// Proceso de lectura de datos de entrada
always@(posedge clk)
     if (load_data)
         begin
			 addr <= #(PER/2)selector;
			 selector <= selector + 1;
			 val_out <= #(1*PER) 1'b1;
         end

// Proceso de lectura de salida 
always@(posedge clk)
       if (val_out)
			begin
				sample_cnt = sample_cnt +1;
				scan_parameters = $fscanf(parameters_file, "%b\n", parameters_wave);
				dout_F <= #(PER/10) parameters_wave;
				dout_M <= #(PER/10) dout_wire;
				if ($feof(parameters_file))
				begin
					load_data <= #(PER/10) 1'b0;
					end_sim = #(5*PER) 1'b0;
					#(4*PER) $stop;
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