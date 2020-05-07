//E16377
//I B S VINDULA
//LAB05 PART02

//test bench
module testbench_reg;
reg [7:0] WRITEDATA;                        //8 bit input data
reg [2:0] WRITEREG;                //register values for storing input data
reg WRITE, CLK, RESET;              //write enable reset and clock inputs
reg [2:0] OUT1ADDRESS, OUT2ADDRESS; //register variables for read data values
wire [7:0] OUT1, OUT2;                //read the values and load into this outputs

//reg [7:0] register_f [7:0];           //8registors, every register can store 8 bits

register_file myreg(WRITEDATA, OUT1, OUT2, WRITEREG, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
initial begin

  // %b is for binary
  //displaying values
    $monitor($time,"\tWRITEDATA: %b\tOUT1 :%b\tOUT2 :%b\tWRITEREG :%b\tOUT1ADDRESS :%b\tOUT2ADDRESS :%b\tWRITE :%b\tCLK :%b\tRESET :%b\n",WRITEDATA, OUT1, OUT2, WRITEREG, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
    //generate files needed to plotthe waveform using GTKwave
    $dumpfile("wavedata_reg.vcd");
    $dumpvars(0,testbench_reg) ;    // 0 means the level it should go ,dump the changes in all modules when using 0

    //assigning values for testbench
    RESET = 1'b0 ;
    WRITE = 1'b0 ;

    #5
    RESET = 1'b1 ;
    OUT1ADDRESS = 3'b111;
    OUT2ADDRESS = 3'b010;
    #8
    RESET = 1'b0 ;
    OUT2ADDRESS = 3'b000 ;
    #6
    WRITEREG = 3'b110 ;
    WRITEDATA = 8'b01010110 ;
    WRITE = 1'b1 ;
    #6
    WRITE = 1'b0;
    #10
    OUT1ADDRESS = 3'b110;
    #5
    WRITEREG = 3'b001 ;
    WRITEDATA = 8'b00110111 ;
    WRITE = 1'b1 ;
    OUT1ADDRESS = 3'b011;
    OUT2ADDRESS = 3'b010;
    #10
    WRITE = 1'b0 ;
    #15
    WRITEREG = 3'b100;
    WRITEDATA = 8'b01110001 ;
    WRITE = 1'b1 ;
    #10
    WRITEDATA = 8'b00011110 ;
    WRITE = 1'b1 ;
    OUT2ADDRESS = 3'b100 ;
    #5
    WRITE = 1'b0 ;
    #10
    WRITEREG = 3'b011;
    WRITEDATA = 8'b10101110 ;
    WRITE = 1'b1;
    #15
    WRITE = 1'b0;
    #5
    WRITEREG = 3'b101;
    WRITEDATA = 8'b00110001;
    WRITE = 1'b0;
    OUT2ADDRESS = 3'b101 ;
    #5
    WRITEREG = 3'b111;
    WRITEDATA = 8'b01000101;
    WRITE = 1'b1 ;
    OUT1ADDRESS = 3'b001 ;
    #10
    $finish;



end

  //clock signal generation
  always
    #10 CLK = ~CLK ;
endmodule

//Register file module
module register_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

    input [7:0] IN;                        //8 bit input data
    input [2:0] INADDRESS;                //register values for storing input data
    input WRITE, CLK, RESET;              //write enable reset and clock inputs
    input [2:0] OUT1ADDRESS, OUT2ADDRESS; //register variables for read data values
    output reg [7:0] OUT1, OUT2;          //read the values and load into this outputs

    reg [7:0] register_f [7:0];           //8registors, every register can store 8 bits
    integer i,j;                          //to check reset and writeenable

  

    //chenge if reset is changed
    always @(RESET)
    begin                                 //if reset is 1
      if(RESET)begin
         #2                               //delay 2 time units 
         for(i=0; i < 8; i=i+1 )begin
             register_f[i] = 8'd0;        //change all the values inside the register to 0          
         end
         #2                               //delay 2 time units
         OUT1 = register_f[OUT1ADDRESS];  //load the values to the output register
         OUT2 = register_f[OUT2ADDRESS];
      end
    end
   //if the positive edge of the clock is triggered
   always @(posedge CLK)begin   
      //if write enable is enabled
      if(WRITE)begin
          #2                               //delay by 2 time units
          register_f[INADDRESS] = IN;      //write data into the INADDRESS  
      end    
          #2                               //delay the execution by 2 time units
          OUT1 = register_f[OUT1ADDRESS];  //load the read data values
          OUT2 = register_f[OUT2ADDRESS];
    end

     //if out1address changed
    always @(OUT1ADDRESS)begin
       if(!RESET)begin                      //if reset is disabled
           #2                               //delay 2 time units 
           OUT1 = register_f[OUT1ADDRESS];  //load read data into outputs
       end
    end
    //if out2address changed
    always @(OUT2ADDRESS)begin
       if(!RESET) begin                     //if reset is disabled
           #2                               //delay 2 time units to change outputs
           OUT2 = register_f[OUT2ADDRESS]; //load read data into outputs
       end
    end
     
endmodule

