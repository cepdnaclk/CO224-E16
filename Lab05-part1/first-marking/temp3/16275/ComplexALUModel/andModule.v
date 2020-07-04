/*
    PereraALHE
    E16275
    lab5 part 1
    AND module
*/

module andModule(op1, op2, ans);
    //inputs will be 8bit op1 and op2 then ans will be the output 8bit wire
    input [7:0] op1, op2;
    output [7:0] ans;

    singleBitAND and0(op1[0], op2[0], ans[0]);
    singleBitAND and1(op1[1], op2[1], ans[1]);
    singleBitAND and2(op1[2], op2[2], ans[2]);
    singleBitAND and3(op1[3], op2[3], ans[3]);
    singleBitAND and4(op1[4], op2[4], ans[4]);
    singleBitAND and5(op1[5], op2[5], ans[5]);
    singleBitAND and6(op1[6], op2[6], ans[6]);
    singleBitAND and7(op1[7], op2[7], ans[7]);

endmodule

//-------------------------------------------------------------------------------
//Single Bit and Module
module singleBitAND(bit1, bit2, ans);
    input bit1, bit2;
    output reg ans;

    always @ (bit1, bit2)
    begin
        //And eeach two input bits and fetch to ans
        ans = bit1 & bit2;
    end
endmodule

