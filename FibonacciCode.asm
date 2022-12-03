.data
integer: .asciiz "Enter a number greater than 25\n"
prompt1: .asciiz "The Fibonnaci sequence is:\n"
error: .aciiz "Illegal number!"

.text 
main:
li $v0, 4 #prints message 
la $a0, integer 
syscall

li $v0, 5 #reads string
syscall

move $t0, $v0 #saves input to register
jal fibonnaci #calls function
move $t1, $v0

li $v0, 4 #prints second message 
la $a0, prompt1
syscall

li $v0, 1 #prints result
move $t0, $t1

li $I v0, 10 #exits
syscall
