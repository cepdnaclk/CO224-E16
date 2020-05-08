
/*
Author: E/16/200
Name: Lakmali B.L.S.
Lab 5 Part 2
Test bench for register file
*/



module regfile_testbench;
    
    reg [7:0] WRITEDATA;//the data you want to write into the register
    reg [2:0] WRITEREG,READREG1,READREG2;//address of write register and readregisters
    reg CLOCK, RESET, WRITEENABLE; //Write enable is high data is written into the registers in positive edges of the clock
    wire [7:0] REGOUT1,REGOUT2; //these are the values read from the regidters
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2,WRITEREG,READREG1, READREG2, WRITEENABLE, CLOCK, RESET);
       
    initial
    begin
        CLOCK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("Register_File_Wavedata.vcd");
		$dumpvars(0, regfile_testbench);
        
        //we will assign values to the inputs
        RESET = 1'b0;//reset is 0
        WRITEENABLE = 1'b0;// write enable is 0
        
        #1
        RESET = 1'b1;//reset is 1
        READREG1 = 3'd1;//read the value in register 1
        READREG2 = 3'd5;//read the value in register 5
        
        #4
        RESET = 1'b0;//reset is 0
        
        #5
        WRITEENABLE = 1'b1;//write enable is 1
        WRITEREG = 3'd4;//write 80 into register 4
        WRITEDATA = 8'd80;
        
        #3
        READREG1 = 3'd4;//read the value in register 4
        
        #2
        READREG2 = 3'd6;//read the value in register 6
        
        #10
        WRITEREG = 3'd6;//write 95 into register 6
        WRITEDATA = 8'd95;
        
        #10
        WRITEENABLE = 1'b0;//write enable is 0
        
        #1
        READREG1 = 3'd0;//read the value in register 0
        
        #9
        WRITEREG = 3'd0;//write 28 into register 0
        WRITEDATA = 8'd28;
        WRITEENABLE = 1'b1;//write enable is 1
        
        #5
        READREG2 = 3'd1;//read register 1
        
        #10
        WRITEENABLE = 1'b0;//write enable is 0
        
        #10
        WRITEREG = 3'd5;//write 12 into register 5
        WRITEDATA = 8'd12;
        
        #1
        WRITEENABLE = 1'b1;//write enable is 1
        
        #10
        READREG1 = 3'd5;//read the value in register 5
        
        #3
        WRITEDATA = 8'd15;//write 15 into register 5
        
        #11
        WRITEENABLE = 1'b0;//write enable is 0
        
        #4
        WRITEREG = 3'd1;//write 50 into register 1
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;//write enable is 1
        
        #5
        WRITEENABLE = 1'b0;//write enable is 0
        
        #10
        $finish;
    end
    
    // clock is generated with a time period of 10 time units
    always
    begin
        #5 CLOCK = ~CLOCK;
    end
        

endmodule


