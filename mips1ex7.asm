# 4.Fa�a um algoritmo que calcule e mostre a �rea de um trap�zio usando apenas n�meros inteiros.
#Sabe-se que: A = (base maior + base menor) * altura)/2

.data # cadastrar mensagens de texto
	prompt1: .asciiz "Digite O Valor Da Base Maior:\n"
	prompt2: .asciiz "Digite O Valor Da Base Menor:\n"
	prompt3:.asciiz "Digite A Altura: \n"
	resultado: .asciiz "�rea Total : "
	
.text # textos longos

main: # in�cio do algoritmo;
#Base Maior
	   # ===== BASE MAIOR =====
    	li $v0, 4             # syscall 4 = imprimir string
    	la $a0, prompt1       # carrega o endere�o da string no $a0
    	syscall               # imprime a mensagem

    	li $v0, 5             # syscall 5 = ler inteiro
    	syscall               # l� n�mero do teclado
    	move $t0, $v0         # guarda o n�mero em $t0

    	# ===== BASE MENOR =====
    	li $v0, 4             # imprime a segunda mensagem
    	la $a0, prompt2
    	syscall

    	li $v0, 5             # l� o pr�ximo n�mero
    	syscall
    	move $t1, $v0         # guarda em $t1
	
	#altura:
	li $v0,4 #Imprimir String
	la $a0,prompt3 #Carregar O Prompt3 ;
	syscall
	
	li $v0,5 #ler n�mero inteiro
	syscall
	move $t3,$v0
	
	
	
	
	
	#processo:
	add $t2, $t0, $t1
	mul $t4, $t2,$t3
	li $t5, 2      # carrega o valor 2 em $t5
	div $t4, $t5   # divide $t4 por $t5
	mflo $t4       # pega o resultado da divis�o (quociente) no registrador $t4

	
	
	#Resultado:
	li $v0,4 #Imprimir String
	la $a0,resultado
	syscall
	
	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
	
	
	
