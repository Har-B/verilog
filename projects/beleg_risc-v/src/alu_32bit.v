module alu_32bit (
    input [31:0]operand_a_in,
    input [31:0]operand_b_in,
    input [3:0]alu_operation_in,
    output reg [31:0]result_y_out,
    output reg result_carry_out
);

localparam ADD = 4'h0;
localparam SUB_SIGND = 4'h1;

// ADD, ADDition of two's complement, (Compare (BLT))
// muss in Zweierkomplement rechnen, da (-1) & siehe cobold

    // wires direct to/from adder
    reg [31:0] a_adder, b_adder;
    reg c_in_adder;
    wire [31:0] sum_adder;
    wire c_out_adder;

    wire [31:0]pc_w; // programm counter

    /* init external module */
    // ADD
    full_adder_32bit dut (
        .a(a_adder),
        .b(b_adder),
        .c_in(c_in_adder),
        .sum(sum_adder),
        .c_out(c_out_adder)
    );

    /* logic for signed (two's complement) substraction 
        used for BLT (signed)
    */
    /* connnection to adder */
    always @(*) begin
        case(alu_operation_in)
            // Addition
            ADD: begin
                a_adder = operand_a_in;
                b_adder = operand_b_in;
                c_in_adder = 1'b0; // TODO: Right?
            end
            // subtraction signed (BLT)
            SUB_SIGND: begin
                a_adder = operand_a_in;
                b_adder = (~operand_b_in);
                c_in_adder = 1'b1;
            end
            // default:;
        endcase
    end

    // assign module outputs
    always @(*) begin
        result_y_out = sum_adder;
        result_carry_out = c_out_adder; 
    end

endmodule