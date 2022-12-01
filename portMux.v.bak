module portMUX(rb,in_port,sel,out);

input [7:0]rb;
input [7:0]in_port;
input sel;

output [7:0]out;

assign out=(sel==0)?rb:
in_port;

endmodule