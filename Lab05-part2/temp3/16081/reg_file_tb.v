
`include "reg_file.v"

module reg_file_tb;
    
    reg [7:0] IN ;                                                    // input data port
    wire [7:0] OUT1 , OUT2 ;                                      // output data port
    reg [2:0] INADDRESS , OUT1ADDRESS , OUT2ADDRESS;                  // input output address
    reg  WRITE , CLOCK , RESET;                                        // write enable , clock , reset

    reg_file myregfile(IN, OUT1, OUT2 , INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLOCK, RESET);      // REGISTER FILE 
       
    initial
    begin
        CLOCK = 1'b1;
        
        $dumpfile("reg_file_wavedata.vcd");                                                         // generate files needed to plot the waveform using GTKWave
		$dumpvars(0, reg_file_tb);
        
        #1
        RESET = 1'b0;                                                                                
        WRITE = 1'b0;

        #1
        RESET = 1'b1;                                       // reset the dat

        #1
        RESET = 1'b0;                   

        #5                                                 //write data
        WRITE = 1'b1 ;
        INADDRESS = 3'b11 ; 
        IN        = 8'b01111 ; 
        OUT1ADDRESS= 3'b11 ;                                // read data same clock

        #7                   
        WRITE = 1'b1 ;                                      // write data 
        INADDRESS = 3'b01 ; 
        IN        = 8'b01101 ;         

        #3     
        WRITE = 1'b0 ;        

        #2
        WRITE = 1'b1 ;                                      // syc write
        INADDRESS = 3'b111 ; 
        IN        = 8'b0101010 ;         
        OUT2ADDRESS = 3'b111 ;                              // same clock read
        

        #3
        OUT1ADDRESS = 3'b001  ;                               // asycr read
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLOCK = ~CLOCK;
        

endmodule
