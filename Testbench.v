module ALU_TB();
    reg [31:0] ATB, BTB;
    reg CLKTB;
    reg [2:0] SELTB;
    wire [31:0] RTB_NB, RTB_B;
    wire ZFLAGTB_NB, ZFLAGTB_B;


    // Instanciamos la ALU con bloqueo (ALUB)
    AluB alu_b ( .A(ATB), .B(BTB), .op(SELTB), .Res(RTB_B), .CLK(CLKTB), .Zflag(ZFLAGTB_B));

    // Instanciamos la ALU sin bloqueo (ALUNB)
    AluNB alu_nb ( .A(ATB), .B(BTB), .op(SELTB), .Res(RTB_NB), .CLK(CLKTB), .Zflag(ZFLAGTB_NB));

  
    always #50 CLKTB = ~CLKTB;

    initial begin
        CLKTB = 0; // Inicializa el reloj
        ATB = 32'd300;
        BTB = 32'd100;

        SELTB = 3'b000; #100;  // Suma
        SELTB = 3'b001; #100;  // AND
        SELTB = 3'b010; #100;  // OR
        SELTB = 3'b011; #100;  // Resta
        SELTB = 3'b100; #100;  // Multiplicacion
        SELTB = 3'b101; #100;  //Ternaria
        

        $stop;
    end
endmodule
