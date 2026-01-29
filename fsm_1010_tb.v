module fsm_1010_mealy_ov_tb();
reg clk,rst,din;
wire detected;
fsm_1010_mealy_ov dut(clk,rst,din,detected);
initial
begin
{clk,rst,din}=0;
end
always #5 clk=~clk;
initial
begin
rst=1'b1;
#10
rst=1'b0;
#10;
din=1'b1;
#10;
din=1'b0;
#10;
din=1'b1;
#10;
din=1'b0;
#10;
din=1'b0;
#50;
$finish;
end
endmodule
