module alu(DATA1, DATA2, RESULT, SELECT);
    input [7:0] DATA1;
    input [7:0] DATA2;
    output [7:0] RESULT;
    input [2:0] SELECT;
    
    reg [7:0] RESULT;

    always @ (DATA1 or DATA2 or SELECT) // this block run if there is any change in DATA1 or DATA2 or SELECT
    begin
        case (SELECT)
            3'b000:
                RESULT = #1 DATA2;
            3'b001:
                RESULT = #2 DATA1 + DATA2;
            3'b010:
                RESULT = #1 DATA1 & DATA2;
            3'b011:
                RESULT = #1 DATA1 | DATA2;
            default: RESULT = 8'b00000000;
        endcase
    end
    
endmodule