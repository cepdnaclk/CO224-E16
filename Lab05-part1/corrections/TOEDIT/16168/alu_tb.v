/*
CO 224 (computer architecture) Lab 05 Task 01
Design: Alu testbench
Author: Kalpage S.W.
Reg no: E/16/168
Date  : 03/05/2020
*/

`include "alu.v" //importing the alu module to this file

module alu_testbench;

    reg [7:0] in0_t, in1_t; // in0_t = OPERAND1 , in1_t = OPERAND2 
    reg [2:0] sel_t;        // sel_t = ALUOP
    wire [7:0] out_t;       // out_t = ALURESULT 

    alu myalu(in0_t,in1_t,out_t,sel_t);

    initial
    begin
        //see how signals vary using command line
        $monitor($time, " in0: %b, in1: %b, sel: %b --> out: %b",in0_t,in1_t,sel_t,out_t);
    
        //generate files which are  needed to plot the waveform using GTKWAVE 
        $dumpfile("alu_wavedata.vcd");
        $dumpvars(0, alu_testbench);
    end

    initial
    begin
        //for SELECT == 000 and checking for different data inputs
        sel_t = 3'b000;
        in0_t = 8'b00110011;
        in1_t = 8'b00111100;    
        #10
        in1_t = 8'b11001100;    
        #10
        in0_t = 8'b11001100; 
        in1_t = 8'b00111100;  
        #10
        in1_t = 8'b11001100; 
        #70

        //for SELECT == 001 and checking for different data inputs
        sel_t = 3'b001; 
        in0_t = 8'b00110011;
        in1_t = 8'b00111100;    
        #10
        in1_t = 8'b11001100;    
        #10
        in0_t = 8'b11001100; 
        in1_t = 8'b00111100;  
        #10
        in1_t = 8'b11001100; 
        #70

        //for SELECT == 010 and checking for different data inputs
        sel_t = 3'b010;
        in0_t = 8'b00110011;
        in1_t = 8'b00111100;    
        #10
        in1_t = 8'b11001100;    
        #10
        in0_t = 8'b11001100; 
        in1_t = 8'b00111100;  
        #10
        in1_t = 8'b11001100; 
        #70

        //for SELECT == 011 and checking for different data inputs
        sel_t = 3'b011;
        in0_t = 8'b00110011;
        in1_t = 8'b00111100;    
        #10
        in1_t = 8'b11001100;    
        #10
        in0_t = 8'b11001100; 
        in1_t = 8'b00111100;  
        #10
        in1_t = 8'b11001100; 
        #70

        //for SELECT == 100 and checking for different data inputs
        sel_t = 3'b100;
        in0_t = 8'b00110011;
        in1_t = 8'b00111100;    
        #10
        in1_t = 8'b11001100;    
        #10
        in0_t = 8'b11001100; 
        in1_t = 8'b00111100;  
        #10
        in1_t = 8'b11001100;     
        
    end

endmodule




