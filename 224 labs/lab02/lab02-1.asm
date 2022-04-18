.text

start:	
	# load string address
	la $t0,input
	
	# printing string text
	li $v0,4
	la $a0,msg1
	syscall

	# taking string from the user
	li $v0, 8
	la $a0, input   
	li $a1, 20		# max size 20
	syscall
loop:
	lbu $t1,0($t0)
	andi $t1,$t1,0x0F	# t1 contains the ascii digit 
	
	# checking the end case
	beq $t1, 10, toDecimal  # string end with 10
	bgt $t1, 7, notOctal
	
	addi $t0,$t0,1		# index++
	addi $t3,$t3,1		# counter++
	j loop

toDecimal: 
	addi $t0, $t0, -1	# index fixed
	
	li $s1, 0		# sum of digits
	li $t4, 1		# first multiplier

loop2:

	lbu $t1, 0($t0)
	andi $t1, $t1, 0x0F	 # t1 contains the ascii digit 
	
	mul $t5, $t4, $t1	# first digit 
	add $s1, $s1, $t5	# add to sum
	
	mul $t4, $t4, 8		# multiplier increment with *8	
	addi $t0, $t0, -1	# index --
	addi $t3, $t3, -1	# counter --

	bne $t3, 0, loop2
	
	# printing decimal text
	li $v0,4
	la $a0, msg2
	syscall
	
	# printing result
	li $v0,1
	move $a0,$s1
	syscall
	
	li $v0,4
	la $a0, newline
	syscall
	j start	

notOctal:

	li $t0,-8		# print negative number
	move $a0,$t0
	li $v0,1
	syscall
	
exit:

	li $v0,10
	syscall

.data

msg1: .asciiz "Octal number:"
msg2: .asciiz "\nDecimal number:"
newline: .asciiz "\n"
input: .asciiz
