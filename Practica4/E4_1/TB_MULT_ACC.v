`timescale 1ns/1ps

module TB_MULT_ACC();
// CONFIGURABLE PARAMETERS ///////////////////////////////////
parameter Win = 16;
parameter Wc = 18;
// END CONFIGURABLE PARAMETERS ///////////////////////////////

parameter PER=10; // CLOCK PERIOD

// Variables de entrada
reg signed [Win-1:0] din;
reg signed [Wc-1:0] coef;
reg clk, rst, ce;

// Variables de salida
wire signed [Wc+Win-1:0] dout;

// contadores de ciclos
integer i = 0;

always #(PER/2) clk = !clk;

always #(PER) i = i + 1 ;

MULT_ACC /*#(.Wc(Wc), .Win(Win))*/ UUT 
			(.din(din),
			.coef(coef),
			.clk(clk),
			.rst(rst),
			.ce(ce),
			.dout(dout));

initial	
	begin
		clk = 1'b1;
		rst = 1'b0;
		ce = 1'b0;
		#(2*PER);
		$display("Simulation started");
		test1();
		#PER;
		test2();
		#PER;
		test3();
		#PER;
		test4();
		$display("Simulation finished");
		#(PER*2) $stop;
	end

task test1 ();
	// values in whith active reset and enable
	begin
		@(posedge clk)
		rst = 1'b1;
		ce = 1'b1;
		#(2*PER);
		#(PER/10); 
		din = -1;
		coef = -2;
		#(PER);
		din = 1;
		coef = -5;
		#(PER);
		din = 10;
		coef = 4;
		#(PER);
		din = 9;
		coef = 3;
		#(PER);
	end
endtask

task test2 ();
	// values in whith active reset but MAC disabled
	begin
		@(posedge clk)
		rst = 1'b1;
		ce = 1'b0;
		#(2*PER);
		#(PER/10); 
		din = -1;
		coef = -2;
		#(PER)
		din = 1;
		coef = -1;
		#(PER);
		din = -1;
		coef = 5;
		#(PER);
		din = 1;
		coef = 5;
		#(PER);
	end
endtask

task test3 ();
	// values in whith MAC enable and reset low
	// We can seee some glitches since the operation is purily combinational.
	begin
		@(posedge clk)
		rst = 1'b0;
		ce = 1'b1;
		#(2*PER);
		#(PER/10); 
		din = -1;
		coef = -2;
		#(PER);
		din = 1;
		coef = -2;
		#(PER);
		din = -1;
		coef = 2;
		#(PER);
		din = 1;
		coef = 1;
		#(PER);
	end
endtask

task test4 ();
	// values in whith low reset and enable
	begin
		@(posedge clk)
		rst = 1'b0;
		ce = 1'b0;
		#(2*PER);
		#(PER/10); 
		din = -1;
		coef = -1;
		#(PER);
		din = 1;
		coef = -2;
		#(PER);
		din = -1;
		coef = 2;
		#(PER);
		din = 1;
		coef = 2;
	end
endtask

endmodule 