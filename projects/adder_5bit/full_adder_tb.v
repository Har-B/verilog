module full_adder_tb;

reg a_tb, b_tb, c_in_tb;
wire sum_tb, c_out_tb;

// init external module
full_adder dut (
	.a(a_tb),
	.b(b_tb),
	.c_in(c_in_tb),
	.sum(sum_tb),
	.c_out(c_out_tb)
);

// code external stimulation of DUT
initial 
begin

	$monitor("time=%2t: A=%0b B=%0b Cin=%0b -> Sum=%0b Cout=%0b", $time, a_tb, b_tb, c_in_tb, sum_tb, c_out_tb);
	$dumpfile("a.vcd");
	$dumpvars(0, dut);

		a_tb = 0; b_tb = 0; c_in_tb = 0;
	# 5	a_tb = 1; b_tb = 0; c_in_tb = 0;
	# 5	a_tb = 0; b_tb = 1; c_in_tb = 0;
	# 5	a_tb = 1; b_tb = 1; c_in_tb = 0;

	# 5	a_tb = 0; b_tb = 0; c_in_tb = 1;
	# 5	a_tb = 1; b_tb = 0; c_in_tb = 1;
	# 5	a_tb = 0; b_tb = 1; c_in_tb = 1;
	# 5	a_tb = 1; b_tb = 1; c_in_tb = 1;
	$finish;
end

endmodule
