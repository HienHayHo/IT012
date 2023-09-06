.data
	string1: .asciiz "Nhap ky tu (chi mot ky tu): "
	string2: .asciiz "\nKy tu truoc: "
	string3: .asciiz "\nKy tu sau: "
	s1: .asciiz "\nKy tu la so\n"
	s2: .asciiz "\nKy tu la chu\n"
	s3: .asciiz "\ninvalid type\n"
	s4: .asciiz "\nKy tu la chu in hoa\n"
.text
	#print string1
	li $v0, 4
	la $a0, string1
	syscall 
	
	#read char
	li $v0, 12
	syscall
	move $s0, $v0
	move $s1, $v0 #$s0=$s1=$v0
	
	sle $t0, $s0, 57 
	sge $t1, $s0, 48 #48 <= s0 <= 57: number
	beq $t0, $t1, number #Thoa man thi nhay den number
	
	sle $t0, $s0, 122 
	sge $t1, $s0, 97 #97 <= s0 <= 122: char in hoa
	beq $t0, $t1, char #Thoa man thi nhay den char
	
	sle $t0, $s0, 90 
	sge $t1, $s0, 65 #65 <= s0 <= 90: char thuong
	beq $t0, $t1, char_hoa #Thoa man thi nhay den char in hoa
	
	
	
	#neu khong roi vao cac truong hop tren thi in invalid type roi exit
	li $v0, 4
	la $a0, s3
	syscall
	j exit
	
	number:
	li $v0, 4
	la $a0, s1 #In ra s1
	syscall
	j res
	
	char:
	li $v0, 4
	la $a0, s2  #In ra s2
	syscall
	j res
	
	char_hoa:
	li $v0, 4
	la $a0, s4  #In ra s4
	syscall
	
	res:
	li $v0, 4
	la $a0, string2
	syscall
	addi $s0, $s0, -1 #Giam di 1 don vi trong bang ma ascii
	li $v0, 11 #print_char
	la $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, string3
	syscall
	addi $s1, $s1, 1 #Tang them 1 don vi trong bang ma ascii
	li $v0, 11 #print_char
	la $a0, ($s1)
	syscall
	
	exit:
