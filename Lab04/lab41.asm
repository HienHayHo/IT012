.text
li $s1, 5
li $s2, 0
li $s0, 1
loop:
sle $t0, $s0, $s1
beq $t0, $0, exit
add $s2, $s2, $s0
addi $s0, $s0, 1
j loop
exit:

li $v0, 1
la $a0, ($s2)
syscall