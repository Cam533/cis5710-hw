        .section .data
input_string:   .asciz "Hello world!"

        # tohost/fromhost are data locations used by Spike
        .align 8
tohost: .byte 0
        .align 8
fromhost: .byte 0

        
        .section .text
        .globl _start
_start:
        # Load the address of the input string into a0
        la a0, input_string

        # Your code here!
loop:
        lbu t0, 0(a0) # load character at a0, t0 is the character, a0 is the pointer to char

        beqz t0, end_program # if null char or end of string end loop / end program

        # skip if it is not in between a (97) and z (122)
        # branch to next char if less than 97
        li t1, 97 
        blt t0, t1, next

        # branch to next char if more than 122
        li t1, 122
        bgt t0, t1, next

        # passed check, subtract 32 to get to uppercase and load back into memory
        addi t0, t0, -32
        sb t0, 0(a0)             # store back
next:
        addi a0, a0, 1 # update the pointer by one to go to next char
        j loop
end_program:
        # jump here when you're done
        j end_program

