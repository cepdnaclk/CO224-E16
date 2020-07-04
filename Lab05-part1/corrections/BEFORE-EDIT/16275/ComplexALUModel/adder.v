/*
    PereraALHE
    E16275
    lab5 part 1
    Adder module
*/

module adder(op1, op2, ans);
    //inputs will be 8bit op1 and op2 then ans will be the output 8bit wire
    input  [7:0] op1, op2;
    output [7:0] ans;
    wire  [7:0] c;

    //add each single pair of binary with carry and pass the carry forward bits
    singleBitAdder sb0(op1[0], op2[0], 1'b0, c[0], ans[0]);
    singleBitAdder sb1(op1[1], op2[1], c[0], c[1], ans[1]);
    singleBitAdder sb2(op1[2], op2[2], c[1], c[2], ans[2]);
    singleBitAdder sb3(op1[3], op2[3], c[2], c[3], ans[3]);
    singleBitAdder sb4(op1[4], op2[4], c[3], c[4], ans[4]);
    singleBitAdder sb5(op1[5], op2[5], c[4], c[5], ans[5]);
    singleBitAdder sb6(op1[6], op2[6], c[5], c[6], ans[6]);
    singleBitAdder sb7(op1[7], op2[7], c[6], c[7], ans[7]);
    //also overflow bit can be used for future

endmodule

//-------------------------------------------------------------------------------
//singleBitAdder module

module singleBitAdder(bit1, bit2, c_in, c_out, ans);
    input bit1, bit2, c_in;
    output c_out, ans;
    reg c_out, ans;

    always @ (bit1, bit2, c_in)
    begin

        // considered the addition operation  for 3 bits once
        //carry and ans got using two logical operation sets 
        c_out = (bit1 & bit2) | (bit1 & c_in) | (bit2 & c_in);
        ans = bit1 ^ bit2 ^ c_in;
    end
endmodule