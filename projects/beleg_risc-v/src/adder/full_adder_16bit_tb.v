module full_adder_16bit_tb;

localparam WIDTH = 16;

reg [WIDTH-1:0] a_tb;
reg [WIDTH-1:0] b_tb;
reg c_in_tb;
wire [WIDTH-1:0] sum_tb;
wire c_out_tb;
wire [WIDTH:0] sum_all_tb;

    // init external module
    full_adder_16bit dut (
        .a(a_tb),
        .b(b_tb),
        .c_in(c_in_tb),
        .sum(sum_tb),
        .c_out(c_out_tb)
    );

    /* direct wire-ing */
    // get whole sum with carry
    assign sum_all_tb[WIDTH]  = c_out_tb;
    assign sum_all_tb[WIDTH-1:0]  = sum_tb;


    /* external stimulation of DUT */
    initial 
    begin

        // produce output for terminal
        $monitor("time=%2t: A=%d B=%d Cin=%0b -> Sum=%d Cout=%0b", $time, a_tb, b_tb, c_in_tb, sum_tb, c_out_tb);

        // produce wave output file
        $dumpfile("tb.vcd");
        $dumpvars(0, full_adder_16bit_tb);

        /* manual value testing */
            a_tb = 16'd0; b_tb = 16'd0; c_in_tb = 0;  // = 1
        # 2	a_tb = 16'd1; b_tb = 16'd0; c_in_tb = 0;  // = 1
        # 2	a_tb = 16'd0; b_tb = 16'd1; c_in_tb = 0;  // = 1
        # 2 a_tb = 16'd0; b_tb = 16'd0; c_in_tb = 1;  // = 1

        # 2	a_tb = 16'd1;  b_tb = 16'd1; c_in_tb = 1;      // = 3
        # 2	a_tb = 16'hFF; b_tb = 16'd1; c_in_tb = 0;    // = 256
        # 2	a_tb = 16'hFF; b_tb = 16'd0; c_in_tb = 1;    // = 256
        # 2	a_tb = 16'hF0; b_tb = 16'hF0; c_in_tb = 0;  // = 480
        # 2	a_tb = 16'hFF; b_tb = 16'hFF; c_in_tb = 0;  // = 510

        # 2	a_tb = 16'hFF_FF; b_tb = 16'hFF_FF; c_in_tb = 0;  // = 131070 = 2^16 + 65534
        # 2	a_tb = 16'hFF_FF; b_tb = 16'hFF_FF; c_in_tb = 1;  // = 131071 = 2^16 + 65535
    end

    /* iterating value testing */
    // see full_adder_8bit_tb.v

endmodule