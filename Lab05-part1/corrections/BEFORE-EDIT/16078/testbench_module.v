//CO224 : Lab 5 : Part 1
//E/16/078 
//testbench

`include "alu_module.v"

//testbench
module testbench;




	//port declaration
	reg [7:0]DATA1;
	reg [7:0]DATA2;
	reg [2:0]SELECT;
	wire [7:0]RESULT;
	
	//instantiate module
	alu ALU(DATA1, DATA2, RESULT, SELECT);
	
	//initial block 1
	initial
	begin
	
		//monitor command
		$monitor($time, " DATA1: %b, DATA2: %b, SELECT: %b, RESULT: %b ",DATA1,DATA2,SELECT,RESULT);
		
		//dump datafile
		//generate files to gtkwave
		$dumpfile("wave.vcd");	//file to dump
		$dumpvars(0,testbench); //module to dump from
		
	end
	
	
	//initial block 2
	initial
	begin
	
		//intialize input values
		DATA1 = 8'b10010001;
		DATA2 = 8'b10010010;
		SELECT = 3'b000;	
		
		//test changing SELECT
		#10 				//tell verilog to wait 10 time units
		SELECT = 3'b001;	//ADD
		 
		#10
		SELECT = 3'b010;	//AND
		
		#10
		SELECT = 3'b011;	//OR
		
		#10
		SELECT = 3'b110;	//Reserved	
		
		#10
		SELECT = 3'b000;	//FORWARD
		
		
		//test changing DATA1
		#10
		DATA1 = 8'b00011001;
		DATA2 = 8'b10010010;
		
		#10 				
		SELECT = 3'b001;	//ADD
		 
		#10
		SELECT = 3'b010;	//AND
		
		#10
		SELECT = 3'b011;	//OR
		
		#10
		SELECT = 3'b101;	//Reserved	
		
		#10
		SELECT = 3'b000;	//FORWARD
		
		
		//test changing DATA2
		#10
		DATA1 = 8'b00011001;
		DATA2 = 8'b00010010;
		
		#10 				
		SELECT = 3'b001;	//ADD
		 
		#10
		SELECT = 3'b010;	//AND
		
		#10
		SELECT = 3'b011;	//OR
		
		#10
		SELECT = 3'b111;	//Reserved	
		
		#10
		SELECT = 3'b000;	//FORWARD
		
		
	end

endmodule