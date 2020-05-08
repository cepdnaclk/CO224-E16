/*
    Name            : De Silva K.R
    Index Number    : E/16/068
    Lab             : Lab 05 - part 2
*/

// register file module
module REG_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

input CLK, RESET, WRITE;                            // CLK, RESET and WRITE inputs
input [7:0] IN;                                     // 8 bit input stream IN
input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;    // 3 bit address ports
output wire [7:0] OUT1, OUT2;                       // 8 bit output streams OUT1 and OUT2

integer i;                                          // for, for-loop                           

// an array with 8, 8-bit locations
reg [7:0] register_array [0:7];

always @ (*) begin
    // resets all registers to zero when RESET is triggered
    if(RESET) begin
        #2
        for(i=0; i<8; i=i+1) begin
            register_array[i]<= 0;
        end
    end
end

always @ (posedge CLK) begin
    // for storing a register with value in IN
    if(WRITE) begin
        // stores IN stream values in the respective register
        register_array[INADDRESS] <= #2 IN;
    end
end   

// retrieving values stored in
assign #2 OUT1 =  register_array[OUT1ADDRESS];
assign #2 OUT2 =  register_array[OUT2ADDRESS];

endmodule

