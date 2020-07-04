`include "utils.v"

module alu(DATA1, DATA2, RESULT, SELECT) ;
	
	input [7:0]DATA1,DATA2;
	input [2:0]SELECT; 
	
	output [7:0]RESULT;

	 
	//reg [7:0]RESULT;  //result is 7 bit register 
	//zero flag for the jump instrctions  
	
	wire [7:0] adder_out, and_out, or_out;
	
	
	
	adder ADDER(adder_out, DATA1, DATA2); 
	
	and_module AND8(and_out, DATA1, DATA2);
	
	or_module OR8(or_out, DATA1, DATA2);
	
	alu_operation_selector AOP(RESULT, SELECT, DATA2, adder_out, and_out, or_out); 
	

	
endmodule            


    

module and_module(S, A, B);
	input [7:0] A, B;
	output [7:0] S;
	
	and(S[0], A[0], B[0]);
	and(S[1], A[1], B[1]);
	and(S[2], A[2], B[2]);
	and(S[3], A[3], B[3]);
	and(S[4], A[4], B[4]);
	and(S[5], A[5], B[5]);
	and(S[6], A[6], B[6]);
	and(S[7], A[7], B[7]);
	
endmodule 

module or_module(S, A, B);
	input [7:0] A, B;
	output [7:0] S;
	
	or(S[0], A[0], B[0]);
	or(S[1], A[1], B[1]);
	or(S[2], A[2], B[2]);
	or(S[3], A[3], B[3]);
	or(S[4], A[4], B[4]);
	or(S[5], A[5], B[5]);
	or(S[6], A[6], B[6]);
	or(S[7], A[7], B[7]);
	
endmodule
 

//this module will select the out put of the alu according to the select	
module alu_operation_selector(RESULT, SELECT, FORWARD_INPUT, ADDER_INPUT,
						 AND_INPUT, OR_INPUT); 
						 
	input [2:0] SELECT;
	input [7:0] ADDER_INPUT, FORWARD_INPUT, AND_INPUT, OR_INPUT;    
	
	output [7:0] RESULT;  

	
	//8 8x1 muxs are uses for each bit in RESULT                                        
	mux8_1 mux0(RESULT[0], FORWARD_INPUT[0], ADDER_INPUT[0], AND_INPUT[0], OR_INPUT[0], 1'b0, 1'b0, 1'b0, 1'b0, SELECT);  
	mux8_1 mux1(RESULT[1], FORWARD_INPUT[1], ADDER_INPUT[1], AND_INPUT[1], OR_INPUT[1], 1'b0, 1'b0, 1'b0, 1'b0, SELECT);
	mux8_1 mux2(RESULT[2], FORWARD_INPUT[2], ADDER_INPUT[2], AND_INPUT[2], OR_INPUT[2], 1'b0, 1'b0, 1'b0, 1'b0, SELECT);
	mux8_1 mux3(RESULT[3], FORWARD_INPUT[3], ADDER_INPUT[3], AND_INPUT[3], OR_INPUT[3], 1'b0, 1'b0, 1'b0, 1'b0, SELECT);
	                    
	mux8_1 mux4(RESULT[4], FORWARD_INPUT[4], ADDER_INPUT[4], AND_INPUT[4], OR_INPUT[4], 1'b0, 1'b0, 1'b0, 1'b0, SELECT);
	mux8_1 mux5(RESULT[5], FORWARD_INPUT[5], ADDER_INPUT[5], AND_INPUT[5], OR_INPUT[5], 1'b0, 1'b0, 1'b0, 1'b0, SELECT);
	mux8_1 mux6(RESULT[6], FORWARD_INPUT[6], ADDER_INPUT[6], AND_INPUT[6], OR_INPUT[6], 1'b0, 1'b0, 1'b0, 1'b0, SELECT);
	mux8_1 mux7(RESULT[7], FORWARD_INPUT[7], ADDER_INPUT[7], AND_INPUT[7], OR_INPUT[7], 1'b0, 1'b0, 1'b0, 1'b0, SELECT);
	                                        
endmodule   

