/*
    PereraALHE
    E16275
    lab5 part 1
    ALU module
*/

module alu(DATA1, DATA2, RESULT, SELECT);

    //instantiate 8bit inputs as DATA1, DATA2 then 3 bit SELECT finally 8bit RESULT
    input [7:0] DATA1, DATA2;
    input [2:0] SELECT;
    output [7:0] RESULT;
    reg [7:0] RESULT;

    always @ (DATA1 or DATA2 or SELECT)
    begin
        case(SELECT)
            3'b000 :
            begin
                #1 
                RESULT = DATA2;
            end

            3'b001 :
            begin
                #2 
                RESULT = DATA1 + DATA2;
            end

            3'b010 :
            begin
                #1
                RESULT = DATA1 & DATA2;
            end 

            3'b011 :
            begin
                #1
                RESULT = DATA1 | DATA2;
            end

        endcase 
    end

endmodule

