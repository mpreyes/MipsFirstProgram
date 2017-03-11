.data 
	welcome_message: .asciiz "Welcome to my awesome program!" 
	first_num: .asciiz " \n Enter the first number : " 
	second_num: .asciiz "Enter the second number: "
	addt: .asciiz "\nNumbers added: " 
	subtractt: .asciiz "\nNumbers subtracted: "
	andt: .asciiz " and "
	ort: .asciiz " or "
.text

	li $v0, 4
	la $a0, welcome_message
	syscall 
	

	#prompt for a number
	li $v0, 4

	la $a0, first_num
	syscall
	
	#get first number
	li $v0, 5	#we want to get an integer
	syscall
	# store the result in $t0
	#move $t0, $v0
	
	add $t0, $v0, $zero
	
	#ask for second number
	li $v0, 4
	la $a0, second_num
	syscall
	
	#get second number 
	li $v0, 5
	syscall 
	#move $t1, $v0
	add $t1, $v0, $zero
	
	add $t3,$t0,$t1
	sub $t4,$t0,$t1
	slt $t5,$t0,$t1 # if its less than it will be 1, else 0
	beq $t5,$zero,alessthanb
	bne $t5, $zero, agreaterthanb 
	syscall
	#if it is greater than display this label
	alessthanb: 
	li $v0, 4
	la $a0, andt
	
	syscall
	#if it is less than, display this label
	agreaterthanb:
	li $v0, 4
	la $a0, ort
	syscall
	
	#Display addition message
	li $v0, 4
	la $a0, addt
	syscall
	
	li $v0, 1 # 1 is to print an integer
	move $a0, $t3
	syscall
	
	#display subtraction
	li $v0, 4
	la $a0, subtractt
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
		
	
