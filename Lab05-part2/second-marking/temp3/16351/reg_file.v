/* Computer Architecture Lab 05 Part II
 * Design: Register File
 * Author: E/16/351 Shanaka T.K.M.
 * Date	: 03-May-2020
 */

 module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
 	//Defining ports
 	input [0:2] OUT2ADDRESS, OUT1ADDRESS, INADDRESS;
	input [0:7] IN;
	input CLK, WRITE, RESET;
	output [0:7] OUT1, OUT2;

	reg [0:7] OUT1, OUT2;
	reg [0:7] register_array [0:7];
	reg [0:3] i;//increment

	//Set output 1
	always @ (OUT1ADDRESS, register_array[OUT1ADDRESS])
	begin
		case(RESET)
			1'b1:
				//Delaying time = resetting time + reading time =4
				#4
				OUT1 = register_array[OUT1ADDRESS];
			1'b0:
				//Only reading time delaying
				#2
				OUT1 = register_array[OUT1ADDRESS];
		endcase
		
	end
	//Set output2
	always @ (OUT2ADDRESS, register_array[OUT2ADDRESS])
	begin
		case(RESET)
			1'b1:
				//Delaying time = resetting time + reading time =4
				#4
				OUT2 = register_array[OUT2ADDRESS];
			1'b0:
				//Only reading time delaying
				#2
				OUT2 = register_array[OUT2ADDRESS];
		endcase
	end

	//Resetting
	always @ (posedge RESET)
	begin
		//2 units time delaying
		#2
		//set all values to zero
		for(i=0;i<8;i=i+1)
		begin
			register_array[i] = 8'b00000000;
		end
	end

	//Writing values
	always @ (posedge CLK)
	begin
		if(WRITE && (~RESET )) 
		begin
			//Time delaying of 2 when writing
			#2
			//Writing in register file
			register_array[INADDRESS] = IN;
		end
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
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        
        #8
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd80;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1
        READREG1 = 3'd2;
        
        #9
        WRITEREG = 3'd1;
        WRITEDATA = 8'd35;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITEENABLE = 1'b1;

        #10
        READREG1 = 3'd1;
        READREG2 = 3'd2;

         #10
        READREG1 = 3'd3;
        READREG2 = 3'd4;
        
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