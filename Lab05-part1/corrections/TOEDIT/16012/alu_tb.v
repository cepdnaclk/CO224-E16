/* CO224 Lab - 05 Part 1 - ALU */
/* Name : Adikari A.M.I.N. */
/* Reg no. : E/16/012 */
/* module for testbench for alu module */
module alu_tb;
    /* Declaring testbench variables */
	reg [7:0] OPERAND1, OPERAND2;   /* 8 - bit input operands */
	reg [2:0] ALUOP;           /* 3 - bit control input operand */
	wire [7:0] ALURESULT;          /* 8 - bit output operand */
	/* Instantiate the alu with the testbench variables */
	alu myAlu(OPERAND1, OPERAND2, ALURESULT, ALUOP);
	/* Test the design */ 
	initial
		begin
			$monitor($time," OPERAND1: %b, OPERAND2: %b, ALUOP: %b, ALURESULT: %b",OPERAND1,OPERAND2,ALUOP,ALURESULT);
			$dumpfile("wavedata.vcd");
			$dumpvars(0,alu_tb);
		end
	initial
		begin
			OPERAND1 = 8'b00000001;         /* Assign values to input operands */
			OPERAND2 = 8'b11111111;
			ALUOP = 3'b000;             /* Implements FORWARD function */
			
			#10                  /* Wait 10ns */
			ALUOP = 3'b001;   /* Change control input to implement ADD function */

			#10                  /* Wait 10ns */
			ALUOP = 3'b010;   /* Change control input to implement AND function */

			#10                  /* Wait 10ns */
			ALUOP = 3'b011;   /* Change control input to implement OR function */
			
			#10                  /* Wait 10ns */
			ALUOP = 3'b111;   /* Change control input to a reserved opcode */
		end
endmodule