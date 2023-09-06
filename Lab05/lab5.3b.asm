.data
a: .word
s1: .asciiz "\nNhap so luong phan tu: "
s2: .asciiz "\nNhap cac phan tu: "
s3: .asciiz " "
s4: .asciiz "\nNhap i: "
s5: .asciiz "\nNhap j: "
s6: .asciiz "\nINVALID"

.text

la $s2, a
li $v0, 4
la $a0, s2
syscall

li $a1, 0
add $t0, $s2, $0

loop_test:
li $v0, 5
syscall
move $t8, $v0
beq $t8, -1, EXIT
sw $t8, 0($t0)
addi $t0, $t0, 4
addi $a1, $a1, 1
j loop_test

EXIT:

exit:
li $v0, 4
la $a0, s4
syscall
li $v0, 5
syscall
move $s0, $v0

sge $t1, $s0, 0
slt $t2, $s0, $a1
bne $t1, $t2, invalid


li $v0, 4
la $a0, s5
syscall
li $v0, 5
syscall
move $s1, $v0

slt $t0, $s0, $s1
sll $t3, $s0, 2
add $t4, $s2, $t3
beq $t0, $0, else 
sw $s0, ($t4)
j exit_p

else:
sw $s1, ($t4)
j exit_p

invalid:
li $v0, 4
la $a0, s6
syscall
j exit

exit_p:
#In array1
add $t0, $0, $s2
sll $t1, $a1, 2
add $t2, $s2, $t1
loop1:
slt $t3, $t0, $t2
beq $t3, $0, exit1
lw $t4, ($t0)
li $v0, 1
la $a0, ($t4)
syscall
li $v0, 4
la $a0, s3
syscall
addi $t0, $t0, 4
j loop1
exit1:
