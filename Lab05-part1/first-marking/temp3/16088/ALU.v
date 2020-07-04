
module alu(DATA1, DATA2, RESULT, SELECT);

input [2:0]SELECT;  //3bit wire for the select as input           
input  [7:0] DATA1, DATA2; //8bit  wire for DATA1 and DATA2 as input
output reg  [7:0]RESULT; //8bit register for RESULT as output

    always @ (SELECT, DATA1, DATA2)// always block with SELECT, DATA1, DATA2 in the sensitivity list
    case(SELECT) // switch case corespond to SELECT
        3'b000 :
            begin
                #1;
                RESULT = DATA2;        // Fowared operatiom  
            end
        3'b001 :begin
                #2;
                RESULT = DATA1 + DATA2; // add operation
            end
        3'b010 :begin
                #1;
                RESULT = DATA1 & DATA2; // and operation
            end
        3'b011 :begin
                #1;
                RESULT = DATA1 | DATA2; // or operation
            end
    endcase
        
endmodule