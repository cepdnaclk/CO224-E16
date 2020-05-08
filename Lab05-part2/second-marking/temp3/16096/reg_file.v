//E16096
//Lab5_part2


module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

	input [7:0] IN;
	input [2:0] INADDRESS,OUT1ADDRESS,OUT2ADDRESS;
	input WRITE,CLK,RESET;
	output [7:0] OUT1,OUT2;

	
	reg [7:0] a[7:0];
	
	integer i;  //used in the for loop later on
	
	always @ (posedge CLK)begin   //the writing of data into register is taking place at the positive clock edge
		if(!RESET) begin   //if reset is set to 1,irrespective of data being sent to the register file,all registers should be zero. Hence,writing is avoided.
			if(WRITE)begin    //writting is done only when writeenable=1
				#2 a[INADDRESS]=IN;    //delay for writing is #2
			end
		end	
	end	
	
	always @ (RESET)begin
		if(RESET) begin  //when reset=1(level-triggered) all the registers in register_file is are set to 0
			#2
			for (i = 0; i < 8; i = i + 1) begin   //all registers in register file are set to 0 when reset=1(level-triggered)
              a[i] <= 8'b0;
            end
		 /*#2  a[0]=8'b00000000;    //what is expected above
			 a[1]=8'b00000000;
			 a[2]=8'b00000000;
			 a[3]=8'b00000000;
			 a[4]=8'b00000000;
			 a[5]=8'b00000000;
			 a[6]=8'b00000000;
			 a[7]=8'b00000000;*/
		end
	end
	
		assign #2 OUT1=a[OUT1ADDRESS];  //asynchronous assigning of outputs with register values in OUT1ADDRESS and OUT2ADDRESS
		
		assign #2 OUT2=a[OUT2ADDRESS];
		
		
		
	
				
	
endmodule		
				
				
				