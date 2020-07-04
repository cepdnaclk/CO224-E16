/*Title = Simple Ariyhmatic Logic Unit(Only Support ADD SUB AND OR MOV LOADI)
  Author = P.M.M.P RAndeniya
  E Number = E/16/313
*/


//Verilog module for an ALU
module alu(DATA1,DATA2,RESULT,SELECT);
    
    //inputs,outputs and internal variables declared here
    input [7:0] DATA1,DATA2;  //8 bit Operands
    input [2:0] SELECT;       //Selection OPCODE
    output [7:0] RESULT;      //Output of the ALU
    reg [7:0] Reg3;           //temperory reg
    
   
    //Assign the output 
    assign RESULT = Reg3;

    //Always block with inputs in the sensitivity list.if any change of SELECT DATA1 DATA2 this will execute
    always @(SELECT or DATA1 or DATA2)
    begin
        casex (SELECT)
         3'b000 : #1 Reg3 = DATA2;          // forward DATA2 into RESULT, DATA2 → RESULT
         3'b001 : #2 Reg3 = DATA1 + DATA2;  //DATA1 + DATA2 → RESULT         
         3'b010 : #1 Reg3 = DATA1 & DATA2;  //bitwise AND on DATA1 with DATA2, DATA1 & DATA2 → RESULT
         3'b011 : #1 Reg3 = DATA1 | DATA2;  //bitwise OR on DATA1 with DATA2, DATA1 | DATA2 → RESULT
         3'b1XX :  Reg3 = 8'bxxxxxxxx;    //Reserved for future functional units     
        endcase 
    end
    
endmodule


//testbench module for an ALU
module alu_testbench;

    // Inputs
    reg [7:0] DATA1;  //8 bit input DATA1
    reg [7:0] DATA2;  //8 bit input DATA2
    reg [2:0] SELECT; //# bit OPCODE selector

    // Outputs
    wire [7:0] RESULT; 

    // Instantiate the Unit alu
    alu myalu (.DATA1(DATA1),.DATA2(DATA2), .RESULT(RESULT), .SELECT(SELECT));


    initial 
    begin
      //see how signal vary in command line
      $monitor($time," DATA1 = %b, DATA2 = %b, ALUOP = %b, RESULT = %b ",DATA1,DATA2,SELECT,RESULT);
      //generate files needed to plot waveform using gtkwave
      $dumpfile("wavedata.vcd");
      $dumpvars(0,alu_testbench);
    end
    
    initial begin
        // Apply inputs.
        DATA1 = 8'b01000100;  //initial DATA1 value
        DATA2 = 8'b00111011;  //initial DATA2 value
        SELECT = 3'b000;      //initial OPCODE

        //when the time unit = 100
        #10;
        SELECT = 3'b001;    //new opcode
        //when the time units = 200
        #10;
        DATA1 = 8'b01001110;  //change the DATA1 value
        SELECT = 3'b010;       //new opcode
         
        //when the time units = 300
        #10;
        SELECT = 3'b011;     //new OPCODE
        DATA2 = 8'b01001010; //New DATA2 Value
        //when time units = 4000
        #10;
        SELECT = 3'b110;   //new OPCODE
      
    end
          
endmodule
