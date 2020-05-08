//E 16 275
//Perera ALHE
//Lab 5 
//Part 2 Register File
//Reg_file module

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

    //Define inputs output ports for the module
    input [7:0] IN;                         //input data 8bit word
    input [2:0] INADDRESS;                  //address the input will be saved 3 bit
    input WRITE, CLK, RESET;                //the ports that contain the boolean value og WRITE RESET and CLK
    input [2:0] OUT1ADDRESS, OUT2ADDRESS;   //address that contains the outputs from the registry

    output reg [7:0] OUT1, OUT2;            //take the output through wires 

    reg [7:0] rf [7:0];                     //create 64 bit array of bits divided into 8 equal registers

    //define the behavior of the hardware to act on positive edge CLK ans RESET = 1
    always @ (posedge CLK or RESET)
    begin
        if(RESET)           //Consider the case when RESET == 1
        begin
            #2
            //make all the register velues to zero
            rf[0] = 8'd0; 
            rf[1] = 8'd0;
            rf[2] = 8'd0;
            rf[3] = 8'd0;
            rf[4] = 8'd0;
            rf[5] = 8'd0;
            rf[6] = 8'd0;
            rf[7] = 8'd0;

            #2
            //After that assign the reg values according to the address to the output ports
            OUT1 <= rf[OUT1ADDRESS];
            OUT2 <= rf[OUT2ADDRESS]; 

        end
        if(WRITE && !RESET)     //if WRITE == 1 and RESET == 0
        begin
            #2
            rf[INADDRESS] <= IN;    //the input data will be assigned to the register 
            
            #2
            //After that assign the reg values according to the address to the output ports
            OUT1 <= rf[OUT1ADDRESS];
            OUT2 <= rf[OUT2ADDRESS]; 
        end

        
    end

    //Also the OUT ADDRESS also changed this always block will define the behavior of the hardware module when having OUT ADDRESS are changed 
    always @ (OUT1ADDRESS, OUT2ADDRESS)
    begin
        if(~RESET)
        begin
            #2
            //After that assign the reg values according to the address to the output ports
            OUT1 <= rf[OUT1ADDRESS];
            OUT2 <= rf[OUT2ADDRESS]; 
        end
    end
endmodule