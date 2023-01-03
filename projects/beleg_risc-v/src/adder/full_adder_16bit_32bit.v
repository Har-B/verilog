module full_adder_16bit(
    input [15:0]a,
    input [15:0]b,
    input c_in,         // carry bit in
    output [15:0]sum,
    output c_out        // carry bit out
);

    // wire for carry
    wire w_c_1;

    full_adder_8bit a0 (.a(a[7:0]),     .b(b[7:0]),     .c_in(c_in),    .c_out(w_c_1));
    full_adder_8bit a1 (.a(a[15:8]),    .b(b[15:8])     .c_in(w_c_1),   .c_out(c_out));

endmodule

module full_adder_32bit(
    input [31:0]a,
    input [31:0]b,
    input c_in,         // carry bit in
    output [31:0]sum,
    output c_out        // carry bit out
);

    // wire for carry
    wire w_c_1;

    full_adder_8bit a0 (.a(a[15:0]),    .b(b[15:0]),    .c_in(c_in),    .c_out(w_c_1));
    full_adder_8bit a1 (.a(a[31:16]),   .b(b[31:16]),   .c_in(w_c_1),   .c_out(c_out));

endmodule
