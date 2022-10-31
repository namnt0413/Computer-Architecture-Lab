#B�i 1 - C�ch g�n s? nguy�n cho 1 thanh ghi
#G�n 10 cho thanh ghi $t1
#G�n 15 cho thanh ghi $t2
#G�n 20 cho thanh ghi $t3
.data #ph?n ?? khai b�o d? li?u
	number: .word 10
.text #ph?n code ch�nh
	lw $t1,number # lay gia tri cua nhan number gan vao thanh ghi $t1
	li $t2,15 # $t2 = 15
	addi $t3,$zero,20 # $t3 = 0 + 20
