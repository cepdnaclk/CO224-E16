
`include "reg_file.v"

module reg_file_tb2;
    
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
		$dumpvars(0, reg_file_tb2);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #2
        RESET = 1'b1;
        READREG1 = 3'd5;
        READREG2 = 3'd1;
        
        #10
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd3;
        WRITEDATA = 8'd90;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        READREG1 = 3'd3;
        
        
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd30;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd4;
        
        #9
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd2;
        WRITEDATA = 8'd10;
        WRITEENABLE = 1'b1;
		READREG2 = 3'd2;
        
        #10
        WRITEDATA = 8'd20;
        WRITEENABLE = 1'b1;
        
        #15
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd6;
        WRITEDATA = 8'd55;
        WRITEENABLE = 1'b1;
		READREG1 =3'd6;
        
        #7
        WRITEENABLE = 1'b0;
        
        #5
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule