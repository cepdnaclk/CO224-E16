module testbench;                                  //making the test bench to test the results
    
   reg [7:0] DATA1_t, DATA2_t;
   reg [2:0] SELECT_t;

   wire [7:0] RESULT_t;

   alu myalu( DATA1_t, DATA2_t, RESULT_t, SELECT_t);

   initial
   begin
      //dispalying the inputs and the outputs
      $monitor($time, " DATA1 : %8b, DATA2 : %8b, SELECT : %3b, RESULT : %8b",DATA1_t, DATA2_t, SELECT_t, RESULT_t);
      
      //genrationg the files needed run in gtkwave
      $dumpfile("wavedata.vcd");
      $dumpvars(0, testbench);
       
   end

   initial
   begin
      DATA1_t = 8'b00001000;
      DATA2_t = 8'b00000101;
      SELECT_t = 3'b000;                 //forward operation

      #10
      SELECT_t = 3'b001;                //add operation

      #10
      SELECT_t = 3'b010;               //and opration

      #10
      SELECT_t = 3'b011;               //or operation

      #10
       DATA1_t = 8'b11111001;

      #10
      DATA2_t = 8'b00001001;
      SELECT_t = 3'b001;

      #10
      SELECT_t = 3'b111;               //testing preserved combination for future use



   end

endmodule