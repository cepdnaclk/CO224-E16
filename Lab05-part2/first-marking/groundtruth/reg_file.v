// Computer Architecture (CO224) - Lab 05
// Design: Register File of Simple Processor
// Author: Kisaru Liyanage

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
        
        #11
        READREG1 = 3'd2;
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


module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
    
    // ports declaration
    input [7:0] IN;
    input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;
    input CLK, RESET, WRITE; 
    output [7:0] OUT1, OUT2;
    
    // array of registers for 8*8 reg file
    reg [7:0] regfile [7:0];
    
    /* START DEBUGGING CODE */
    initial
    begin
        // monitor changes in reg file content and print (used to check whether the CPU is running properly)
        #5;
        $display("\n\t\t\t==================================================");
        $display("\t\t\t Change of Register Content Starting from Time #5");
        $display("\t\t\t==================================================\n");
        $display("\t\ttime\treg0\treg1\treg2\treg3\treg4\treg5\treg6\treg7");
        $display("\t\t--------------------------------------------------------------------");
        $monitor($time, "\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", regfile[0], regfile[1], regfile[2], regfile[3], regfile[4], regfile[5], regfile[6], regfile[7]);
    end
    /* END DEBUGGING CODE */
    
    assign #2 OUT1 = regfile[OUT1ADDRESS];
    assign #2 OUT2 = regfile[OUT2ADDRESS];
    
    integer i;
    
    // reg_file functionality
    always @ (posedge CLK, posedge RESET) // async reset
    begin
        if (RESET) begin
            #2;
            for (i = 0; i < 8; i = i + 1) begin
                regfile[i] = 0;
            end
        end else begin
            if (WRITE) begin
                #2 regfile[INADDRESS] = IN;
            end
        end
    end
    
endmodule