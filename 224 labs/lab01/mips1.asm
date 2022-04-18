	.text
	
	la	$t0, array1
	lw	$t2, counter
	
	
	
	# Display string: 
	# $v0= 4, $a0= address of string, sycall
	li	$v0, 4
	la	$a0, msg1
	syscall
	
	# Get user input
	li $v0, 5
    	syscall
	
	# Save to a register
	move $t3, $v0
	
	bne $t3,$0,continue
	j true
continue:
	
adding:	
	# Display string: 
	# $v0= 4, $a0= address of string, sycall
	li	$v0, 4
	la	$a0, msg2
	syscall
	
	# Get user input
	li $v0, 5
    	syscall
	
	# Save to a register
	move $t4, $v0
	
	#store the first element to the array1
	sw $t4, 0($t0)
	
	#increment the index
	addi $t0,$t0, 4
	
	#increment the counter
	addi $t2,$t2, 1
	
	bgt $t3,$t2, adding
	
	
reverse:	
	#fix the last index
    	addi    $t0, $t0, -4
    	
	#last index element
	lw      $t5, 0($t0)
	
    	#printing int
	li	$v0, 1
	move    $a0, $t5
	syscall
	
	#printing space
	li	$v0, 4
	la	$a0, msg3
	syscall
	
	#decrement the counter
	addi $t2,$t2, -1

	bgt $t2,$0, reverse
	j exit
true:	
	li	$v0, 4
	la	$a0, msg4
	syscall
exit:
	li $v0, 10
	syscall
	
	.data
array1:	.space 	80
counter:.word	0
msg1:	.asciiz	"enter size\n"
msg2:	.asciiz	"enter a number\n"
msg3: 	.asciiz	" "
msg4: 	.asciiz	"empty arr "