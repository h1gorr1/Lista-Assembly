#3.A empresa Hipotheticus paga R$10,00 por hora normal trabalhada, e R$15,00 por hora extra. Faça
#um algoritmo para calcular e imprimir o salário bruto e o salário líquido de um determinado
#funcionário. Considere, também, uma entrada de desconto para calcular o salário líquido.

.data
	horasnormais: .asciiz "Digite As Horas Trabalhadas :"
	horasextras: .asciiz "Digite As Horas Extras: "
	desconto: .asciiz "Digite O Valor A Ser Descontado: "
	valorbruto: .asciiz "O Valor Bruto é: "
	valorliquido: .asciiz "O Valor Líquido é: "
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
	
	mul $t0,$t0,10 #Sálario Horas Normais No Registrador 0
	mul $t1,$t1,15 #Sálario Horas Extras No Registrador 1
	add $t2,$t0,$t1 #Sálario Bruto = Valor Horas Extras + Valor Horas Normais
	
	mul $t4, $t2, $t3     # bruto * desconto
	li $t7, 100           # divisor
	li $t8, 50            # metade do divisor
	add $t4, $t4, $t8     # soma metade para arredondar
	div $t4, $t7	      # Dividir bruto * desconto por 100
	mflo $t5              # valor arredondado a descontar
	sub $t6, $t2, $t5     # salário líquido = bruto - desconto

	
	
	#Valor Bruto Texto:
	li $v0,4
	la $a0,valorbruto
	syscall
	
	#Valor Bruto Total
	li $v0,1
	move $a0,$t2 #Valor Sálario Bruto ! 
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
		
	