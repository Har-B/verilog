module main;

/*

*/

    /* programm counter */
    reg [15:0] pc, pc_next;
    reg [31:0] instruction;
    reg clk, rst;

    // reg [15:0] a_tb;
    // reg [15:0] b_tb;
    // reg c_in_tb;
    // wire [15:0] sum_tb;
    // wire c_out_tb;
    // wire [15:0] sum_all_tb;

    /* init external module */
    /* rom */
    rom2t14x32bit dut (     
            .addr_in(pc),
            .data_out(instruction)
    );

    /* 16bit adder for programm counter */
    full_adder_16bit dut (
        .a(),
        .b(),
        .c_in(),
        .sum(),
        .c_out()
    );



//     // wires to alu
//     wire ;

//     /* init external module */
//     // ALU



endmodule