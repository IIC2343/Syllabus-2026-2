.data
    arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
    len: .word 9
.text
    main:
        lw a0, len
        la a1, arr
        addi s0, zero, 2		# Constante para obtener promedios y restos
        addi s1, zero, 4		# Constante para computar direcciones
        jal ra, find_median		# find_median(len, puntero_arr)
        addi a7, zero, 1		# Imprimir resultado
        ecall
        addi a7, zero, 10		# Terminar programa
        ecall
    find_median:
        rem t0, a0, s0			# t0 = a0 % s0 = len % 2
        div t1, a0, s0			# t1 = a0 // s0 = len // 2
        beq t0, zero, even_length	# Si t0 = 0, entonces el arreglo es par
        odd_length:
            add a0, zero, t1		# a0 = indice de la mediana
            mul a0, a0, s1		# a0 = i*4
            add a0, a0, a1		# a0 = dir(arr) + 4*i = dir(arr[i])
            lw a0, 0(a0)		# a0 = mem[a0] = arr[i] (mediana de arreglo de largo impar)
            jal zero, end
        even_length:
            add a0, zero, t1		# a0 = indice del segundo elemento de la mediana
            addi a2, a0, -1		# a2 = indice del primer elemento de la mediana
            mul a0, a0, s1		# a0 = i*4
            add a0, a0, a1		# a0 = dir(arr) + 4*i = dir(arr[i])
            lw a0, 0(a0)		# a0 = mem[a0] = arr[i] (segundo elemento mediana)              
            mul a2, a2, s1		# a2 = (i-1)*4
            add a2, a2, a1		# a2 = dir(arr) + 4*(i-1) = dir(arr[i-1])
            lw a2, 0(a2)		# a2 = mem[a2] = arr[i-1] (primer elemento mediana)
            add a0, a0, a2              # a0 = arr[i-1] + arr[i]
            div a0, a0, s0              # a0 = (arr[i-1] + arr[i]) // 2 = mediana de arreglo de largo par
        end:
            jalr zero, 0(ra)		# Se retorna la mediana en el registro a0
