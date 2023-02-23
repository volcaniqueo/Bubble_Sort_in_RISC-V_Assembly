.globl _start

.equ N, 6
.section .data
V: .word 7,6,5,4,3,2

.section .text
_start:
    li a0, 0 # i
    li a1, N-1 # N
    la t0, V
    j for1

for1:
    bge a0, a1, EXIT
    li a2, 0 # j
    sub a3, a1, a0
    addi a0, a0, 1
    j for2
for2:
    bge a2, a3, for1
    slli t1, a2, 2
    addi a2, a2, 1
    add t1, t1, t0  #V[j]
    lw a4, 0(t1)
    addi t1, t1, 4  #V[j+1] 
    lw a5, 0(t1)
    ble a4, a5, for2
    sw a4, 0(t1)
    addi t1, t1, -4
    sw a5, 0(t1)
    j for2

EXIT:
    j .
    




