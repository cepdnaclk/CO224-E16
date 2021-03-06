/*
    PereraALHE
    E16275
    lab5 part 1
    testbench
*/

module testbench;

    //instantiate 8bit inputs as DATA1, DATA2 then 3 bit SELECT finally 8bit RESULT
    reg [7:0] DATA1, DATA2;
    reg [2:0] SELECT;
    output [7:0] RESULT;

    //call the imported module alu using aluCall module
    alucall alu1(DATA1, DATA2, RESULT, SELECT);

    initial
    begin

        //set the test subjects for testing in various instances
        //------------------------TEST CASE 1---------------------------------
        //DATA1 = -1; DATA2 = +1;
        DATA1 = 8'b11111111;
        DATA2 = 8'b00000001;

        //RESULT = DATA2;
        SELECT = 3'b000;

        #10
        //RESULT = DATA1 + DATA2;
        SELECT = 3'b001;

        #10
        //RESULT = DATA1 & DATA2;
        SELECT = 3'b010;

        #10 
        //RESULT = DATA1 | DATA2;
        SELECT = 3'b011;

        //------------------------TEST CASE 2---------------------------------
        #10
        //Reinitialise DATA1 = 50; DATA2 = 58
        DATA1 = 8'b00110010;
        DATA2 = 8'b00111010;

        //RESULT = DATA2;
        SELECT = 3'b000;

        #10
        //RESULT = DATA1 + DATA2;
        SELECT = 3'b001;

        #10
        //RESULT = DATA1 & DATA2;
        SELECT = 3'b010;

        #10 
        //RESULT = DATA1 | DATA2;
        SELECT = 3'b011;

        //------------------------TEST CASE 3---------------------------------
        #10
        //Reinitialise DATA1 = -60; DATA2 = -58
        DATA1 = 8'b00110010;
        DATA2 = 8'b11000110;

        //RESULT = DATA2;
        SELECT = 3'b000;

        #10
        //RESULT = DATA1 + DATA2;
        SELECT = 3'b001;

        #10
        //RESULT = DATA1 & DATA2;
        SELECT = 3'b010;

        #10 
        //RESULT = DATA1 | DATA2;
        SELECT = 3'b011;

    end

    initial 
    begin

        //Check the result of each output variables when changes happens in the input variable
        $monitor($time , " DATA1 = %b , DATA2 = %b , SELECT = %b , RESULT = %b", DATA1, DATA2, SELECT, RESULT);

    end

	initial 
    	begin
		//create a wavedata file for view the behavior of the simulation process
        	$dumpfile("wavedata.vcd");
        	$dumpvars(0, testbench); 
    	end

endmodule

//-------------------------------------------------------------------------------
//call the module alu in alu.v
module alucall(DATA1, DATA2, RESULT, SELECT);

    //set values for the alu module
	input [7:0] DATA1, DATA2;
	input [2:0] SELECT;
	output [7:0] RESULT;
    wire [7:0] RESULT;

    //connect alu module to the testbench
	alu alu1(.DATA1(DATA1), .DATA2(DATA2), .SELECT(SELECT), .RESULT(RESULT));

endmodule
