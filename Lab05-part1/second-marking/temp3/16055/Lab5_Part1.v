//E16055 Lab 5 Part 1




// module testbench;
//     reg[7:0] r1,r2; //input
//     reg[2:0] select;
//     wire[7:0] out; // output

// //ALU operations
//     integer i; // iteration purpose
// alu bit8_Alu(r1,r2,out,select); // 8 and 3 bit input and output for the alu
//     initial begin
//     //initial values
//         r1=8'b00001111;
//         r2=8'b00000101;
//         select=3'b000;
//         for (i=0;i<=4;i=i+1)
//         begin
//             #10;
//             $display("time = %d input 1 = %b input 2 = %b selection = %b result = %b ",$time ,r1,r2,select,out);
//             select=select+3'b001; // changing the selection
//         end;

//     end


// endmodule
//MODULE FOR ALU
module alu (in1,in2,result,select); 
    input[7:0] in1,in2; //8 bit operands
    input[2:0] select; //operation selection 
    output[7:0] result ;// 8 bit outputs

    reg result;
    always @(in1,in2,select)
    begin
        case(select)
            3'b000 :
                #1 result=in2; // forwarding data
            3'b001 :
                #2 result=in1+in2; // addition
            3'b010 :
                #1 result=in1 & in2; // and operation
            3'b011 :
                #1 result=in1 | in2; // or operation
            default:
                result = 8'bXXXXXXXX; // for future functional units 

        endcase  
    end
endmodule
