module reg_file(IN,OUT1,OUT2,INADDRESS,OUT1ADDRESS,OUT2ADDRESS, WRITE, CLK, RESET);
    
    input [2:0]INADDRESS, OUT1ADDRESS, OUT2ADDRESS; // 3 bit wires for  INADDRESS, OUT1ADDRESS, OUT2ADDRESS
    input [7:0]IN; // 8 bit wire for IN
    input WRITE, CLK, RESET; // 1 bit wire for WRITE, CLK, RESET
    output [7:0]OUT1, OUT2; //8 bit reg for OUT1, OUT2 
    reg [7:0]register [0:7];    //8 bit 8 word register file

    integer i;
    always @ (RESET,posedge CLK)begin  // in change of RESET or posedge in CLK
        if(RESET==1)begin              // if RESET is high reset all the registers after a 2 time unit delay
            #2;
            for(i=0; i<8; i = i+1)begin
                register[i] = 0;
            end
        end else begin                // else if WRITE if high write to the spcific register afeter a 2 time unit delay
            if(WRITE==1)begin
                #2;
                register[INADDRESS] = IN;
            end
        end         
    end
    
       // in any change of the inpute signals update OUT registers to make it asynchronouse
       
    assign #2  OUT1 = register[OUT1ADDRESS];
    assign #2  OUT2 = register[OUT2ADDRESS];
    

endmodule