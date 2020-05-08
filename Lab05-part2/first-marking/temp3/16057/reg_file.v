module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
    initial
    begin
        $dumpfile("wavedata.vcd");
		$dumpvars(0, reg_file_tb);
    end
       
    initial
    begin
        CLK = 1'b1;
        
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #2
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        
        #7
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd33;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #9
        WRITEREG = 3'd1;
        WRITEDATA = 8'd69;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd178;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd133;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd74;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #5
        $finish;
    end
    
    always
        #5 CLK = ~CLK;

endmodule



module reg_file (IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

    input[7:0] IN; // input data
    output reg [7:0] OUT1, OUT2; // data output
    input[2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS; // 3bit addressess corresponding to register numbers
    input WRITE, CLK, RESET;

    output reg[7:0] registers[0:7]; // 8bit eight registers

    integer l; // for the loop, l is for the loop for clearing registers(if reset enabled)

    // since reading happening always, when either one of the register's content is change, it should show the output
    // 2 times units after change happens(after resetting and writing)
    always @(registers[0] or registers[1] or registers[2] or registers[3] or registers[4] or registers[5] or registers[6] or registers[7]) begin
        
        #2
        OUT1 = registers[OUT1ADDRESS];
        OUT2 = registers[OUT2ADDRESS];
        
    end

    // except the content changing of the register, if either one of read address changes it should give the
    // corresponding output.
    // but if the reset is happening we should give priority to the reset. 
    // since it will be already displaying the output after reset(resetting is like writing 0s)
    always @(OUT1ADDRESS or OUT2ADDRESS) begin 
        if(!RESET) begin
            #2
            OUT1 = registers[OUT1ADDRESS];
            OUT2 = registers[OUT2ADDRESS];
        end          
    end

    // at each pos edge of the clock writing to the register after 2 time units
    always @(posedge CLK) begin    
        if(WRITE) begin
            #2 registers[INADDRESS] = IN;            
        end        
    end

    // if the reset enabled, making all registers to zeroes
    always @ (RESET) begin   
        if(RESET) begin
            #2
            for(l=0; l<8; l=l+1) begin
                registers[l] <= 8'd0;
            end
        end
    end
endmodule
