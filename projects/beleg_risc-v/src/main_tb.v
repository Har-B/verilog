module main_tb;

reg clk_tb;
reg rst_tb;
wire [15:0] pc_tb;
wire [15:0] pc_next_tb;
wire [31:0] instruction_tb;

    /* init external module */
    main dut (
        .clk(clk_tb),
        .rst(rst_tb)
    );

    /* direct access of lower-level modules */
    assign pc_tb = dut.pc;
    assign pc_next_tb = dut.pc_next;
    assign instruction_tb = dut.instruction;


    /* external stimulation of DUT */
    initial begin

        // produce output for terminal
        $monitor("time=%2t: clk=%d rst=%d PC=%d -> PC_next=%d; Instr=%0b",
            $time, clk_tb, rst_tb, pc_tb, pc_next_tb, instruction_tb);

        // produce wave output file
        $dumpfile("tb.vcd");
        $dumpvars(0, main_tb);
    end

    // Generate clk
    always #1 clk_tb = !clk_tb;

    initial begin

        clk_tb <= 0;
        rst_tb <= 0;

        #2 rst_tb <= 1;
        #2 rst_tb <= 0;
        
        #30 $finish;
    end


endmodule