# Lee n y muestra n términos de Fibonacci
.data
msg_prompt: .asciiz "Ingrese n: "
msg_head1:  .asciiz "Fibonacci (n = "
msg_head2:  .asciiz "): "
sep:        .asciiz ", "
nl:         .asciiz "\n"

.text
.globl main
main:
    # prompt y lectura de n
    la   $a0, msg_prompt
    li   $v0, 4
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0          # n

    blez $s0, fin          # n<=0 → salir

    # encabezado
    la   $a0, msg_head1
    li   $v0, 4
    syscall
    move $a0, $s0
    li   $v0, 1
    syscall
    la   $a0, msg_head2
    li   $v0, 4
    syscall

    # inicialización (a=0, b=1, i=1)
    li   $s1, 0
    li   $s2, 1
    li   $s3, 1

    # imprime primer término (1)
    li   $a0, 1
    li   $v0, 1
    syscall
    beq  $s0, 1, fin_nl

loop:
    # separador
    la   $a0, sep
    li   $v0, 4
    syscall

    # siguiente = a+b; imprimir
    addu $s4, $s1, $s2
    move $a0, $s4
    li   $v0, 1
    syscall

    # avanzar ventana
    move $s1, $s2
    move $s2, $s4

    addiu $s3, $s3, 1
    blt   $s3, $s0, loop

fin_nl:
    la   $a0, nl
    li   $v0, 4
    syscall
fin:
    li   $v0, 10
    syscall
