//processor part 1
//E16377 ALU unit
//CO224

module alu_testbench ;

	reg [7:0] OPERAND1 ;
	reg [7:0] OPERAND2 ;
	reg [2:0] ALUSELECT ;											//reg variables to assign
	wire [7:0] ALURESULT ;											//wire result


	//connecting signals
	alu myalu(OPERAND1 , OPERAND2 , ALURESULT , ALUSELECT) ;


	//system task | printing out

	initial begin

	// %b is for binary
	//displaying values
		$monitor($time,"\t module alu\tDATA1: %b , DATA2: %b , RESULT: %b , SELECT: %b \n",OPERAND1,OPERAND2,ALURESULT,ALUSELECT);
		//generate files needed to plotthe waveform using GTKwave
		$dumpfile("wavedata.vcd");
		$dumpvars(0,alu_testbench) ;    // 0 means the level it should go ,dump the changes in all modules when using 0
	end

	//give signals values
	//initial block executes only ones , going line by line ,
	// all these happens at the zeroth time
	//can have multiple initial bloack all starting at the zeroth tme
	initial begin
		OPERAND1 = 8'b01101010 ;
		OPERAND2 = 8'b10100011 ;
		ALUSELECT = 3'b000 ;


		//there is a default time scale, but we can change it
		#10 //wait for 10 time units
		ALUSELECT = 3'b001 ;

		

		#10  // waiting for another 20 time units 
		ALUSELECT = 3'b010 ;


		#10  // waiting for another 20 time units 
		ALUSELECT = 3'b011 ;


		#10  // waiting for another 20 time units 
		ALUSELECT = 3'b0xx ;

	end



endmodule


module alu(DATA1 , DATA2 , RESULT , SELECT) ;

	//sel 000 forward
	//sel 001 add
	//sel 010 and
	//sel 011 or
	//sel 1XX in future

	input [0:7] DATA1 ; //8bit oper1 input
	input [0:7] DATA2 ; // 8bit oper2
	input [0:2] SELECT ; //3bit select

	output [0:7] RESULT ; //8bit result output
	reg [0:7] RESULT ;

	always @(DATA1 or DATA2 or SELECT)begin
	case (SELECT)
		3'b000 : #1 RESULT = DATA2 ;				//FORWARD
		3'b001 : #2 RESULT = DATA1 + DATA2 ;		//ADD
		3'b010 : #1 RESULT = DATA1 & DATA2 ;		//AND
		3'b011 : #1 RESULT = DATA1 | DATA2 ; 	    //OR
		3'b1xx : #1 RESULT = RESULT ;				//result will not be change for any other inputs , for further developing the code
	endcase
	end
endmodule



