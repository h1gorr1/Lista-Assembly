#9.Fazer um algoritmo que leia 2 n�meros inteiros e exiba a divis�o destes. Sabe-se que o 2o n�mero
#n�o pode ser zero, portanto, deve-se insistir na solicita��o do 2o n�mero at� ele ser diferente de 0
.data
	dividido: .asciiz "N�mero A Ser Dividido: "
	invalido: .asciiz "N�mero Inv�lido, tente Denovo! "
	divisor : .asciiz "N�mero A Ser O Divisor: "
	total: .asciiz "O Total Da Divis�o �: "
.text
main:

#Texto Dividido
	li $v0,4
	la $a0,dividido
	syscall
	
	#Valor Do Dividido
	li $v0,5
	syscall
	move $t0,$v0 #Mover Para Registrador Zero
	
	#Texto Divisor:
	li $v0,4
	la $a0,divisor
	syscall
	
	#Valor Divisor:
	li $v0,5 #Ler Inteiro
	syscall
	move $t1,$v0
	
	verificar_n:
	bne $t1,$zero resultado_conta #Se Registrador 1 for diferente de zero, vai para a label Resultado Conta. 
	
	beq $t1,$zero n_invalido
	n_invalido:
	#Texto Inv�lido, Tente Novamente:
	li $v0,4
	la $a0,invalido
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	j verificar_n
	
	
	
	
	
	resultado_conta:
	div $t0,$t1
	mflo $t2
	j fim
	
	#texto Fim
	fim:
	li $v0,4 #Imprimir String
	la $a0,total #Texto(endere�o) do divisor
	syscall # print 
	
	li $v0,1 #Pegar o resultado
	move $a0,$t2 #Mover o resultado
	syscall #print
	
	li $v0,10 #Fim Do Programa
	syscall #Print
	
	
	
	
	