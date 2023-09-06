
.text
li $s0, 7
li $s1, 6
li $t0, 8
li $t1, 7

bne $s0, $s1, else
add $s2, $t0, $t1
j exit

else:
sub $s2, $t0, $t1
exit:

li $v0, 1
la $a0, ($s2)
syscall

