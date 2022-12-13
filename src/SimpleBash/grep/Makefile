CC = gcc
CFLAGS = -Wall -Werror -Wextra -c  
OFLAGS = -Wall -Werror -Wextra -o

all:s21_grep

s21_grep: s21_grep.o
	$(CC) -o s21_grep s21_grep.o

	
s21_grep.o:
	$(CC) -c s21_grep.c

lint: 
	clang-format --Werror -n *.h
	clang-format --Werror -n *.c
	
test: s21_grep.o
	chmod 777 grep.sh
	./grep.sh 

valgrind:
	valgrind --trace-children=yes --track-fds=yes --leak-check=full --show-leak-kinds=all --track-origins=yes  ./s21_grep -n for s21_grep.c

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c

clean:
	rm -rf *.o s21_grep log.txt

rebuild:clean all

.PHONY: lint cppcheck valgrind