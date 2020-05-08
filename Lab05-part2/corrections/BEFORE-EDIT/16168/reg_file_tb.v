/*
CO 224 (computer architecture) Lab 05 Task 02
Design: Register file module
Author: Kalpage S.W.
Reg no: E/16/168
Date  : 03/05/2020
*/

`include "reg_file.v" //importing the reg_file module to this file

module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1; //initalize clock
        
        //generate files which are  needed to plot the waveform using GTKWAVE
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
    end

    initial
    begin   
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1 //when resetting and reading from a register at same time 
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd4;

        #8
        RESET = 1'b0;
        
        #5//writing to a register
        WRITEREG = 3'd2;
        WRITEDATA = 8'd95;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1//changing the readregister1
        READREG1 = 3'd2;
        
        #9//writing into a  reading register
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
        
        #10// when writing to a register and reading from that same register at same time 
        READREG1 = 3'd2;
        WRITEENABLE = 1'b0;
        
        #6
        READREG1 = 3'd1;
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
        
        #10//reading after writing to a register    
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd46;
        WRITEENABLE = 1'b1;

        #1
        RESET = 1'b1;
        READREG1 = 3'd0;

        #5//writing to a register while reset is 1 
        WRITEREG = 3'd0;
        WRITEDATA = 8'd95;

        #8
        RESET = 1'b0;
        WRITEREG = 3'd1;
        WRITEDATA = 8'd40;


        #5//both reading registers are same register 
        READREG1 = 3'd1;
        READREG2 = 3'd1;
        
        #1
        WRITEENABLE = 1'b0;

        #6//writing when write enable = 0
        WRITEDATA = 8'd45;

        #4
        WRITEENABLE = 1'b1;

        #6
        WRITEDATA = 8'd47;
        
        #1
        WRITEENABLE = 1'b0;

        #1//small ripple of write enable high
        WRITEENABLE = 1'b1;

        #6
        WRITEDATA = 8'd48;
        WRITEENABLE = 1'b0;

        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule
