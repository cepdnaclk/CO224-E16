/*
CO 224 (computer architecture) Lab 05 Task 01
Design: Alu module
Author: Kalpage S.W.
Reg no: E/16/168
Date  : 03/05/2020
*/

module alu (DATA1, DATA2, RESULT, SELECT); 

    /*Ports declaration*/ 
    input [7:0] DATA1, DATA2;       // DATA1 = OPERAND1 , DATA2 = OPERAND2 (8 bit inputs)
    input [2:0] SELECT;             //SELECT = ALUOP (8 bit input)
    output [7:0] RESULT;            //RESULT = ALURESULT (8 bit output)

    /*RESULT variable  can be changed therefore it need to be held in a register*/
    reg RESULT;

    always @ (DATA1, DATA2, SELECT)  //sensitivity list
    begin
        /*Case block*/
        case(SELECT)
        3'b000    : begin           //if SELECT == 000 ; DATA2 --> RESULT 
                        #1
                        RESULT =  DATA2 ;                        
                    end                   
        3'b001    : begin           //if SELECT == 001 ; DATA1 + DATA2 --> RESULT 
                        #2
                        RESULT = DATA1 + DATA2 ;                         
                    end           
        3'b010    : begin           //if SELECT == 010 ; DATA1 and DATA2 --> RESULT 
                        #1
                        RESULT = DATA1 & DATA2 ;                        
                    end
        3'b011    : begin           //if SELECT == 011 ; DATA1 or DATA2 --> RESULT 
                        #1
                        RESULT = DATA1 | DATA2 ;
                    end            
        default   : begin           //Reserved ; RESULT is unknown (don't care)
                        RESULT =  8'bx ;    
                    end                
        endcase
    end

endmodule