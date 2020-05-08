/*module reg_file_tb;//this is the test bench written 
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);//giving inputs and getting output are done via this(just like calling)
       
    initial
    begin
        CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output(these all were provided) 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #5
        RESET = 1'b1;
        READREG1 = 3'd4;
        READREG2 = 3'd6;
        
        #8
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd1;
        WRITEDATA = 8'd82;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #7
        READREG1 = 3'd3;
        
        #9
        WRITEREG = 3'd1;
        WRITEDATA = 8'd75;
        WRITEENABLE = 1'b0;
        READREG1 = 3'd1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd2;
        WRITEDATA = 8'd70;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd35;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
        
        #8
        WRITEENABLE = 1'b0;
        
	#10
        WRITEREG = 3'd6;
        WRITEDATA = 8'd22;
        WRITEENABLE = 1'b1;

        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule
*/
module reg_file (IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);//just as method

        //ports declaration
	//initialize outputs and these names are as given in pdf
        output [7:0]OUT1;           
        output [7:0]OUT2;
	//initialize inputs
	input [7:0]IN;
	input [2:0]INADDRESS;         
	input [2:0]OUT1ADDRESS; 
	input [2:0]OUT2ADDRESS;
	input WRITE;
        input CLK;
        input RESET; 

        reg [7:0]OUT1;//reg is used as data type for variables to which values are assigned
	reg [7:0]OUT2;
	reg [7:0] REGISTERS[0:7];
	integer i;//for the 'for loop'
		
        always @ (*) //get change level triggerd  
	begin
	       if(RESET == 1)// when reset is 1 all the registers get the value 0 and reset is level triggered
	       begin
		   #2;  //registers reset delay
		   for (i=0; i<8; i=i+1)//this is done in a loop
		   begin
		       REGISTERS[i]=8'b0;// all registers getting 0
		   end
	       end
        end	       
	always @ (posedge CLK) //write is happened at positive edge of the clock      
	begin
	       if (WRITE == 1 && RESET == 0)  //this happen when write is enabled and registers are not reseting
               begin
		   #2;  //registers write delay
                   REGISTERS[INADDRESS] <= IN; //values get assigned to registers in the file
               end
        end				              
        
	always @ (REGISTERS[OUT1ADDRESS] , REGISTERS[OUT2ADDRESS])//to run always when the input values get changed
	begin 
	      #2;//registers read delay	
              OUT1 <= REGISTERS[OUT1ADDRESS];  //read values get assigned
              OUT2 <= REGISTERS[OUT2ADDRESS];   
        end 	
endmodule


	
	 
	
	
