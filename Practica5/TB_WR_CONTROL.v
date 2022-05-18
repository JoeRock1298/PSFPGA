`timescale 1ns/1ps

module TB_WR_CONTROL();

	parameter PER=10; // CLOCK PERIOD

	// Variables de entrada
	reg rst;
	reg clk;
	reg rxrdy;
	reg start_wr;

	// Variables de salida
	wire shift_rxregs, done_wr, load_confregs;
	wire [2:0] wr_leds;

	// contadores de ciclos
	integer i = 0;
	// Contador de palabras recibidas
	integer n_bytes = 0;

	always #(PER/2) clk = !clk;

	always #(PER) i = i + 1 ;

	WR_CONTROL UUT 
				(.rxrdy(rxrdy),
				.clk(clk),
				.rst(rst),
				.start_wr(start_wr),
				.done_wr(done_wr),
				.shift_rxregs(shift_rxregs),
				.load_confregs(load_confregs),
				.wr_leds(wr_leds));
	// Simulando un ciclo de control entero
	initial	
		begin
			clk = 1'b1;
			rst = 1'b1;
			rxrdy = 1'b0;
			start_wr = 1'b0;
			#(10*PER);
			rst = 1'b0;
			$display("Simulation started");
			wr_test();
			$display("Simulation finished");
			#(PER*10) $stop;
		end
	task wr_test (); 
	begin
		// A write control is received
		@(posedge clk)
		begin
			#(PER/10) start_wr <= 1'b1;
			for (n_bytes = 0; n_bytes <= 11; n_bytes = n_bytes + 1) 
			begin
				#(PER*10);
				rxrdy <= #(PER/10) 1'b1;
				rxrdy <= #(PER) 1'b0;
				if (done_wr == 1'b1) 
				begin
					start_wr <= 1'b0;
				end
			end
		end
	end
	endtask

endmodule 