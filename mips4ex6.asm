#6.Faça um algoritmo que leia dois valores inteiros A e B se os valores forem iguais deverá se somar
#os dois, caso contrário multiplique A por B. Ao final de qualquer um dos cálculos deve-se atribuir o
#resultado para uma variável C e mostrar seu conteúdo na tela.
.data
	prompt: .asciiz "Valor De A: "
	prompt1: .asciiz "Valor De B: "
	valordec: .asciiz "Valor De C é: "
.text
main:
#Mensagem Valor De A:
	li $v0,4
	la $a0,prompt
	syscall
	
	li $v0,5 #Ler Valor  De A:
	syscall
	move $t0,$v0#Valor De a em Registraddor 0
	
	#Mensagem Valor B
	li $v0,4
	la $a0,prompt1
	syscall
	
	#Armazenar Valor B
	li $v0,5
	syscall
 	move $t1,$v0 #Valor De B No t1
	
	beq $t1,$t0, somar_ab #Somar a e b
	
	multiplicar_ab: #multiplicar a e b
	mul $t2,$t0,$t1
	j fim
	
	somar_ab:
	add $t2,$t0,$t1
	j fim
	
	fim:
	li $v0,4
	la $a0,valordec
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
	
	li $v0,10
	syscall
	