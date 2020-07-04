/*
    Reg. No :E/16/394
    CO224
*/
module alu( DATA1, DATA2 ,RESULT ,SELECT );
    //ALU module for cpu
    //instantiate 8 bits inputs data1 and data2
    input [7:0] DATA1 ,DATA2 ;
    //instantiate 3 bits input select
    input [2:0] SELECT;
    //instantiate 8 bits output result
    output [7:0] RESULT;
    //create 7 bits register to hold result
    reg [7:0] RESULT;
    //execute whenever data1 , data2 , select value changes
    always @( DATA1 ,DATA2 ,SELECT)
    begin
        //do operation according to value in select
        case(SELECT)
            //if select = 000 forward function ,data2-> result #1 delay
            3'b000 : RESULT = #1 DATA2 ;
            //if select = 001 add function ,data1 + data2 -> result #2 delay
            3'b001 : RESULT = #2 DATA1 + DATA2 ;
            //if select = 010 and function , data1 & data2 -> result #1 delay
            3'b010 : RESULT = #1 DATA1 & DATA2 ;
            //if select = 011 or function , data1 | data2 -> result #1 delay
            3'b011 :RESULT = #1 DATA1 | DATA2;
            //Following are reserved for future functional units #0 delyas
            //if select = 100
            3'b100 : $display("Reserved for future functional unit");
            //if select = 101 
            3'b101 : $display("Reserved for future funtional unit");
            //if select = 110
            3'b110 : $display("Reserved for future funtional unit");
            //if select = 111
            3'b111 : $display("Reserved for future funtional unit");
        endcase


    end

endmodule