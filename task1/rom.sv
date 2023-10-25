module rom #(
	parameter ADDR_WIDTH = 8,
		  DATA_WIDTH = 8
)(
	input logic clk,
	input logic [ADDR_WIDTH-1:0] addr,
	output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] rom_array [2**ADDR_WIDTH-1:0];

initial begin
	$display("Loading ROM.");
	$readmemh("sinerom.mem", rom_array);
end

always_ff @ (posedge clk) begin
	dout <= rom_array[addr];
end

endmodule
