/* Computer Architecture (CO224) - Lab 05
 * Design: Register File of a Simple Processor
 * Author: E/16/389 WELIKANDA V.H.L.N.
 * Date	: 02-May-2020
 */

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

	// Port declaration
	input [0:2] OUT2ADDRESS, OUT1ADDRESS, INADDRESS;
	input [0:7] IN;
	input CLK, WRITE, RESET;

	output [0:7] OUT1, OUT2;
	reg [0:7] OUT1, OUT2;

	reg [0:7][0:7] reg_array;
	reg [0:3] i;

	// Resetting the Register Values to zero
	// Positive edge is considered in here becase of the less calculation
	// Eventhough I consider positive edge in here the behavior of the RESET is level trigger in this code
	always @ (posedge RESET)
	begin
		#2	// Resetting delay is 2 time units
		for(i = 0; i < 8; i = i+1) begin
			reg_array[i] = 8'd0;
		end
	end

	// Write a value to the Register
	always @ (posedge CLK)
	begin
		// Level triggering behaviour of RESET is considered in here
		if (WRITE == 1'b1 && INADDRESS && IN && RESET == 1'b0) begin
			reg_array[INADDRESS] = #2 IN;	
		end
	end

	// If the reading address is set correctly this will give the value coresponding to the OUT1ADDRESS to the OUT1
	always @ (OUT1ADDRESS, reg_array[OUT1ADDRESS])
	begin
		case (RESET)
			1'b1:
				#4	// Resetting timing(#2) + Reading timing(#2)
				OUT1 = reg_array[OUT1ADDRESS];
			default:
				#2	// Reading timing(#2)
				OUT1 = reg_array[OUT1ADDRESS];
		endcase
	end

	// If the reading address is set correctly this will give the value coresponding to the OUT2ADDRESS to the OUT2
	always @ (OUT2ADDRESS, reg_array[OUT2ADDRESS])
	begin
		case (RESET)
			1'b1:
				#4	// Resetting timing(#2) + Reading timing(#2)
				OUT2 = reg_array[OUT2ADDRESS];
			default:
				#2	// Reading timing(#2)
				OUT2 = reg_array[OUT2ADDRESS];
		endcase
	end

endmodule

// Provided by Mr.Kisaru Liyanage(IIC/CO224)
// Made some changes in the timing and the values by me
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
        READREG2 = 3'd1;
        
        #6
        RESET = 1'b0;
        
        #4
        WRITEREG = 3'd2;
        WRITEDATA = 8'd23;
        WRITEENABLE = 1'b1;
        
        #12
        WRITEENABLE = 1'b0;
        
        #1
        READREG1 = 3'd2;
        
        #10
        WRITEREG = 3'd3;
        WRITEDATA = 8'd82;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd3;
        
        #9
        WRITEENABLE = 1'b0;
        
        #8
        WRITEREG = 3'd1;
        WRITEDATA = 8'd45;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd67;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #8
        WRITEREG = 3'd3;
        WRITEDATA = 8'd10;
        WRITEENABLE = 1'b1;
        
        #4
        WRITEENABLE = 1'b0;
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        
endmodule
