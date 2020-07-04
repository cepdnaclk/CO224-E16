// Lab_05_part1
//E16115
//ALU

// module testbench_alu;
// //Inputs
// reg[7:0] inp1;
// reg[7:0] inp2;
// reg[2:0] alu_sel;
// //Output
// wire[7:0] outp;
// // Verilog code for ALU
//  integer i;
// alu test_unit(
//             inp1,inp2,  // ALU 8-bit Inputs                 
//             alu_sel,// ALU Selection
//             outp);// ALU 8-bit Output
//      initial begin
//     // hold reset state for 100 ns.
//       inp1 = 8'h0A;
//       inp2 = 8'h02;
//       alu_sel = 3'b000;
// #0
//       for (i=0;i<4;i=i+1)
//       begin
//       $display("In time %d data1 = %d data2 = %d select = %d result = %d.", $time,inp1,inp2,alu_sel,outp);
//        alu_sel = alu_sel + 3'b001;
//        #10;
//       end;
      
//       inp1 = 8'hF6;
//       inp2 = 8'h0A;
      
//     end
// endmodule




module alu(DATA1,DATA2,RESULT,SELECT);

input [7:0] DATA1,DATA2;  //ALU 8 bit inputs
input [2:0] SELECT;       //ALU operation selection
output reg [7:0] RESULT;  //ALU 8 bit output

always @(DATA1,DATA2,RESULT,SELECT)
begin
case (SELECT)
3'b000 : RESULT = DATA2;//forward
3'b001 : RESULT = DATA1 + DATA2; //addition
3'b010 : RESULT = DATA1 & DATA2; //and
3'b011 : RESULT = DATA1 | DATA2; //or
endcase
end
 
endmodule





