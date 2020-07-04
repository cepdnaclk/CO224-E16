/*
    PereraALHE
    E16275
    lab5 part 1
    ALU module ComplexVersion (Use to consider the overflow of when adding two 8 bit values together)
				(Also single bit arithmatics Also Considered)	 
*/

Compile using

	iverilog -o e16275_lab5_part1.vvp testbench.v alu.v adder.v andModule.v orModule.v

run using 

	vvp e16275_lab5_part1.vvp
