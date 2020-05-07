/*
Author : K.A.R. THUSHARA
E No   : E/16/369

// to run this use following

iverilog -Wall -o out.vvp reg_file_tb.v
vvp out.vvp
gtkwave test.vcd

*/

`include "reg_file.v" // import the reg_file.v

module reg_file_tb;
    // reg declaration
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE;
    // wire declaration 
    wire [7:0] REGOUT1, REGOUT2;

    reg_file myfile( // create a unit from reg_file module
        .IN(WRITEDATA), 
        .OUT1(REGOUT1), 
        .OUT2(REGOUT2), 
        .INADDRESS(WRITEREG), 
        .OUT1ADDRESS(READREG1), 
        .OUT2ADDRESS(READREG2), 
        .WRITE(WRITEENABLE), 
        .CLK(CLK), 
        .RESET(RESET));
       
    initial begin
        CLK = 1'b1; // initialize clock to binary 0
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("test.vcd"); // dump data into test.vcd file
		$dumpvars(0, reg_file_tb);
        
        // check the results at following
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd1;
        
        #8
        RESET = 1'b0;
        
        #3
        WRITEREG = 3'd2;
        WRITEDATA = 8'd78;
        WRITEENABLE = 1'b1;
        
        #18
        WRITEENABLE = 1'b0;

        #5
        RESET = 1'b1;
        
        #1
        READREG1 = 3'd3;
        
        #8
        WRITEREG = 3'd1;
        WRITEDATA = 8'd38;
        READREG1 = 3'd1;

        #5
        RESET = 1'b0;
        WRITEENABLE = 1'b1;
        
        #8
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd2;
        WRITEDATA = 8'd71;

        #3
        READREG2 = 3'd2;
        WRITEENABLE = 1'b1;
        
        #2
        WRITEDATA = 8'd15;

        #3
        WRITEREG = 3'd2;
        WRITEDATA = 8'd78;
        
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        
        #5
        WRITEENABLE = 1'b0;
        
        #10
        $finish;
    end
    
    // generate a clock with 10ns period
    always
        #5 CLK = ~CLK;
        

endmodule
