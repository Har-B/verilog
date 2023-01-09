# Beleg Embedded Systems - RISC-V kompatibler Microprozessor

## Infos
* RISC-V
* 32 bit Architektur
* verarbeitet Integer-Werte

## Aufgaben
* Micro Controller
    * Rechenwerk
    * Registersatz
    * Programmspeicher
    * beigelegter Code (Listing 1) ist ausführbar
    * Programm gespeichert in Programmspeicher
    * Abarbeitung des Programms mit Hilfe eines Befehlszählers

* Testbenches zur Verifikation genutzt
* Dokumentation


### Listing 1
Assemblercode für die Multiplikation zweier Zahlen in RISC-V
~~~~
1 ADDI x1, x0, 5 # init reg[x1] <= 5
2 ADDI x2, x0, 4 # init reg[x2] <= 4
3 ADDI x3, x0, 0 # init reg[x3] <= 0
4
5 loop: # begin of loop
6 ADD x3, x3, x1 # x3 <= x3 + x1
7 ADDI x2, x2, -1 # x2 <= x2 + -1
8 BLT x0, x2, loop # branch to loop if x2 is less than x0
9
10 HLT # halt
~~~~

----
----
# Folgerungen aus Beleg-Aufgabe

## Aufgaben
**Legende:** <br>
(x) - noch zu tun <br>
(/) - Erledigt

* Assembler umwandeln in Binär-/Maschienen-Code
* (x) Micro Controller
    * (x) Rechenwerk
        * (x) ADD
        * (X) Compare (für BLT (branch if less than))
    * (x) Registersatz von RISC-V
        * (x) alle Spezialregister implementiert
    * (x) Programmspeicher
    * (X) ISA (Instruction Set Architecture) ist implementiert
        * (x) ADD
        * (x) ADDI
        * (x) BLT
    * (x) Programm gespeichert in Programmspeicher
    * (x) Abarbeitung des Programms mit Hilfe eines Befehlszählers
    * (x) beigelegter Code (Listing 1) ist ausführbar

* (x) Testbenches zur Verifikation genutzt
* (x) Dokumentation

### Listing 1
Assemblercode für die Multiplikation zweier Zahlen in RISC-V
~~~~
1 ADDI x1, x0, 5 # init reg[x1] <= 5 
2 ADDI x2, x0, 4 # init reg[x2] <= 4
3 ADDI x3, x0, 0 # init reg[x3] <= 0
4
5 loop: # begin of loop
6 ADD x3, x3, x1 # x3 <= x3 + x1
7 ADDI x2, x2, -1 # x2 <= x2 + -1
8 BLT x0, x2, loop # branch to loop if x2 is less than x0 # TODO <- exlpanation seams to be wrong  https://erik-engheim.medium.com/risc-v-assembly-code-examples-7bca0e7ebaa3 & Folien
9
10 HLT # halt
~~~~
### RISC-V 32bit
**ADDI:**
~~~~
I-Type:
[
    imm     [11:0]  31-20
    rs1     [4:0]   19-15
    func3   [2:0]   14-12   = 0x0
    rd      [4:0]   11-7
    opcode  [6:0]   6-0     = 0b0010011
]

--------------------------------------------------------------
Listing1:
                    #     imm          regI  fu3 regO  opcode
1 ADDI x1, x0, 5    # 32'b000000000101_00000_000_00001_0010011
2 ADDI x2, x0, 4    # 32'b000000000100_00000_000_00010_0010011
3 ADDI x3, x0, 0    # 32'b000000000000_00000_000_00011_0010011
7 ADDI x2, x2, -1   # 32'b111111111111_00010_000_00010_0010011
~~~~

**ADD:**
~~~~
R-Type:
[
    funct7  [6:0]   31-25   = 0x00
    rs2     [4:0]   24-20
    rs1     [4:0]   19-15
    func3   [2:0]   14-12   = 0x0
    rd      [4:0]   11-7
    opcode  [6:0]   6-0     = 0b0110011
]

---------------------------------------------------------------
Listing1:
                    #     fu7     regI1 regI2 fu3 regO  opcode
6 ADD x3, x3, x1    # 32'b0000000_00011_00001_000_00011_0110011
~~~~

**BLT:**
~~~~
B-Type:
[
    imm[12]     [0]     31
    imm[10-5]   [5:0]   30-25
    rs2         [4:0]   24-20
    rs1         [4:0]   19-15
    func3       [2:0]   14-12   = 0x4
    imm[4-1]    [3:0]   11-8
    imm[11]     [0]     7
    opcode      [6:0]   6-0     = 0b1100011
]
    imm[0] = 0b0

---------------------------------------------------------------
Listing1:

loop-memory-address = 3*4(as 32bit-instructions stored as 4 bytes) = 12
BLT-memory-address = 5*4 = 20
diff = 8
(cannot use uneven numbers because of imm[0] = 0)
                    #     imm      regI1 regI2 fu3 imm    opcode 
8 BLT x0, x2, loop  # 32'b0_000000_00000_00010_100_0100_0_1100011
~~~~