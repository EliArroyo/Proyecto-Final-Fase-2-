//PROYECTO FASE 1
//Hecho por Rebeca Hernandez, Elizabeth Arroyo y Humberto Peña
//Contador de programa

module PC(
	input  wire [31:0]entrada,
	input                 clk,
	input wire 			  rst,
	output reg  [31:0] salida
);

always@(posedge clk)
begin
	if(rst)
		salida = 32'b0;
	
	else
		salida = entrada;
end
endmodule

