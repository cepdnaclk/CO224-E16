// make test bench
`timescale 1ns /  1ps

module alu(
    input  [7:0] DATA1 , DATA2 ,            // ALU 8 bit input
    output [7:0] RESULT ,                   // ALU output
    input  [2:0] SELECT                     // ALU selector
    
    );
    reg    [7:0] ALU_out ;

    assign RESULT = ALU_out ;

    
    always @( SELECT , DATA1 , DATA2 )     //  make a synchronizer clk is more suitable
    begin 
  
      case( SELECT )
      3'b000 :                              // Forward
        #1 ALU_out =  DATA2 ;
      3'b001:
        #2 ALU_out = DATA1 + DATA2  ;         // Add
      3'b010:
        #1 ALU_out = DATA1 & DATA2  ;         // AND
      3'b011:
        #1 ALU_out = DATA1 | DATA2  ;         // Or

   //  default: 
                                           // reserved for future functions units 
      endcase
    end

endmodule
