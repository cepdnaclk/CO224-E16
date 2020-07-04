
//1 bit full adder
module bit_full_adder(S, COUT, A, B, CIN);
	input A, B, CIN;
	
	output S, COUT;
	
	wire w0, w1, w2, w3, w4;
	
	xor xor0(w0, A, B);
	and and0(w1, A, B);
	and and1(w2, CIN, w0);
	xor xor1(S, w0, CIN);
	or or0(COUT, w1, w2);
	
endmodule

//8 bit full adder
module  adder(S, A, B) ;
	input [7:0] A, B;
	output [7:0] S;
	
	wire co0, co1, co2, co3, co4, co5, co6, co7;
	
	//use 8 1 bit full adders
	bit_full_adder bfa0( S[0], co0, A[0], B[0], 1'b0);
	bit_full_adder bfa1( S[1], co1, A[1], B[1], co0); 
	bit_full_adder bfa2( S[2], co2, A[2], B[2], co1);
	bit_full_adder bfa3( S[3], co3, A[3], B[3], co2);
	
	bit_full_adder bfa4( S[4], co4, A[4], B[4], co3);
	bit_full_adder bfa5( S[5], co5, A[5], B[5], co4);
	bit_full_adder bfa6( S[6], co6, A[6], B[6], co5);
	bit_full_adder bfa7( S[7], co7, A[7], B[7], co6);
	
endmodule  

	

//this mux can select between two 8 bit channels      
module mux(SELECT, IN1, IN2, OUT);
	input SELECT;         //select pin
	input [7:0] IN1, IN2; //inputs
	
	output [7:0] OUT;

	//use 8 2x1 muxs for each bit 
	mux2_1 MUX2_0(OUT[0], IN1[0], IN2[0], SELECT);  
	mux2_1 MUX2_1(OUT[1], IN1[1], IN2[1], SELECT);
	mux2_1 MUX2_2(OUT[2], IN1[2], IN2[2], SELECT);
	mux2_1 MUX2_3(OUT[3], IN1[3], IN2[3], SELECT);
	mux2_1 MUX2_4(OUT[4], IN1[4], IN2[4], SELECT);
	mux2_1 MUX2_5(OUT[5], IN1[5], IN2[5], SELECT);
	mux2_1 MUX2_6(OUT[6], IN1[6], IN2[6], SELECT);
	mux2_1 MUX2_7(OUT[7], IN1[7], IN2[7], SELECT);
		
		
endmodule   
 
//simple 1 bit 2x1 mux 
module mux2_1(OUT, D0, D1, SELECT); 
	input D0, D1, SELECT;
	output OUT;
	       
	wire w0, w1, w2;
	
	not(w0, SELECT);
	
	and a0(w1, D0, w0);
	and a1(w2, D1, SELECT);
	
	or or0(OUT, w1, w2);
	
endmodule
	
//8x1 mux 
module mux8_1(OUT, D0, D1, D2, D3, D4, D5, D6, D7, SELECT);
	input D0,D1, D2, D3, D4, D5, D6, D7;  //1 bit inputs
	input [2:0] SELECT;                   //3 bit select               	
	
	output OUT;     
	
	//this will select D value as ouput according to the select

	wire [2:0] SELECT_INVERT;
	         
	wire w0, w2, w3, w4, w5, w6, w7;
	
	assign SELECT_INVERT = ~SELECT;  //neg values of select bits
	
	and a0(w0, D0, SELECT_INVERT[2], SELECT_INVERT[1], SELECT_INVERT[0]);
	and a1(w1, D1, SELECT_INVERT[2], SELECT_INVERT[1], SELECT[0]);  
	and a2(w2, D2, SELECT_INVERT[2], SELECT[1], SELECT_INVERT[0]);
	and a3(w3, D3, SELECT_INVERT[2], SELECT[1], SELECT[0]);
	
	and a4(w4, D4, SELECT[2], SELECT_INVERT[1], SELECT_INVERT[0]);
	and a5(w5, D5, SELECT[2], SELECT_INVERT[1], SELECT[0]);
	and a6(w6, D6, SELECT[3], SELECT[1], SELECT_INVERT[0]);
	and a7(w7, D7, SELECT[2], SELECT[1], SELECT[0]); 
	
	or or0(OUT, w0, w1, w2, w3, w4, w5, w6, w7);
	
	
endmodule