module controller(op,flag,rfwe,dmwe,outwe,branchSel,wbSel,portSel);

input [3:0]op;
input flag;

output [3:0]rfwe;
output dmwe;
output outwe;

output [1:0]branchSel;
output wbSel;
output portSel;

assign rfwe= //rfwe bits 3:LR_we 2:Nwe 1:Zwe 0:RFwe
(op==1||op==2||op==3)?4'b0111:
(op==4||op==5||op==7||op==8||op==13||op==15)?4'b0001:
(op==11)?4'b1000:
0;

assign dmwe=(op==14)?1: //only enable for store
0;

assign outwe=(op==6)?1: //only enable for out
0;

assign branchSel=(op==9||op==11)?1: //br and brsub
(op==10&&flag==1)?1: //brz and brn
(op==12)?2: //return
0; //else pc+2

assign wbSel=(op==13||op==15)?1: //load and loadimm
0;

assign portSel=(op==7)?1: //in
0;

endmodule