

module testbench;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file testreg_file(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("wavedata.vcd");
		$dumpvars(0, testbench);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1 RESET = 1'b1; READREG1 = 3'd3; READREG2 = 3'd5;
        
        #8 RESET = 1'b0;
        
        #5 WRITEREG = 3'd1; WRITEDATA = 8'd12; WRITEENABLE = 1'b1;
        
        #10 WRITEENABLE = 1'b0;
        
        #1 READREG1 = 3'd5;
        
        #9 WRITEREG = 3'd2; WRITEDATA = 8'd93; WRITEENABLE = 1'b1; READREG1 = 3'd1;
        
        #10 WRITEENABLE = 1'b0;
        
        #10 WRITEREG = 3'd7; WRITEDATA = 8'd23; WRITEENABLE = 1'b1;
        
        #10 WRITEDATA = 8'd35; WRITEENABLE = 1'b1;
        
        #10 WRITEENABLE = 1'b0;
        
        #6 WRITEREG = 3'd1; WRITEDATA = 8'd50; WRITEENABLE = 1'b1;
        
        #5 WRITEENABLE = 1'b0;
        
        #10
        $finish;
    end
    
    
    always
        #5 CLK = ~CLK; // clock signal
        

endmodule

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET) ;
 
 input [2:0] OUT1ADDRESS, OUT2ADDRESS ; //register numbers where data should be retrieved
 input [2:0] INADDRESS ; // register number which data should store
 input [7:0] IN ; // 8 bit data input
 input WRITE ; // write enable
 input CLK, RESET ; // clock and reset
 output reg [7:0] OUT1, OUT2 ; // 8 bit data output, OUT1ADDRESS->OUT1 and OUT2ADDRESS->OUT2
 
 //reg OUT1, OUT2, IN;
 reg [7:0] register[7:0];  // An array of 8 registers each of 8 bit 

 always @(register[OUT1ADDRESS], register[OUT2ADDRESS]) begin // these registers change, output should change
        #2
        OUT1 = register[OUT1ADDRESS];
        OUT2 = register[OUT2ADDRESS];
        
    end
 
 always @(posedge CLK)
 begin
   
  // if write is enable , store the data of the register number which is provided by INADDRESS 
  if(WRITE)begin
   #2 register[INADDRESS] = IN ; 
   
  end
 end

 always @(OUT1ADDRESS, OUT2ADDRESS) begin
  if(!RESET) begin
    #2
    OUT1 =  register[OUT1ADDRESS] ; 
    
    // Save the data stored OUT2ADDRESS to OUT2
    OUT2 =  register[OUT2ADDRESS] ;
  end
 end

 always @(RESET) // resetting registers
 begin
   if(RESET) begin
    #2
   	register[0] = 8'd0;
   	register[1] = 8'd0;
   	register[2] = 8'd0;
   	register[3] = 8'd0;
   	register[4] = 8'd0;
   	register[5] = 8'd0;
   	register[6] = 8'd0;
   	register[7] = 8'd0;   	
   end
 end
endmodule
 
