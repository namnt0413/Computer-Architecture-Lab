.eqv KEY_CODE 0xffff0004 # ASCII tu ban phim, 1 byte
.eqv KEY_READY 0xffff0000 # =1 neu ma co ky tu moi
# tu dong clear sau lw
.eqv DISPLAY_CODE 0xffff000c # ASCII de show, 1 byte
.eqv DISPLAY_READY 0xffff0008 # = 1 neu ma san sang ghi, clear sau sw
.text
li $k0, KEY_CODE
li $k1, KEY_READY
li $s0, DISPLAY_CODE
li $s1, DISPLAY_READY
li $s2, 64
li $s3, 91
li $s4, 96
li $s5, 123
li $t5, 1
li $t6, 2
li $t7, 3
li $t8, 47
li $t9, 58
li $s7, 0
loop:
nop
WaitForKey:
lw $t1, ($k1) # t1 = [k1] = KEY_READY
beq $t1, $0, WaitForKey # key == 0 => wait

ReadKey:
lw $t0, ($k0) # Doc ky tu

WaitForDis:
lw $t2, ($s1)
beq $t2, $0, WaitForDis

ToLower:
sgt $t2, $t0, $s2 # if t0 >= 65 && t0 <= 90
slt $t3, $t0, $s3
and $t4, $t2, $t3
beqz $t4, ToUpper # If true => toupper
addi $t0, $t0, 32
j ShowKey

ToUpper:
sgt $t2, $t0, $s4 # if t0 >= 96 && t0 <= 123
slt $t3, $t0, $s5
and $t4, $t2, $t3
beqz $t4, Number # If true => number
subi $t0, $t0, 32
j ShowKey

Number:
sgt $t2, $t0, $t8 # if t0 >= 47 && t0 <= 58
slt $t3, $t0, $t9
and $t4, $t2, $t3
beqz $t4, Null # If true => do nothing
j ShowKey

Null:
addi $t0, $0, 42

ShowKey:
sw $t0, ($s0)
addi $t1, $0, 69 # ky tu e
addi $t2, $0, 88 # ky tu x
addi $t3, $0, 73 # ky tu i
addi $t4, $0, 84 # ky tu t
beq $s7, $0, put_1
beq $s7, $t5, put_2
beq $s7, $t6, put_3
beq $s7, $t7, put_4

next:
lw $t0, 12($sp)
seq $t1, $t0, $t1
lw $t0, 8($sp)
seq $t2, $t0, $t2
lw $t0, 4($sp)
seq $t3, $t0, $t3
lw $t0, 0($sp)
seq $t4, $t0, $t4
and $t1, $t1, $t2
and $t1, $t1, $t3
and $t1, $t1, $t4
bnez $t1, exit
j loop

put_1:
addi $s7, $s7, 1
lw $s6, 12($sp)
beq $s6, $t1, put_2 
add $s7, $0, $0
sw $t0, 12($sp)
addi $s6, $s6, 1
j next
put_2:
addi $s7, $s7, 1
lw $s6, 8($sp)
beq $s6, $t2, put_3 
add $s7, $0, $0
sw $t0, 8($sp)
addi $s6, $s6, 1
j next
put_3:
addi $s7, $s7, 1
lw $s6, 4($sp)
beq $s6, $t3, put_4 
add $s7, $0, $0
sw $t0, 4($sp)
addi $s6, $s6, 1
j next
put_4:
add $s7, $0, $0
lw $s6, 0($sp)
beq $s6, $t4, exit
sw $t0, 0($sp)
add $s6, $0, $0
j next

exit:
li $v0, 10
syscall
