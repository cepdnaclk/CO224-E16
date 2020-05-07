/* CO224 Lab - 05 Part 2 - Register File */
/* Name : Adikari A.M.I.N. */
/* Reg no. : E/16/012 */
/* module for testbench for reg_file module */
module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLOCK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLOCK, RESET);
       
    initial
    begin
        CLOCK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
        RESET = 1'b1;
        READREG1 = 3'd6;
        READREG2 = 3'd4;
        
        #8
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd7;
        WRITEDATA = 8'd121;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1
        READREG1 = 3'd3;
        
        #9
        WRITEREG = 3'd0;
        WRITEDATA = 8'd33;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd0;
        
        #9
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd5;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd83;
        WRITEENABLE = 1'b1;
        
        #8
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd6;
        WRITEDATA = 8'd27;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLOCK = ~CLOCK;
        

endmodule