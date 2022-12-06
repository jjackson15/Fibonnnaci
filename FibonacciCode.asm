.data
command: .asciiz "Enter a number greater than 25\n"
prompt1: .asciiz "The Fibonnaci sequence is:\n"
error: .asciiz "Illegal number!"
comma: .asciiz ", "
.text
.globl main


main:
li $v0, 4 #prints message 
la $a0, command 
syscall

li $v0, 5 #reads string
syscall
move $t3, $v0
add $s0, $ra, $zero
add $t0, $zero, $zero
addi $t1, $zero, 1
addi $s1, $zero, $t3
addi $s2, $zero, 2

slti $t4, $v0, 25
#bne $t1, $zero, fibonacci
#beq $t1, $zero, error

move $v0, $t1

move $a0, $v0 #saves input to register
jal fibonacci #calls function
move $a1, $v0

li $v0, 4 #prints second message 
la $a0, prompt1
syscall

add $a0, $t0, $zero
li $v0, 1 #prints result
syscall
la $a0, comma
li $v0, 4
syscall
add $a0, $t1, $zero
li $v0, 1
syscall
la $a0, comma
li $v0, 4
syscall

move $s0, $ra
li $v0, 10 #exits
syscall
  
fibonacci:
beq $s1, $s2, print2
addi $s2, $s2, 1
add $t2, $t0, $t1
add $t0, $zero, $t2
beq $s1, $s2, print
addi $s2, $s2, 1
add $t2, $t0, $t1
add $t1, $zero, $t2

print:
add $a0, $t0, $zero
li $v0, 1
syscall
la $a0, newl
li $v0, 4
syscall
beq $s1, $s2, end

print2:
add $a0, $t1, $zero
li $v0, 1
syscall
la $a0, newl
li $v0, 4
syscall
beq $s1, $s2, end
j start

fibonacciExit:
move $s0, $ra
li $v0, 10 #exits
syscall


