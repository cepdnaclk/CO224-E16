//C0224
//Author : P.M.M.P Randeniya
//E/16/313


//testbench module for regfile
module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    //define register file
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
        
        #5
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        
        #8
        RESET = 1'b0;
        WRITEENABLE = 1'b1;

        #6
        WRITEREG = 3'd2;
        WRITEDATA = 8'd95;
       
        
        #6
        WRITEENABLE = 1'b0;
        
        #10
        READREG1 = 3'd2;
        WRITEENABLE = 1'b1;
        WRITEDATA = 8'd28;

        #5
        WRITEREG = 3'd1;
        RESET = 1'b1;
        READREG2 = 3'd4;
        
        
        #10
        WRITEENABLE = 1'b0;
        RESET = 1'b0;
        READREG1 = 3'd2;
        
        #15
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
      
        #5
        $finish;
    end
    
    // clock signal generation
    always
        #10 CLK = ~CLK;
        

endmodule
