.text	

	lw	$t0, A	
	lw	$t1, B	
	lw	$t2, C		
	
	#getting a text			
	li	$v0, 4
	la	$a0, msg1
	syscall
							
	# getting a
	li $v0, 5
    	syscall
	
	# Save to a register
	move 	$t0, $v0


	#getting b text			
	li	$v0, 4
	la	$a0, msg2
	syscall
							
	# getting b
	li $v0, 5
    	syscall
	
	# Save to a register
	move 	$t1, $v0


	#getting c text			
	li	$v0, 4
	la	$a0, msg4
	syscall
							
	# getting c
	li $v0, 5
    	syscall
	
	# Save to a register
	move 	$t2, $v0




	# x = a (b - c) % 8

	
	sub $t4,$t1,$t2
	mult $t4,$t0 
	mflo $t5
	mfhi $t6
	
	bne $t4,$0,continue
	j true
	
continue:	
	bne $t0,$0,continue2
	j true
continue2:

#checking if b-c is negative or not
	blt $t4,0,loop2
	
loop:
	addi $t5,$t5,-8
	bge $t5,8,loop
	
	li	$v0, 1
	move	$a0, $t5
	syscall
	j exit
	
loop2:
	addi $t5,$t5,8
	blt $t5,0,loop2
	
	li	$v0, 1
	move	$a0, $t5
	syscall
	j exit
true:	
	li	$v0, 1
	move	$a0, $0
	syscall


exit:
	li $v0, 10
	syscall	
.data		

A:.word	0
B:.word	0
C:.word	0
msg1:	.asciiz	"enter a\n"
msg2:	.asciiz	"enter b\n"
msg3: 	.asciiz	" "	
msg4: 	.asciiz	"enter c\n"
msg5: 	.asciiz	"\n"	