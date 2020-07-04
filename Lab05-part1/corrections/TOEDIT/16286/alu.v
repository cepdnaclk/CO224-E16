// module testbench;
//     //in this testbench purpose is to instantiate a alu and check the outputs for given inputs

//     reg [7:0] data1,data2;
//     reg [2:0] select;
//     //above fields must be type reg .because they are used to assign some values and see the result

//     wire [7:0] result;
//     //result is not used to assign a value to test.Hence it can be a wire

//     //instantiate the design block
//     alu processorAlu(data1,data2,result,select);

//     initial
// 	begin
// 		// see how signals vary using command line
//         $monitor($time," =>  data1:%d   data2:%d   sel: %b   result:%d",data1,data2,select,result);

// 		//generate files to plot the waveform using GTKWave
// 		$dumpfile("aluwave.vcd");
// 		$dumpvars(0,testbench);
// 	end

//     initial
//     begin
//         data1 <= 8'b00001100; //assign value(12) for data1
//         data2 <= 8'b00100100; //assign value(36) for data2
//         select = 3'b000;//Forward

//         #10 //wait for 10 simulation time unit
//         select = 3'b001;//Add

//         #10 //wait for 10 simulation time unit
//         select = 3'b010;//And

//         #10 //wait for 10 simulation time unit
//         select = 3'b011;//Or

//         #10 //wait for 10 simulation time unit
//         select = 3'b111;//Other

//         #10
//         data1 <= 8'b00111111; //assign value(63) for data1
//         data2 <= 8'b00101101; //assign value(45) for data2
//         select = 3'b000;//Forward

//         #10 //wait for 10 simulation time unit
//         select = 3'b001;//Add

//         #10 //wait for 10 simulation time unit
//         select = 3'b010;//And

//         #10 //wait for 10 simulation time unit
//         select = 3'b011;//Or

//         #10 //wait for 10 simulation time unit
//         select = 3'b101;//Other
//     end
// endmodule
module alu(DATA1, DATA2, RESULT, SELECT);
    //ports declaration
    //DATA1,DATA2,SELECT ports are inputs
    //RESULT port is the output
    //we assign values into RESULT port .Therefore it must be a register
    input [7:0]DATA1,DATA2; input [2:0]SELECT;
    output reg [7:0]RESULT;

    //we have to check the result when DATA1,DATA2 or DATA3 signals changes
    //That ports must in the sensitivity list
    always @ (DATA1,DATA2,SELECT)
    begin
        //switch case is used to generate RESULT for various SELECT signals
        case (SELECT)
            3'b000  : #1 RESULT = DATA2;   //Forward
            3'b001  : #2 RESULT = DATA1 + DATA2; //Add
            3'b010  : #1 RESULT = DATA1 & DATA2; //And
            3'b011  : #1 RESULT = DATA1 | DATA2; //Or
            default : RESULT = 8'b0;//Reserved for future functional units
        endcase
    end
endmodule 