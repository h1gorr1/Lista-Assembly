.data
	prompt1: .asciiz "Digite O Valor Do Cateto Oposto: \n"
	prompt2: .asciiz "Digite O Valor Do Cateto Adjacente: \n"
	resultado: .asciiz "Valor Da Hipotenusa: "
.text
main:
##Cateto Oposto Texto
	li $v0,4
	la $a0,prompt1
	syscall
	
	#Cateto Oposto Valor
	li $v0,5
	syscall
	move $t0,$v0
	
	#Cateto Adjacente Texto
	li $v0,4 #Imprimir String
	la $a0,prompt2 #string
	syscall #terminar processo
	
	#Cateto Adjacente Valor
	li $v0,5 # Ler Inteiro
	syscall
	move $t1,$v0 #Mover Valor Cateto Adjacente Para registrador 1
	
	#calculo hipotenusa:
	mul $t2,$t0,$t0
	mul $t3,$t1,$t1
	add $t4,$t2,$t3
	 # Converter inteiro para float
    	mtc1 $t4, $f0       # Move inteiro para registrador de float
    	cvt.s.w $f0, $f0    # Converte inteiro para float

    	# Calcular raiz quadrada (syscall 42 ou instrucao)
    	sqrt.s $f1, $f0     # f1 = sqrt(f0)

    	# Imprimir resultado
    	li $v0, 4
    	la $a0, resultado
    	syscall

    	li $v0, 2           # Imprimir float
    	mov.s $f12, $f1
    	syscall

    	# Encerrar
    	li $v0, 10
    	syscall
	

	