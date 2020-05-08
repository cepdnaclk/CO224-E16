// E/16/388
// Lab 5 part 2
// Register file testbench



`include "regfile.v"            //include register file

module reg_file_tb;             //module to check regfile
    
    reg [7:0] IN_t;             //to write values in regfile
    reg [2:0] INADDRESS_t, OUT1ADDRESS_t, OUT2ADDRESS_t;    //in and out port addresses
    reg CLK, RESET, WRITE_t;                                //control and reset signals
    wire [7:0] OUT1_t, OUT2_t;                              //8 bit read outputs 
      
    reg_file regtest(IN_t, OUT1_t, OUT2_t, INADDRESS_t, OUT1ADDRESS_t, OUT2ADDRESS_t, WRITE_t, CLK, RESET);     //making a regfile module to test
       
    initial
    begin
        CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("e16388_reg_file_wavedata.vcd");                      //save signals to this file
        $dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;                                                   //reset before using
        WRITE_t = 1'b0;
        
        #1  //1
        RESET = 1'b1;                                                   
        OUT1ADDRESS_t = 3'b000;                                         //check reset accurately
        OUT2ADDRESS_t = 3'b000;
        
        #6  //7
        WRITE_t = 1'b1;                                                 //RESET = 1 and WRITE = 1 
        IN_t = 8'b00110011;                                             //check functionality for this scenario
        INADDRESS_t = 3'b000;
        OUT1ADDRESS_t = 3'b000;
        OUT2ADDRESS_t = 3'b000;
        
        #6  //13
        RESET = 1'b0;                                                   //RESET = 0 and WRITE = 0 
                                                                        //check functionality for this scenario
        #15 //28
        WRITE_t = 1'b0;
        INADDRESS_t = 3'b001;
        IN_t = 8'b11110011; 
        OUT1ADDRESS_t = 3'b001; 
        #6  //34

        
        RESET = 1'b1;
        #1  //35
        RESET = 1'b0;
        #1  //36
        OUT1ADDRESS_t = 3'b001;
        OUT2ADDRESS_t = 3'b111;
        #10 //46

        WRITE_t = 1'b1;                                             //WRITE =1 and RESET = 0.write and read from register file
        #1 //47
        IN_t = 8'b11111111;
        INADDRESS_t = 3'b111;       
        OUT1ADDRESS_t = 3'b111;
        #10 //57

        IN_t = 8'b01111111;
        INADDRESS_t = 3'b110;       
        OUT2ADDRESS_t = 3'b110;
        #10  //67



        
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;                                              //clock signal generator
        

endmodule
