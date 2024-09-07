.data
	texto1: .asciiz "Introduce la cantidad de numero de la sucecion de fibonacci quieres imprimir \n"
	texto2: .asciiz "la sucecion de fibonacci es: "
	texto3: .asciiz "la suma de esos numeros es: "
	texto4: .asciiz "la serie de fibonacci es:\n"
	texto5: .asciiz "\nprograma finalizado"
	texto6: .asciiz "\n"
	


.text

main:
	
	li $s0, 0 #este es el numero de ciclos hechos
	li $s1, 0 #este es el numero de ciclos a hacer
	li $s2, 0 #este es la suma de los numeros
	li $s3, 0 #este es el valor a imorimir
	li $s4, 1 #este es el primer valor de la serie

	
	#aqui se obtiene la cantidad de numeros a imprimir
	li $v0, 4
	la $a0, texto1
	syscall
	li $v0, 5
	syscall
	move $s1, $v0 
	
	li $v0, 4
	la $a0, texto4
	syscall
	
loop:
	beq $s0,$s1 final
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	add $s2, $s2, $s3
	
	li $v0, 4
	la $a0, texto6
	syscall
	
	add $t0, $s3, $s4
	move $s3, $s4
	move $s4, $t0



siguiente_ciclo:
	addi $s0, $s0, 1
	j loop
	
final:

	li $v0, 4
	la $a0, texto3
	syscall

	li $v0, 1
	move $a0, $s2
	syscall


	li $v0, 4
	la $a0, texto5
	syscall
	li $v0, 10
	syscall


