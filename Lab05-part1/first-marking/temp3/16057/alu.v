module testbench;

    reg[7:0] DATA1_t, DATA2_t; // declaring 8bit inputs
    reg[2:0] SELECT_t; // declaring 3bit aluop code
    wire[7:0] RESULT_t; // 8bit output

    alu myalu(DATA1_t, DATA2_t, RESULT_t, SELECT_t); // instantiating a alu
    
    initial
    begin  // displaying inputs and outputs
        $monitor($time, " DATA1_t: %b, DATA2_t: %b, SELECT_t: %b, RESULT_t: %b", DATA1_t,DATA2_t, SELECT_t,RESULT_t);
    end

    initial
    begin
        DATA1_t = 8'b00001111;  // assigning values to check functionality
        DATA2_t = 8'b11110000;

        SELECT_t = 3'b001;  // add operation

        #10
        SELECT_t = 3'b010; //and operation

        #10
        SELECT_t = 3'b011; // or operation

        #10
        DATA1_t = 8'b10101011; // changing values of data1 and data2
        DATA2_t = 8'b01100110;

        #10
        SELECT_t = 3'b000; // mov operation

        #10
        SELECT_t = 3'b111; // unused bit combination, doesn't changing results

        

    end

endmodule


module alu(DATA1, DATA2, RESULT, SELECT);

    input[7:0] DATA1, DATA2; // declaring 8bit input ports
    input[2:0] SELECT;  // 3bit input port for ALUOp code
    output reg[7:0] RESULT; // 8bit output

    always @ (DATA1 or DATA2 or SELECT)begin  // always block execute if either of inputs are changed
        case (SELECT)
            3'b001 : #2 RESULT = DATA1 + DATA2;  // add-sub operation opcode 001
            3'b000 : #1 RESULT = DATA2;          // mov-loadi opcode 000, moving data2 to result
            3'b010 : #1 RESULT = DATA1 & DATA2;  // bitwise and opcode 010
            3'b011 : #1 RESULT = DATA1 | DATA2;  // bitwise or opcode 011
            
            /////default: $monitor("%b IS AN INVALID ALUOP SIGNAL.", SELECT);
        endcase        
    end

endmodule
