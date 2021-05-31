# LC2K Assembler
C program turning assembly code into machine code, based on the "LC-2K" ISA. 

## The LC2K ISA
Affectionately called the "Little Computer 2000", the LC-2K is a simple simulated computer that has the potential to solve some complex problems. It is an 8-register, 32 bit computer with 2<sup>16</sup> word-addressable memory slots.

### Instruction Formats:
- The LC-2K ISA had 4 instrution format types
- Bit 0 is the LSB
- Bits 31-25 are unused and should be 0

| | |
:--- | :---
R-Type Instructions <br> (```add```, ```nor```) | bits 24-22: ```opcode``` <br> bits 21-19: ```reg A``` <br> bits 18-16: ```reg B``` <br> bits 15-3: ```unused``` (all 0s) <br> bits 2-0: ```destReg```
I-type instcutions <br> (```lw```, ```sw```, ```beq```) | bits 24-22: ```opcode``` <br> bits 21-19: ```reg A``` <br> bits 18-16: ```reg B``` <br> bits 15-0: ```offsetField``` (16 bit 2's complement number within the range [-32768, 32767]
J-Type Instructions <br> (```jalr```) | bits 24-22: ```opcode``` <br> bits 21-19: ```reg A``` <br> bits 18-16: ```reg B``` <br> bits 15-0: ```unused``` (all 0s)
O-Type Instructions <br> (```halt```, ```noop```) | bits 24-22: ```opcode``` <br> bits 21-0: ```unused``` (all 0s)


### Machine Instructions:
Description of the actions of the supported machine instructions in the LC-2K ISA. 

Name | Opcode (binary) | Action:
:---: | :---: | :---
```add``` | 000 | Add contents of ```regA``` with the contents of ```regB``` and store the result in the ```destReg```. 
```nor``` | 001 | Nor (bitwise) contents of ```regA``` with the contents of ```regB``` and store the result in the ```destReg```. 
```le``` | 010 | Nor (bitwise) contents of ```regA``` with the contents of ```regB``` and store the result in the ```destReg```. 




## The Assembler


## The Multiplier

