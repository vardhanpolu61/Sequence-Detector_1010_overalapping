`timescale 1ns / 1ps
module sd_1011(x,areset,clk,op,current_state,next_state);
input x,areset,clk;
output reg op;
output reg [1:0] current_state,next_state;
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
always@(*)
begin
op=0;
next_state=s0;
case(current_state)
s0:begin
next_state=x?s1:s0;
op=0;
end
s1:begin
next_state=x?s1:s2;
op=0;
end
s2:begin
next_state=x?s3:s0;
op=0;
end
s3:begin
next_state=x?s1:s2;
op=x?1:0;
end
endcase
end
always@(posedge clk or posedge areset) 
begin
if(areset)
current_state<=s0;
else
current_state<=next_state;
end
endmodule
