module AluNB(
    input [31:0] A,
    input [31:0] B,
    input CLK,
    input [2:0] op,
    output reg [31:0] Res,
    output reg Zflag
);

initial begin
    Res <= 32'd0;
    Zflag <= 1'b0;
end

always @(posedge CLK or op) begin
    case (op)
        3'b000: Res <= A + B;    
        3'b001: Res <= A & B;    
        3'b010: Res <= A | B;    
        3'b011: Res <= A - B;    
        3'b100: Res <= A * B;    
        3'b101: Res <= (A < B) ? 32'd1 : 32'd0;  
        default: Res <= 32'd0;   
    endcase
    
    if (Res == 32'd0) 
        Zflag <= 1'b1;
    else 
        Zflag <= 1'b0;
end

endmodule