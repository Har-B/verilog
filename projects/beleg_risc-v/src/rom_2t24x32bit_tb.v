module rom2t24x32bit_tb();

localparam WIDTH = 32;

    reg [23:0] addr_tb;
    wire [WIDTH-1:0] data_tb;

    rom2t24x32bit dut (
        .addr_in(addr_tb),
        .data_out(data_tb)
    );

    initial begin
        // produce output for terminal
        $monitor("Addr=%0h Data=%0b", addr_tb, data_tb);

        // produce wave output file
        $dumpfile("tb.vcd");
        $dumpvars(0, rom2t24x32bit_tb);
    end

    initial begin

        /* manual value testing */
           addr_tb = 0;
        #5 addr_tb = 1;
        #5 addr_tb = 2;
        #5 addr_tb = 3;

        // normal acess of first address of 32bit-instruction stored in 4*8bit storage
        #5 addr_tb = 4;
        #5 addr_tb = 8;
        #5 addr_tb = 12;
        #5 addr_tb = 16;
        #5 addr_tb = 20;
        #5 addr_tb = 24;

    end

endmodule