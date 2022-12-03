.data
integer: .asciiz "Enter a number greater than 25\n"
prompt1: .asciiz "The Fibonnaci sequence is:\n"
error: .aciiz "Illegal number!"

.text
main:
li $v0, 4
la $a0, integer
syscall

li $v0, 5
syscall

move $t0, $v0
jal fibonnaci
move $t1, $v0

li $v0, 4
la $a0, prompt1
syscall
