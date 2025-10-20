.data
	prompt1: .asciiz "Digite O Valor Do Comprimento: "
	prompt2: .asciiz "Digite O Valor Da Largura: "
area: .asciiz "	O Valor Da Área É : "
.text
main:
# Comprimento Texto
	li $v0, 4
	la $a0,prompt1
	syscall
	
	#Comprimento Valor 
	li $v0,5
	syscall
	move $t0,$v0
	
	#Largura Texto
	li $v0,4
	la $a0,prompt2
	syscall
	
	#Largura Valor
	li $v0,5
	syscall
	move $t1,$v0
	
	#Processo área
	mul $t2,$t0,$t1
	
	li $v0,4
	la $a0,area
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
	
	li $v0,10
	syscall
	
	
	
	