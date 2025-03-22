module counter(input clk, reset, output reg[2:0] counter
    );

// up counter
always @(posedge clk or posedge reset)
begin
if(reset)
 counter <= 3'd0;
else
 counter <= counter + 3'd1;
end 
endmodule
