.data
	texto1: .asciiz "introduce un numero \n"
	texto2: .asciiz "¿cuantos numeros deseas comparar? (3,4 o 5)\n"
	texto3: .asciiz "error, finalizando programa"
	texto4: .asciiz "el numero mayor es:"
	cantidad: .space 1


.text

main:
#pregutna cuantos comparar
	li $v0, 4
	la $a0, texto2
	syscall
	
	#lo guarda
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $t0,3 #min
	li $t1,5 #max
	li $s1,0 #contador
	li $s2,-2147483648  #es el numero menor que puede contener
	
	#comparar si esta dentro de los limites
	blt $s0,$t0, error
	bgt $s0,$t1, error
	
#ciclo para leer numeros y asignar mayor
while:
	beq $s0,$s1,result
	li $v0, 4
	la $a0, texto1
	syscall
	
	li $v0,5
	syscall
	
	bgt $v0,$s2, asignar_mayor
	j aumentar_contador

asignar_mayor:
	move $s2, $v0
	
aumentar_contador:
	#aumenta el contador
	addi $s1,$s1,1
	j while
error:
	li $v0, 4
	la $a0, texto3
	syscall
	li $v0, 10
	syscall

result:
	li $v0, 4
	la $a0, texto4
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	
fin:
	li $v0,10
	syscall
	
	
	

	
	
	
	
	
	
	