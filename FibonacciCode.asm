.data
integer: .asciiz "Enter a number greater than 25\n"
error: .aciiz "Illegal number!"

.text
main:
li $v0, 4
la $a0, integer
syscall

li $v0, 5
syscall
