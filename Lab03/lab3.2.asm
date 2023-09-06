.data
string1: .space 100
string2: .asciiz "Nhap: "
string3: .asciiz "Xuat: "

.text
	#print string2
	li $v0, 4
	la $a0, string2
	syscall
	
	#read string1
	li $v0, 8
	la $a0, string1
	li $a1, 100
	syscall
	
	#print string3
	li $v0, 4
	la $a0, string3
	syscall
	
	#print string1
	li $v0, 4
	la $a0, string1
	syscall
