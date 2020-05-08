// CO224 - Computer Architecture - 2020
// Implementation of a simple 8×8 register file.
// Reg No : E/16/022

// Part 2 - Register File

/*
module testbench;

    // Declare variables for inputs & outputs
    reg [7:0] WRITEDATA;     // 8 bit input port declarations as WRITEDATA
    reg [2:0] WRITEREG, READREG1, READREG2;     // 3 bit input port declarations as WRITEREG, READREG1, READREG2
    reg CLK, RESET, WRITEENABLE;     // 1 bit input port declarations as CLK, RESET, WRITEENABLE
    wire [7:0] REGOUT1, REGOUT2;     // 8 bit output port declarations as REGOUT1, REGOUT2
    
    // instantiate the design block
    reg_file e16022reg_file(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        // Generate files needed to plot the waveform using GTKWave
        $dumpfile("e16022reg_file_wavedata.vcd");
		$dumpvars(0, testbench);
        
        // Assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
        // 1
        RESET = 1'b1;
        READREG1 = 3'd1;
        READREG2 = 3'd5;
        
        #6
        // 7
        RESET = 1'b0;
        
        #5
        // 12
        WRITEREG = 3'd3;
        WRITEDATA = 8'd115;
        WRITEENABLE = 1'b1;
        
        #9
        // 21
        WRITEENABLE = 1'b0;
        
        #1
        // 22
        READREG1 = 3'd3;
        
        #6
        // 28
        WRITEREG = 3'd0;
        WRITEDATA = 8'd58;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd0;
        
        #3
        // 31
        WRITEENABLE = 1'b0;
        
        #10 
        // 41
        WRITEREG = 3'd3;
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        
        #7
        // 48
        WRITEDATA = 8'd35;
        WRITEENABLE = 1'b1;
        
        #10
        // 58
        WRITEENABLE = 1'b0;
        
        #6
        // 64
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
        
        #5
        // 69
        WRITEENABLE = 1'b0;
        
        #11
        $finish;
    end
    
    // Clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule
*/

// Define module called reg_file
module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
    
    // Declare input and output ports
    input [2:0] OUT1ADDRESS, OUT2ADDRESS;
    input [2:0] INADDRESS;
    input [7:0] IN;
    input WRITE, CLK, RESET;
    output reg [7:0] OUT1, OUT2;
    
    // Register set of 8 registers with 8 bits each
    reg [7:0] regset [7:0];

    // 
    always @ (RESET)
    begin
        if (RESET == 1'b1) begin           
            #2;     // reg reset delay
            
            // Reset all register values to zero
            regset[0] <= 8'b0;
            regset[1] <= 8'b0;
            regset[2] <= 8'b0;
            regset[3] <= 8'b0;
            regset[4] <= 8'b0;
            regset[5] <= 8'b0;
            regset[6] <= 8'b0;
            regset[7] <= 8'b0;
            
        end
    end

    // Checking if values referred by OUT1ADDRESS & OUT2ADDRESS are to be changed
    always @ (regset[OUT1ADDRESS], regset[OUT2ADDRESS])
    begin
        #2;     // Register read delay
        OUT1 <= regset[OUT1ADDRESS];    /* Retrieving values stored in register referred by OUT1ADDRESS and load value to OUT1 */
        OUT2 <= regset[OUT2ADDRESS];    /* Retrieving values stored in register referred by OUT2ADDRESS and load value to OUT2 */
    end

    // Checking for availability of rising edge of CLOCK
    always @ (posedge CLK)
    begin
        if (WRITE == 1'b1) begin
            #2;     // Register write delay
            regset[INADDRESS] <= IN;    /* Write data, present in IN port to the input register specified by the INADDRESS */

            #2;     // Register read delay
            OUT1 <= regset[OUT1ADDRESS];    /* Retrieving values stored in register referred by OUT1ADDRESS and load value to OUT1 */
            OUT2 <= regset[OUT2ADDRESS];    /* Retrieving values stored in register referred by OUT2ADDRESS and load value to OUT2 */
        end
    end

endmodule
