module programCounter(in,out,clk);

input [7:0]in;
output [7:0]out;
input clk;

reg [7:0]out;

initial begin
	out=0;
end

always @(posedge clk) begin
	out=in;
end

endmodule