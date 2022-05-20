`timescale 1ns/1ps

module TB_RD_CONTROL();

	parameter PER=10; // CLOCK PERIOD

	// Variables de entrada
	reg rst;
	reg clk;
	reg txbusy;
	reg start_rd;

	// Variables de salida
	wire txena, done_rd, load_txregs, shift_txregs;
	wire [2:0] rd_leds;

	// contadores de ciclos
	integer i = 0;
	// Contador de palabras recibidas
	integer n_bytes = 0;

	always #(PER/2) clk = !clk;

	always #(PER) i = i + 1 ;

	RD_CONTROL UUT 
				(.txbusy(txbusy),
				.clk(clk),
				.rst(rst),
				.start_rd(start_rd),
				.done_rd(done_rd),
				.shift_txregs(shift_txregs),
				.load_txregs(load_txregs),
				.txena(txena),
				.rd_leds(rd_leds));
	// Simulando un ciclo de control entero
	initial	
		begin
			clk = 1'b1;
			rst = 1'b1;
			txbusy = 1'b0;
			start_rd = 1'b0;
			#(10*PER);
			rst = 1'b0;
			$display("Simulation started");
			rd_test();
			$display("Simulation finished");
			#(PER*10) $stop;
		end
	task rd_test (); 
	begin
		// A write control is received
		@(posedge clk)
		begin
			// Start received
			start_rd <= #(PER/10) 1'b1;
			start_rd <= #(PER + PER/10) 1'b0;
			#(PER);
			//writing loop
			for (n_bytes = 0; n_bytes <= 11; n_bytes = n_bytes + 1) 
			begin
				txena <= #(PER/10) 1'b1;
				txena <= #(PER + PER/10) 1'b0;
				txbusy <= 1'b1;
				#(PER*10);
				txbusy <= 1'b0;
			end
		end
	end
	endtask

endmodule 