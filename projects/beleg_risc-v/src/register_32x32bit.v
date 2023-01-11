// TODO: rename I/O's

module register_32x32bit (
    input         clk,
    input         rst,           // rst = 1 => delete all values
    input  [31:0] regIn_in,         // input value
    input  [4:0]  regInAddr_in,     // input address (2^5 = 32)
    input         regInWE_in,       // input write enable
    input  [4:0]  regOut1Addr_in,   // output1 address
    input  [4:0]  regOut2Addr_in,   // output2 address
    output [31:0] regOut1_out,       // output1 value
    output [31:0] regOut2_out      // output2 value
);


  // memory: 32 Bit wide @ 32 locations (deep)
  reg [31:0] register[31:0];

  // register file storage
  always @(posedge clk, posedge rst) begin
    
    // if reset active, delete memory content
    if (rst) begin
        // TODO: is there a nicer way?
        register[0] <= 32'b0;
        register[1] <= 32'b0;
        register[2] <= 32'b0;
        register[3] <= 32'b0;
        register[4] <= 32'b0;
        register[5] <= 32'b0;
        register[6] <= 32'b0;
        register[7] <= 32'b0;
        register[8] <= 32'b0;
        register[9] <= 32'b0;
        register[10] <= 32'b0;
        register[11] <= 32'b0;
        register[12] <= 32'b0;
        register[13] <= 32'b0;
        register[14] <= 32'b0;
        register[15] <= 32'b0;
        register[16] <= 32'b0;
        register[17] <= 32'b0;
        register[18] <= 32'b0;
        register[19] <= 32'b0;
        register[20] <= 32'b0;
        register[21] <= 32'b0;
        register[22] <= 32'b0;
        register[23] <= 32'b0;
        register[24] <= 32'b0;
        register[25] <= 32'b0;
        register[26] <= 32'b0;
        register[27] <= 32'b0;
        register[28] <= 32'b0;
        register[29] <= 32'b0;
        register[30] <= 32'b0;
        register[31] <= 32'b0;
    end
    // if inWriteEnable is active, write to register
    else begin
      if (regInWE_in) begin
        register[regInAddr_in] <= regIn_in;
      end
    end
  end

  // output registers
  assign regOut1_out = register[regOut1Addr_in];
  assign regOut2_out = register[regOut2Addr_in];

endmodule