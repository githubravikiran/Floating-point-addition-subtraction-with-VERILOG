module floatop_tb;
reg clk,rst,start;
reg [31:0]X,Y;
wire [31:0]sum;
wire valid;

always #5 clk = ~clk;

float_op inst (clk,rst,start,X,Y,sum,valid);

initial
$monitor($time,"X=%d, Y=%d, sum=%d ",X,Y,sum);

initial
begin
X=32'h43e10ccd; Y=32'h41433333;
clk=1'b1; rst=1'b0; start=1'b0;
#100 rst = 1'b1;
#100 start = 1'b1;
#100 start = 1'b0;
@valid
#100 X=32'h43d5d2f1b; Y=32'h3c656042;
start = 1'b1;
#100 start = 1'b0;
end      
endmodule

