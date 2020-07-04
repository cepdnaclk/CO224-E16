/*
Author : THUSHARA KAR
E no   : E/16/369
*/
module alu( DATA1, DATA2, RESULT, SELECT); 

    // input declaration
    input [2:0]  SELECT;
    input [7:0]  DATA1, DATA2;

    // output declaration
    output reg [7:0] RESULT; 

    // SELECT parameter initialization
    parameter  [2:0] FORWARD  = 3'b000,
                     ADD      = 3'b001,
                     AND      = 3'b010,
                     OR       = 3'b011;
                     //REVERSED = 3'b100; // for further use

    // always at a change in SELECT or DATA1 or DATA2
    always @ (SELECT or DATA1 or DATA2)

        begin
            case (SELECT)

                // FORWARD :: DATA2 --> RESULT
                FORWARD: begin
                    #1;
                    RESULT = DATA2; 
                end
                // ADD :: DATA1 + DATA2 --> RESULT
                ADD: begin 
                    #2;
                    RESULT = DATA1 + DATA2;
                end
                // AND :: DATA1 & DATA2 --> RESULT
                AND: begin
                    #1;
                    RESULT = DATA1 & DATA2;
                end
                // OR :: DATA1 | DATA2 --> RESULT
                OR:  begin
                    #1;
                    RESULT = DATA1 | DATA2;
                end
                // DEFAULT :: 8'b0 --> RESULT
                default: begin
                    RESULT = 8'b0;
                end

            endcase
        end

endmodule