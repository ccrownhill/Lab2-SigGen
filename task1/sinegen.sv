module sinegen #(
	parameter ADDR_WIDTH = 8,
	parameter DATA_WIDTH = 8
)(
	input logic clk,
	input logic rst,
	input logic en,
	input logic [ADDR_WIDTH-1:0] incr,
	output logic [DATA_WIDTH-1:0] dout
);

logic [ADDR_WIDTH-1:0] count;

counter #(ADDR_WIDTH) addr_counter (
	.clk (clk),
	.rst (rst),
	.en (en),
	.incr (incr),
	.count (count)
);

rom #(ADDR_WIDTH, DATA_WIDTH) sine_rom (
	.clk (clk),
	.addr (count),
	.dout (dout)
);

endmodule
