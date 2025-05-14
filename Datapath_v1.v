//PROYECTO FASE 1
//Hecho por Rodrigo Esaú Villegas Nuño y José Luis Chávez Gómez
//DataPath versión 1 (instrucciones tipo R)
`timescale 1ns/1ns

module Datapath_v1(
	input clk1,
	input clk2,
	input reset
);

//Definimos registros para las conexiones.
wire [31:0] r1;				//Dato escritura BR y salida multiplexor
wire [5:0]  out_control;	//Salida de la unidad de control, se separa en varios bits.
wire [31:0] r2;				//Salida de Read Data 1 y entrada de OP1 de la ALU
wire [31:0] r3;				//Salida de Read Data 2, entrada de OP2 de la ALU y dato escritura de memoria.
wire [2:0]  r4;				//Salida de ALU control y entrada de ALUop
wire [31:0] r5;			    //Direccion de memoria de datos, entrada 2 de mux y salida de ALU
wire [31:0] r6;				//Dato entrada 1 demux y dato de lectura.
wire [31:0] r7;				//Salida de add_four_module y entrada del PC.
wire [31:0] r8;				//Salida de PC, entrada del add_four_module y entrada de memoria de instrucciones.
wire [31:0] instruccion;	//Salida de memoria de instrucciones y hacia BR, control...

//Definición de todas las instancias que se van a utilizar.
add_four_module			instancia_add_four(.A(r8), .R(r7));
PC						instancia_PC(.entrada(r7), .clk(clk1), .rst(reset), .salida(r8));
memoria_instrucciones	instancia_mem_inst(.direccion(r8), .instruccion(instruccion));
Banco_Registros 	    instancia_BR(.direccion_lect_1(instruccion[25:21]), .direccion_lect_2(instruccion[20:16]), .direccion_escritura(instruccion[15:11]), .RegEn(out_control[5]), .datoEscritura(r1), .datoLect_1(r2), .datoLect_2(r3), .clk(clk2));
memoria_datos		    instancia_mem_datos(.direccion(r5), .MemWrite(out_control[1]), .datoEscritura(r3), .datoLectura(r6));
ALU      				instancia_ALU(.A(r2), .B(r3), .ALU_Sel(r4), .R(r5), .ZFlag());
multiplexor    			instancia_mux(.entrada1_mux(r6), .entrada2_mux(r5), .mux_sel(out_control[0]), .salida_mux(r1));
Unidad_control			instancia_control(.OPcode(instruccion[31:26]), .salida_control(out_control));
ALU_control				instancia_ALU_control(.Function(instruccion[5:0]), .ALUOp_in(out_control[4:2]), .OpALU_out(r4));

endmodule

module DataPath_TB();

reg clk1;
reg clk2;
reg reset;

Datapath_v1 Datapath_TB_v1(.clk1(clk1), .clk2(clk2), .reset(reset));

//Banco de pruebas.
//Se cargan 2 archivos:
//El primer archivo con los datos en el banco de registros.
//El segundo archivo con los bits necesarios para la memoria de instrucciones

always #25 clk1=~clk2;
always #25 clk2=~clk2;
initial
	begin
		clk1=0;
		clk2=0;
		reset=1;
		#50;
		reset=0;
		$readmemb("datos.txt", Datapath_TB_v1.instancia_BR.BR_in);
		$readmemb("prueba_binario.txt", Datapath_TB_v1.instancia_mem_inst.mem_instrucciones);
		#1500;
		$stop;
	end
endmodule
