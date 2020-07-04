/*
    Reg. No :E/16/394
    CO224
*/
//testbench for alu unit
module testbench();

    //create  8 bits registers for Inputs
    reg [7:0] data1_t, data2_t;
    //create 3 bits register for Inputs
    reg [2:0] select_t;
    //create wire for output
    wire [7:0] result_t;

    //instantiate alu
    alu myAlu(data1_t ,data2_t ,result_t ,select_t);

    initial
    begin
        //set value for data1 and data2
        data1_t = 8'b00000001 ;
        data2_t = 8'b00001001 ;
        //set value of select for forward function
        select_t = 3'b000;

        #10
        //change data2 value 
        data2_t = 8'b10000010 ;

        #10
        //set value of select for add function
        select_t = 3'b001 ;

        #10
        //change value of data1 
        data1_t = 8'b11000010 ;

        #10
        //set value of select to and function
        select_t = 3'b010 ;

        #10
        //change value of data2
        data2_t = 8'b01000001 ;

        #10
        //set value of select to or function
        select_t = 3'b011 ;

        #10
        //change value of data1 
        data1_t = 8'b11010010 ;
        
        #10
        //set value of select to reserved function units
        select_t = 3'b100 ;

        #10
        //set value of select to reserved function units
        select_t = 3'b101 ;

        #10
        //set value of select to reserved function units
        select_t = 3'b110 ;

        #10
        //set value of select to reserved function units
        select_t = 3'b111 ;
    end

    initial
    begin
        //see how signals vary with command line
        $monitor( $time, " DATA1 : %b , DATA2 : %b , SELECT : %b , RESULT : %b",data1_t ,data2_t ,select_t ,result_t);
    end
endmodule