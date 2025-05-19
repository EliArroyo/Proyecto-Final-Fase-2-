

module ALU(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [2:0]  ALU_Sel,
    output reg [31:0] R,
    output reg ZFlag
);

always@(*) 
	begin
		case (ALU_Sel)
			3'b000: R = A & B;        				// AND
			3'b001: R = A | B;        				// OR
			3'b010: R = A + B;       				// SUMA
			3'b110: R = A - B;        				// RESTA
			3'b111: R = (A < B) ? 32'd1 : 32'd0; 	// Ternario A < B	
			default: R = 32'd0;       				// Por defecto, resultado en 0
		endcase
		ZFlag = (R == 32'b0) ? 1'b1 : 1'b0;			//Si la salida es 0, se activa la bandera.
	end
endmodule


