module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET); 

input[7:0] IN;
input[2:0] INADDRESS,OUT1ADDRESS,OUT2ADDRESS;
input CLK,RESET,WRITE;
output[7:0] OUT1,OUT2;
reg[7:0] OUT1,OUT2;

reg [7:0] regfile[7:0];
integer i;
always @(RESET or posedge CLK ) begin
    if(RESET) 
    begin
        #2;
         for (i=0;i<8;i=i+1)
             begin
             regfile[i]= 8'd0;
            end
    end
end

always @ (posedge CLK)begin
  if(!RESET)begin
    if(WRITE) begin
        #2 regfile[INADDRESS] = IN;
    end 
  end   
end         


always @(*) begin
    #2;
    OUT1 = regfile[OUT1ADDRESS];
    OUT2 = regfile[OUT2ADDRESS];
end



endmodule


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
        RESET = 1'b0;
        READREG1 = 3'd0;
        READREG2 = 3'd5;
        
        #8
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd3;
        WRITEDATA = 8'd56;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1
        READREG1 = 3'd2;
        
        #9
        WRITEREG = 3'd7;
        WRITEDATA = 8'd40;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd7;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
         WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
       
        
        #10
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #10
         WRITEREG = 3'd1;
        WRITEDATA = 8'd85;
        WRITEENABLE = 1'b1;
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule

