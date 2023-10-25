module counter #(
	parameter WIDTH = 8
)(
	input logic clk,
	input logic rst,
	input logic en,
	input logic [WIDTH-1:0] incr,
	output logic [WIDTH-1:0] count
);

always_ff @ (posedge clk) begin
	if (rst == 1'b1)
		count <= 0;
	else if (en == 1'b1)
		count <= count + incr;
end

endmodule
