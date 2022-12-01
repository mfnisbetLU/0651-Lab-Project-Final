//Data Memory Module
module dataMemory(clk, op, ra, address, read_data);

input clk;
input [9:0]ra; // Data from register being operated on
input [3:0]op; // Opcode from byte 1
input [7:0]address; // Address in data memory array
output [7:0] read_data;

reg [7:0]datamem[0:255]; // Memory of 256 bytes

integer i;
initial begin
	for (i = 0; i < 256; i = i + 1) begin 
		datamem[i] = 0; // Fills data memory with zeroes
	end
end

assign read_data=(op==4'b1101)?datamem[address]:address;

always @(negedge clk) begin
	if(op == 4'b1110) begin // Store instruction OP=14
		datamem[address] = ra[7:0]; // Memory address space is set to write_data
	end
end

endmodule 