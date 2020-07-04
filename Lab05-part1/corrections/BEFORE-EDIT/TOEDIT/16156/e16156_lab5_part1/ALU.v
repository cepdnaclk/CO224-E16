//Verilog module for an ALU
module alu(DATA1, DATA2, RESULT, SELECT);
    
    //inputs,outputs and internal variables declared here
    input [7:0] DATA1,DATA2;
    input [2:0] SELECT;
    output [7:0] RESULT;
    wire [7:0] Reg1,Reg2;
    reg [7:0] Reg3; // defining a 8 bit register as Reg3
    
    //Assign DATA1 and DATA2 to internal variables for doing operations
    assign Reg1 = DATA1;
    assign Reg2 = DATA2;
    //Assign the output 
    assign RESULT = Reg3;

    //Always block with inputs in the sensitivity list.
    always @(SELECT or Reg1 or Reg2)
    begin
        case (SELECT)  //  #1 or #2 delay is added, because it is given already
         0 :#1 Reg3 = Reg2;  //(forward DATA2 into RESULT)
         1 :#2 Reg3 = Reg1 + Reg2; //(add DATA1 and DATA2) 
         2 :#1 Reg3 = Reg1 & Reg2;  //(bitwise AND on DATA1 with DATA2) 
         3 :#1 Reg3 = Reg1 | Reg2; //(bitwise OR on DATA1 with DATA2) 
         4 : Reg3 = 8'bx ;  //$monitor("Reserved for future functional units ");              
         5 : Reg3 = 8'bx ;  //$monitor("Reserved for future functional units "); 
         6 : Reg3 = 8'bx ;  //$monitor("Reserved for future functional units ");    
         7 : Reg3 = 8'bx ;  //$monitor("Reserved for future functional units "); 
         default:	$monitor("The select value is not valid ");	 
        endcase 
    end
    
endmodule

















