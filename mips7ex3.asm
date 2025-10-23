#3.A empresa Hipotheticus paga R$10,00 por hora normal trabalhada, e R$15,00 por hora extra. Fa�a
#um algoritmo para calcular e imprimir o sal�rio bruto e o sal�rio l�quido de um determinado
#funcion�rio. Considere, tamb�m, uma entrada de desconto para calcular o sal�rio l�quido.

.data
	horasnormais: .asciiz "Digite As Horas Trabalhadas :"
	horasextras: .asciiz "Digite As Horas Extras: "
	desconto: .asciiz "Digite O Valor A Ser Descontado: "
	valorbruto: .asciiz "O Valor Bruto �: "
	valorliquido: .asciiz "O Valor L�quido �: "
	linha: .asciiz "\n"
.text
main:
	#Texto Horas Normais
	li $v0,4
	la $a0,horasnormais
	syscall
	
	#Valor Horas Normais
	li $v0,5
	syscall
	move $t0, $v0 #Horas Normais No Registrador 0
	
	#Texto Horas Extras
	li $v0,4
	la $a0,horasextras
	syscall
	
	#Valor Horas Extras
	li $v0,5
	syscall
	move $t1,$v0 #Horas Extras Registrador 1
	
	# Texto Desconto:
	li $v0,4
	la $a0,desconto
	syscall
	
	#Valor Desconto:
	li $v0,5
	syscall
	move $t3,$v0 #Valor Do Desconto No t3
	
	mul $t0,$t0,10 #S�lario Horas Normais No Registrador 0
	mul $t1,$t1,15 #S�lario Horas Extras No Registrador 1
	add $t2,$t0,$t1 #S�lario Bruto = Valor Horas Extras + Valor Horas Normais
	
	mul $t4, $t2, $t3     # bruto * desconto
	li $t7, 100           # divisor
	li $t8, 50            # metade do divisor
	add $t4, $t4, $t8     # soma metade para arredondar
	div $t4, $t7	      # Dividir bruto * desconto por 100
	mflo $t5              # valor arredondado a descontar
	sub $t6, $t2, $t5     # sal�rio l�quido = bruto - desconto

	
	
	#Valor Bruto Texto:
	li $v0,4
	la $a0,valorbruto
	syscall
	
	#Valor Bruto Total
	li $v0,1
	move $a0,$t2 #Valor S�lario Bruto ! 
	syscall
	
	#Quebra De Linha
	li $v0,4
	la $a0,linha
	syscall
	
	#Texto Salario Liquido Total: 
	li $v0,4
	la $a0,valorliquido
	syscall
	#Valor Salario Liquido:
	li $v0,1
	move $a0,$t6
	syscall
	
	#Quebra De Linha
	li $v0,4
	la $a0,linha
	syscall
	
	li $v0,10
	syscall
		
	