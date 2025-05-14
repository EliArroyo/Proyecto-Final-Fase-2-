//PROYECTO FASE 1.
//Hecho por Rodrigo Esaú Villegas Nuño y José Luis Chávez Gómez
//Unidad de control

module Unidad_control(
    input wire [5:0]  OPcode,
    output reg [5:0]  salida_control
);

//Salida control bits (modificaciones a futuro)
//5      RegWrite -> BR
//4 3 2  ALUcontrol
//1		 MemToWrite -> MemDatos
//0		 MemToReg	-> Multiplexor

always@(*) 
	begin
		case (OPcode)
			6'b000000:  salida_control = 6'b1_010_0_0;		// Opcode de instrucciones tipo R
			//Otras opciones a modificarse.
			default: salida_control = 6'd0;       			// Por defecto, salida en 0
		endcase
	end
endmodule



