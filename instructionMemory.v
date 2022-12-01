module instructionMemory(address,ra,rb,op,brx,ea);

input [7:0]address;
output [1:0]ra;
output [1:0]rb;
output [3:0]op;
output brx;
output [7:0]ea;

reg [7:0]mem[0:255];

initial begin
	$readmemb("C:\\Users\\mattc\\OneDrive\\Desktop\\Eele-0651 Project Files\\instructionMemory\\subroutineFixed.txt",mem);
end
assign op = mem[address][7:4];
assign ra = mem[address][3:2];
assign rb = mem[address][1:0];
assign brx = mem[address][3];
assign ea = mem[address+1];
endmodule