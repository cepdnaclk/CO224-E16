
`include "alu.v"  //alu module included
//testbench 
module testbench;
	
	reg [7:0] OPERAND1, OPERAND2;   //declare a 8 bit variable DATA1_t,DATA2_t  that can hold its value
	reg [2:0] ALUOP;   // declare a 3 bit variable SELECT_t that can hold its value
	wire [7:0] ALURESULT;  // declare a 8 bit variable RESULT_t that can hold its value
	integer j;
	integer i;
	
	alu myalu(OPERAND1, OPERAND2, ALURESULT, ALUOP);
	
	initial
	begin
	//see how signals vary using command line
		$monitor($time,"	OPERAND1: %b, OPERAND2: %b, ALUOP: %b,	ALURESULT: %b",OPERAND1, OPERAND2,  ALUOP, ALURESULT); //print values
		$dumpfile("wavedata1.vcd");  //specify the VCD file name and it contains information about value changes on the selected variables
		$dumpvars(0,testbench); //specify that all variables must be dumped
	end
	
	initial begin
	
		//initialize variables
		OPERAND1=8'b0;  
		OPERAND2=8'b1;
		ALUOP=3'b000;
		
		for (j=0;j<=3;j=j+1)
		begin
			for (i=0;i<=4;i=i+1)
			begin
				OPERAND2=OPERAND2+8'b01; //increasing DATA2_t
				OPERAND1=OPERAND1+8'b01; //increasing DATA1_t
				#10;
				
			end;
			
			ALUOP=ALUOP + 3'b01; //change the select value adding 1 bit	
			
		end;
		
		// check reserved values for select
		ALUOP=3'b100;
		OPERAND1=8'b110;
		OPERAND2=8'b001;
		#5;
		ALUOP=3'b101;
		OPERAND1=8'b110;
		OPERAND2=8'b001;
		#5;
		ALUOP=3'b110;
		OPERAND1=8'b110;
		OPERAND2=8'b101;
		#5;
		ALUOP=3'b111;
		OPERAND1=8'b110;
		OPERAND2=8'b011;
		
	#10 
	$finish;
	
	end
	

	
	
endmodule