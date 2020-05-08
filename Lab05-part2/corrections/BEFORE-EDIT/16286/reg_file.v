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
        
        #5
        WRITEREG = 3'd3;
        WRITEDATA = 8'd54;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #5
        READREG1 = 3'd3;
        
        #7
        WRITEREG = 3'd5;
        WRITEDATA = 8'd89;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd1;
        READREG2 = 3'd5;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd2;
        WRITEDATA = 8'd36;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd15;
        RESET = 1'b1;
        READREG2 = 3'd2;
        
        #7
        WRITEENABLE = 1'b0;
        RESET = 1'b0;

        #6
        WRITEREG = 3'd7;
        WRITEDATA = 8'd76;
        WRITEENABLE = 1'b1;
        
        #5
        READREG2 = 3'd7;
        WRITEENABLE = 1'b0;

        #1
        RESET = 1'b1;

        #7
        READREG2 = 3'd7;
        RESET = 1'b0;
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        
    
endmodule

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

    //ports declaration
    //IN,OUT1,OUT2,INADDRESS,WRITE,CLK,RESET ports are inputs
    //OUT1ADDRESS,OUT2ADDRESS ports are the outputs
    //we assign values into output ports .Therefore they must be registers
    input [7:0]IN; input [2:0]INADDRESS,OUT1ADDRESS,OUT2ADDRESS;
    output [7:0]OUT1,OUT2;
    input WRITE,CLK,RESET;

    //instantiate 8x8 register file
    //it is used to store values.Therefore it must be reg type  
    //represented as array of words
    reg[7:0] register_file[7:0];

    // registers identified by OUT1ADDRESS and OUT2ADDRESS are read and the values are loaded onto OUT1 and OUT2
    assign #2 OUT1 = (RESET)? 1'd0 : register_file[OUT1ADDRESS];
    assign #2 OUT2 = (RESET)? 1'd0 : register_file[OUT2ADDRESS];
    
    //instantiate variables i,j for next iterating procedures
    integer i;
    always @ (posedge CLK,RESET)begin
        if(CLK == 1'b1)begin
            //if Clock is on rising edge 
            // data present on the IN port (from the instruction that just completed) to be written to the input register specified by the INADDRESS
            //this is done only if WRITE signal is enabled
            if((RESET != 1'b1) && (WRITE == 1'b1))begin
               #2 register_file[INADDRESS] =  IN; 
            end
        end
        if(RESET == 1'b1 )begin
            //if Reset is on falling edge
            //register file values are reset
            #2
            for (i = 0; i < 8; i = i + 1) begin
                register_file[i] = 8'd0;
            end
        end
        
    end
endmodule