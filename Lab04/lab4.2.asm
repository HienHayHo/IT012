.data
	string1: .asciiz "\nHai so bang nhau"
	string2: .asciiz "\nSo lon hon: "
	string3: .asciiz "\nNhap so dau tien: "
	string4: .asciiz "\nNhap so thu hai: "
	s1: .asciiz "\nTong: "
	s2: .asciiz "\nHieu: "
	s3: .asciiz "\nTich: "
	s4: .asciiz "\nThuong (phan nguyen): "
	s5: .asciiz "\nThuong (phan du): "

.text
	#Nhap 2 so nguyen
	li $v0, 4
	la $a0, string3
	syscall
	li $v0, 5
	syscall
	move $s0, $v0 #Gan so dau tien cho s0
	
	li $v0, 4
	la $a0, string4
	syscall
	li $v0, 5
	syscall
	move $s1, $v0 #Gan so thu hai cho s1
	
	
	#Kiem tra
	
	#s1 = s0
	beq $s1, $s0, equal
	
	#s0 < s1
	slt $t1, $s0, $s1
	bne $t1, $0, less
	
	#s1 < s0
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 1
	la $a0, ($s0)
	syscall
	j res
	
	equal:
	li $v0, 4
	la $a0, string1
	syscall
	j res
	
	less:
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 1
	la $a0, ($s1)
	syscall
	j res
	
	res:
	#Sum
	li $v0, 4
	la $a0, s1
	syscall
	add $s2, $s1, $s0
	li $v0, 1
	la $a0, ($s2)
	syscall
	
	#Sub
	li $v0, 4
	la $a0, s2
	syscall
	sub $s2, $s0, $s1
	li $v0, 1
	la $a0, ($s2)
	syscall
	
	#Mul
	li $v0, 4
	la $a0, s3
	syscall
	mult $s0, $s1 #s0*s1: Ket qua la so nguyen luu trong $lo
	mflo $s2 
	li $v0, 1
	la $a0, ($s2)
	syscall
	
	#Div
	div $s0, $s1 #s0 / s1
	mflo $s2 #Phan nguyen luu trong thanh ghi $lo 
	mfhi $s3 #Phan du luu trong thanh ghi $hi 
	
	li $v0, 4
	la $a0, s4
	syscall
	li $v0, 1
	la $a0, ($s2)
	syscall
	
	li $v0, 4
	la $a0, s5
	syscall
	li $v0, 1
	la $a0, ($s3)
	syscall
	
	 
