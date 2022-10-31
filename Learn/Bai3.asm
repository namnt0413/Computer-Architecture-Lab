#B�i 3 - C�ch thao t�c c�c ph�p to�n +,-,*,/
.data
.text
	li $t1,32 # $t1 = 32
	li $t2,5 # $t2 = 5
	#ph�p +
	add $t3,$t1,$t2 # $t3 = $t1 + $t2
	#ph�p -
	sub $t4,$t1,$t2 # $t4 = $t1 - $t2
	#ph�p *
	mul $t5,$t1,$t2 # $t5  = $t1 * $t2
	#ph�p /
	div $t1,$t2   # thuong duoc luu tai thanh lo, so du lul tai thanh hi
	mflo $t6 # $t6 = th??ng
	mfhi $t7 # $t7 = d?
