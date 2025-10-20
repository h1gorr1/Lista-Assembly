# 2. Uma fábrica de camisetas produz os tamanhos pequeno, médio e grande,
# cada uma sendo vendida respectivamente por 10, 12 e 15 reais.
# O usuário fornece a quantidade de cada tipo e a máquina informa o valor arrecadado.

.data
    prompt:     .asciiz "Digite a quantidade de camisetas pequenas vendidas:\n"
    prompt2:    .asciiz "Digite a quantidade de camisetas médias vendidas:\n"
    prompt3:    .asciiz "Digite a quantidade de camisetas grandes vendidas:\n"
    
    lucro:      .asciiz "Lucro Camiseta Pequena: "
    lucro2:     .asciiz "Lucro Camiseta Média: "
    lucro3:     .asciiz "Lucro Camiseta Grande: "
    
    newline:    .asciiz "\n"

.text
main:
    # Camisetas Pequenas
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   # Quantidade de camisetas pequenas

    # Camisetas Médias
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0   # Quantidade de camisetas médias

    # Camisetas Grandes
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0   # Quantidade de camisetas grandes

    # Cálculo dos lucros
    mul $t3, $t0, 10     # t3 = pequenas * 10
    mul $t4, $t1, 12     # t4 = médias * 12
    mul $t5, $t2, 15     # t5 = grandes * 15

    # Exibir Lucro Pequenas
    li $v0, 4
    la $a0, lucro
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # Exibir Lucro Médias
    li $v0, 4
    la $a0, lucro2
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # Exibir Lucro Grandes
    li $v0, 4
    la $a0, lucro3
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # Encerrar programa
    li $v0, 10
    syscall