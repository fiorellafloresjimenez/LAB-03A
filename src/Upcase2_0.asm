# Convierte a mayúscula la 1.ª letra de cada palabra
.data
prompt: .asciiz "Ingrese una frase: "
buff:   .space  256
nl:     .asciiz "\n"
out:    .asciiz "Resultado: "

.text
.globl main
main:
    # entrada
    la   $a0, prompt
    li   $v0, 4
    syscall
    la   $a0, buff
    li   $a1, 255
    li   $v0, 8
    syscall

    # recorrido
    la   $t0, buff        # p
    li   $t1, 1           # prevSep = true

scan:
    lbu  $t2, 0($t0)      # c
    beq  $t2, $zero, done

    # separadores: ' ', '\t', '\n'
    li   $t3, 32
    beq  $t2, $t3, set_sep
    li   $t3, 9
    beq  $t2, $t3, set_sep
    li   $t3, 10
    beq  $t2, $t3, set_sep

    # si inicio de palabra y 'a'..'z' → mayúscula
    beq  $t1, $zero, cont
    li   $t4, 'a'
    li   $t5, 'z'
    blt  $t2, $t4, cont
    bgt  $t2, $t5, cont
    addiu $t2, $t2, -32
    sb   $t2, 0($t0)

cont:
    move $t1, $zero
    addiu $t0, $t0, 1
    b    scan

set_sep:
    li   $t1, 1
    addiu $t0, $t0, 1
    b    scan

done:
    # salida
    la   $a0, out
    li   $v0, 4
    syscall
    la   $a0, buff
    li   $v0, 4
    syscall
    la   $a0, nl
    li   $v0, 4
    syscall
    li   $v0, 10
    syscall
