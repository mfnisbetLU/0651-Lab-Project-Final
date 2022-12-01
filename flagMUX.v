module flagMUX(N,Z,brx,out);

input N;
input Z;
input brx;
output out;

wire out;

assign out=(brx==1'b0)?Z:
N;

endmodule