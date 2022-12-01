module branchMUX(PCadd2,ea,LR_r,sel,address);

input [7:0]PCadd2;
input [7:0]ea;
input [7:0]LR_r;
input [1:0]sel;
output [7:0]address;

wire [7:0]address;

assign address=(sel==2'b00)?PCadd2:
(sel==2'b01)?ea:
(sel==2'b10)?LR_r:
2'h00;

endmodule