/*
    Reg.No :E/16/394
    CO224 Lab 5 testReg_file.v
*/
module testbench();
    //define registers
    reg t_write , t_clk ,t_reset ;
    reg [7:0] t_in ;
    reg [2:0] t_outaddress1 ,t_outaddress2 ,t_inaddress ;
    //define wires
    wire [7:0] t_out1, t_out2 ;
    //instantiate reg_file
    reg_file myreg_file(t_in ,t_out1 ,t_out2 ,t_inaddress ,t_outaddress1 ,t_outaddress2 ,t_write ,t_clk ,t_reset);
    //assign clk =0
    initial
    begin
        t_clk <= 0 ;
        //disable write_enable and reset
        t_write <= 0 ;
        t_reset <= 0 ;
        //generate files needed to plot the wavefrom using GTKWave
        $dumpfile("wavedata.vcd");
        $dumpvars(0,testbench);
        $display("\t\ttime \tclk \toadd1 \tout1 \toadd2 \tout2 \tinaddr \twrite \tdata \treset ");
         //print inputs and outputs to cmd
        $monitor($time ,"\t%b \t%d \t%d \t%d \t%d \t%d \t%b \t%d \t%b" ,t_clk ,t_outaddress1 ,t_out1 ,t_outaddress2 ,t_out2 ,t_inaddress ,t_write ,t_in ,t_reset);
        
    end
    //generate clock signal 
    always 
    begin
        #5 
        t_clk = ~t_clk;
        //stop program when $time >100
        if($time > 100)
        begin
            $finish;
        end
    end
    
    initial
    begin
        #5
        t_outaddress1  <= 0;
        t_outaddress2 <= 1;
        t_reset <= 1;

        #4
        t_reset <= 0;

        #1
        t_inaddress <=  0;
        t_in <= 20;
        t_write <= 1;

        #9
        t_inaddress <=  0;
        t_in <= 20;
        t_write <= 0;

        #5
        t_inaddress <=  1;
        t_in <= 50;
        t_write <= 1;

        #30 $finish;
    end
    
endmodule