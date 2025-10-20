#8.Encontrar o dobro de um número caso ele seja positivo e o seu triplo caso seja negativo,
#imprimindo o resultado.

.data
	valorn: .asciiz "Determine o Valor De N: "
	total: .asciiz "O Valor Final De N é: "
	#n: .float 0.0
	
.text
main:
	#Texto Valor De N
	li $v0,4
	la $a0,valorn
	syscall
	

	
	#Pegando Valor De N:
	li $v0,5 #Ler Valor Inteiro 
	syscall #Print no v0
	move $t0,$v0 #Move Pro Registrador 0 o que estiver em v0
	
	bltz $t0,triplo_n #Bltz = Se O Valor For Menor Que Zero, Mover para Label triplo_n
	
	duplo_n:
	add $t1,$t0,$t0
	j fim
	
	triplo_n:
	add $t1,$t0,$t0
	add $t1,$t1,$t0
	j fim
	
	fim:
	#Texto total
	li $v0,4
	la $v0,total
	
	#Resultado Total Valor
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,10
	syscall
	
	
	#bgtz = Se O Valor For Maior(>) que zero.
	
	
	
	
	#isso na função 6 de ler número float.
	#s.s $f0,n #Mover Valor Do Ponto Flutuante Para f0.
		
	