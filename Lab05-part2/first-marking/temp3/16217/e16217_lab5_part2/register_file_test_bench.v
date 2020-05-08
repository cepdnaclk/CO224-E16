`include "register_file_module.v"

module register_file_test_bench;
	
	reg [2:0] in_address, out1_address, out2_address;
	reg [7:0] in;
	
	wire [7:0] out1, out2;
	
	reg clk, reset, write; 
	
	integer t;
	
	reg_file reg_file_(in, out1, out2, in_address, out1_address, out2_address, write, clk, reset); 
	
	initial begin   
		t = 0;
		clk = 1'b0;
		
		$monitor("t:%d out1: %d out2: %d", t, out1, out2);   
		$dumpfile("register_file_wave.vcd");
		$dumpvars(0, register_file_test_bench);
		   
		out1_address = 3'b001;
		out2_address = 3'b010;
		
		#3 write = 1'b1;               	//write enable at 3
		#2 in_address = 3'b001;			//in address = 1
		#1 in = 8'b0000_0001;			//in = 1
 
        
        #10 in_address = 3'b010;		//at 16 in in_address = 2
        #1 in = 8'b000_0010;     		//at 17 in = 2
        
        #5 out1_address = 3'b010; 		//at 22 out1_address 2
        
        #13 write = 1'b0; 				//at 35  write disabled
        
        #1 in =  8'b000_0011; 			//so at 36 no changes at address 2 hence no changes at out2
        
        #19 write = 1'b1;  				//at 55 enable write
        #1 in_address =  3'b011;
        #1 in = 8'b000_0100; 			//at 57 change reg3 value to 4 
        
        #14 out1_address = 3'b011; 		//at 71 out1 address will be 3 so out1 will be 4	
        
        #10 in_address =  3'b111;
        #1 in = 8'b000_1100; 			//at 82 reg7 value will be 12
        
        #10 out2_address = 3'b111;		//at 92 oute will be reg7 value
        
        #1 write = 1'b0;				//at 93 write dissable
        #10 reset = 1'b1;				//reset at 112
		#1 reset = 1'b0;
		
		#10 out1_address = 3'b000;
	end
	
	 always 
	 	#10 clk = ~clk;

	 
	 always begin
	 	#10 t = t + 10; 
	 end   
	 
	 initial #150 $finish;
	 	
endmodule