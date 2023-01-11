module register_32x32bit_tb;

reg         clk_tb;
reg         rst_tb;
reg  [31:0] regIn_in_tb;
reg  [4:0]  regInAddr_in_tb;
reg         regInWE_in_tb;
reg  [4:0]  regOut1Addr_in_tb;
reg  [4:0]  regOut2Addr_in_tb;
wire [31:0] regOut1_out_tb;
wire [31:0] regOut2_out_tb;

    /* init external module */
    register_32x32bit dut(
        .clk(clk_tb),
        .rst(rst_tb),
        .regIn_in(regIn_in_tb),
        .regInAddr_in(regInAddr_in_tb),
        .regInWE_in(regInWE_in_tb),
        .regOut1Addr_in(regOut1Addr_in_tb),
        .regOut2Addr_in(regOut2Addr_in_tb),
        .regOut1_out(regOut1_out_tb),
        .regOut2_out(regOut2_out_tb)
    );

     /* external stimulation of DUT */
    initial begin

        // produce output for terminal
        $monitor("time=%2t: rst: %d; OutAddr1=%d OutVal1=%h OutAddr2=%d OutVal2=%h; WE=%d WrAddr=%d InVal= %h",
            $time, rst_tb, 
            regOut1Addr_in_tb, regOut1_out_tb,
            regOut2Addr_in_tb, regOut2_out_tb,
            regInWE_in_tb, regInAddr_in_tb, regIn_in_tb
        );

        // produce wave output file
        $dumpfile("tb.vcd");
        $dumpvars(0, register_32x32bit_tb);
    end


    // Generate clk 
    //  baseTime = #2 (two inverts to get posEdge again) -> #1
    always #1 clk_tb = !clk_tb;

    /* manual value testing */
    initial begin

        clk_tb     <= 0;
        rst_tb     <= 1;
        regInWE_in_tb <= 0;

        #2 rst_tb <= 0;

        // show current memory content
           regOut1Addr_in_tb = 5'b00000; regOut2Addr_in_tb = 5'b00000;
        #2 regOut1Addr_in_tb = 5'b00001; regOut2Addr_in_tb = 5'b00001;
        #2 regOut1Addr_in_tb = 5'b00010; regOut2Addr_in_tb = 5'b00010;
        #2 regOut1Addr_in_tb = 5'b00011; regOut2Addr_in_tb = 5'b00011;
        #2 regOut1Addr_in_tb = 5'b11111; regOut2Addr_in_tb = 5'b11111;
        
        // insert new memory content
        #2 regInAddr_in_tb = 5'b00000; regIn_in_tb = 32'hcccc_ffff; regInWE_in_tb = 1; #2 regInWE_in_tb = 0;
        #2 regInAddr_in_tb = 5'b00001; regIn_in_tb = 32'hcccc_aaaa; regInWE_in_tb = 1; #2 regInWE_in_tb = 0;
        #2 regInAddr_in_tb = 5'b00010; regIn_in_tb = 32'hcccc_bbbb; regInWE_in_tb = 1; #2 regInWE_in_tb = 0;
        #2 regInAddr_in_tb = 5'b00011; regIn_in_tb = 32'hcccc_5555; regInWE_in_tb = 1; #2 regInWE_in_tb = 0;
        #2 regInAddr_in_tb = 5'b11111; regIn_in_tb = 32'hffff_ffff; regInWE_in_tb = 1; #2 regInWE_in_tb = 0;
        
        // check for new content
        #2 regOut1Addr_in_tb = 5'b00000; regOut2Addr_in_tb = 5'b00000;
        #2 regOut1Addr_in_tb = 5'b00001; regOut2Addr_in_tb = 5'b00001;
        #2 regOut1Addr_in_tb = 5'b00010; regOut2Addr_in_tb = 5'b00010;
        #2 regOut1Addr_in_tb = 5'b00011; regOut2Addr_in_tb = 5'b00011;
        #2 regOut1Addr_in_tb = 5'b11111; regOut2Addr_in_tb = 5'b11111;

        #5 $finish;

    end

endmodule