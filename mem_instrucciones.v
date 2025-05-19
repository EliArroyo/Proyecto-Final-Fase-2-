//PROYECTO FASE 1
//Hecho por Rebeca Hernandez, Elizabeth Arroyo y Humberto Peña
//Memoria de instrucciones

module memoria_instrucciones(
	input  wire[31:0] direccion,
	output reg [31:0] instruccion
);

reg [7:0]mem_instrucciones[0:999];

always@(*)
	begin
	//El dato de lectura se va a conformar de 4 bytes (4 direcciones de la memoria de instrucciones)
	instruccion = {mem_instrucciones[direccion], mem_instrucciones[direccion+1], mem_instrucciones[direccion+2], mem_instrucciones[direccion+3]};
end
endmodule
