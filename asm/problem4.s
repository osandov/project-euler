.text

.type is_palindrome, @function
is_palindrome:
    xorq %rcx, %rcx
    movq $10, %rsi
    movq %rdi, %rax
    1: /* Convert the number to an array of digits */
        xorq %rdx, %rdx
        divq %rsi
        movb %dl, -20(%rsp, %rcx)
        addq $1, %rcx
        cmpq $0, %rax
        jne 1b
    xorq %rdx, %rdx
    2: /* Compare the elements of the array */
        subq $1, %rcx
        cmpq %rdx, %rcx
        jle 3f
        movb -20(%rsp, %rcx), %al
        subb -20(%rsp, %rdx), %al
        jnz 4f
        addq $1, %rdx
        jmp 2b
    3:
    movb $1, %al
    ret
    4:
    xorb %al, %al
    ret

.globl solve
.type solve, @function
solve:
    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14

    xorq %rbx, %rbx /* The cumulative maximum */
    movq $99, %r12
    1:
        addq $1, %r12
        cmp $1000, %r12
        jge 4f
        movq $99, %r13
        2:
            addq $1, %r13
            cmp $1000, %r13
            jge 1b
            movq %r12, %rax
            xorq %rdx, %rdx
            mulq %r13
            movq %rax, %r14
            movq %r14, %rdi
            call is_palindrome
            cmpb $0, %al
            je 3f
            cmp %rbx, %r14
            cmovg %r14, %rbx
            3: jmp 2b

    4:
    movq %rbx, %rax
    popq %r14
    popq %r13
    popq %r12
    popq %rbx
    ret
