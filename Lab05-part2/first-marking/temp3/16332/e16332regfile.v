module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b0;
        
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
        WRITEREG = 3'd0;
        WRITEDATA = 8'd20;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1
        READREG1 = 3'd2;
        READREG2 = 3'd1;
        
        #9
        WRITEREG = 3'd2;
        WRITEDATA = 8'd28;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd2;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        READREG1 = 3'd0;
        READREG2 = 3'd2;

        #10
        WRITEREG = 3'd5;
        WRITEDATA = 8'd60;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd47;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        READREG1 = 3'd5;
        READREG2 = 3'd5;

        #6
        WRITEREG = 3'd5;
        WRITEDATA = 8'd30;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #10
        READREG1 = 3'd5;
        READREG2 = 3'd1;

        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule


module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
	input [2:0] INADDRESS, OUT1ADDRESS,OUT2ADDRESS; //declare inputs
	input [7:0] IN; //declare input In
	input WRITE,CLK,RESET;
	output  [7:0] OUT1,OUT2; //declare outputs
    reg [7:0] register[0:7]; //register file with 8 registers
	integer i; //declare two integers
    integer j;

   

    always @(OUT1ADDRESS or OUT2ADDRESS) //define always block for select OUT1,OUT2 registers
    begin                                //depend on the OUT1ADDRESS and OUT2ADDRESS
        case(OUT1ADDRESS) //select integer i on OUT1ADDRESS
                3'b000 :i=0;
                3'b001 :i=1;
                3'b010 :i=2;
                3'b011 :i=3;
                3'b100 :i=4;
                3'b101 :i=5;
                3'b110 :i=6;
                3'b111 :i=7;
                
        endcase
                
        case(OUT2ADDRESS)  //select integer i on OUT2ADDRESS
                3'b000 :j=0;
                3'b001 :j=1;
                3'b010 :j=2;
                3'b011 :j=3;
                3'b100 :j=4;
                3'b101 :j=5;
                3'b110 :j=6;
                3'b111 :j=7;
                
        endcase

    end


	always @(posedge CLK or  RESET) //define always block for write and reset the register 
	begin                           //on the clock edge and reset level
        if(RESET==1'b1) //if reset is 1 then every register become zero 
            #2  //delay for reset the register file
            begin
            register[0]=8'b00000000;
            register[1]=8'b00000000;
            register[2]=8'b00000000;
            register[3]=8'b00000000;
            register[4]=8'b00000000;
            register[5]=8'b00000000;
            register[6]=8'b00000000;
            register[7]=8'b00000000;
            end
        else if(WRITE==1'b1) //if write is enable regiter is writting depend on INADDRESS
            #2               //on the clock edge,#2 for give delay for writting
            begin
                case(INADDRESS) //write register on INADDRESS
                    3'b000 :register[0]=IN;
                    3'b001 :register[1]=IN;
                    3'b010 :register[2]=IN;
                    3'b011 :register[3]=IN;
                    3'b100 :register[4]=IN;
                    3'b101 :register[5]=IN;
                    3'b110 :register[6]=IN;
                    3'b111 :register[7]=IN;
                
                endcase
            end

        
	end
    assign #2 OUT1=register[i];  //Set OUT1 asynchronsly 
    assign #2 OUT2=register[j];  //Set OUT2 asynchronsly ,OUT1,OUT2 are changing when  assign value is changing
	
endmodule
