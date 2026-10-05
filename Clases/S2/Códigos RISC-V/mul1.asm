.text
  main:
    # addi = add immediate (LITERAL). Reg + lit
    # subi NO EXISTE
    addi t0, zero, 10			# t0 = 10
    addi t1, zero, 200			# t1 = 200
    addi t2, zero, 0			# t2 = 0
    mul_loop:
      beq t0, zero, end			# if t0 = 0 jmp end
      add t2, t2, t1			# t2 += t1
      addi t0, t0, -1			# t0 += -1
      jal zero, mul_loop	        # jmp mul_loop
    end:
