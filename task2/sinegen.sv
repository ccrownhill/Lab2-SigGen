module sinegen #(
	parameter ADDR_WIDTH = 8,
	parameter DATA_WIDTH = 8
)(
	input logic clk,
	input logic rst,
	input logic en,
	input logic [ADDR_WIDTH-1:0] incr,
	input logic [ADDR_WIDTH-1:0] offset,
	output logic [DATA_WIDTH-1:0] dout1,
	output logic [DATA_WIDTH-1:0] dout2
);

logic [ADDR_WIDTH-1:0] count;

counter addr_counter (
	.clk (clk),
	.rst (rst),
	.en (en),
	.incr (incr),
	.count (count)
);

rom sine_rom (
	.clk (clk),
	.addr1 (count),
	.addr2 (count + offset),
	.dout1 (dout1),
	.dout2 (dout2)
);

endmodule
