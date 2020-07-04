/*
    PereraALHE
    E16275
    lab5 part 1
    ALU module
*/

module alu(DATA1, DATA2, RESULT, SELECT);

    //instantiate 8bit inputs as DATA1, DATA2 then 3 bit SELECT finally 8bit RESULT
    input [7:0] DATA1, DATA2;
    input [2:0] SELECT;
    output [7:0] RESULT;
    reg [7:0] RESULT;

    //made connections to connect each separate modules to alu
    wire [7:0] ADDERCONNECT, ANDCONNECT, ORCONNECT;

    always @ (DATA1, DATA2, SELECT)
    begin
        case(SELECT)
            3'b000 :
		begin
			#1
		 	RESULT = DATA2;
		end
            3'b001 :
		begin
			#2
			RESULT <= ADDERCONNECT;
		end
            3'b010 :
		begin 
			#1
			RESULT <= ANDCONNECT;
		end
            3'b011 :
		begin 
			#1
			RESULT <= ORCONNECT;
		end
        endcase 
    end

    //Connect adder, and, or operations to the alu
    adderCall adder1(DATA1, DATA2, ADDERCONNECT);
    andModuleCall and1(DATA1, DATA2, ANDCONNECT);
    orModuleCall or1(DATA1, DATA2, ORCONNECT);

endmodule

//-------------------------------------------------------------------------------
//connect adder to the alu via adderCall connection
module adderCall(DATA1, DATA2, RESULT);
	input [7:0] DATA1, DATA2;
	output [7:0] RESULT;
    wire [7:0] RESULT;
	
    adder adder1(.op1(DATA1), .op2(DATA2), .ans(RESULT));

endmodule

//-------------------------------------------------------------------------------
//connect and module to the alu via andModuleCall connection
module andModuleCall(DATA1, DATA2, RESULT);
	input [7:0] DATA1, DATA2;
	output [7:0] RESULT;
    wire [7:0] RESULT;

	andModule and1(.op1(DATA1), .op2(DATA2), .ans(RESULT));

endmodule


//-------------------------------------------------------------------------------
//connect or module to the alu via orModuleCall connection
module orModuleCall(DATA1, DATA2, RESULT);
	input [7:0] DATA1, DATA2;
	output [7:0] RESULT;
    wire [7:0] RESULT;

	orModule or1(.op1(DATA1), .op2(DATA2), .ans(RESULT));

endmodule
