// Computer Architecture (CO224) - Lab 05
// Design: ALU of Simple Processor

module alu(DATA1, DATA2, RESULT, SELECT);

    //ports declaration
	input [7:0]DATA1;    // 8-bit input called DATA1
    input [7:0]DATA2;    // 8-bit input called DATA2  
    input [2:0]SELECT;   // 3-bit input called SELECT
    output reg [7:0]RESULT;     // 8-bit input called RESULT

    always @ (DATA1, DATA2, SELECT)     // This always block gets executed whenever DATA1, DATA2, SELECT changes value
    begin
        case (SELECT)
            3'b000    : RESULT = #1 DATA2;     // If SELECT=0,forward DATA2 into RESULT 
            3'b001    : RESULT = #2 DATA1 + DATA2;     // If SELECT=1, add DATA1 and DATA2 
            3'b010    : RESULT = #1 DATA1 & DATA2;     // If SELECT=2, bitwise AND on DATA1 with DATA2
            3'b011    : RESULT = #1 DATA1 | DATA2;     // If SELECT=3, bitwise OR on DATA1 with DATA2
            default   : RESULT = 8'bXXXXXXXX;       // If SELECT is anything else display 8 X s
        endcase
    end

endmodule
