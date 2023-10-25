module ram #(
	parameter ADDR_WIDTH = 9,
		  DATA_WIDTH = 8
)(
	input logic clk,
	input logic wr,
	input logic rd,
	input logic [ADDR_WIDTH-1:0] waddr,
	input logic [ADDR_WIDTH-1:0] raddr,
	input logic [DATA_WIDTH-1:0] din,
	output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] ram_array [2**ADDR_WIDTH-1:0];

always_ff @ (posedge clk) begin
	if (wr == 1'b1)
		ram_array[waddr] <= din;
	if (rd == 1'b1)
		dout <= ram_array[raddr];
end

endmodule
