module alu_32bit_tb;

localparam WIDTH = 32;

localparam ADD = 4'h0;
localparam SUB_SIGND = 4'h1;

reg [WIDTH-1:0] a_tb;
reg [WIDTH-1:0] b_tb;
reg [3:0] alu_operation_tb;
wire [WIDTH-1:0] result_y_out_tb;
wire result_carry_out_tb;
wire [WIDTH:0]result_all_tb; // result with carry



    /* init external module */
    // ALU
    alu_32bit dut (
        .operand_a_in(a_tb),
        .operand_b_in(b_tb),
        .alu_operation_in(alu_operation_tb),
        .result_y_out(result_y_out_tb),
        .result_carry_out(result_carry_out_tb)
    );

    /* direct wire-ing */
    // get whole sum with carry
    assign result_all_tb[WIDTH]  = result_carry_out_tb;
    assign result_all_tb[WIDTH-1:0]  = result_y_out_tb;

    // code external stimulation of DUT
    initial 
    begin

        // produce output for terminal
        $monitor("time=%2t: A=%d B=%d AluOp=%0b -> Res=%d Cout=%0b", $time,
            a_tb, b_tb, alu_operation_tb, result_y_out_tb, result_carry_out_tb);

        // produce wave output file
        $dumpfile("tb.vcd");
        $dumpvars(0, alu_32bit_tb);

        /* manual value testing */
        // addition
        alu_operation_tb = ADD;
            a_tb = 32'd0; b_tb = 32'd0; // = 0
        # 2	a_tb = 32'd1; b_tb = 32'd0; // = 1
        # 2	a_tb = 32'd0; b_tb = 32'd1; // = 1

        # 2	a_tb = 32'd2;  b_tb = 32'd1;    // = 3
        # 2	a_tb = 32'hFFFF; b_tb = 32'd1;  // = 65535
        # 2	a_tb = 32'd1; b_tb = 32'hFFFF;  // = 65535

        # 2	a_tb = 32'hFFFF_FFFF; b_tb = 32'hFFFF_FFFF;  // = 8589934590 = 2^32 + 4294967294

        // substraction signed
        alu_operation_tb = SUB_SIGND;
            a_tb = 32'd0; b_tb = 32'd0; // = 0
        # 2	a_tb = 32'd1; b_tb = 32'd0; // = 1
        # 2	a_tb = 32'd0; b_tb = 32'd1; // = -1
        # 2	a_tb = 32'd1; b_tb = 32'd1; // = 0

        # 2	a_tb = 32'd2;  b_tb = 32'd1;    // = 1
        # 2	a_tb = 32'd1;  b_tb = 32'd2;    // = -1

        // transform with pyhton: bitstring.Bits(int=-100, length=32)
        # 2	a_tb = 32'hFFFF_FF9C;  b_tb = 32'd2;    // -100 - 2 = -102
        # 2	a_tb = 32'hFFFF_FF9C;  b_tb = 32'hFFFF_FFFE;    // -100 - -2 = -98
        # 2

    end


endmodule