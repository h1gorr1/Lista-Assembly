#11.Escrever um algoritmo que leia uma quantidade desconhecida de n�meros e conte quantos deles
#est�o nos seguintes intervalos: [0-25], [26-50], [51-75] e [76-100]. A entrada de dados deve terminar
#quando for lido um n�mero negativo.
#*Sabe-se que a entrada deve ser um n�mero entre 0 e 100, validar a entrada para que n�o permita
#n�meros fora deste intervalo
.data
	n: .asciiz "Digite O N�mero Desejado! "
	ninvalido: .asciiz "N Inv�lido, tente Menor que 100! "
	final: .asciiz "Um N�mero Menor que 0 foi digitado,fim do programa! "
	linha: .asciiz "\n"
	contador: .asciiz "n at� a sequ�ncia �:"
.text
main:

	#N:
	li $v0,4 #Fun��o De Imprimir String
	la $a0,n #String n
	syscall
	
	li $v0,5 #Fun��o Ler Inteiro:
	syscall
	move $t0,$v0 #Converter para t0
	
	li $t1,25 #Sequencia 1
	li $t2,50 #Sequencia 2
	li $t3,75 #Sequencia 3
	li $t4,100 #Sequencia 4
	li $t9,1 #Valor Adicionado
	li $t6,0 #Contador 
	
	j verificar_n
	
	#validar_n:
	reformular_n:
	li $v0,4 #Imprimir string
	la $a0,linha #Argumento no .data
	syscall #Mostrar
	
	li $v0,4
	la $a0,n
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	verificar_n:
	bgt $t0,$t4,valor_invalido   # Se for maior que 100 ? inv�lido
    	blt $t0,$zero,fim            # Se for negativo ? fim blt = menor que
    	j processo_n                 # Caso contr�rio ? v�lido, vai pro processo_n
	
	valor_invalido:
	li $v0,4
	la $a0,ninvalido
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	processo_n:
	move $t6,$zero
	blt $t0,$zero,fim #Se N Menor Que Zero,Fim Do Programa
	ble $t0,$t1,looping_0a25 #Se N For Menor ou igual que 25, vai pro looping de 0 a 25
	ble $t0,$t2,looping_26a50 #Se N For Menor Que 50, V� De 26 a 50 
	ble $t0,$t3,looping_51a75 #Se N For Menor Que 75, V� De 51 a 75
	ble $t0,$t4,looping_76a100 #Se N For Menor Que 100, V� De 76 a 100
	
	looping_0a25:
	beq $t0,$t1,mostrar_contador #Se T0 For Igual a 25,pular para o contador direto.
	add $t0,$t0,$t9 #Adicionar 1 a n
	add $t6,$t6,$t9 #Adicionar 1 ao contador da sequencia que come�a com zero
	li $v0,1 #Imprimir N�mero Inteiro
	move $a0,$t0 #Mostrar N�mero Do Registrador 
	syscall #Parar e fazer
	
	li $v0,4
	la $a0,linha
	syscall
	
	bne $t0,$t1,looping_0a25 #Se For Diferente de 25,volta pro loop 
	
	
	j reformular_n
	
	looping_26a50:
	beq $t0,$t2,mostrar_contador #Se For Igual, Mostrar Contador Direto
	add $t0,$t0,$t9 #Adicionar 1 ao n�mero selecionado
	add $t6,$t6,$t9 #Adicionar 1 ao contador
	
	li $v0,1 #imprimir n�mero inteiro
	move $a0,$t0 #mostrar n�mero depois do acrescimo
	syscall
	
	li $v0,4 #Imprimir string
	la $a0,linha #Argumento no .data
	syscall #Mostrar
	
	bne $t0,$t2,looping_26a50 #Se For Diferente, Volta pro loop!
	li $v0,4 #Imprimir string
	la $a0,linha #Argumento no .data
	syscall #Mostrar
	j mostrar_contador
	
	looping_51a75:
	beq $t0,$t3,mostrar_contador #Se For Igual a 75,mostra o Contador Direto.
	add $t0,$t0,$t9 #Adicionar 1 a n
	add $t6,$t6,$t9 #adicionar 1 ao contador
	
	li $v0,1 #Imprimir N�mero Inteiro
	move $a0,$t0 #mover o quue foi armazenado para ser mostrado  
	syscall
	
	li $v0,4 #Imprimir string
	la $a0,linha #Argumento no .data
	syscall #Mostrar
	
	bne $t0,$t3,looping_51a75 #se n for diferente de t3(75),voltar pro looping
	li $v0,4 #Imprimir string
	la $a0,linha #Argumento no .data
	syscall #Mostrar
	j mostrar_contador
	
	looping_76a100:
	beq $t0,$t4,mostrar_contador #se for igual a 100, mostra contador direto
	add $t0,$t0,$t9 #Adicionar 1 ao n selecionado 
	add $t6,$t6,$t9 #Adicionar 1 ao contador
	
	li $v0,1 #Imprimir inteiro
	move $a0,$t0
	syscall
	
	li $v0,4 #Imprimir string
	la $a0,linha #Argumento no .data
	syscall #Mostrar
	
	bne $t0,$t4,looping_76a100 #se n for diferente de 100, volte para o looping!
	li $v0,4 #Imprimir string
	la $a0,linha #Argumento no .data
	syscall #Mostrar
	
	j mostrar_contador #SE n�O, mostre o contador
	
	mostrar_contador: #Fun��o final de cada Lista
	li $v0,4 #fun��o Imprimir texto
	la $a0,contador #Imprimir string contador no data
	syscall #mostrar na tela
	
	li $v0,1 #fun��o imprimir inteiro
	move $a0,$t6 #argumento a carregar
	syscall #mostrar
	
	li $v0,4 #Imprimir string
	la $a0,linha #Argumento no .data
	syscall #Mostrar
	j reformular_n
	
	fim:
	li $v0,4
	la $a0,final
	syscall
	
	li $v0,10
	syscall