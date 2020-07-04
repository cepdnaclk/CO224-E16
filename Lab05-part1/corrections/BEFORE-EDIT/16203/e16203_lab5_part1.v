module alu(DATA1,DATA2,RESULT,SELECT);	//module for ALU
    input [7:0]DATA1,DATA2;                               //define 8bit tw0 inputs DATA1 and DATA2
	input [2:0] SELECT;                                         //define 2bit SELECT port
	output [7:0]RESULT;                                          //define 8bit output port
	reg RESULT;                                                     // output is declared as type reg since it is used in procedural block
	always@(DATA1,DATA2,SELECT)                  //always block calls whenever DATA1,DATA2 or SELECT changes
	begin
		case(SELECT)
			3'b000: begin 
			                #1;                                                      
		                   RESULT=DATA2;                            //forward DATA2 to output
						   end
			3'b001: begin 
                 			#2;
			               RESULT=DATA1+DATA2;                //ADD
						   end
			3'b010: begin 
			               #1;
			               RESULT=DATA1 & DATA2;               //AND
						   end
            3'b011: begin 
			                #1;
			               RESULT=DATA1| DATA2;                 //OR
						   end 
		    default:RESULT =1'd0;				//unused select combination makes output 0
		endcase
	end

endmodule

//in this test bench, the value already in RESULT  is printed instantly before the calculation take place and then print the correct value

 // module alu_testbench();		                                      //testbench of ALU
	// reg [7:0] DATA1,DATA2;
	// reg [2:0] SELECT;
	// wire [7:0] RESULT;

	// alu alu_test(DATA1,DATA2,RESULT,SELECT);	
		
		// initial
		// begin
		// $monitor("DATA1: %b,DATA2: %b,SELECT: %b,RESULT: %b",DATA1,DATA2,SELECT,RESULT);
		// end
		
		// initial
		// begin
		
		// DATA1 = 8'b10101011;
		// DATA2 = 8'b00000001;
		// SELECT = 3'b000;
		 // #5
		// SELECT = 3'b001;
		 // #5
		// SELECT = 3'b010;
		 // #5
		// SELECT = 3'b011;
		 // #5
		// SELECT = 3'b100;
		// end
		
 // endmodule







