`timescale 1ns/1ps

module TB_MAIN_CONTROL();

	parameter PER=10; // CLOCK PERIOD

	// Variables de entrada
	reg rst;
	reg clk;
	reg rxrdy;
	reg done_wr;
	reg done_rd;
	reg [7:0] rxdw;

	// Variables de salida
	wire start_wr, start_rd;
	wire [2:0] sleds;

	// contadores de ciclos
	integer i = 0;

	always #(PER/2) clk = !clk;

	always #(PER) i = i + 1 ;

	MAIN_CONTROL UUT 
				(.rxrdy(rxrdy),
				.clk(clk),
				.rst(rst),
				.done_wr(done_wr),
				.done_rd(done_rd),
				.rxdw(rxdw),
				.start_wr(start_wr),
				.start_rd(start_rd),
				.sleds(sleds));
	// Simulando un ciclo de control entero
	initial	
		begin
			clk = 1'b1;
			rst = 1'b1;
			rxrdy = 1'b0;
			done_rd = 1'b0;
			done_wr = 1'b0;
			rxdw = 0;
			#(10*PER);
			rst <= 1'b0;
			$display("Simulation started");
			rd_wr_command(1); // sending a read command
			#(3*PER);
			rd_wr_command(1); // sending a command to see that we don't change the state
			#(9*PER); // By now, the config data should have been written
			done_rd <= 1;
			#(PER);
			done_rd <= 0;
			#(PER);
			rd_wr_command(0); // sending a write command
			#(3*PER);
			rd_wr_command(0); // sending a command to see that we don't change the state
			#(9*PER); // By now, the config data should have been written
			done_wr <= 1;
			#(PER);
			done_wr <= 0;
			$display("Simulation finished");
			#(PER*10) $stop;
		end
	task rd_wr_command (input wr_rd);
	begin
		if(wr_rd) // read = 1;
			@(posedge clk)
			begin
				rxdw <= 8'hF0;
				rxrdy <= #(PER+PER/10) 1;
				rxrdy <= #(2*PER+PER/10) 0;
				rxdw <= #(2*PER+PER/10) 8'h00;
			end
		else if (!wr_rd)
			@(posedge clk)
			begin
				rxdw <= 8'h0F;
				rxrdy <= #(PER+PER/10) 1;
				rxrdy <= #(2*PER+PER/10) 0;
				rxdw <= #(2*PER+PER/10) 8'h00;
			end
	end
	endtask

endmodule 