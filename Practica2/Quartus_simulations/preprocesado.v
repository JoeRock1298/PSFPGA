// -------------------------------------------------------------------------------------------------------------------------
// Universitat Politècnica de València
// Escuela Técnica Superior de Ingenieros de Telecomunicación
// -------------------------------------------------------------------------------------------------------------------------
// Sistemas Digitales Programables
// Curso 2021 - 2022
// -------------------------------------------------------------------------------------------------------------------------
// Nombre del archivo: preprocesado.v
//
// Descripción: Este código Verilog implementa un módulo de preprocesado que permite direccionar la memoria ROM con el
//              2° MSB, generando simetría en el eje vertcial de la señal sinusoidal. 
// Sus funcionalidades son:
//      - trunc_phase, fase truncada del acumulador.
//      -ADDR_ROM, direccionaiento de la memoria ROM.
//
// -------------------------------------------------------------------------------------------------------------------------
//      Versión: V1.0                   | Fecha Modificación: 25/02/2022
//
//      Autor: Jose Luis Rocabado Rocha
//      Autor: Gianmarco Sangoi Da Roza
//
// ------------------------------------------------------------------------------------------------------------------------
module preprocesado

#(parameter L) // Truncated bits
(input [L-1:0] trunc_phase, output [L-3:0] ADDR_ROM);

assign ADDR_ROM = (trunc_phase [L-2]) ? ~(trunc_phase[L-3:0]) : trunc_phase[L-3:0];

endmodule 
 
