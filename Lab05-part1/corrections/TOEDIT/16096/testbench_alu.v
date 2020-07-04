
module testbench_alu;
	
	reg [7:0] data1_t,data2_t;
	reg [2:0] select_t;
	wire [7:0] result_t;
	
	alu alu1(data1_t,data2_t,result_t,select_t);
	
	initial
	begin
		$monitor($time," data1: %b, data2: %b, result: %b, select: %b",data1_t,data2_t,result_t,select_t);
		
		$dumpfile("alu_wavedata.vcd");
		$dumpvars(0,testbench_alu);
	
	end

	initial  
	begin
		data1_t=8'b00011111;
		data2_t=8'b00000001;
		select_t=3'b000;      //FORWARD
		
		#10
		select_t=3'b001;      //ADD
		
		#10
		data2_t=8'b00000111; 
		
		#10
		select_t=3'b010;     //AND
		
		#10
		select_t=3'b011;     //OR
		
		#10
		select_t=3'b111;     //An unused combination
		
		#20 $finish;
	end

endmodule

