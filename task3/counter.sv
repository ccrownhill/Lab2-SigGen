module counter #(
	parameter WIDTH = 9
)(
	input logic clk,
	input logic rst,
	output logic [WIDTH-1:0] count
);

always_ff @ (posedge clk) begin
	if (rst == 1'b1)
		count <= 0;
	else
		count <= count + {{WIDTH-1{1'b0}}, 1'b1};
end

endmodule
