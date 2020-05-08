/*******************************************
 *         Author: Nuwantha B.L.A.         *
 *      Lab 05: CO224-Project_part_02      *
 *           Date  : 2020/05/03            *                  
 *******************************************/


module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
      
   // declare the input & output   
   input WRITE, CLK, RESET;
   input [7:0] IN;
   input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;
   output [7:0] OUT1, OUT2;
   reg [7:0] registerFile[0:7]; // declare the register file
   reg [7:0] OUT1, OUT2;
   integer counter;
   integer delay;

   always @(posedge CLK) begin // check the positive edge of clock
     if (WRITE == 1'b1) begin  // check the enable of writeEnable
      // write the IN value for the INADDRESS index of register file
      #2 registerFile[INADDRESS]  = IN; 
    
      #2  // delay of reading
      // update the reading output 1 & 2
      OUT1 = registerFile[OUT1ADDRESS];
      OUT2 = registerFile[OUT2ADDRESS];
     end 
   end

   always @(OUT1ADDRESS, OUT2ADDRESS) begin  
         // check the reset is enable
         if (RESET == 1'b1) begin
            // if reset is enable, take the delay as 4 sec
            delay = 4;
         end else begin 
            // else delay as 2 sec 
            delay = 2;
         end
         //delay of reading
         #delay
         //update the reading values of out1 & out2
         OUT1 = registerFile[OUT1ADDRESS];
         OUT2 = registerFile[OUT2ADDRESS];   
   end
   
   always @(*) begin 
     //check the enable reset
     if (RESET) begin
      #2
      //go to the all registers of register file from for loop
      for (counter = 0; counter < 8; counter = counter+1) begin
      	 registerFile[counter] = 0;  // reset the each register as 0
      end
     end
   end   
 
endmodule


