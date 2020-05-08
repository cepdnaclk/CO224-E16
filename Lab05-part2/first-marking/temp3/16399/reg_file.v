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
        
        //give read registers
        #1
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        

        
        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd95;
        WRITEENABLE = 1'b1;
        RESET = 1'b1;
        
        //check the RESET=1 WRITEENABLE=1 at rising egde of CLK
        #10
        WRITEENABLE = 1'b0;
        RESET = 1'b0;

        #10
        READREG1 = 3'd2;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        

        #4
        //check read and write at the same clock edge
        READREG1=1'b1;
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
   
    input [7:0]IN; input [2:0]INADDRESS,OUT1ADDRESS,OUT2ADDRESS;
    output [7:0]OUT1,OUT2;
    input WRITE,CLK,RESET;
    
    //8*8 reg
    reg[7:0] REGISTERS[7:0];

    
    

    integer i;
    always @ (posedge CLK,RESET)begin

        //write if reset is 0
        if(RESET == 1'b0)begin
            //check whether write is enabled
            if(WRITE == 1'b1)begin
               #2 REGISTERS[INADDRESS] =  IN; 
            end
        end
        //write 0 if reset is 1
        if(RESET == 1'b1 )begin
            #2
            for (i = 0; i < 8; i = i + 1) begin
               REGISTERS[i] = 8'd0;
            end
        end
        
    end

    //read asynchrounously 
    assign #2 OUT1 =  REGISTERS[OUT1ADDRESS];
    assign #2 OUT2 =  REGISTERS[OUT2ADDRESS];
endmodule