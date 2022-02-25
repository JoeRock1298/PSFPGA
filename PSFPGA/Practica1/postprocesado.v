module postprocesado
#(parameter W)
(input L_MSB, input [W-1:0] half_sin, output signed [W-1:0] sin_wave);

assign sin_wave = (L_MSB) ? (~half_sin + 1'b0) : half_sin;

endmodule 
 