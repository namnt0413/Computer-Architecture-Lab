.eqv SEVENSEG_RIGHT 0xFFFF0010 # Dia chi cua den led 7 doan trai.
.eqv SEVENSEG_LEFT 0xFFFF0011 # Dia chi cua den led 7 doan phai
.text
main:
input:
li $v0, 12 # Đọc ký tự
syscall
li $a0, 10
end_input:
div $v0, $a0 # lấy số vừa nhập chia cho 10 để lấy chữ số cuối
mflo $v0
mfhi $s1
div $v0, $v0, $a0 # chia tiếp cho 10 để lấy chữ số gần cuối
mflo $v0
mfhi $s0
li $t0, 0 # Số để so sánh
beq $s0, $t0, set_0l
addi $t0, $t0, 1
beq $s0, $t0, set_1l
addi $t0, $t0, 1
beq $s0, $t0, set_2l
addi $t0, $t0, 1
beq $s0, $t0, set_3l
addi $t0, $t0, 1
beq $s0, $t0, set_4l
addi $t0, $t0, 1
beq $s0, $t0, set_5l
addi $t0, $t0, 1
beq $s0, $t0, set_6l
addi $t0, $t0, 1
beq $s0, $t0, set_7l
addi $t0, $t0, 1
beq $s0, $t0, set_8l
addi $t0, $t0, 1
beq $s0, $t0, set_9l
nextl:
jal SHOW_7SEG_LEFT # show
li $t0, 0
beq $s1, $t0, set_0r
addi $t0, $t0, 1
beq $s1, $t0, set_1r
addi $t0, $t0, 1
beq $s1, $t0, set_2r
addi $t0, $t0, 1
beq $s1, $t0, set_3r
addi $t0, $t0, 1
beq $s1, $t0, set_4r
addi $t0, $t0, 1
beq $s1, $t0, set_5r
addi $t0, $t0, 1
beq $s1, $t0, set_6r
addi $t0, $t0, 1
beq $s1, $t0, set_7r
addi $t0, $t0, 1
beq $s1, $t0, set_8r
addi $t0, $t0, 1
beq $s1, $t0, set_9r
nextr:
jal SHOW_7SEG_RIGHT # show
j exit
# Đặt chỉ số hiển thị cho led
set_0l:
ori $a0, $0, 0x3f
j nextl
set_1l:
ori $a0, $0, 0x06
j nextl
set_2l:
ori $a0, $0, 0x5b 
j nextl
set_3l:
ori $a0, $0, 0x4f 
j nextl
set_4l:
ori $a0, $0, 0x66
j nextl
set_5l:
ori $a0, $0, 0x6d
j nextl
set_6l:
ori $a0, $0, 0x7d
j nextl
set_7l:
ori $a0, $0, 0x07
j nextl
set_8l:
ori $a0, $0, 0x7f
j nextl
set_9l:
ori $a0, $0, 0x6f
j nextl
set_0r:
ori $a0, $0, 0x3f
j nextr
set_1r:
ori $a0, $0, 0x06
j nextr
set_2r:
ori $a0, $0, 0x5b 
j nextr
set_3r:
ori $a0, $0, 0x4f 
j nextr
set_4r:
ori $a0, $0, 0x66
j nextr
set_5r:
ori $a0, $0, 0x6d
j nextr
set_6r:
ori $a0, $0, 0x7d
j nextr
set_7r:
ori $a0, $0, 0x07
j nextr
set_8r:
ori $a0, $0, 0x7f
j nextr
set_9r:
ori $a0, $0, 0x6f
j nextr
exit: 
li $v0, 10
syscall
endmain:
SHOW_7SEG_LEFT: 
li $t1, SEVENSEG_LEFT # Gán địa chỉ
sb $a0, 0($t1) # Gán giá trị
jr $ra
SHOW_7SEG_RIGHT: 
li $t1, SEVENSEG_RIGHT # Gán địa chỉ
sb $a0, 0($t1) # Gán giá trị
jr $ra 