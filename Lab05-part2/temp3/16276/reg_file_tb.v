/****************************************
reg_file_tb module
Name    : Perera G K B H
ENo     : E/16/276
*****************************************/

`include "reg_file.v"

module reg_file_tb;
    
    //declare variables
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    //calling the module to be tested
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        ///monitor using gtkwave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        //testing the module 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
        RESET = 1'b1;
        
        #2
        WRITEENABLE = 1'b1;
        WRITEREG = 3'd4;
        WRITEDATA = 8'd95;

        
        #5
        READREG1 = 3'd4;
        READREG2 = 3'd2;
        
        #5
        RESET = 1'b0;               
        
        
        #17
        WRITEREG = 3'd4;
        WRITEDATA = 8'd25;
        READREG1 = 3'd4;
        READREG2 = 3'd7;

        #1
        WRITEENABLE = 1'b0;
        
        #7
        WRITEREG = 3'd5;
        WRITEDATA = 8'd25;
        READREG1 = 3'd5;
        READREG2 = 3'd4;
        
        #6
        WRITEREG = 3'd6;
        WRITEDATA = 8'd78;
        WRITEENABLE = 1'b1;

        #4
        READREG1 = 3'd6;
        READREG2 = 3'd5;
        
        #8
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        
endmodule
