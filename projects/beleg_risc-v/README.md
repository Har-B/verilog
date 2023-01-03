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