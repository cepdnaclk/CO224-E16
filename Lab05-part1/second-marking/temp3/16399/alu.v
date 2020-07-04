// module testbench;

//     reg [7:0] OPERAND1,OPERAND2;
//     reg [2:0] ALUOP;
//     wire [7:0] ALURESULT;

//     alu test(OPERAND1,OPERAND2,ALURESULT,ALUOP);

//     initial
//     begin
//         $dumpfile("alu.vcd");
// 		$dumpvars(0, testbench);

//     end

//     initial
//     begin

//         //give 3 and 5 as operands
//         OPERAND1 = 8'b011;
//         OPERAND2 = 8'b101;

//         //make ALUOP 0
//         ALUOP = 3'b0;

//         #2
//         //make ALUOP as 1
//         ALUOP = 3'b1;

//         #3
//         //make ALUOP as 2
//         ALUOP = 3'b10;
        
//         #2
//         //make ALUOP as 3
//         ALUOP = 3'b11;
        
//         #2
//         //make ALUOP as 4 for checking undefined one
//         ALUOP =3'b100;

//         #1
//         $finish;
        


//     end



// endmodule



module alu(DATA1, DATA2, RESULT, SELECT);

    //declare ports
    input [7:0] DATA1, DATA2;
    input [2:0] SELECT;
    output reg [7:0] RESULT;


    always @ (DATA1, DATA2, RESULT, SELECT)
    begin

        case (SELECT)

            //Forward data2 into result
            3'b000: #1 RESULT = DATA2;

            //Store addition in result
            3'b001: #2 RESULT = DATA1 + DATA2;

            //Store bit wise and in result
            3'b010: #1 RESULT = DATA1 & DATA2;

            //store bit wise or in result
            3'b011: #1 RESULT = DATA1 | DATA2;

            //give output 0 for reserved select inputs
            default begin
                RESULT = 8'b0;
            end 
        endcase
        
    end
   
endmodule