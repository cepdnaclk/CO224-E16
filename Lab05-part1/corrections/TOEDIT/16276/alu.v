/****************************************
ALU module
Name    : Perera G K B H
ENo     : E/16/276
*****************************************/

module alu( DATA1, DATA2,  RESULT, SELECT);

    //port declaration
    input [7:0] DATA1, DATA2;
    input [2:0] SELECT;
    output reg [7:0] RESULT;

    always @ (DATA1, DATA2, SELECT) begin
        case (SELECT)
        //alu function forward
        3'b000 : #1 RESULT = DATA2;
        //alu function add
        3'b001 : #2 RESULT = DATA1 + DATA2;
        //alu function and
        3'b010 : #1 RESULT = DATA1 & DATA2;
        //alu function or
        3'b011 : #1 RESULT = DATA1 | DATA2;
        //for functions to be implemented in the future
        default :   begin
                        $display($time, " aluop %b is reserved for future use.ALU output is set to xxxxxxxx.", SELECT);
                        RESULT = 8'bxxxx_xxxx;
                    end
        endcase
    end

endmodule