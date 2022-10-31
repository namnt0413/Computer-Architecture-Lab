.eqv MONITOR_SCREEN 0x10010000
.eqv RED 0x00FF0000
.eqv GREEN 0x0000FF00
.text
# x1 < x2 y1 < y2
li $k0, MONITOR_SCREEN
li $s0, RED
li $v0, 5
syscall
add $s1, $v0, $0 # x1
li $v0, 5
syscall
add $s2, $v0, $0 # y1
li $v0, 5
syscall
add $s3, $v0, $0 # x2
li $v0, 5
syscall
add $s4, $v0, $0 # y2
addi $t0, $s2, -1 # biến đếm hàng

loop11:
bgt $t0, $s4, next
addi $t1, $s1, -1 # biến đếm cột
loop21:
bgt $t1, $s3, endloop21
jal print
addi $t1, $t1, 1
j loop21
endloop21:
addi $t0, $t0, 1
j loop11
next:
li $s0, GREEN
add $t0, $0, $s2 # biến đếm hàng
loop1:
beq $t0, $s4, exit
add $t1, $0, $s1 # biến đếm cột
loop2:
beq $t1, $s3, endloop2
jal print
addi $t1, $t1, 1
j loop2
endloop2:
addi $t0, $t0, 1
j loop1

print:
addi $t2, $0, 64
mul $t2, $t2, $t0
add $t2, $t2, $t1
sll $t2, $t2, 2
add $t2, $t2, $k0 
sw $s0, 0($t2)
jr $ra
exit: