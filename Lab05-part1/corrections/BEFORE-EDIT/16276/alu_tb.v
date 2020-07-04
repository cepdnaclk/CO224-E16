/****************************************
alu_tb module
Name    : Perera G K B H
ENo     : E/16/276
*****************************************/

`include "alu.v"

module alu_tb;

    //declare variables
    reg [7:0] OPERAND1, OPERAND2;
    reg [2:0] ALUOP;
    wire [7:0] ALURESULT;

    //calling the module to be tested
    alu myalu (OPERAND1, OPERAND2, ALUOP, ALURESULT);

    initial
    begin
        //monitor using gtkwave
        $dumpfile("alu_wavedata.vcd");
        $dumpvars(0, alu_tb);

        //monitor using cmd
        $monitor($time, " OPERAND: %b, OPERAND: %b, ALUOP: %b, ALURESULT: %b\n", OPERAND1, OPERAND2, ALUOP, ALURESULT);
    end

    //testing the module
    initial
    begin
        OPERAND1 = 8'b0000_0011;
        OPERAND2 = 8'b0000_1010;
        ALUOP = 3'b000;

        #10
        ALUOP = 3'b001;

        #10
        ALUOP = 3'b010;

        #10
        ALUOP = 3'b011;

        #10
        ALUOP = 3'b101;

        #10
        ALUOP = 3'b111;

        #10
        OPERAND1 = 8'b1111_0000;
        OPERAND2 = 8'b0000_1111;
        ALUOP = 3'b000;

        #10
        ALUOP = 3'b001;

        #10
        ALUOP = 3'b100;

        #10
        $finish;

    end

endmodule