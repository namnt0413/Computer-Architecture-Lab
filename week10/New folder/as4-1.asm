.eqv MONITOR_SCREEN 0x10010000
.eqv RED 0x00FF0000
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.text
li $k0, MONITOR_SCREEN
li $s0, WHITE
li $t0, 0 # biến để đếm hàng
li $t2, 8 # số hàng và cột là 8
li $t3, 2
checkrow:
beq $t0, $t2, exit # hàng >= 8 thì dừng
li $t1, 0 # biến để đếm cột
div $t0, $t3 # kiểm tra xem hàng là chẵn hay lẻ
mfhi $t4
checkcol:
beq $t1, $t2, endcheckcol # cột >= 8 thì đến hàng tiếp theo
div $t1, $t3 # kiểm tra xem cột là chẵn hay lẻ
mfhi $t5
xor $t6, $t4, $t5 # nếu số hàng hoặc số cột là cùng chẵn hoặc cùng lẻ thì tô màu
beq $t6, $0, print
next:
addi $t1, $t1, 1
addi $k0, $k0, 4 # cộng thêm 4 đẻ vẽ ô tiếp theo
j checkcol
endcheckcol:
addi $t0, $t0, 1
j checkrow
print:
sw $s0, 0($k0)
j next
exit:
