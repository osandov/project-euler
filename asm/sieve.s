.section .text

/*
struct sieve {
    bool *prime;
    size_t size;
};
*/

.globl sieve_create
.type sieve_create, @function
/* struct sieve *sieve_create(size_t) */
sieve_create:
    pushq %rbx
    pushq %r12
    movq %rdi, %rbx
    
    /* Allocate the sieve struct and initialize sieve->size */
    movq $16, %rdi
    call malloc
    movq %rbx, 8(%rax)
    movq %rax, %r12

    /* Allocate the bool array and save it in sieve->prime */
    subq $1, %rbx
    shrq $1, %rbx
    movq %rbx, %rdi
    call malloc /* malloc((n - 1) / 2) */
    movq %rax, (%r12)

    /* Set the bool array to all true */
    movq %rax, %rdi
    movl $1, %esi
    movq %rbx, %rdx
    call memset

    movq %r12, %rax
    popq %r12
    popq %rbx
    ret

.globl sieve_destroy
.type sieve_destroy, @function
/* void sieve_destroy(struct sieve *) */
sieve_destroy:
    pushq %rbx
    movq %rdi, %rbx

    /* Free the bool array */
    movq (%rbx), %rdi
    call free

    /* Free the sieve struct */
    movq %rbx, %rdi
    call free

    popq %rbx
    ret

.globl sieve_init
.type sieve_init, @function
/* struct sieve *sieve_init(struct sieve *) */
sieve_init:
    movq %rdi, %rsi
    movq 8(%rdi), %r8 /* n */
    movq (%rdi), %rdi /* the list */

    fildq 8(%rsi) /* Compute upper bound for outer loop */
    fsqrt
    fistpq -8(%rsp)
    movq -8(%rsp), %r10

    movq %r8, %r9 /* Compute upper bound for inner loop */
    shrq $1, %r9
    subq $1, %r9

    movb $0, (%rdi) /* One is not prime */

    xorq %rdx, %rdx /* Only zero %rdx once and hope we don't overflow */
    movq $3, %rcx /* p */
    1:
        movq %rcx, %rax
        mulq %rcx
        shrq $1, %rax
        2: /* Mark multiples of p */
            cmp %r9, %rax
            jge 3f
            movb $0, (%rdi, %rax)
            addq %rcx, %rax
            jmp 2b
        3:
        addq $2, %rcx
        cmpq %r10, %rcx
        jle 1b
    movq %rsi, %rax
    ret

.globl sieve_is_prime
.type sieve_is_prime, @function
/* bool sieve_is_prime(struct sieve *, size_t) */
sieve_is_prime:
    movq %rsi, %rcx /* Check if %rsi is even */
    andq $0x1, %rcx
    jnz 2f
    cmpq $2, %rsi
    jne 1f
    movb $1, %al /* If %rsi is 2, return true */
    ret
    1:
    xorb %al, %al /* If %rsi is even and not 2, return false */
    ret
    2:
    movq (%rdi), %rdi
    shrq $1, %rsi
    movb (%rdi, %rsi), %al
    ret
