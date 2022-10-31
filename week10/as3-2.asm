.eqv KEY_CODE 0xffff0004 # ASCII tu ban phim, 1 byte
.eqv KEY_READY 0xffff0000 # =1 neu ma co ky tu moi
# tu dong clear sau lw
.eqv DISPLAY_CODE 0xffff000c # ASCII de show, 1 byte
.eqv DISPLAY_READY 0xffff0008 # = 1 neu ma san sang ghi, clear sau sw
.eqv HEADING 0xffff8010 # Integer: Goc quay tu 0 den 359
# 0 : Tren
# 90: Phai
# 180: Duoi
# 270: Trai
.eqv MOVING 0xffff8050 # Boolean: Co di chuyen hay khong
.eqv LEAVETRACK 0xffff8020 # Boolean (0 hoac !0):
# Co track hay khong
.eqv WHEREX 0xffff8030 # Integer: Doc gia tri X hien tai cua con bot
.eqv WHEREY 0xffff8040 # Integer: Doc gia tri Y hien tai cua con bot
.text
li $a2, KEY_CODE
li $a3, KEY_READY
li $s0, DISPLAY_CODE
li $s1, DISPLAY_READY
li $t8, 0 # Check xem co dang chay hay khong
li $t3, 32 # dau cach
li $t4, 119 # w
li $t5, 97 # a
li $t6, 115 # s
li $t7, 100 # d

loop:
nop
WaitForKey:
lw $t1, ($a3) # t1 = [k1] = KEY_READY
beq $t1, $0, WaitForKey # key == 0 => wait

ReadKey:
lw $t0, 0($a2) # Doc ky tu

WaitForDis:
lw $t2, ($s1)
beq $t2, $0, WaitForDis

ShowKey:
sw $t0, ($s0)
beq $t0, $t4, UP
beq $t0, $t5, LEFT
beq $t0, $t6, DOWN
beq $t0, $t7, RIGHT
beq $t0, $t3, RUN_STOP # space

next:
nop
j loop

UP:
addi $a0, $0, 0
jal ROTATE
j next

LEFT:
addi $a0, $0, 270
jal ROTATE
j next

DOWN:
addi $a0, $0, 180
jal ROTATE
j next

RIGHT:
addi $a0, $0, 90
jal ROTATE
j next

RUN_STOP:
beq $t8, $0, RUN
jal STOP
addi $t8, $0, 0
j next
RUN:
jal GO
addi $a0, $0, 90 	#mac dinh luc dau la di ve ben phai
jal ROTATE
addi $t8, $0, 1
j next
GO:
li $at, MOVING # Thay doi cong MOVING
addi $k0, $0, 1 # logic 1
sb $k0, ($at) # Bat dau chay
jr $ra
STOP:
li $at, MOVING # Thay doi cong MOVING
sb $0, ($at) # Dung chay
jr $ra
TRACK:
li $at, LEAVETRACK # Thay doi cong LEAVETRACK
addi $k0, $0, 1 # logic 1
sb $k0, 0($at) # bat dau tracking
jr $ra
UNTRACK:
li $at, LEAVETRACK # Thay doi cong LEAVETRACK
sb $0, 0($at) # dung ve
jr $ra
ROTATE:
li $at, HEADING # Thay doi cong HEAD
sw $a0, ($at) # Xoay robot
jr $ra
