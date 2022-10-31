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
main:
addi $a0, $0, 90 # Quay sang trai de bat dau chay
jal ROTATE
jal GO
sleep0:
addi $v0, $zero, 32 # De no chay trong 3000ms
li $a0, 3000
syscall
jal STOP

jal TRACK # Danh dau TRACK
addi $a0, $0, 180 # Quay goc
jal ROTATE
jal GO
sleep2:
addi $v0, $zero, 32 # De no chay trong 3000ms
li $a0, 3000
syscall
jal UNTRACK # Ve duong thang tu diem hien tai toi TRACK cu

jal TRACK # Danh dau TRACK
addi $a0, $0, 90 # Quay goc
jal ROTATE
jal GO
sleep3:
addi $v0, $zero, 32 # De no chay trong 3000ms
li $a0, 3000
syscall
jal UNTRACK # Ve duong thang tu diem hien tai toi TRACK cu

jal TRACK # Danh dau TRACK
addi $a0, $0, 0 # Quay goc
jal ROTATE
jal GO
sleep4:
addi $v0, $zero, 32 # De no chay trong 3000ms
li $a0, 2980
syscall
jal UNTRACK # Ve duong thang tu diem hien tai toi TRACK cu

jal TRACK # Danh dau dia diem hien tai
addi $a0, $0, 270 # Quay sang trai de bat dau chay
jal ROTATE
jal GO
sleep1:
addi $v0, $zero, 32 # De no chay trong 3000ms
li $a0, 3000
syscall
jal UNTRACK # Ve duong thang tu diem hien tai toi TRACK cu

jal STOP
endmain:
li $v0, 10
syscall

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
