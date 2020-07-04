// module testbench;
// 	reg [7:0] DATA1,DATA2;//create as reg type because inside the initial blocks we want to assign values
// 	reg [2:0] SELECT;
// 	wire [7:0] RESULT;
	
// 	alu test1(DATA1, DATA2, RESULT, SELECT);
	
// 	initial//all initial blocks will start to run at same time
// 	begin
// 		$monitor($time," DATA1: %b, DATA2: %b, SELECT: %b, RESULT: %b",DATA1,DATA2,SELECT,RESULT);

// 	end
	
// 	initial
// 	begin
// 		DATA1=8'b10001011;
// 		DATA2=8'b01000010;
// 		SELECT=3'b000;//for forward
		
// 		#5
// 		SELECT=3'b001;//for add
		
// 		#5
// 		SELECT=3'b010;//for and
		
// 		#5
// 		SELECT=3'b011;//for or
		
// 		#5
// 		SELECT=3'b100;
		
// 		#5
// 		SELECT=3'b101;
	
// 	end

// endmodule



module alu(DATA1, DATA2, RESULT, SELECT);//templates for alu and input and output ports
	input [7:0] DATA1,DATA2;//8 wires buses
	input [2:0] SELECT;//3 wires bus
	output reg [7:0] RESULT;//create as a reg type because we want to assign a value for a result.
	
	always @(DATA1,DATA2,SELECT)begin //whenever DATA1,DATA2,SELECT inputs change body of the always start to run
		case(SELECT)
			3'b000 : #1 RESULT=DATA2;
			3'b001 : #2 RESULT=DATA1+DATA2;
			3'b010 : #1 RESULT=DATA1&DATA2;
			3'b011 : #1 RESULT=DATA1|DATA2;
			default :  RESULT=8'bx;//set result for unknown when select equals 1xx
		endcase
	end


endmodule