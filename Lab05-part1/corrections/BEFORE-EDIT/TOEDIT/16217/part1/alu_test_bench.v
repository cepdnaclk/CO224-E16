`include "alu_module.v"

module alu_test_bench;
	
	reg [7:0] num1, num2; 	//numbers for testing
	wire [7:0] answer;      //answe
	reg [2:0] select;		//op code
	
	alu alu_module(num1, num2, answer, select);
	
	initial begin
		
		num1 = 8'b0000_0101; 
        num2 = 8'b0000_1100;
        
        select = 3'b000;
        
        #10 $display("MOV : num1= %b(5) num2= %b(12) | answer= %b(12)", num1, num2, answer);
        
        #10 select = 3'b001;
        #10 $display("ADD/SUB : num1= %b(5) num2= %b(12) | answer= %b(17)", num1, num2, answer);
        
        #10 select = 3'b010;
        #10 $display("AND : num1= %b num2= %b | answer= %b", num1, num2, answer);  
        
        #10 select = 3'b011;
        #10 $display("OR : num1= %b num2= %b | answer= %b", num1, num2, answer); 
        
        #10 num1 = 8'b0001_1000;
        #10 num2 = 8'b1111_1100;
       	#10 select = 3'b001;
       	
       	#10 $display("ADD/SUB : num1= %b(24) num2= %b(-4)| answer= %b(20)", num1, num2, answer); 
       	
       	#10 num1 = 8'b0000_0011;
        #10 num2 = 8'b1111_1100;
       	#10 select = 3'b001;
       	
       	#10 $display("ADD/SUB : num1= %b(3) num2= %b(-4)| answer= %b(-1)", num1, num2, answer);
        
       	#10 num1 = 8'b1111_1001;
        #10 num2 = 8'b0000_0100;
       	#10 select = 3'b001;
       	
       	#10 $display("ADD/SUB : num1= %b(-7) num2= %b(4) | answer= %b(-3)", num1, num2, answer);
        
        #10 $finish;
    end
endmodule