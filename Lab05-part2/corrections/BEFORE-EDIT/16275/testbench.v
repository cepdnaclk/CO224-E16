//E 16 275
//Perera ALHE
//Lab 5 
//Part 2 Register File
//Test Bench

module testbench;

    //define variables for the simulation
    reg [7:0] IN;                           //input data 8bit word
    reg [2:0] INADDRESS;                    //address the input will be saved 3 bit
    reg WRITE, CLK, RESET;                  //the ports that contain the boolean value og WRITE RESET and CLK
    reg [2:0] OUT1ADDRESS, OUT2ADDRESS;     //address that contains the outputs from the registry

    wire [7:0] OUT1, OUT2;                  //take the output through wires 

    reg [7:0] rf [7:0];                     //create 64 bit array of bits divided into 8 equal registers


    //Call the external module reg_file using reg_file_call module
    reg_file_call rg(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

    //initiate the test module to simulate test cases
    initial
    begin
	
	CLK = 1'b1;			//set CLK = 1
	RESET = 1'b0;			//set RESET = 0
	WRITE = 1'b0;			//set WRITE = 0
	OUT1ADDRESS = 3'd1;		//OUT1 gives the value that saves the data in OUT1ADDRESS position in the reg file
	OUT2ADDRESS = 3'd2;		//OUT1 gives the value that saves the data in OUT1ADDRESS position in the reg file

	#2				//wait 2 seconds
	RESET = 1'b1;			//RESET = 1

	#11				//wait 11 seconds
	RESET = 1'b0;			//RESET = 0
	
	#1
	OUT1ADDRESS = 3'd3;		//OUT1 gives the value that saves the data in OUT1ADDRESS position in the reg file
	OUT2ADDRESS = 3'd4;		//OUT2 gives the value that saves the data in OUT2ADDRESS position in the reg file

	#5				//wait 5 seconds
	WRITE = 1'b1;			//WRITE = 1
	IN = 8'd15;			//IN = 15 data is entered
	INADDRESS = 3'd3;		//INADDRESS = 3 the palce where the value is stored
	
	#7				//wait for 7 seconds
	WRITE = 1'b0;			//WRITE  = 0

	#3				//wait for 3 seconds
	RESET = 1'b1;			//RESET = 1

	#5				//wait for 5 seconds
	RESET = 1'b0;			//RESET = 0

	#4				//wait for 4 seconds 
	IN = 8'd18;			//IN = 18 data is entered
	INADDRESS = 3'd4;		//INADDRESS = 4 where the entered data will be saved	

	#1				//wait for 1 seconds
	WRITE = 1'b1;			//WRITE = 1 
	IN = 8'd12;			//IN = 12 data is entered
	INADDRESS = 3'd4;		//INADDRESS = 4 where the entered data will be saved

	#7				//wait for 7 seconds
	WRITE = 1'b0;			//WRITE = 0 
                                                                                                                                                                                                     

        //end of the simulation
        $finish;
    end

    always
    begin
        #5 CLK = ~CLK;                  //Running signal of a clock has 10sec period
    end

    initial
    begin

        //Monitor the data with inputs and display the inputs with outputs
        $monitor($time, " IN = %b OUT1 = %b OUT2 = %b INADDRESS = %b OUT1ADDRESS = %b OUT2ADDRESS = %b WRITE = %b RESET =%b",IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, RESET);

        $dumpfile("wavedata.vcd");        //create the waveforms for the simulation
        $dumpvars(0, testbench);            
    end

endmodule

//call the external module called reg_file 
module reg_file_call(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

    //define the ports such inputs outputs for external module that connected into testbench
    input [7:0] IN;
    input [2:0] INADDRESS;
    input WRITE, CLK, RESET;
    input [2:0] OUT1ADDRESS, OUT2ADDRESS;
    output wire [7:0] OUT1, OUT2;

    reg [7:0] rf [7:0];

    //inside reg_file_call connect the module reg_file
    reg_file rg(.IN(IN), .OUT1(OUT1), .OUT2(OUT2), .INADDRESS(INADDRESS), .OUT1ADDRESS(OUT1ADDRESS), .OUT2ADDRESS(OUT2ADDRESS), .WRITE(WRITE), .CLK(CLK), .RESET(RESET));

endmodule
