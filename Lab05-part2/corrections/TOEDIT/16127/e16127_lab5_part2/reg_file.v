

module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd1;
        
        #8
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd1;
        WRITEDATA = 8'd45;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;

        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd85;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1
        READREG1 = 3'd1;
        READREG2 = 3'd2;
        
        #9
        WRITEREG = 3'd3;
        WRITEDATA = 8'd99;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd3;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd74;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEREG = 3'd5;
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #5
        READREG1 = 3'd1;
        READREG2 = 3'd2;

        #6
        WRITEREG = 3'd5;
        WRITEDATA = 8'd67;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;

        #10
        READREG1 = 3'd1;
        READREG2 = 3'd2;
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule


module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
	input [7:0] IN;//8bit inut
	
	input [2:0] INADDRESS,OUT1ADDRESS,OUT2ADDRESS;
	input WRITE,CLK,RESET;
	
	output reg [7:0] OUT1,OUT2; //use reg type.because wire type cannot assign
	
	reg [7:0] REG1,REG2,REG3,REG4,REG5,REG6,REG7,REG8;
	
	always @(posedge CLK or RESET) begin//sensitive for positive edge of a clock
	
		

			
			
		if(RESET==1'b1) begin//if reset is high(1) reset all registers   ***
		
			#2
			REG1=8'b00000000;
			REG2=8'b00000000;
			REG3=8'b00000000;
			REG4=8'b00000000;
			REG5=8'b00000000;
			REG6=8'b00000000;
			REG7=8'b00000000;
			REG8=8'b00000000;
		
		end  else if(RESET==1'b0)begin		//if reset is low(0) datapath happens    ***
			if(WRITE==1'b1)begin
				#2     //just after a 2 time unit  feom the begining of the clock write happense 
				case(INADDRESS)
					3'b000 : REG1=IN;
					3'b001 : REG2=IN;
					3'b010 : REG3=IN;
					3'b011 : REG4=IN;
					3'b100 : REG5=IN;
					3'b101 : REG6=IN;
					3'b110 : REG7=IN;
					3'b111 : REG8=IN;
				endcase
			
			end
			

	
		
		end
	
	end
	
	always @(OUT1ADDRESS or OUT2ADDRESS ) begin
			#2   //after a 2 time unit  feom the OUT1ADDRESS and OUT2ADDRESS assign the OUT1 and OUT2 
				case(OUT1ADDRESS)
					3'b000 : OUT1=REG1;
					3'b001 : OUT1=REG2;
					3'b010 : OUT1=REG3;
					3'b011 : OUT1=REG4;
					3'b100 : OUT1=REG5;
					3'b101 : OUT1=REG6;
					3'b110 : OUT1=REG7;
					3'b111 : OUT1=REG8;
				endcase
				case(OUT2ADDRESS)
					3'b000 : OUT2 =REG1;
					3'b001 : OUT2 =REG2;
					3'b010 : OUT2 =REG3;
					3'b011 : OUT2 =REG4;
					3'b100 : OUT2 =REG5;
					3'b101 : OUT2 =REG6;
					3'b110 : OUT2 =REG7;
					3'b111 : OUT2 =REG8;
				endcase
	
	end


    always @( posedge CLK ) begin
			#4   //after a 4 time unit  feom the clock read and assign the OUT1 and OUT2 
				case(OUT1ADDRESS)
					3'b000 : OUT1=REG1;
					3'b001 : OUT1=REG2;
					3'b010 : OUT1=REG3;
					3'b011 : OUT1=REG4;
					3'b100 : OUT1=REG5;
					3'b101 : OUT1=REG6;
					3'b110 : OUT1=REG7;
					3'b111 : OUT1=REG8;
				endcase
				case(OUT2ADDRESS)
					3'b000 : OUT2 =REG1;
					3'b001 : OUT2 =REG2;
					3'b010 : OUT2 =REG3;
					3'b011 : OUT2 =REG4;
					3'b100 : OUT2 =REG5;
					3'b101 : OUT2 =REG6;
					3'b110 : OUT2 =REG7;
					3'b111 : OUT2 =REG8;
				endcase
    end
    
    always @( RESET) begin
			#2   //after a 2 time unit  feom the reset read and assign the OUT1 and OUT2 
				case(OUT1ADDRESS)
					3'b000 : OUT1=REG1;
					3'b001 : OUT1=REG2;
					3'b010 : OUT1=REG3;
					3'b011 : OUT1=REG4;
					3'b100 : OUT1=REG5;
					3'b101 : OUT1=REG6;
					3'b110 : OUT1=REG7;
					3'b111 : OUT1=REG8;
				endcase
				case(OUT2ADDRESS)
					3'b000 : OUT2 =REG1;
					3'b001 : OUT2 =REG2;
					3'b010 : OUT2 =REG3;
					3'b011 : OUT2 =REG4;
					3'b100 : OUT2 =REG5;
					3'b101 : OUT2 =REG6;
					3'b110 : OUT2 =REG7;
					3'b111 : OUT2 =REG8;
				endcase
	
	end
	
	
	
	

endmodule