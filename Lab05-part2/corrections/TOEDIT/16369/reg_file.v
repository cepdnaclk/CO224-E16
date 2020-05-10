/*
Author  : THUSHARA K.A.R.
E No    : E/16/369
*/
module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS,
                OUT2ADDRESS, WRITE, CLK, RESET);

    // input declaration
    input WRITE,CLK,RESET;
    input [2:0] INADDRESS, OUT1ADDRESS,OUT2ADDRESS;
    input [7:0] IN;

    // output declaration
    output [7:0] OUT1, OUT2;

    // register file declaration
    reg [7:0] REG_FILE[7:0];

    // integer count variable
    integer count;

    // always at the positive edge of the CLK
    always @(posedge CLK) begin
        if (WRITE && ~RESET) begin// if WRITE is enabled and RESET is disabled
            #2; // wait for 2ns
            REG_FILE[INADDRESS] = IN; // write the register file with IN data
        end
    end 

    //always at any change 
    always @(*) begin
        if(RESET) begin
            #2; // wait for 2ns
            for(count = 0; count < 8; count= count+1) begin 
                // reset the reg_file with 0
                REG_FILE[count] = 8'h00; 
            end
        end
    end 

    // wait for 2ns and assign continuously
    assign #2 OUT1 = REG_FILE[OUT1ADDRESS]; // assigning to output 1 
    assign #2 OUT2 = REG_FILE[OUT2ADDRESS]; // assigning to output 2

endmodule // module reg_file
