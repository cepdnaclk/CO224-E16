`include "ALU.v"
module tb_alu;

    // Inputs
    reg [7:0] DATA1;// defining a 8 bit register as data1
    reg [7:0] DATA2;// defining a 8 bit register as data2
    reg [2:0] SELECT;// defining a 3 bit register as select

    // Outputs
    wire [7:0] RESULT;

    // call the alu module  
    alu uut ( DATA1, DATA2, RESULT, SELECT);
    
	 initial begin  // type the inputs output as well as time throughout the whole time
       $monitor($time,"     DATA1: %b   DATA2: %b   SELECT: %b    RESULT: %b",DATA1,DATA2,SELECT,RESULT);
	   $dumpfile("wavedata.vcd");// specify the VCD filename
	   $dumpvars(0,tb_alu);///specify that all variables must be dumped
    end
	
	
    integer i,j,k;
    initial 
	begin
        // initializing inputs.
        DATA1 = 8'b00000000;
		DATA2 = 8'b00000001;
        SELECT = 3'b000; 
		k=10;  // the time to change data
		
		for(i=0;i<=4;i++)
		begin
		    for(j=0;j<=5;j++)
		    begin
		        case(j)      // six sets as data1
			        0 : DATA1 = 8'b00000001 ;
                    1 : DATA1 = 8'b00000101 ;
                    2 : DATA1 = 8'b00010101 ; 
                    3 : DATA1 = 8'b01010101 ;
                    4 : DATA1 = 8'b10100101 ;              
                    5 : DATA1 = 8'b01110011 ;
				endcase
				case(j)      //six sets as data2
			        0 : DATA2 = 8'b11000111;
                    1 : DATA2 = 8'b00100001;
                    2 : DATA2 = 8'b01000101; 
                    3 : DATA2 = 8'b10000101;
                    4 : DATA2 = 8'b00100001;              
                    5 : DATA2 = 8'b10000001;
				endcase
				#k;
			end
			SELECT = SELECT  + 3'b001; //adding one to the select value
			
		end			
    end
      
endmodule