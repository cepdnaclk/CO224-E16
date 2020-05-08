


module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET); 

input[7:0] IN;
input[2:0] INADDRESS,OUT1ADDRESS,OUT2ADDRESS;
input CLK,RESET,WRITE;
output[7:0] OUT1,OUT2;
reg[7:0] OUT1,OUT2;

reg [7:0] rfile[7:0];
integer i;
always @(RESET or posedge CLK ) begin
    if(RESET) 
    begin
        #2;
         for (i=0;i<=7;i=i+1)
             begin
             rfile[i]=0;
            end
    end

    else if(WRITE) begin
        #2 rfile[INADDRESS] = IN;
    end
             
end

always @(*) begin
    #2;
    OUT1 = rfile[OUT1ADDRESS];
    OUT2 = rfile[OUT2ADDRESS];
end



endmodule
