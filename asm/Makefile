PROBLEMS := \
	problem1 \
	problem2 \
	problem3 \
	problem4 \
	problem5 \
	problem6 \
	problem7 \
	problem8 \
	problem9 \
	problem10

all: $(PROBLEMS)

CFLAGS := -g

problem%: main.o problem%.s
	$(CC) $(CFLAGS) -o $@ $^

problem3: sieve.o
problem7: sieve.o
problem10: sieve.o

sieve.o: sieve.s
	$(CC) $(CFLAGS) -o $@ -c $<

main.o: main.c
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -f main.o sieve.o $(PROBLEMS)
