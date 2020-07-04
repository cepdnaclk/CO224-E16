// module alu_testbench;               //testbench for alu module
//    reg [7:0] DATA1,DATA2;           //8 bit registers for DATA1 and DATA2
//    reg [2:0] SELECT;                //3 bit register for SELECT
//    wire [7:0] RESULT;               //8 bit wire for RESULT
//    integer i;                       //integer is declared here
//    alu test_unit(DATA1,DATA2,SELECT,RESULT);
//    initial begin
//       $dumpfile("dump.vcd");
//       $dumpvars(0,alu_testbench);
//       DATA1=8'b00001000;           //give an initilaL 8 bit value for DATA1
//       DATA2=8'b00000001;           //give an initial 8 bit value for DATA2
//       SELECT=3'b000;               //give an 3 bit initial value for SELECT
//       #10;
//       $display(" DATA1=%b, DATA2=%b, SELECT=%b, RESULT=%b\n",DATA1,DATA2,SELECT,RESULT);    //display values
//       SELECT=3'b001;
//       #10;
//       $display(" DATA1=%b, DATA2=%b, SELECT=%b, RESULT=%b\n",DATA1,DATA2,SELECT,RESULT);    //display values
//       SELECT=3'b010;
//       #10;
//       $display(" DATA1=%b, DATA2=%b, SELECT=%b, RESULT=%b\n",DATA1,DATA2,SELECT,RESULT);    //display values
//       SELECT=3'b011;
//       #10;
//       $display(" DATA1=%b, DATA2=%b, SELECT=%b, RESULT=%b\n",DATA1,DATA2,SELECT,RESULT);    //display values
//    end
// endmodule                                 //end module


module alu(DATA1,DATA2,RESULT,SELECT);    //module instantiation
    input [7:0] DATA1;       //8 bit input port for DATA1
    input [7:0] DATA2;       //8 bit input port for DATA2
    input [2:0] SELECT;      //3 bit input port for SELECT
    output [7:0] RESULT;     //8 bit output port for RESULT
    reg [7:0] RESULT;        //declare RESULT as a register
    always @ (DATA1,DATA2,SELECT) begin      //executing conditions
       case(SELECT)                          //use of case structure for SELECT 
         3'b000: #1 RESULT=DATA2;            //FORWARD function  
         3'b001: #2 RESULT=DATA1+DATA2;      //ADD function 
         3'b010: #1 RESULT=DATA1&DATA2;      //AND function
         3'b011: #1 RESULT=DATA1|DATA2;      //OR function
         default: #1 RESULT=0;               //dealing with unused bit combinations of SELECT
       endcase
    end
endmodule                  //end module
