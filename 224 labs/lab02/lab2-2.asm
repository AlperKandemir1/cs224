.text

start:
	#Print input text
	li $v0,4
	la $a0,msg1
	syscall
	
	#Read input
	li $v0,5
	syscall
	
	#sum
	li $t1,0
	
	#copy initial number
	move $t0,$v0
	move $t8,$v0
	

	#digit 1
	srl $t0,$t0,28		#t0= initial number
	sll $t0,$t0,24
	add $t1,$t1,$t0

	move $t0,$t8
	
	#digit 2
	srl $t0,$t0,24
	sll $t0,$t0,28
	add $t1,$t1,$t0

	move $t0,$t8
	
	#digit 3
	srl $t0,$t0,20
	sll $t0,$t0,28
	srl $t0,$t0,12
	add $t1,$t1,$t0
	
	move $t0,$t8

	#digit 4
	srl $t0,$t0,16
	sll $t0,$t0,28
	srl $t0,$t0,8
	add $t1,$t1,$t0
	
	move $t0,$t8

	#digit 5
	srl $t0,$t0,12
	sll $t0,$t0,28
	srl $t0,$t0,20
	add $t1,$t1,$t0
	
	move $t0,$t8
	
	#digit 6
	srl $t0,$t0,8
	sll $t0,$t0,28
	srl $t0,$t0,16
	add $t1,$t1,$t0	
	
	move $t0,$t8
	
	#digit 7
	srl $t0,$t0,4
	sll $t0,$t0,28
	srl $t0,$t0,28
	add $t1,$t1,$t0
	
	move $t0,$t8
	
	#digit 8
	sll $t0,$t0,28
	srl $t0,$t0,24
	add $t1,$t1,$t0
	
	move $t0,$t8
	
	#Print result text
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,4
	la $a0,msg4
	syscall
	
	#Print result in hex
	li $v0,34
	move $a0,$t1
	syscall
	
	#Print initial number
	li $v0,4
	la $a0,msg3
	syscall
	
	#Print initial hex
	li $v0,34
	move $a0,$t8
	syscall
	
	
	#Print stop text
	li $v0,4
	la $a0,msg5
	syscall
	
	#Read stop or continue input
	li $v0,5
	syscall
	move $t0,$v0
	
	beq $t0,1,start
	beq $t0,-1,exit
	
exit:
	li $v0,10
	syscall

.data

msg1: .asciiz "\nEnter a number:"
msg2: .asciiz "\nresult: "
msg3: .asciiz "\ninitial number: "
msg4: .asciiz "        "
msg5: .asciiz "\n enter 1 to continue or press -1 to stop: "
