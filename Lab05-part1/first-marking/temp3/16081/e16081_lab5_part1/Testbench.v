`include "alu.v"

// make test bench
`timescale 1ns /  1ps

module Testbench;

  reg signed [7:0] DATA1 , DATA2 ;                 // input
  reg [2:0] SELECT ;                        // selector

  wire signed [7:0] RESULT; 
     
  alu functions( DATA1 , DATA2 , RESULT , SELECT );
        initial begin
        //    System output
              $monitor($time , "DATA1 : %b(%d) , DATA2 : %b(%d) , SELECT : %b , RESULT : %b(%d) " , DATA1 , DATA1 , DATA2 , DATA2 , SELECT , RESULT , RESULT );
              $dumpfile( "wavedata.vcd" );
              $dumpvars( 0 , Testbench );
        end 
        initial begin
          #0                          //  forward
          DATA1  = 8'b10000011 ; 
          DATA2  = 8'b010 ;
          SELECT = 3'b000 ;
          #5                          // add
          DATA1  = 8'b011 ; 
          DATA2  = -8'b110 ;
          SELECT = 3'b001 ;
          #5                          // and
          DATA1  = 8'b011 ; 
          DATA2  = 8'b010 ;
          SELECT = 3'b010 ;
          #5                          // or
          DATA1  = 8'b101 ; 
          DATA2  = 8'b010 ;
          SELECT = 3'b011 ;
        end


endmodule
