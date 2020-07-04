//E/16/290





module alu(DATA1, DATA2, SELECT, RESULT);

	//DECLARING PORTS
         input [7:0] DATA1;
         input [7:0] DATA2;
         input [2:0] SELECT;
         output reg [7:0] RESULT;


        
        //FORWARD FUNCTION  
        function [7:0] FORWARD(input [7:0] DATA2)  ;

	        begin 

                FORWARD=DATA2;
	        end

        endfunction


        //ADD FUNCTION
        function [7:0] ADD(input [7:0] DATA1,input [7:0] DATA2)  ;

	        begin 

              	ADD=DATA1+DATA2;
	        end

        endfunction
        

        //AND FUNCTION

        function [7:0] AND(input [7:0] DATA1,input [7:0] DATA2)  ;

	        begin 

           		AND=DATA1 & DATA2;
	        end

        endfunction
        

        //OR FUNCTION
        function [7:0] OR(input [7:0] DATA1,input [7:0] DATA2)  ;

	        begin 

               OR=DATA1 | DATA2;
	        end

        endfunction
        
              
                
               

         //ALWAYS WITH INPUTS
         always @(DATA1, DATA2, SELECT)
	         begin

                //SELECT FUNCTION BY OPCODE
	         	case(SELECT)
	                	
	                     3'b000:begin  #1;RESULT= FORWARD(DATA2)   ; end //DELAY 1s AND DO FORWARD OPERATION
	                     3'b001:begin  #2;RESULT= ADD(DATA1, DATA2); end //DELAY 2s AND DO ADD OPERATION
	                     3'b010:begin  #1;RESULT= AND(DATA1, DATA2); end //DELAY 1s AND DO AND OPERATION
	                     3'b011:begin  #1;RESULT= OR (DATA1, DATA2); end //DELAY 1s AND DO OR  OPERATION
	                     default:///MADE DON'T CARE OUTPUT FOR RESERVED (NOT IMPLEMENTED) NO DELAY

	                                   RESULT=8'bX;
	                            
	                             
	                
	                endcase
	               
	                
	         end
endmodule



