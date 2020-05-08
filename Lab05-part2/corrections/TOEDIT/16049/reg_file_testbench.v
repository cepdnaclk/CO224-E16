/*
E16049
CO224 
Lab5
testbench for reg file
*/

module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;//initial clock signal
        
        // generate .vcd file for gtkwave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        //t=0
        #1
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        //t=1
        #8
        RESET = 1'b0;
        //t=9
        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd95;
        WRITEENABLE = 1'b1;
        //t=14
        #10
        WRITEENABLE = 1'b0;
        //t=24
        #1
        READREG1 = 3'd2;
        //t=25
        #9
        WRITEREG = 3'd1;
        WRITEDATA = 8'd28;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd1;
        //t=34
		#5
		WRITEDATA = 8'd31
		//t=39
        #5
        WRITEENABLE = 1'b0;
        //t=44
        #5
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITEENABLE = 1'b1;
		//T=49
        #5
		WRITEREG = 3'd5;
		WRITEDATA = 8'd26;
		//t=54
        #10
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        //t=64
        #10
        WRITEENABLE = 1'b0;
        //t=74
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
        //t=80
        #5
        WRITEENABLE = 1'b0;
        //t=85
        #10
		//t=95
        $finish;
    end
    
    //clock signal 
    always
        #5 CLK = ~CLK;
        

endmodule
