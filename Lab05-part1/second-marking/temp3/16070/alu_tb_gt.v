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