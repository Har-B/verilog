module full_adder (
	input a,
	input b,
	input c_in,	// carriage in
	output sum,
	output c_out 	// carriage out
);

// Code for Adder implementation

assign sum = a ^ b ^ c_in;
assign c_out = (a & b) | (a & c_in) | (b & c_in);

// as primitives
// xor(sum, a, b, c_in)


endmodule
