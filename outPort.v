module outPort(in,we,clk,out);

input [9:0]in;
input we;
input clk;

output [7:0]out;

reg [7:0]out;

initial begin
	out=0;
end

always @(negedge clk) begin
	if(we) begin
		out=in[7:0];
	end
end

endmodule