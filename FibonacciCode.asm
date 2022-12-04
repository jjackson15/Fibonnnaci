.data
integer: .asciiz "Enter a number greater than 25\n"
prompt1: .asciiz "The Fibonnaci sequence is:\n"
error: .asciiz "Illegal number!"
comma: .asciiz ", "

.text 
main:
li $v0, 4 #prints message 
la $a0, integer 
syscall

li $v0, 5 #reads string
syscall

move $a0, $v0 #saves input to register

jal fibonnaci #calls function
move $a1, $v0

li $v0, 4 #prints second message 
la $a0, prompt1
syscall

li $v0, 1 #prints result
move $a0, $a               1
syscall

li $v0, 4
la $a0, comma
syscall


li $v0, 10 #exits
syscall

fibonacci:
addi $sp, $sp, -12
sw $ra, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0




