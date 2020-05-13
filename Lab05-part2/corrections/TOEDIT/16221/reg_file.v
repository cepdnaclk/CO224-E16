/*	Madushanka H.M.K
  	E/16/221
	Code for Register File
*/

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS,WRITE,CLK, RESET);

input[7:0] IN;	//8-bit input data to write
input[2:0] OUT1ADDRESS, OUT2ADDRESS, INADDRESS;	//register addresses of read and write
output reg[7:0] OUT1, OUT2;	//output data from reading registers
input WRITE, CLK, RESET;	//inputs to enable write,clock and reset

reg[7:0] register[7:0];		//8 registers array to store 8-bit data

always@(posedge(CLK)) begin	//write command will work according to clk(synchronously)
	if(WRITE == 1'b1)begin	//if write command given
		#2		//2 time units delay
		register[INADDRESS] <= IN;	//write into given register	
	end
end

always@(register[OUT1ADDRESS], register[OUT2ADDRESS])begin	//reading asynchronously	
	#2	//2 time units delay
	//assigning output data
	OUT1 <= register[OUT1ADDRESS];	
	OUT2 <= register[OUT2ADDRESS];
end

always@(RESET)begin	
	if(RESET == 1'b1)begin	//if reset is set
	#2	//2 time units delay
	//set all values in registers to zero
	register[0] = 0;
	register[1] = 0;
	register[2] = 0;
	register[3] = 0;
	register[4] = 0;
	register[5] = 0;
	register[6] = 0;
	register[7] = 0;
	
	/*this can do by a for loop too,but this giving an error when running the program on my pc
	integer i;
	for(i=0; i<8; i=i+1)begin
		register[i] = 0;
	end*/
	end
end
endmodule
	
//test module
module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(CLK, RESET, WRITEENABLE, WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2);
       
    initial
    begin
        CLK = 1'b1;
        $monitor($time," CLK: %b,RESET: %b,WRITE: %b,WRITEDATA: %b,OUT1: %b,OUT2: %b,WRITEREG: %b,READREG1: %b,READREG2: %b",CLK, RESET, WRITEENABLE, WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2);	//output format
      
        $dumpfile("reg_file_wavedata.vcd");//GTK wave file
	$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #2
        RESET = 1'b1;
        READREG1 = 3'd3;
        READREG2 = 3'd7;
        
        #5
        RESET = 1'b0;
        
	#5
	READREG1 = 3'd5;
	READREG2 = 3'd4;

        #2
        WRITEREG = 3'd3;
        WRITEDATA = 8'd23;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #2
        READREG1 = 3'd3;
	READREG2 = 3'd4;
        
        #5
        WRITEREG = 3'd0;
        WRITEDATA = 8'd45;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd4;
        
        #3
        WRITEENABLE = 1'b0;
        
        #5
        WRITEREG = 3'd4;
        WRITEDATA = 8'd55;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd27;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #6
	READREG1 = 3'd7;
	
	#4
	READREG2 = 3'd1;
	
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
endmodule	




