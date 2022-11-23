module full_adder_8bit_tb;

    reg [7:0]a_tb;
    reg [7:0]b_tb;
    reg c_in_tb;
    wire [7:0]sum_tb;
    wire c_out_tb;

    // init external module
    full_adder_8bit dut8 (
        .a(a_tb),
        .b(b_tb),
        .c_in(c_in_tb),
        .sum(sum_tb),
        .c_out(c_out_tb)
    );

    // code external stimulation of DUT
    initial 
    begin

        // produce output for terminal
        // $monitor("time=%2t: A=%d B=%d Cin=%0b -> Sum=%d Cout=%0b", $time, a_tb, b_tb, c_in_tb, sum_tb, c_out_tb);
        $monitor("#pyCMD# %d + %d + %0b == %d + 256 * %0b", a_tb, b_tb, c_in_tb, sum_tb, c_out_tb);
        
        // produce output
        $dumpfile("a.vcd");
        $dumpvars(0, dut8);

        /* manual value testing */
        //     a_tb = 8'd0; b_tb = 8'd0; c_in_tb = 0;
        // # 5	a_tb = 8'd1; b_tb = 8'd0; c_in_tb = 0;
        // # 5	a_tb = 8'd0; b_tb = 8'd1; c_in_tb = 0;
        // # 5	a_tb = 8'd1; b_tb = 8'd1; c_in_tb = 0;

        // # 5	a_tb = 8'd0; b_tb = 8'd0; c_in_tb = 1;
        // # 5	a_tb = 8'd1; b_tb = 8'd0; c_in_tb = 1;
        // # 5	a_tb = 8'd0; b_tb = 8'd1; c_in_tb = 1;
        // # 5	a_tb = 8'd1; b_tb = 8'd1; c_in_tb = 1;

        // # 5	a_tb = 8'd64;  b_tb = 8'd1; c_in_tb = 1;
        
        // # 5	a_tb = 8'd100; b_tb = 8'd1; c_in_tb = 1;
        // # 5	a_tb = 8'd100; b_tb = 8'd30; c_in_tb = 0;

        // # 5	a_tb = 8'd255; b_tb = 8'd1; c_in_tb = 0;
        // # 5	a_tb = 8'd255; b_tb = 8'd1; c_in_tb = 1;

        // $finish;
    end

    /* iterating value testing */
    initial begin
    a_tb = 0;
    b_tb = 0;
    c_in_tb = 0;
    end

    always begin
        #512;
        a_tb = a_tb + 1;
        if (a_tb == 255) begin
            #15;
            $finish;
        end
    end
    always begin
        #2;
        b_tb = b_tb + 1;
        if (b_tb == 255) begin
            #2
            b_tb = 0;
        end
    end
    always begin
        #1 c_in_tb = ~c_in_tb;
    end

endmodule
