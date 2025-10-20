.data
	n1: .asciiz "Digite O Valor Do 1º Inteiro: "
	n2: .asciiz "Digite O Valor Do 2º Inteiro: "
	dividendo: .asciiz "O Dividendo é: "
	divisor: .asciiz "O Divisor é : "
	resultado: .asciiz "O Valor Da Operação é: "
	resto: .asciiz "O Resto é: "
	linha: .asciiz "\n"
.text
main:
	#mensagem 1º inteiro:
	li $v0,4 #Imprimir String
	la $a0,n1 #Imprimir a string n1
	syscall #print
	
	#Valor 1ºInteiro:
	li $v0,5 #Ler Inteiro
	syscall #print/terminar o que estava fazendo
	move $t0,$v0 #Mover Valor Lido Para t0
	
	#Texto n2:
	li $v0,4
	la $a0,n2
	syscall
	
	#Valor n2
	li $v0,5
	syscall
	move $t1,$v0
	
	# Comparação:
	bgt $t0,$t1,calc        # se t0 > t1, pula para calc
	bgt $t1,$t0,t1_maior    # se t1 > t0, pula para t1_maior
	beq $t0,$t1,calc        # se t0 == t1, pula para calc
	j fim

	t1_maior:
    	move $t2,$t0
    	move $t0,$t1
    	move $t1,$t2
    	j calc

	calc:
    	div $t0,$t1
    	mflo $t2
    	mul $t3,$t1,$t2
    	sub $t4,$t0,$t3
    	j fim
	
	fim:
	#Texto Dividendo
	li $v0,4 
	la $a0,dividendo
	syscall
	
	
	
	#Valor Dividendo
	li $v0,1 #Pegar O Resultado
	move $a0,$t0 #Valor Dividendo 
	syscall
	li $v0,4
	la $a0,linha
	syscall
	
	#Texto Divisor
	li $v0,4 #Imprimir String
	la $a0,divisor #Divisor Texto
	syscall
	
	
	#valor Divisor
	li $v0,1
	move $a0,$t1 #Valor Divisor
	syscall
	li $v0,4
	la $a0,linha
	syscall
	
	#Texto Resultado
	li $v0,4 #Função String
	la $a0,resultado #Texto Resultado
	syscall
	
	
	#Valor resultado
	li $v0,1
	move $a0,$t2 #Valor Divisão
	syscall
	li $v0,4
	la $a0,linha
	syscall
	
	
	#Texto Resto:
	li $v0,4
	la $a0,resto
	syscall
	
	
	li $v0,1
	move $a0,$t4
	syscall
	li $v0,4
	la $a0,linha
	syscall
	
	li $v0,10
	syscall
	
	
	
	