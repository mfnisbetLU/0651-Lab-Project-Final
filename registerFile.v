module registerFile(ra,rb,raVal,rbVal,wb,clk,we,N,Z,LRin,LRout);

input [1:0]ra;
input [1:0]rb;
input [9:0]wb;
input clk;
input [3:0]we;
input [7:0]LRin;

output [7:0]raVal;
output [7:0]rbVal;
output N;
output Z;
output [7:0]LRout;

reg [7:0]mem[0:3];
reg N;
reg Z;
reg [7:0]LRout;

initial begin
	mem[0]=0;
	mem[1]=0;
	mem[2]=0;
	mem[3]=0;
	N=0;
	Z=0;
	LRout=0;
end

assign raVal=mem[ra];
assign rbVal=mem[rb];

always @(negedge clk) begin
	if(we[0]==1)begin
		mem[ra]=wb[7:0];
	end
	if(we[1]==1)begin
		Z=wb[9];
	end
	if(we[2]==1)begin
		N=wb[8];
	end
end

always @(posedge clk) begin
	if(we[3]==1)begin
		LRout=LRin;
	end
end

endmodule