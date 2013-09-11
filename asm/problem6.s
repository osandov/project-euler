.section .text
.globl solve
.type solve, @function

solve:
    xorq %rsi, %rsi /* accumulator for the sum */
    xorq %rdi, %rdi /* accumulator for the sum of the squares */

    xorq %rdx, %rdx /* only have to zero %rdx once for these small numbers */
    movq $100, %rcx
    1:
        addq %rcx, %rsi
        movq %rcx, %rax
        mulq %rcx /* Square %rcx into %rax */
        addq %rax, %rdi /* Add it to the accumulator */
    loop 1b

    movq %rsi, %rax /* Square %rsi into %rax */
    mulq %rsi /* Now %rax is the square of the sum */
    subq %rdi, %rax

    ret
