module rom256x32bit (
    input   [7:0] addr,       // address
    output [31:0] data      // data output (instruction)
);

    // memory: 16 Bit wide @ 8 locations (deep)
    reg [31:0] rom[255:0];

    initial begin
        $readmemh("rom_image.mem", rom);
    end

    // register file storage
    assign data = rom[addr];

endmodule