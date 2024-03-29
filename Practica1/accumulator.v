// -------------------------------------------------------------------------------------------------------------------------
// Universitat Politècnica de València
// Escuela Técnica Superior de Ingenieros de Telecomunicación
// -------------------------------------------------------------------------------------------------------------------------
// Sistemas Digitales Programables
// Curso 2021 - 2022
// -------------------------------------------------------------------------------------------------------------------------
// Nombre del archivo: accumulator.v
//
// Descripción: Este código Verilog implementa un acumulador parametrizable en modulo y paso.
// Sus funcionalidades son:
//      - iRST_n, activo a nivel alto, sincrono.
//      - iCLK, Reloj activo por flanco de subida.
//      - iENABLE sincrono activo a nivel alto.
//      - iP, paso del acumulador.
//		- oQ, Salida del acumulador.
//
// -------------------------------------------------------------------------------------------------------------------------
//      Versión: V1.0                   | Fecha Modificación: 19/02/2022
//
//      Autor: Jose Luis Rocabado Rocha
//	    Autor: Gianmarco Sangoi Da Roza
//
// -------------------------------------------------------------------------------------------------------------------------

module accumulator (iCLK, iRESET, iENABLE, iP, oQ);
	
	parameter n = 16; //16
	input iCLK, iRESET, iENABLE;
	input [n-1:0] iP; // Input -> Counter step
	output reg [n-1:0] oQ;

	always @(posedge iCLK)
        begin
            if (iRESET)
                oQ <= {n{1'b0}};              
            else	
                if (iENABLE == 1'b1)
                    if (oQ == {n{1'b1}} - iP)
                        oQ <= {n{1'b0}};
                    else
			oQ <= oQ + iP;
        end

endmodule
