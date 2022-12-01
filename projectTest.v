module project(clk,in_port,out_port);

input clk;
input [7:0]in_port;
output [7:0]out_port;

wire [7:0]currentAddress;
wire [7:0]nextAddress;
programCounter pcMod(nextAddress,currentAddress,clk);

wire [7:0]addressPlus2;
add2 add2Mod(currentAddress,addressPlus2);

wire [1:0]ra;
wire [1:0]rb;
wire [3:0]op;
wire brx;
wire [7:0]ea;
instructionMemory imMod(currentAddress,ra,rb,op,brx,ea);

wire [7:0]raVal;
wire [7:0]rbVal;
wire [9:0]wb;
wire [3:0]RFwe;
wire Nflag;
wire Zflag;
wire [7:0]LRout;
registerFile rfMod(ra,rb,raVal,rbVal,wb,clk,RFwe,Nflag,Zflag,addressPlus2,LRout);

wire flag;
flagMUX flagMUXMod(Nflag,Zflag,brx,flag);

wire [1:0]branchSel;
branchMUX branchMUXMod(addressPlus2,ea,LRout,sel,nextAddress);

wire portSel;
wire [7:0]rbALU;
portMUX portMUXMod(rbVal,in_port,portSel,rbALU);

wire [3:0]outop;
wire wbSel;
wire DMwe;
wire OUTwe;
controller controllerMod(op,flag,outop,RFwe,DMwe,OUTwe,branchSel,wbSel,portSel);

wire [7:0]MEMout;
wire [9:0]ALUout;
wbMUX wbMUXMod(MEMout,ALUout,wbSel,wb);

alu aluMod(raVal,rbALU,outop,ALUout);

outPort outPortMod(ALUout,OUTwe,clk,out_port);

endmodule