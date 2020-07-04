module testbench;

	reg 	[7:0] 	d1_t;		//input signals
	reg 	[7:0] 	d2_t;
	reg 	[2:0] 	sel_t;
	
	wire [7:0]	 res_t;		//output signals

	
	alu alu_test( d1_t, d2_t, res_t, sel_t);				//initialize alu module
	
	initial
	begin
	
		// see how signals vary using command line
		//$monitor($time, " d1_t: %b , d2_t: %b ,sel_t: %b , res_t: %b",d1_t,d2_t,sel_t,res_t );
		
		// geneate files needed to plot the waveform using GTKWave
		$dumpfile("E16173wavedataALU.vcd");
		$dumpvars(0, testbench);			//0 all variables throgh all the modules  (1 for only that module)
		
	
	end
	
	
	initial
	begin
		
		
		d1_t	=		8'b10010010;							//data 1 input
		d2_t	=		8'b10010001;							//data 2 input	
		sel_t	=		3'b001;										// selection input (op-code)			ADD
		
		#10
		
		d1_t	=		8'b10010010;							//data 1 input
		d2_t	=		8'b10010001;							//data 2 input	
		sel_t	=		3'b000;										// selection input (op-code)			Forward
		
		#10
		
		d1_t	=		8'b10010010;							//data 1 input
		d2_t	=		8'b10010001;							//data 2 input	
		sel_t	=		3'b010;										// selection input (op-code)			bitwiseAND
		
		#10
		
		d1_t	=		8'b10010010;							//data 1 input
		d2_t	=		8'b10010001;							//data 2 input	
		sel_t	=		3'b011;										// selection input (op-code)			bitwiseOR

	end



endmodule


module alu(DATA1, DATA2, RESULT, SELECT);
	
	//port declarations
	
	input [7:0] DATA1;								// ALU 8-bit input 1
	input [7:0] DATA2;								// ALU 8-bit input 2
	input [2:0] SELECT;							// op-code 
	
	output [7:0] RESULT ;				// ALU 8 bit output (register)
	reg RESULT;
	
  
  	// This always block is executed whenever DATA1,DATA2,SELECT changes values
  always @ (DATA1, DATA2, SELECT) 
  begin    
	case(SELECT)
		3'b000:																		//forward
		  #2
		  RESULT =	DATA2;									
		3'b001:																		//add
		  #2
		  RESULT = DATA1 + DATA2 ; 					
		3'b010:																		// AND
		  #2
		  RESULT = DATA1 & DATA2 ; 					
		3'b011:																		//OR
		  #2
		  RESULT = DATA1 | DATA2 ; 
	endcase
  end
	
endmodule
