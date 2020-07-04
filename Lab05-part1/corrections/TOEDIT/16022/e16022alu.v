// CO224 - Computer Architecture - 2020
/* Implementation of an 8-bit ALU can perform four different functions to support the instructions add, sub, and, or, mov, and loadi */
// Reg No : E/16/022

// Part 1 – ALU

/* ADD, AND and OR functional units will use the values in DATA1 and DATA2, perform the corresponding operation, and write the output to RESULT. */
// FORWARD functional unit should simply copy an operand value from DATA2 to RESULT.


/*
module testbench;

    // Declare variables for inputs & outputs
    reg [7:0] DATA1_T, DATA2_T;     // 8 bit input port declarations as DATA1_T & DATA2_T
    reg [2:0] SELECT_T;             // 3 bit input Input port declaration as SELECT_T
    wire [7:0] RESULT_T;            // 8 bit input Output port declaration as RESULT_T

    // instantiate the design block
    alu e16022alu (DATA1_T, DATA2_T, SELECT_T, RESULT_T);

    initial
    begin

        // See how signals vary using command line
        $monitor($time, " DATA1: %b, DATA2: %b, SELECT: %b, RESULT: %b", DATA1_T, DATA2_T, SELECT_T, RESULT_T);

        // Generate files needed to plot the waveform using GTKWave
        $dumpfile("waveData.vcd"); 
        $dumpvars(0, testbench);

    end

    initial
    begin
        
        // Assign values to input ports
        DATA1_T = 8'b11001110;
        DATA2_T = 8'b00101011;
        SELECT_T = 3'b000;

        #5;         // Wait for 5 simulation time unit
        SELECT_T = 3'b001;

        #5;         // Wait for 5 simulation time unit
        SELECT_T = 3'b010;

        #5;         // Wait for 5 simulation time unit
        SELECT_T = 3'b011;

        #5;         // Wait for 5 simulation time unit
        SELECT_T = 3'b100;

        #5;         // Wait for 5 simulation time unit
        DATA1_T = 8'b10010110;
        SELECT_T = 3'b011;

        #5;         // Wait for 5 simulation time unit
        DATA2_T = 8'b11001110;
        SELECT_T = 3'b000;

        #5;         // Wait for 5 simulation time unit
        DATA1_T = 8'b00101110;
        DATA2_T = 8'b11000010;
        SELECT_T = 3'b001;

    end

endmodule
*/


// Define module called alu
module alu (DATA1, DATA2, SELECT, RESULT);

    // Declare input and output ports
    output reg [7:0] RESULT;
    input [7:0] DATA1, DATA2;
    input [2:0] SELECT;

    wire [7:0] RESULTADD, RESULTAND, RESULTOR;
    wire cout;
    
    AddModule addm(DATA1, DATA2, 1'b0, RESULTADD, cout);    // Instance of the module AddModule is created
    ANDModule andm(DATA1, DATA2, RESULTAND);    // Instance of the module ANDModule is created
    ORModule orm(DATA1, DATA2, RESULTOR);       // Instance of the module ORModule is created

    /*
    If SELECT sequence is 000, function is FORWARD 
    If SELECT sequence is 001, function is ADD
    If SELECT sequence is 010, function is AND
    If SELECT sequence is 011, function is OR
    If SELECT sequence is 1XX, it is Reserved for future use
    */
    always @ (DATA1, DATA2, SELECT)
    begin
        if (SELECT == 3'b000) begin
            #1      // Latency for FORWARD function
            assign RESULT = DATA2;          // Copy an operand value from DATA2 to RESULT
        end else if (SELECT == 3'b001) begin
            #2      // Latency for ADD function
            assign RESULT = RESULTADD;      // Add DATA1, DATA2 and assign it to RESULT
        end else if (SELECT == 3'b010) begin
            #1      // Latency for AND function
            assign RESULT = RESULTAND;      // Bitwise AND on DATA1 with DATA2 and assign it to RESULT
        end else if (SELECT == 3'b011) begin
            #1      // Latency for OR function
            assign RESULT = RESULTOR;       // Bitwise OR on DATA1 with DATA2 and assign it to RESULT
        end else begin
            assign RESULT = 8'bx;       // Assign RESULT with xxxxxxxx for Reserved SELECT sequence
        end
    end


endmodule

// Define module called RippleCarryAdder4.
// It instantiates 8 FullAdders. 
module AddModule(d1, d2, cin, resAdd, cout);

    // Declare input and output ports
    input [7:0] d1, d2; input cin;
    output [7:0] resAdd; output cout;
    wire cout, cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7;   // Wires for connecting instances.
    
    // 8 instances of the module FullAdder are created with unique names
    FullAdder fa0(d1[0],d2[0],cin,resAdd[0],cout0);
    FullAdder fa1(d1[1],d2[1],cout0,resAdd[1],cout1);
    FullAdder fa2(d1[2],d2[2],cout1,resAdd[2],cout2);
    FullAdder fa3(d1[3],d2[3],cout2,resAdd[3],cout3);
    FullAdder fa4(d1[4],d2[4],cout3,resAdd[4],cout4);
    FullAdder fa5(d1[5],d2[5],cout4,resAdd[5],cout5);
    FullAdder fa6(d1[6],d2[6],cout5,resAdd[6],cout6);
    FullAdder fa7(d1[7],d2[7],cout6,resAdd[7],cout);

endmodule

// Define module called FullAdder
module FullAdder(d1, d2, cin, resAdd, cout);
    
    // Declare input and output ports
    input d1, d2, cin; 
    output resAdd, cout;

    assign {cout, resAdd} = d1 + d2 + cin;       // Add d1, d2 and assign it to resAdd, while assigning carry to cout

endmodule

// Define module called ANDModule
module ANDModule(d3, d4, r1);

    // Declare input and output ports
    input [7:0] d3, d4;
    output [7:0] r1;

    assign r1 = d3 & d4;      // Bitwise AND on d3 with d4 and assign it to r1

endmodule

// Define module called ORModule
module ORModule(d5, d6, r1);

    // Declare input and output ports
    input [7:0] d5, d6;
    output [7:0] r1;

    assign r1 = d5 | d6;      // Bitwise OR on d5 with d6 and assign it to r1

endmodule
