module reg_file_tb;                           //testbench for reg_file
    
    reg [7:0] WRITEDATA;                      //8 bit register for WRITEDATA
    reg [2:0] WRITEREG, READREG1, READREG2;   //3 bit registers for WRITEREG,READREG1,READREG2
    reg CLK, RESET, WRITEENABLE;              //registers for RESET,WRITEENABLE
    wire [7:0] REGOUT1, REGOUT2;              //8 bit wires for REGOUT1,REGOUT2
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);  
       
    initial
    begin
        
        $dumpfile("dump.vcd");        //dumpfile
		$dumpvars(0, reg_file_tb);
        //assigning values with time 
        CLK=1'b1;                    //initializing valuess
        RESET = 1'b1;
        WRITEENABLE = 1'b0;
        
        #5
        RESET = 1'b0;
        
        #1
        WRITEREG = 3'd5;
        WRITEDATA = 8'd54;
        READREG1 = 3'd1;
        READREG2 = 3'd2;
       
        #10
        WRITEDATA = 8'd12;
        WRITEENABLE = 1'b1;
        WRITEREG = 3'd3;
        
        #1
        READREG2 = 3'd5;
        
        #9
        WRITEENABLE = 1'b0;
        
        #2
        READREG1 = 3'd3;
        
        #9
        WRITEREG = 3'd1;
        WRITEDATA = 8'd55;
        WRITEENABLE = 1'b1;
        READREG2 = 3'd1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #3
        READREG1 = 3'd5;
        
        #7
        WRITEREG = 3'd5;
        WRITEDATA = 8'd61;
        WRITEENABLE = 1'b1;
        
        #5
        READREG2 =3'd7;
        
        #5
        WRITEDATA = 8'd23;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd2;
        WRITEDATA = 8'd57;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #2
        WRITEREG = 3'd5;
        WRITEDATA = 8'd35;
        READREG2 = 3'd1;
        
        #10
        RESET = 1'd1;
        READREG2 = 3'd6;
        
        #4
        RESET = 1'd0;
        
        #5
        WRITEENABLE = 1'b1;
        READREG1 = 3'd2;    
        
        #1
        WRITEDATA = 8'd24;
        
        #4
        WRITEREG = 3'd2;
        
        #10
        WRITEDATA = 8'd29;
        WRITEREG = 3'd5;
        READREG1 = 3'd2;
        #10
        $finish;               //finish CLK inverting
    end
    
    always
        #5 CLK = ~CLK;     //CLK is iverting in every 5 time uints
        

endmodule

     
     
     
module reg_file(IN,OUT1,OUT2,INADDRESS,OUT1ADDRESS,OUT2ADDRESS,WRITE,CLK,RESET);     //reg_file module instantiation
     input [7:0] IN;                    //8 bit input port for IN
     output [7:0] OUT1;                 //8 bit output port for OUT1
     output [7:0] OUT2;                 //8 bit output port for OUT2	
     input [2:0] INADDRESS;             //3 bit input port for INADDRESS
     input [2:0] OUT1ADDRESS;           //3 bit input port for OUT1ADDRESS
     input [2:0] OUT2ADDRESS;           //3 bit input port for OUT1ADDRESS
     input WRITE;                       //input port for WRITE
     input CLK;                         //input port for CLK
     input RESET;                       //input port for RESET
     reg [7:0] regNum[7:0];             //represent registers as an array of words
     reg [7:0] OUT1;                    //OUT1 register
     reg [7:0] OUT2;                    //OUT2 register
        
     integer i;                         //declare an integer variable
     always @(posedge CLK) begin        //at the positive edge of the CLK
       if ((~RESET) & WRITE) #2 begin   //check whether WRITE is enabled and RESET is disabled
	     regNum[INADDRESS] = IN;        //write data present on IN port to input register specified by the INADDRESS
	   end
     end
     
     always @(*) #2 begin;
	    OUT1=regNum[OUT1ADDRESS];       //register identified by OUT1ADDRESS is read and value is loaded onto OUT1
        OUT2=regNum[OUT2ADDRESS];       //register identified by OUT2ADDRESS is read and value is loaded onto OUT2 
     end
     
     always @(RESET) begin              //at the RESET
        if (RESET) #2 begin             //check whether RESET is enabled
        for(i=0;i<8;i=i+1) begin
           regNum[i]<=8'b00000000;      //make the values of registers as zeros
        end
        end
     end 
endmodule                               //end module



