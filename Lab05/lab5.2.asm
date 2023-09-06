.data
array1: .word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1: .word 10
array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2: .word 16
array3: .space 8
size3: .word 8
s1: .asciiz " "
s2: .asciiz "\nARRAY1: "
s3: .asciiz "\nARRAY2: "
s4: .asciiz "\nARRAY3: "
s5: .asciiz "\nMang thu: "
s6: .asciiz "\nPhan tu thu: "
s7: .asciiz "INVALID."

.text
la $s1, array1
lw $a1, size1
la $s2, array2
lw $a2, size2
la $s3, array3
lw $a3, size3

#In array1
add $t0, $0, $s1
sll $t1, $a1, 2
add $t2, $s1, $t1
li $v0, 4
la $a0, s2
syscall
loop1:
slt $t3, $t0, $t2
beq $t3, $0, exit1
lw $t4, ($t0)
li $v0, 1
la $a0, ($t4)
syscall
li $v0, 4
la $a0, s1
syscall
addi $t0, $t0, 4
j loop1
exit1:

#In array2
add $t0, $0, $s2
add $t2, $s2, $a2
li $v0, 4
la $a0, s3
syscall
loop2:
slt $t3, $t0, $t2
beq $t3, $0, exit2
lb $t4, ($t0)
li $v0, 1
la $a0, ($t4)
syscall
li $v0, 4
la $a0, s1
syscall
addi $t0, $t0, 1
j loop2
exit2:

#array3[i] = array2[i] + array2[size2 - 1 - i]
add $t0, $0, $s3
add $t1, $0, $s2

addi $t3, $a2, -1
add $t2, $t3, $s2 #array2[size2-1]
add $t3, $s3, $a3

loop3:
slt $t4, $t0, $t3
beq $t4, $0, exit3
lb $t5, ($t1)
lb $t6, ($t2)
add $t7, $t5, $t6
sb $t7, ($t0)

addi $t0, $t0, 1
addi $t1, $t1, 1
addi $t2, $t2, -1
j loop3

exit3:

#In array3
add $t0, $0, $s3
add $t2, $s3, $a3
li $v0, 4
la $a0, s4
syscall
loop4:
slt $t3, $t0, $t2
beq $t3, $0, exit4
lb $t4, ($t0)
li $v0, 1
la $a0, ($t4)
syscall
li $v0, 4
la $a0, s1
syscall
addi $t0, $t0, 1
j loop4
exit4:

#Nhap mang thu may va phan tu nao
li $v0, 4
la $a0, s5
syscall
li $v0, 5
syscall
move $t0, $v0

sge $t1, $t0, 1
sle $t2, $t0, 3
bne $t1, $t2, EXIT

li $v0, 4
la $a0, s6
syscall

li $t1, 1
li $t2, 2
li $t3, 3

beq $t0, $t1, A_1
beq $t0, $t2, A_2
beq $t0, $t3, A_3

A_1:
li $v0, 5
syscall
move $t0, $v0

sge $t1, $t0, 0
slt $t2, $t0, $a1
bne $t1, $t2, EXIT

sll $t1, $t0, 2
add $t1, $s1, $t1
lw $t2, ($t1)
li $v0, 1
la $a0, ($t2) 
syscall
j exit_pro

A_2:
li $v0, 5
syscall
move $t0, $v0

sge $t1, $t0, 0
slt $t2, $t0, $a2
bne $t1, $t2, EXIT

add $t1, $s2, $t0
lb $t2, ($t1)
li $v0, 1
la $a0, ($t2)
syscall
j exit_pro

A_3:
li $v0, 5
syscall
move $t0, $v0

sge $t1, $t0, 0
slt $t2, $t0, $a3
bne $t1, $t2, EXIT

add $t1, $s3, $t0
lb $t2, ($t1)
li $v0, 1
la $a0, ($t2)
syscall
j exit_pro

EXIT:
li $v0, 4
la $a0, s7
syscall

exit_pro:



