module project(clk,in_port,out_port);

input clk;
input [7:0]in_port;
output [7:0]out_port;

//pc -> add2 -> branchMUX (sel) ->pc
//pc -> im -> controller -> sel

wire [7:0]currentAddress;
wire [7:0]nextAddress;
programCounter pcMod(nextAddress,currentAddress,clk);

wire [7:0]addressPlus2;
add2 add2Mod(currentAddress,addressPlus2);

wire [7:0]ea;
wire [7:0]LRout;
wire [1:0]branchSel;
branchMUX branchMUXMod(addressPlus2,ea,LRout,branchSel,nextAddress);

wire [3:0]op;
wire flag;
wire [3:0]RFwe;
wire DMwe;
wire OUTwe;
wire portSel;
wire wbSel;
controller controllerMod(op,flag,RFwe,DMwe,OUTwe,branchSel,wbSel,portSel);

wire [1:0]ra;
wire [1:0]rb;
wire brx;
instructionMemory imMod(currentAddress,ra,rb,op,brx,ea);

wire [7:0]raVal;
wire [7:0]rbVal;
wire [9:0]wb;
wire N;
wire Z;
wire [7:0]LRin;
registerFile rfMod(ra,rb,raVal,rbVal,wb,clk,RFwe,N,Z,addressPlus2,LRout);

wire [7:0]rbVal2;
portMUX portMUXMod(rbVal,in_port,portSel,rbVal2);

wire [9:0]ALUout;
alu aluMod(raVal,rbVal2,op,ALUout);

wire [7:0]MEMout;
wbMUX wbMUXMod(MEMout,ALUout,wbSel,wb);

outPort outPortMod(ALUout,OUTwe,clk,out_port);

flagMUX flagMUXMod(N,Z,brx,flag);

dataMemory dmMod(clk, op, ALUout, ea, MEMout);

endmodule