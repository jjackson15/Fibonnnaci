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
  addi $sp, $sp, -12
  sw $ra, 8($sp)
  sw $s0, 4($sp)
  sw $s1, 0($sp)
  move $s0, $a0

  li $v0, 1 # return value 
  ble $s0, 0x2, fibonacciExit 
  addi $a0, $s0, -1 
  jal fibonacci
  move $s1, $v0 # store result of f(n-1) to s1
  addi $a0, $s0, -2 
  jal fibonacci
  add $v0, $s1, $v0 # add f(n-1)

fibonacciExit:
  lw $ra, 8($sp)
  lw $s0, 4($sp)
  lw $s1, 0($sp)
  addi $sp, $sp, 12
  jr $ra



