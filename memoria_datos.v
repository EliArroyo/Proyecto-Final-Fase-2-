//PROYECTO FASE 1	
//Hecho por Rodrigo Esaú Villegas Nuño y Jose Luis Chávez Gómez
//Memoria de datos

module memoria_datos(
	input  wire[31:0]direccion,
	input  wire MemWrite,
	input  wire[31:0] datoEscritura,
	output reg [31:0] datoLectura
);

reg [31:0]mem_datos[0:31];

always@(*)
	begin
	//Escritura
	if(MemWrite) 
	begin
		mem_datos[direccion] = datoEscritura;
	end
	
	//Lectura
	if(!(MemWrite))
	begin
		datoLectura = mem_datos[direccion];
	end
end
endmodule

