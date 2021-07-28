      lw  0  6  mcand
      lw  0  7  mplier
      lw  0  5  max
      lw  0  2  bit
while beq  3  5  exit
      nor  2  2  2
      nor  7  7  7
      nor  7  2  4
      beq  4  0  noadd
      add  1  6  1
noadd lw   0  4  bit
      nor  2  2  2
      nor  7  7  7
      add  6  6  6
      add  2  2  2
      add  3  4  3
      beq  3  3  while
exit  halt
mcand   .fill  32766
mplier  .fill  10383
max     .fill  15
bit     .fill  1
