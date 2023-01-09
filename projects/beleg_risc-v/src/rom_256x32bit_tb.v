module rom256x32bit_tb();

localparam WIDTH = 32;

    reg [7:0] addr;
    wire [WIDTH-1:0] data;

    rom256x32bit dut (
        .addr(addr),
        .data(data)
    );

    initial begin
        // produce output for terminal
        $monitor("Addr=%0h Data=%0h", addr, data);

        // produce wave output file
        $dumpfile("tb.vcd");
        $dumpvars(0, rom256x32bit_tb);
    end

    initial begin

        /* manual value testing */
           addr = 0;
        #5 addr = 1;
        #5 addr = 2;
        #5 addr = 3;
        #5 addr = 4;

    end

endmodule