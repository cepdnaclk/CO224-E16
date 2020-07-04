module testbench;
 
 reg [7:0] OPEREND1, OPEREND2;// two 8-bit registers
 reg [2:0] ALUOP;// 3-bit register 
 
 wire [7:0] ALURESULT;//result of the ALU 
 
 integer i; //assign a value for i, to call the SELECT function 
 
 alu test_alu(OPEREND1, OPEREND2, ALUOP, ALURESULT);
 
 initial begin
 //display the function of ALU
 $monitor($time," OPEREND1: %b, OPEREND2 : %b, ALUOP : %b, ALURESULT : %b",OPEREND1, OPEREND2, ALUOP, ALURESULT);
 
 end
 
 initial
  begin
   
   //initialize two binary values for DATA1 and DATA2
   OPEREND1 =  8'b10110011;
   OPEREND2 =  8'b11010110;
   
   // opcode of ALU starts with 000
   ALUOP = 3'b000;
   #10
   
   //for loop is used to change the ALU opcode at the given 10nS time 
    for (i=0;i<3;i=i+1)
      begin
       ALUOP = ALUOP + 3'b001;
       #10;
      end;
   
  end

endmodule

module alu(DATA1, DATA2, SELECT, RESULT);
 
 input [7:0] DATA1, DATA2; //ALU 8-bit inputs
 input [2:0] SELECT; //ALU 3-bit select input
 output [7:0] RESULT; //ALU 8-bit result
 
 reg RESULT;
 
 always @(*)
 
 begin
   
   case(SELECT)
   3'b000: //forward
     RESULT=DATA2; //if select input is 000 , DATA2->RESULT
   3'b001: //add
     RESULT=DATA2+DATA1; //if select output is 001 DATA1+DATA2->RESULT
   3'b010: //and
     RESULT=DATA2&DATA1; //if select output is 010 DATA1&DATA2->RESULT
   3'b011: //or
     RESULT=DATA1|DATA2; //if select output is 011 DATA1|DATA2->RESULT
   endcase
   
 end
endmodule
