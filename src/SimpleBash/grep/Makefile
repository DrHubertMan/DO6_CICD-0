CC = gcc
CFLAGS = -Wall -Werror -Wextra -c  
OFLAGS = -Wall -Werror -Wextra -o

all:s21_grep

s21_grep: s21_grep.o
	$(CC) -o s21_grep s21_grep.o
	ls

s21_grep.o:
	$(CC) -c s21_grep.c

lint: 
	clang-format -n *.h
	clang-format -n *.c
	
test:
	chmod +x grep.sh
	./grep.sh

valgrind:
	valgrind --trace-children=yes --track-fds=yes --leak-check=full --show-leak-kinds=all --track-origins=yes  ./s21_grep -n for s21_grep.c

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c

clean:
	rm -rf *.o s21_grep log.txt

rebuild:clean all

.PHONY: lint cppcheck valgrind