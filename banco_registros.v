//PROYECTO FASE 1
//Hecho por Rodrigo Esaú Villegas Nuño y Jose Luis Chávez Gómez
//Banco de registros

module Banco_Registros(
	input  wire[4:0]direccion_lect_1,
	input  wire[4:0]direccion_lect_2,
	input  wire[4:0]direccion_escritura,
	input  wire RegEn,
	input  wire[31:0] datoEscritura,
	output reg [31:0] datoLect_1,
	output reg [31:0] datoLect_2,
	input wire clk
);

reg [31:0]BR_in[0:31];

always@(posedge clk)
	begin
	//Procedimiento de lectura de datos
	datoLect_1 = BR_in[direccion_lect_1];
	datoLect_2 = BR_in[direccion_lect_2];
	
	//Cuando se active el enable del registro, el dato de escritura se tomará desde la dirección correspondiente.
	if(RegEn)
	begin
		BR_in[direccion_escritura] = datoEscritura;
	end
	
end
endmodule

