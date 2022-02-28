module preprocesado

#(parameter L)
(input [L-1:0] trunc_phase, output [L-3:0] ADDR_ROM);

assign ADDR_ROM = (trunc_phase [L-2]) ? ~(trunc_phase[L-3:0]) : trunc_phase[L-3:0];

endmodule 
 