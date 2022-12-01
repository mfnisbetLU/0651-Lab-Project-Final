module wbMUX(memin,aluin,sel,out);

input [7:0]memin;
input [9:0]aluin;
input sel;

output [9:0]out;

assign out=(sel==0)?aluin:
{2'b00,memin};

endmodule