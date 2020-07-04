/*
Author : THUSHARA K.A.R.
E no   : E/16/369

compilation and simulation ...

iverilog -o out.vvp ALU_testbench.v
vvp out.vvp
gtkwave wavedata.vcd

*/

`include "alu.v" // import the alu module
module ALU_testbench;

    // Inputs
    reg [2:0] Opcode;
    reg [7:0] Operand1;
    reg [7:0] Operand2;

    // Outputs
    wire [7:0] Result;

    // Temporary variable for count
    reg [3:0] count = 4'd0;

    // Instantiate the Unit called myALU
    alu myALU (
        .DATA1(Operand1), 
        .DATA2(Operand2), 
        .RESULT(Result),
        .SELECT(Opcode)
    );

    initial begin
        // print the variables in command line
        $monitor($time, "  input1: %b , input2, %b, sel: %b --> result: %b",
                Operand1, Operand2, Opcode, Result);
        // generate files needed to plot the waveform in gtkwave
        $dumpfile("wavedata.vcd");
        $dumpvars(0, ALU_testbench);
    end

    initial begin

        // Initialize Inputs
        Opcode   = 3'b0;
        Operand1 = 8'b0;
        Operand2 = 8'b0;

        // Wait 20 ns for global reset to finish
        #20;    

        // check with the following operands 
        Operand1 = 8'h55;
        Operand2 = 8'h22;  

        for (count = 0; count < 8; count = count + 4'b1) 
            begin // go throught each opcode
                Opcode = count;
                #20;
            end

        // Wait 20 ns 
        #20;

        // repeat with another inputs to operands
        Operand1 = 8'hAA;
        Operand2 = 8'h32;  

        for (count = 0; count < 8; count = count + 4'b1) 
            begin
                Opcode = count;
                #20;
            end
    end     

endmodule

