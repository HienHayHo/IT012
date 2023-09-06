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
la $s0, array1
lw $a1, size1

la $s1, array2
lw $a2, size2

la $s2, array3
lw $a3, size3

# In array1
add $t0, $0, $0
li $v0, 4
la $a0, s2
syscall
loop:
slt $t1, $t0, $a1
beq $t1, $0, exit
sll $t2, $t0, 2
add $t3, $s0, $t2
lw $t4, ($t3)
li $v0, 1
la $a0, ($t4)
syscall
li $v0, 4
la $a0, s1 
syscall
addi $t0, $t0, 1
j loop

exit:

#In array2
add $t0, $0, $0
li $v0, 4
la $a0, s3
syscall
loop2:
slt $t1, $t0, $a2
beq $t1, $0, exit2
add $t3, $s1, $t0
lb $t4, ($t3)
li $v0, 1
la $a0, ($t4)
syscall
li $v0, 4
la $a0, s1 
syscall
addi $t0, $t0, 1
j loop2
exit2:


#    array3[i] = array2[i] + array2[size2 - 1 - i]
add $t0, $0, $0
loop3:
slt $t1, $t0, $a3
beq $t1, $0, exit3
#Tinh size2-1-i
addi $t2, $a2, -1
sub $t2, $t2, $t0
# array2[size2-1-i]
add $t3, $s1, $t2
lb $t4, ($t3)
#array2[i]
add $t5, $s1, $t0
lb $t6, ($t5)
#array2[i] + array2[size2-1-i]
add $t7, $t6, $t4
#array3[i]
add $t8, $s2, $t0
sb $t7, ($t8)
addi $t0, $t0, 1
j loop3
exit3:

#In array3
add $t0, $0, $0
li $v0, 4
la $a0, s4
syscall
loop4:
slt $t1, $t0, $a3
beq $t1, $0, exit4
add $t3, $s2, $t0
lb $t4, ($t3)
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
add $t2, $s0, $t1
lw $t3, ($t2)
li $v0, 1
la $a0, ($t3)
syscall
j exit_pro

A_2:
li $v0, 5
syscall
move $t0, $v0

sge $t1, $t0, 0
slt $t2, $t0, $a2
bne $t1, $t2, EXIT

add $t2, $s1, $t0
lb $t3, ($t2)
li $v0, 1
la $a0, ($t3)
syscall
j exit_pro

A_3:
li $v0, 5
syscall
move $t0, $v0

sge $t1, $t0, 0
slt $t2, $t0, $a3
bne $t1, $t2, EXIT

add $t2, $s2, $t0
lb $t3, ($t2)
li $v0, 1
la $a0, ($t3)
syscall
j exit_pro

EXIT:
li $v0, 4
la $a0, s7
syscall

exit_pro:













