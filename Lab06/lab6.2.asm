.data
a: .word
b: .word
c: .word
d: .word

.text

la $s1, a
la $s2, b
la $s3, c
la $s4, d

addi $s1, $0, 6
addi $s2, $0, 5
sub $s3, $s1, $s2
add $s4, $s1, $s2
