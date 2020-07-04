// Computer Architecture (CO224) - Lab 05
// Design: ALU of Simple Processor

`include "alu.v"

module alu_tb;
    reg [7:0]DATA1_t; reg [7:0]DATA2_t; reg [2:0]SELECT_t;
    wire [7:0]RESULT_t;

    alu my_alu(DATA1_t, DATA2_t, RESULT_t, SELECT_t);

    initial
    begin

        // generate files needed to plot the waveform using GTKWave
        $dumpfile("alu_wavedata.vcd");
		$dumpvars(0, alu_tb);

        DATA1_t = 8'b00000001;
        DATA2_t = 8'b00000010;

        SELECT_t = 3'b000;

        #10
        SELECT_t = 3'b001;

        #10
        SELECT_t = 3'b010;

        #10
        SELECT_t = 3'b011;

        #10
        SELECT_t = 3'b111;
    end

    initial
    begin
        $monitor($time, "DATA1_t: %b, DATA2_t: %b, SELECT_t: %b, RESULT_t: %b", DATA1_t, DATA2_t, SELECT_t, RESULT_t);
    end
endmodule
