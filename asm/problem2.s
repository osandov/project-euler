.section .text
.globl solve
.type solve, @function

solve:
    xorq %rax, %rax
    movq $1, %rcx /* Previous Fibonacci number */
    movq $2, %rdx /* Current Fibonacci number */
    1:
        cmpq $4000000, %rdx
        jge 3f
        
        /* Check if even by masking */
        movq %rdx, %rdi
        andq $1, %rdi
        jnz 2f
        addq %rdx, %rax /* If even, add to the accumulator */

        2:
        addq %rdx, %rcx
        xchgq %rcx, %rdx
    jmp 1b

    3: ret
