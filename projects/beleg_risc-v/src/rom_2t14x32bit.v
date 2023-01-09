/*
Data is stored in bytes -> each byte has an address
For 32bit instruction -> each instruction 4bytes -> PC incremented by 4
(kinda different for reduced instructions (16bit))

The Branch istruction imm is in format imm[12:0] where imm[0] = 0
-> can only be incremented by 2
(-> as we use only 32bit instuructions would be enought to in/de-crement by 4

RISC-V uses LITTLE_ENDIAN -> least significant byte is stored at the smallest memory address

NOTE: ignore 16bit instructions while design
*/

module rom2t14x32bit (
    input  [15:0] addr_in,      // address
    output [31:0] data_out      // data output (instruction)
);

    // one address 8 Bit wide
    // 4* 8Bit = one 32-bit-istruction
    // 2^16/4 = 2^14 32-bit-instructions
    reg [7:0] rom[65536:0]; 

    initial begin
        // $readmemh("rom_image.mem", rom);
        $readmemb("rom_image_risc.mem", rom);

    end

    // register file storage
    // TODO: use little endian for *.mem & maping here: data_out[0:7]
    assign data_out[7:0]    = rom[addr_in];
    assign data_out[15:8]   = rom[addr_in +1];
    assign data_out[23:16]  = rom[addr_in +2];
    assign data_out[31:24]  = rom[addr_in +3];

endmodule