//CO224 Computer Architecture
//Lab 5 - Building a Simple Processor
//Part 2 – Register File
//REG. NO: E/16/087

//////////////////////////////////////////////
/*
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
        READREG2 = 3'd4;
        
        #8
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd95;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1
        READREG1 = 3'd2;
        
        #9
        WRITEREG = 3'd1;
        WRITEDATA = 8'd28;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule
*/
//////////////////////////////////////////////

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
  //Data input,
  input [7:0] IN; 
  //INADDRESS = register number to store that data in
  //OUT1ADDRESS and OUT2ADDRESS = register numbers where data should be retrieved from
  input [2:0] OUT1ADDRESS, OUT2ADDRESS, INADDRESS;
  //WRITE to accommodate the WRITEENABLE control signal
  //CLOCK and RESET signals for synchronization
  input WRITE, CLK, RESET;

  //OUT1 and OUT2 = dual data outputs
  output reg [7:0] OUT1, OUT2;

  //An array of 8 registers each of 8 bits
  reg [7:0] a_reg_file[7:0]; 
 
  //Reset
  always @ (*)
  begin
    if(RESET)
    begin
      #2
      a_reg_file[0] = 8'd0;
      a_reg_file[1] = 8'd0;
      a_reg_file[2] = 8'd0;
      a_reg_file[3] = 8'd0;
      a_reg_file[4] = 8'd0;
      a_reg_file[5] = 8'd0;
      a_reg_file[6] = 8'd0;
      a_reg_file[7] = 8'd0;
      end 
    end

  //OUT1ADDRESS and OUT2ADDRESS = the register numbers where data should be retrieved from.
  //registers identified by OUT1ADDRESS and OUT2ADDRESS, read asynchronously and the values load onto OUT1 and OUT2 respectively
  always @(*)
  begin
    if(~RESET)
    begin
      #2
      //Save data stored at OUT1ADDRESS into OUT1
      OUT1 <=  a_reg_file[OUT1ADDRESS];
      //Save data stored at OUT2ADDRESS into OUT2 
      OUT2 <=  a_reg_file[OUT2ADDRESS]; 
    end  
  end

  always @(posedge CLK)
  begin
    #2
    a_reg_file[INADDRESS] <= IN;
  end

endmodule

