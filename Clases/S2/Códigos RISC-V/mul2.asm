.text
  main:
    li t0, 10			# t0 = 10 
    li t1, 200			# t1 = 200
    li t2, 0			# t2 = 0
    mul_loop:
      beq t0, zero, end		# if t0 = 0 jmp end
      add t2, t2, t1		# t2 += t1
      addi t0, t0, -1		# t0 += -1
      j mul_loop		# jal zero, mul_loop
    end:
