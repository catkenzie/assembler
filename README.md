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
R-Type Instructions <br> - ```add``` <br>-  ```nor``` | bits 24-22: ```opcode``` <br> bits 21-19: ```reg A``` <br> bits 18-16: ```reg B``` <br> bits 15-3: ```unused``` (all 0s) <br> bits 2-0: ```destReg```
I-type Instcutions <br> - ```lw```<br> - ```sw```<br> -  ```beq```| bits 24-22: ```opcode``` <br> bits 21-19: ```reg A``` <br> bits 18-16: ```reg B``` <br> bits 15-0: ```offsetField``` (16 bit 2's complement number within the range [-32768, 32767]
J-Type Instructions <br> - ```jalr``` | bits 24-22: ```opcode``` <br> bits 21-19: ```reg A``` <br> bits 18-16: ```reg B``` <br> bits 15-0: ```unused``` (all 0s)
O-Type Instructions <br> - ```halt```<br>- ```noop``` | bits 24-22: ```opcode``` <br> bits 21-0: ```unused``` (all 0s)


### Machine Instructions:
Description of the actions of the supported machine instructions in the LC-2K ISA. 

Name | Opcode (binary) | Action:
:---: | :---: | :---
```add``` | 000 | Add contents of ```regA``` with the contents of ```regB``` and store the result in the ```destReg```. 
```nor``` | 001 | Nor (bitwise) contents of ```regA``` with the contents of ```regB``` and store the result in the ```destReg```. 
```lw``` | 010 | Load ```regB``` from memory. Memory address formed by adding ```ofsetField``` with the contents of ```regA```. 
```sw``` | 011 | Store ```regB``` into memory. Memory address formed by adding ```ofsetField``` with the contents of ```regA```.
```beq``` | 100 | If the contents of ```regA``` and ```regB``` are the same, then branch to the address ```PC+1+offsetField```, ```PC``` being the program counter containing the address of this beq instruction.
```jalr``` | 101 | Store ```PC+1``` into ```regB``` (address of jalr instruction), then branch to the address contained in ```regB```. 
```halt``` | 110 | Increment the ```PC``` then halt the machine
```noop``` | 111 | Do nothing.



## The Assembler

This program takes an assembly-language program and translates it into machine language. The assembly-language instructions are turned into their opcodes and the symbolic names of addresses are turned into their numeric values. The output is 32-bit instruction machine code. 

### Example 
Program that counts down from 5:

Assembly Input:
```bash
        lw      0       1       five    load reg1 with 5 (symbolic address)
        lw      1       2       3       load reg2 with -1 (numeric address)
start   add     1       2       1       decrement reg1
        beq     0       1       2       goto end of program when reg1==0
        beq     0       0       start   go back to the beginning of the loop
        noop
done    halt                            end of program
five    .fill   5
neg1    .fill   -1
stAddr  .fill   start                   will contain the address of start (2)

```
Machine Code Output: 
```bash
(address 0): 0x810007
(address 1): 0x8a0003
(address 2): 0xa0001
(address 3): 0x101000
(address 4): 0x100fffd
(address 5): 0x1c00000
(address 6): 0x1800000
(address 7): 0x5
(address 8): 0xffffffff
(address 9): 2

```


## The Multiplier
Program written in the LC-2K assembly language that multiplies two numbers. 

Constraints:
- inputs are in memory locations named ```mcand``` and ```mplier```
- inputs are positive numbers at most 15 bits
- output will be stored in register 1 when the program halts
