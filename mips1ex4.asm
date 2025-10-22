.data # cadastrar mensagens de texto
	prompt1: .asciiz "Digite O Valor Da Base Maior:\n"
	prompt2: .asciiz "Digite O Valor Da Base Menor:\n"
	prompt3:.asciiz "Digite A Altura: \n"
	resultado: .asciiz "Área Total : "
	divisor2: .float 2.00
	
.text # textos longos

main: # início do algoritmo;
#Base Maior
	   # ===== BASE MAIOR =====
    	li $v0, 4             # syscall 4 = imprimir string
    	la $a0, prompt1       # carrega o endereço da string no $a0
    	syscall               # imprime a mensagem

    	li $v0,6             #ler float
    	syscall               # lê número do teclado
    	mov.s $f1,$f0     # guarda o número em $f1

    	# ===== BASE MENOR =====
    	li $v0, 4             # imprime a segunda mensagem
    	la $a0, prompt2
    	syscall

    	li $v0,6             # lê o próximo número float
    	syscall
    	mov.s $f2,$f0        # guarda em $t1
	
	#altura:
	li $v0,4 #Imprimir String
	la $a0,prompt3 #Carregar O Prompt3 ;
	syscall
	
	li $v0,6 #ler número Float
	syscall
	mov.s $f3,$f0 #Float Para Registrador 3
	
	#processo:
	add.s $f4, $f1, $f2
	mul.s $f5, $f4,$f3
	l.s $f6,divisor2      # carrega o valor 2 em $t5
	div.s $f7, $f5,$f6   # divide $t4 por $t5
	#mflo pega o resultado da divisão (quociente) no registrador $f4
	#mtc1 $t6,$f0   #Transfere Para Ponto Flutuante o inteiro em $t4
	#cvt.s.w $f0,$f0 #Transferir Ponto flutuante no proprio registrador f0

	#Resultado:
	li $v0,4 #Imprimir String
	la $a0,resultado
	syscall
	
	li $v0,2 #Ler Float
	mov.s $f12,$f7 #
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
	
	
	
