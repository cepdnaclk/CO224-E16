//CO224 Lap05-part 2
//8*8 Register File 
//Author : P.M.M.P Randeniya
//E/16/313

//Register file module
module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

    input [7:0] IN;       //8 bit input data
    input [2:0] INADDRESS; //register number to store input data
    input WRITE, CLK, RESET; //Writtenable ,Clock , Reset data input
    input [2:0] OUT1ADDRESS, OUT2ADDRESS; //Register numbers which have to read data values
    output reg [7:0] OUT1, OUT2; //read data values load into this outputs

    reg [7:0] regf [7:0];  //define 8 registers which can store 8 bits
    integer i,j;    //flags to check reset and writtenable

    //if these registers changed this will execute
    always @(OUT1ADDRESS, OUT2ADDRESS)
    begin
       if(!RESET) begin  //check if reset is enable
           #2 //delay 2 time units to change outputs
           OUT1 = regf[OUT1ADDRESS];  //load read data into outputs
           OUT2 = regf[OUT2ADDRESS];
       end
    end

    //reset is changed this will execute
    always @(RESET)
    begin
      //if reset is enable set register values to 0
      if(RESET) 
      begin
         #2  //delay 2 time units to excute this
         for(i=0; i < 8; i=i+1 )
         begin
             regf[i] = 8'd0;//change the regster data values to 0             
         end
         #2 //delay the execution bt 2 time units
         OUT1 = regf[OUT1ADDRESS];  //load the read data values
         OUT2 = regf[OUT2ADDRESS];
      end
    end
   //if positive edge of the clock appear
   always @(posedge CLK) 
   begin   
      //if write is enable write IN data to given register
      if(WRITE)
      begin
          #2  //delay the excution by 2 time units
          regf[INADDRESS] = IN;  //write data into the INADDRESS  
          j = 1;  //flag for load read data         
      end

      if(j == 1) //check the flags values
      begin
          #2 //delay the execution bt 2 time units
          OUT1 = regf[OUT1ADDRESS];  //load the read data values
          OUT2 = regf[OUT2ADDRESS];
          j = 0;  //change flag value
      end 

    end
     
endmodule

