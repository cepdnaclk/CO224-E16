module testbench;
	reg[7:0] data_in;
	wire[7:0] out1,out2;
	reg[2:0] in_add,out1_add,out2_add;
	reg write;
	reg reset,clk;

	reg_file test(data_in,out1,out2,in_add,out1_add,out2_add,write,clk,reset);

	initial 
	begin

		clk = 1'b1;					//set clk = 1
		reset = 1'b0;				//reset all the registers
		write = 1'b0;				// write disabled
	end
	always
		#5 clk = !clk;				//generate a clock signal where the peroid is 10 time units


	initial 
	begin
		$dumpfile("wavedata1.vcd"); 		//generate a wavefile
		$dumpvars(0,testbench);

		//testing
		#1
		reset = 1'b1;				
		out1_add= 3'd0;
		out2_add = 3'd4;

		#5
		reset = 1'b0;

		#3
		in_add = 3'd5;
		data_in = 8'd10;
		write = 1'b1;
		out1_add = 3'd5;

		#10
		write = 1'b0;
		in_add = 3'd7;
		data_in = 8'd50;
		out2_add = 3'd7;

		#7
		in_add = 3'd3;
		data_in = 8'd66;
		write = 1'b1;
		out1_add= 3'd3;

		#10
		write = 1'b0;
		reset = 1'b1;
	

		#8
		in_add = 3'd4;
		data_in = 8'd6;
		write = 1'b1;

		#10
		reset = 1'b0;
		data_in = 8'd15;
		write = 1'b1;
		out2_add = 3'd4;
		out1_add = 3'd1;

		#5
		write = 1'b0;


		#6
		in_add = 3'd1;
		data_in = 8'd50;
		write = 1'b1;

		#5
		write = 1'b0;

		#10
		$finish;

	end
	
	
	
	
endmodule


