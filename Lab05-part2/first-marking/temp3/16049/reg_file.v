/*
E16049
CO224
Lab05
Register file 
*/

module reg_file(IN,OUT1,OUT2,
				INADDRESS,OUT1ADDRESS,OUT2ADDRESS,
				WRITE,CLK,RESET);
//addresses are 3 bit
//woreds are 8 bit
	integer i; //for loop counter
	input WRITE,CLK,RESET;
	input [7:0] IN; //8 bit input
	input [2:0] INADDRESS,OUT1ADDRESS,OUT2ADDRESS; //3 bit inputs(addresses)
	output [7:0] OUT1,OUT2;	//8 bit outputs
	reg OUT1,OUT2;
	//create 2d array for registers
	//register[8][8] 
	reg [7:0] register [0:7];
	
	always @(*)begin //combinational logic part for reset

		if(RESET == 1)begin
			
			#2	for(i=0;i<8;i=i+1) begin //latency = 2
					//should set every array 0
					register[i] = 8'h00;
				end
			//output is also combinational
			
		end
	end
	always @(*)begin //combinational logic to read out
/*	unblocked latency ,out1,out2 is simultanious
*/	
		OUT1 <= #2 register[OUT1ADDRESS];
		OUT2 <= #2 register[OUT2ADDRESS];
	end	
	always @(posedge CLK) begin //synchronus part
		if(WRITE== 1 && RESET==0)begin //write enable is 1 and reset is 0(no meaning attemting to write when reset is on)
				register[INADDRESS] = #2 IN; //latency = 2
		end	
	
	end
		
endmodule