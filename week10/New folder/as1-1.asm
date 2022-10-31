.eqv SEVENSEG_RIGHT 0xFFFF0010 # Dia chi cua den led 7 doan trai.
.eqv SEVENSEG_LEFT 0xFFFF0011 # Dia chi cua den led 7 doan phai
#Nguyen Tuan Nam 20194629
.text
main:
li $a0, 91 #so 2 => 8 bit cuối thì phải là 01011011
jal SHOW_7SEG_LEFT # show
li $a0, 111 # so 9 => 8 bit cuối thì phải là 01101111
jal SHOW_7SEG_RIGHT # show 
exit: 
li $v0, 10
syscall
endmain:
SHOW_7SEG_LEFT: 
li $t0, SEVENSEG_LEFT # Gán địa chỉ
sb $a0, 0($t0) # Gán giá trị
jr $ra
SHOW_7SEG_RIGHT: 
li $t0, SEVENSEG_RIGHT # Gán địa chỉ
sb $a0, 0($t0) # Gán giá trị
jr $ra