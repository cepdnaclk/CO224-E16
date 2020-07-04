module textbench;

reg[7:0] operand1,operand2;
reg[2:0] sel;
wire [7:0] result;

alu testalu(operand1,operand2,result,sel);


initial
	begin
	 $monitor($time,"  operand1:%b  operand2:%b result:%b sel:%b",operand1,operand2,result,sel);
	end
	
initial
	begin
		operand1=8'b00000001;
		operand2=8'b00000111;
		sel=3'b000;
		
		#10
		operand1=8'b00000001;
		operand2=8'b00000111;
		sel=3'b001;
		
		
		#10
		operand1=8'b00000011;
		operand2=8'b00000101;
		sel=3'b010;
		
		#10
		operand1=8'b00000101;
		operand2=8'b00000011;
		sel=3'b011;
		
		#10
		operand1=8'b00000101;
		operand2=8'b00000011;
		sel=3'b111;
		
		#10
		operand1=8'b00000101;
		operand2=8'b01000011;
		sel=3'b011;
		
		#10
		operand1=8'b10000001;
		operand2=8'b10000000;
		sel=3'b001;
		
		
		
	end

endmodule




module  alu(DATA1, DATA2, RESULT, SELECT); //module deleration
	input [7:0] DATA1,DATA2;  //define input  two 8 bit buses for oprands
	input [2:0] SELECT; //define input 3 bit buse for alu op selector
	output reg [7:0] RESULT; //define 8 bit out bus as a reg type


always @ (DATA1,DATA2,SELECT)  //declare always block wich sensitive for DATA1,DATA2,SELECT
	begin
		#1
		case (SELECT) //case block for handle the selector 
			3'b000 : RESULT=DATA2;  //FORWARD instruction output
					
			3'b001 :RESULT=#1
						   DATA1+DATA2; //ADD instruction output
					
			3'b010 :RESULT=DATA1&DATA2; // bitwise and for AND instruction output
					
					
			3'b011 :RESULT=DATA1|DATA2; // bitwise or for OR instruction output
					 
					
			default:RESULT = 8'bxxxxxxxx; //for handle unused selectors and output in unnown
					  
					
		endcase 
	end 
endmodule




