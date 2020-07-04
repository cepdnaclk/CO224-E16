/*
    Name            : De Silva K.R
    Index Number    : E/16/068
    Lab             : Lab 05 - part 1
*/

// Please note that testbench is also included at the end of the file 

// 8 bit ALU module
module ALU (DATA1, DATA2, SELECT, Cin, RESULT, Cout);
    // ports declaration
    input [7:0] DATA1, DATA2;       // 8 bit input for operand 1 and operand 2
    input [2:0] SELECT;             // 3 bit input for SELECT
    
    // carry-in (Cin) and carry-out (Cout) bits are added for the sake of completeness of the ALU
    input Cin;                      
    output reg Cout;
    
    output reg [7:0] RESULT;        // 8 bit output

    always @ (DATA1 or DATA2 or SELECT) // sensitivity list
    begin
        // case statement is used to deal with SELECT input
        case (SELECT)
            // FORWARD functional unit which is used by loadi and mov instructions
            3'b000: begin RESULT = #1 DATA2; end
            
            // ADD functional unit which is used by add ans subtract instructions
            3'b001: begin {Cout,RESULT} = #2 DATA1 + DATA2 + {7'b0000000,Cin}; end
            
            // OR functional unit which supports "Or" logical operation
            3'b010: begin RESULT = #1 DATA1 | DATA2; end

            // AND functional unit which supports "and" logical operation
            3'b011: begin RESULT = #1 DATA1 & DATA2; end
            
            // default case
            // if the SELECT signal doesn't match with any of the above, unknown logical value x is outputted
            default RESULT = 8'bx;
        endcase
    end
endmodule


