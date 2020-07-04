// module testbench;
	
// 	reg [7:0]DATA1_t,DATA2_t;
// 	reg [2:0]SELECT_t;
// 	wire [7:0]RESULT_t;
	
// 	alu mymux(DATA1_t, DATA2_t, RESULT_t,SELECT_t);
	
// 	initial
// 	begin 
// 	//how signals vary using command line
// 		$monitor($time, "DATA1_t : %b, DATA2_t: %b, SELECT_t : %b , RESULT_t: %b",DATA1_t,DATA2_t,SELECT_t,RESULT_t);
// 	// generate files needed to plot the wave from gtkwave
// 		$dumpfile("wavedata.vcd");
// 		$dumpvars(0,testbench);
// 	end
	
	
// 	initial
// 	begin
// 	DATA1_t = 8'b00000010; //giving inputs to check
// 	DATA2_t = 8'b00000001;
// 	SELECT_t = 3'b000;
	
// 	#10
// 	SELECT_t = 3'b001; //change select after 10 time units
	
// 	#10
// 	SELECT_t = 3'b010;
	
// 	#10
// 	SELECT_t = 3'b011;
	
// 	#10
// 	SELECT_t = 3'b100;
// 	end
// endmodule


module alu(DATA1,DATA2,RESULT,SELECT);

//port declaration
input [7:0]DATA1,DATA2; //two 8 bit inputs
input [2:0]SELECT;		//3 bit select mode
output [7:0]RESULT;		//8 bit output

reg RESULT;

always @ (DATA1,DATA2,SELECT)
begin
	case(SELECT) //cases for the select options
	
	3'b000: //if SELECT=000(FORWARD)
	begin
		#1 RESULT = DATA2;
	end 
	
	3'b001:	//if SELECT=001(ADD,SUB)
	begin
		#2 RESULT = DATA1 + DATA2;
	end 
	
	3'b010:	//if SELECT=010(AND)
	begin
		#1 RESULT = DATA1 & DATA2;
	end 
	
	3'b011:	//if SELECT=011(OR)
	begin
		#1 RESULT = DATA1 | DATA2;
	end 
	
	default://for anyother input the bits are reserved.
	 RESULT= 8'bxxxxxxxx;
	
	endcase
	
	
end
endmodule
