//PROYECTO FASE 1
//Hecho por Rebeca Hernandez, Elizabeth Arroyo y Humberto Peña
//Unidad de operaciones

module add_four_module(
    input wire [31:0] A,
    output reg [31:0] R
);

always@(*) 
	begin
		R = A + 4;     //Aumenta a PC 4 unidades
	end
endmodule

