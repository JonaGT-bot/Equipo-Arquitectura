
module AluB(
    input [31:0] A,
    input [31:0] B,
    input CLK,
    input [2:0] op,
    output reg [31:0] Res,
    output reg Zflag
);

always @(posedge CLK) begin
    case(op)
        3'b000: Res = A + B;      // Suma
        3'b001: Res = A & B;      // AND
        3'b010: Res = A | B;      // OR
        3'b011: Res = A - B;      // Resta
        3'b100: Res = A * B;      // Multiplicación
        3'b111: Res = (A < B) ? 32'd1 : 32'd0;  // Ternaria

        default: Res = 32'd0;
    endcase
    
    Zflag = (Res == 32'd0) ? 1'b1 : 1'b0;
end

endmodule
