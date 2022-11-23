module full_adder_8bit(
    input [7:0]a,
    input [7:0]b,
    input c_in,		// carry bit
    output [7:0]sum,
    output c_out	// carry bit
);

    wire  w_c_1, w_c_2, w_c_3, w_c_4, w_c_5, w_c_6, w_c_7;

    full_adder a0 (.a(a[0]), .b(b[0]), .c_in(c_in),  .sum(sum[0]), .c_out(w_c_1));
    full_adder a1 (.a(a[1]), .b(b[1]), .c_in(w_c_1), .sum(sum[1]), .c_out(w_c_2));
    full_adder a2 (.a(a[2]), .b(b[2]), .c_in(w_c_2), .sum(sum[2]), .c_out(w_c_3));
    full_adder a3 (.a(a[3]), .b(b[3]), .c_in(w_c_3), .sum(sum[3]), .c_out(w_c_4));
    full_adder a4 (.a(a[4]), .b(b[4]), .c_in(w_c_4), .sum(sum[4]), .c_out(w_c_5));
    full_adder a5 (.a(a[5]), .b(b[5]), .c_in(w_c_5), .sum(sum[5]), .c_out(w_c_6));
    full_adder a6 (.a(a[6]), .b(b[6]), .c_in(w_c_6), .sum(sum[6]), .c_out(w_c_7));
    full_adder a7 (.a(a[7]), .b(b[7]), .c_in(w_c_7), .sum(sum[7]), .c_out(c_out));

    
endmodule
