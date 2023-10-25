module sigdelay #(
	parameter ADDR_WIDTH = 9,
		  DATA_WIDTH = 8
)(
	input logic clk,
	input logic wr,
	input logic rd,
	input logic rst,
	input logic [ADDR_WIDTH-1:0] offset,
	input logic [DATA_WIDTH-1:0] mic_signal,
	output logic [DATA_WIDTH-1:0] delayed_signal
);

logic [ADDR_WIDTH-1:0] count;

counter addr_counter (
	.clk (clk),
	.rst (rst),
	.count (count)
);

ram sound_ram (
	.clk (clk),
	.wr (wr),
	.rd (rd),
	.waddr (count + offset),
	.raddr (count), // read delayed
	.din (mic_signal),
	.dout (delayed_signal)
);

endmodule
