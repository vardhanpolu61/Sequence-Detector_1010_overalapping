module fsm_1010_mealy_ov (input clk,rst,din,output reg detected);
parameter idle =2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
reg [1:0] ps,ns;
//present state logic
always@(posedge clk) begin
if(rst)
begin ps<=idle;
end
else
ps<=ns;
end
//next state logic
always@(*)
begin
detected=0;
case(ps)
idle:begin
if(din==1'b1)
ns=s1;
else
ns=idle;
end
s1:begin
if(din==1'b0)
ns=s2;
else
ns=s1;
end
s2:begin
if(din==1'b1)
ns=s3;
else
ns=idle;
end
s3:begin
if(din==1'b1)
ns=s1;
else
begin
ns=s2;
detected =1'b1;
end
end
default:ns=idle;
endcase
end
endmodule
