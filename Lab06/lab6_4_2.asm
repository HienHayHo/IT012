.text 
	li $s3, 4
	li $s4, 5
	bne $s3, $s4, else
	add $s0, $s1, $s2
	j exit
	else:
		sub $s0, $s1, $s2
	exit:
