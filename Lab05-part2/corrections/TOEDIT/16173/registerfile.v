 module reg_file  
 (  
      input          [7:0]     WRITEDATA,  		// write data
      
      output          [7:0]     REGOUT1,  			// regiser 1 data
    
      output          [7:0]     REGOUT2 ,			//register 2 data
	  					
      input          [2:0]     WRITEREG,  			// write port  
	  										
      input          [2:0]     READREG1,  			//read port 1  
	 																		  
      input          [2:0]     READREG2,  			//read port 2
	  
	  input                    WRITEENABLE,  		//enable write register
	  
	  input                    clk,  								//clock signal
	  
      input                    reset							//reset signal
 );  
 
 
      reg     [7:0]     reg_array [7:0];  						// initialize registers 
	  
	  integer i;															// for for loop
	  
      always @ (posedge clk or reset) begin  
           
		   if(reset) begin  
				#2
				for(i=0;i<8;i =i+1) 									// if reset enable (asynchronous)
				begin			
					reg_array[i] = 8'b0;  							// reset all registers to 0
				end		
           end  
		   
           else begin  
                if(WRITEENABLE) begin  						// if write is enable when clock edge
					#2
                     reg_array[WRITEREG] = WRITEDATA;  				// write to the register
                end  
           end  
      end  
	 
      assign REGOUT1 = ( READREG1 == 0)? 8'b0 : reg_array[READREG1];  		// register 1 data to output 1
      assign REGOUT2 = ( READREG2 == 0)? 8'b0 : reg_array[READREG2];  		// register 2 data to output 2
	  
	  
 endmodule   



module regiser_file_testbench;

    //input signals
	
    reg [7:0] WRITEDATA;

    reg [2:0] WRITEREG, READREG1, READREG2;

    reg CLK, RESET, WRITEENABLE; 

	//output 
	
    wire [7:0] REGOUT1, REGOUT2;

   //initialize register_file module

    register_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);

       
    initial

    begin

        CLK = 1'b1;

        // generate files needed to plot the waveform using GTKWave

        $dumpfile("register_file_wavedata.vcd");

		$dumpvars(0, regiser_file_testbench);

        

        // assign values with time to input signals to see output 

        RESET = 1'b0;

        WRITEENABLE = 1'b0;


        #1

        RESET = 1'b1;

        READREG1 = 3'd0;

        READREG2 = 3'd4;

        #5

        RESET = 1'b0;

        #6

        WRITEREG = 3'd4;

        WRITEDATA = 8'd55;

        WRITEENABLE = 1'b1;

        #10

        WRITEENABLE = 1'b0;

        #5

        READREG1 = 3'd1;

        #10

        WRITEREG = 3'd1;

        WRITEDATA = 8'd35;

        WRITEENABLE = 1'b1;

        READREG1 = 3'd1;


        #15

        WRITEENABLE = 1'b0;
		
		#5
		RESET = 1'b1;
		
        #6

        WRITEREG = 3'd1;

        WRITEDATA = 8'd6;

        WRITEENABLE = 1'b1;

        #8

        WRITEDATA = 8'd25;

        WRITEENABLE = 1'b1;

        #5

        WRITEENABLE = 1'b0;
		
		#5
		RESET = 1'b0;
		
        #10

        WRITEREG = 3'd1;

        WRITEDATA = 8'd60;

        WRITEENABLE = 1'b1;
		
		#10

        WRITEREG = 3'd2;

        WRITEDATA = 8'd60;

        WRITEENABLE = 1'b1;
		
		#10

        WRITEREG = 3'd1;

        WRITEDATA = 8'd30;

        WRITEENABLE = 1'b1;
		
        #8

        WRITEENABLE = 1'b0;
        
        #10

        $finish;

    end

    // clock signal generation

    always

        #5 CLK = ~CLK;

endmodule
 
 
 
 
 