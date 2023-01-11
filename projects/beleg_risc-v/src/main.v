module main (
    input clk,
    input rst
);

/*
    TODO: instruction is one beind of pc
*/

    /* programm counter */
    reg [15:0] pc;
    wire [15:0] pc_next;
    reg [31:0] instruction;
    wire [31:0] instruction_next;
    wire zero;
    wire [15:0] pc_step;

    wire [15:0] adder_pc_a;
    wire [15:0] adder_pc_b;

    assign zero = 1'b0;
    assign pc_step = 16'h00_04;

    /* init external module */
    /* ROM */
    rom2t14x32bit rom (     
            .addr_in(pc),
            .data_out(instruction_next)
    );

    /* 16bit adder for programm counter */
    full_adder_16bit adder_pc (
        .a(adder_pc_a),
        .b(adder_pc_b),
        .c_in(zero),
        .sum(pc_next),
        .c_out()
    );

    /* ALU */
    // TODO

    assign adder_pc_a = pc;
    assign adder_pc_b = pc_step;


    /* sequential logic */

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            // reset PC
            pc <= 16'd0;
        end
        else begin
            // get new pc from adder
            pc <= pc_next;

            instruction <= instruction_next;
            // TODO: add functionality of relative branching
        end

    end

endmodule