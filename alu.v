module alu(ra,rb,op,out);

input [7:0]ra;
input [7:0]rb;
input [3:0]op;
output [9:0]out;

assign out[8:0]=(op==1)?ra+rb: //add
	(op==2)?ra-rb: //sub
	(op==3)?~(ra&rb): //nand
	(op==4)?{1'b0,ra<<1}: //shl
	(op==5)?{1'b0,ra>>1}: //shr
	(op==7)?{1'b0,rb}: //in
	(op==8)?{1'b0,rb} : {1'b0,ra}; //mov, nop
assign out[9]=(op==1&&((ra+rb)==0))?1:
(op==2&&((ra-rb)==0))?1:
(op==3&&~(ra&rb)==0)?1:
(op==4&&(ra<<1)==0)?1:
(op==5&&(ra>>1)==0)?1:
0;


endmodule