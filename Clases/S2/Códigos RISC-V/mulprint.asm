.text
  main:
    addi t0, zero, 10		# t0 = 10 
    addi t1, zero, 200		# t1 = 200
    mul t2, t0, t1		# t2 = t0 * t1 = 2000
    add a0, zero, t2		# a0 = t2
    addi a7, zero, 1		# a7 = 1 (PrintInt)
    ecall			# Print a0 = 2000
    ecall
    addi a7, zero, 10		# a7 = 10 (Exit)
    ecall			# Exit
