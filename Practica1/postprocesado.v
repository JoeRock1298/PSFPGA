// -------------------------------------------------------------------------------------------------------------------------
// Universitat Politècnica de València
// Escuela Técnica Superior de Ingenieros de Telecomunicación
// -------------------------------------------------------------------------------------------------------------------------
// Sistemas Digitales Programables
// Curso 2021 - 2022
// -------------------------------------------------------------------------------------------------------------------------
// Nombre del archivo: postprocesado.v
//
// Descripción: Este código Verilog implementa un módulo de postprocesado que permite generar la simetría horizontal de la 
//              señal sinusoidal (el signo) a partir del MSB.
// Sus funcionalidades son:
//      - half_Sin, mitad positiva de la señal sinusoidal.
//              -ADDR_ROM, salida (sinusoidal de fo=P*fclk/2^M).
//
// -------------------------------------------------------------------------------------------------------------------------
//      Versión: V1.0                   | Fecha Modificación: 25/02/2022
//
//      Autor: Jose Luis Rocabado Rocha
//	    Autor: Gianmarco Sangoi Da Roza
//
// ------------------------------------------------------------------------------------------------------------------------

module postprocesado
#(parameter W)
(input L_MSB, input [W-1:0] half_sin, output signed [W-1:0] sin_wave);

assign sin_wave = (L_MSB) ? (~half_sin + 1'b1) : half_sin;

endmodule 
 
