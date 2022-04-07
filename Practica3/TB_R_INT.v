`timescale 1ns/1ps

module TB_R_INT();
// CONFIGURABLE PARAMETERS ///////////////////////////////////
parameter Win = 19;
parameter Rvalue = 5;
// END CONFIGURABLE PARAMETERS ///////////////////////////////

parameter PER=10; // CLOCK PERIOD

reg rst;
reg clk;
reg val_in;
reg signed [Win-1 : 0] data_in;
wire val_out;
wire signed [Win-1:0] data_out;

// contadores de ciclos
integer i = 0;

always #(PER/2) clk = !clk;

always #(PER) i = i + 1 ;

R_INT #(.Win(Win), .Rvalue(Rvalue)) UUT 
			(.data_in(data_in),
			.val_in(val_in),
			.rst(rst),
			.clk(clk),
			.data_out(data_out),
			.val_out(val_out)
			);
// We will test if the data is written each RValue periods.
// When data arrives, is otputed following Rvalue - 1 0's
initial	
	begin
		clk = 1'b1;
		val_in = 1'b0;
		rst = 1'b1;
		#(10*PER);
		rst = 1'b0;
		$display("Simulation started");
		sample_in (16'd19259);
		#((Rvalue - 1 ) * PER);
		sample_in (16'd19); //
		#((Rvalue - 1 ) * PER);
		sample_in ({Win{1'b1}});
		#((Rvalue - 1 ) * PER);
		sample_in (0);
		$display("Simulation finished");
		#(PER*2) $stop;
	end
	
task sample_in; 
	input [Win -1 : 0] data;
	begin
		val_in = #(PER/10)  1'b1;
		data_in = data;
		#PER;
		val_in = 1'b0;
	end
endtask

endmodule 