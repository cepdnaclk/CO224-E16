/*******************************************
 *         Author: Nuwantha B.L.A.         *
 *         Lab 05: Project_part_01         *
 *         Date  : 2020/05/03              *                  
 *******************************************/



module alu( DATA1, DATA2, RESULT, SELECT);
  // declare the input & output
  input  [7:0] DATA1, DATA2;
  input  [2:0] SELECT;
  output [7:0] RESULT;
  reg RESULT;

  always @ (DATA1, DATA2, SELECT)
  begin
  	//use the switch case 
  	case (SELECT)
        3'b000  : #1 RESULT = DATA2;         //for FORWARD
        3'b001  : #2 RESULT = DATA1 + DATA2; //for AND
        3'b010  : #1 RESULT = DATA1 & DATA2; //for AND
        3'b011  : #1 RESULT = DATA1 | DATA2; //for OR
  		  default : RESULT = 8'd0; 
  		//for reserved using dont care
  	endcase

  end

endmodule



// module testbench_alu;

//    reg [7:0] data1,data2;
//    reg [2:0] select;
//    wire [7:0] result;

//    alu myAlu(data1, data2, result, select);

//    initial begin
     
//      $dumpfile("alu_wavedata.vcd");
//      $dumpvars(0, testbench_alu);

//      data1 = 1;
//      data2 = 2;
//      select = 3'b000;

//      #4
//      data1 = 2;
//      data2 = 3;
//      select = 3'b001;

//      #4
//      data1 = 4;
//      data2 = 5;
//      select = 3'b010;

//      #4
//      data1 = 3;
//      data2 = 2;
//      select = 3'b011;

//      #4
//      $finish;


//    end

// endmodule