//CO224 Computer Architecture
//Lab 5 - Building a Simple Processor
//Part 1 – ALU
//REG. NO: E/16/087

//----ALU Functions---------------------------------------------------
//FORWARD - loadi, mov - (forward DATA2 into RESULT) DATA2 → RESULT
//ADD - add, sub - (add DATA1 and DATA2) DATA1 + DATA2 → RESULT
//AND - and - (bitwise AND on DATA1 with DATA2) DATA1 & DATA2 → RESULT
//OR - Or - (bitwise OR on DATA1 with DATA2) DATA1 | DATA2 → RESULT
//Reserved - Reserved for future functional units
//--------------------------------------------------------------------

//Test Bench ALU
/*module testbench;
    reg [7:0] tDATA1, tDATA2;
    reg [2:0] tSELECT;
    wire [7:0] tRESULT;

    alu testalu(tDATA1, tDATA2, tRESULT, tSELECT);

    initial
    begin
        tDATA1 = 8'b00000010;
        tDATA2 = 8'b11111110;

        tSELECT = 3'b000; //FORWARD

        #10 
        tSELECT = 3'b001; //ADD

        #10
        tSELECT = 3'b010; //AND

        #10 
        tSELECT = 3'b011; //OR

        #10
        tSELECT = 3'b100; //Reserved

        #10
        tSELECT = 3'b101; //Reserved

        #10
        tSELECT = 3'b110; //Reserved

        #10
        tSELECT = 3'b111; //Reserved
        
     
    end

    initial 
    begin
        $monitor($time , " DATA1 = %b , DATA2 = %b , SELECT = %b , RESULT = %b", tDATA1, tDATA2, tSELECT, tRESULT);
        $dumpfile("wavedata.vcd");
        $dumpvars(0,testbench);

    end

endmodule
   */ 

//Module ALU
module alu(DATA1, DATA2, RESULT, SELECT);
    //8-bit input ports for operands
    input [7:0] DATA1, DATA2 ; 
    //3-bit control input port
    input [2:0] SELECT;
    //8-bit output port
    output reg [7:0] RESULT;

    always @(DATA1,DATA2,SELECT)
    begin
        case(SELECT)
            3'b000: //FORWARD
                #1 RESULT = DATA2;
            3'b001: //ADD
                #2 RESULT = DATA1 + DATA2;
            3'b010: //AND
                #1 RESULT = DATA1 & DATA2;
            3'b011: //OR
                #1 RESULT = DATA1 | DATA2;
            default: //Reserved
                RESULT = 8'bxxxxxxxx;
        endcase
    end
endmodule