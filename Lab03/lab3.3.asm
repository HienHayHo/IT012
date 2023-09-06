.data
	string1: .asciiz "Nhap a: "
	string2: .asciiz "Nhap b: "
	string3: .asciiz "Tong: "
.text
	#print string1
	li $v0, 4
	la $a0, string1
	syscall
	#Read a
	li $v0, 5
	syscall
	add $t1, $0, $v0
	#print string2
	li $v0, 4
	la $a0, string2
	syscall
	#Read b
	li $v0, 5
	syscall
	add $t2, $0, $v0
	#add t1 , t2
	add $t3, $t1, $t2
	#print string3
	li $v0, 4
	la $a0, string3
	syscall
	#print sum
	li $v0, 1
	la $a0, ($t3)
	syscall