			
	.text		
		
	la	$t0, array
	la	$t1, array
	lw	$t2, counter		
				
	#getting size			
	li	$v0, 4
	la	$a0, msg1
	syscall
							
	# Get user input
	li $v0, 5
    	syscall
	
	# Save to a register
	move 	$t3, $v0
				
	bne	$t3,$0, adding
	li	$v0, 4
	la	$a0, msg5
	syscall	
	j exit	
			
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
			
			
	#fix the last index
    	addi    $t0, $t0, -4    #t0=last element
    	#reset counter
    	
check:
	lw 	$t5, 0($t0)
	lw 	$t6, 0($t1)
	
    	addi    $t0, $t0, -4
    	addi    $t1, $t1, 4
    	
    	#decrement the counter
	addi 	$t2,$t2, -1
	
	bne 	$t5,$t6,false
    	bgt 	$t2,$0, check
    	
    	#palindrome
    	li	$v0, 4
	la	$a0, msg5
	syscall
	j exit
    	
    	#not palindrome
false:
	li	$v0, 4
	la	$a0, msg4
	syscall
			
exit:
	li $v0, 10
	syscall			
			
			
			
			
	.data		
array:	.space 	80
counter:.word	0
msg1:	.asciiz	"enter size\n"
msg2:	.asciiz	"enter a number\n"
msg3: 	.asciiz	" "	
msg4: 	.asciiz	"not palindrome\n"
msg5: 	.asciiz	"palindrome\n"	