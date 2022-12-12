CC = gcc
CFLAGS = -Wall -Werror -Wextra -c 
OFLAGS = -Wall -Werror -Wextra -o

all:s21_cat 

s21_cat: s21_cat.o
	$(CC) $(OFLAGS) s21_cat s21_cat.o

s21_cat.o:
	$(CC) $(CFLAGS) s21_cat.c

lint:
	clang-format -n *.h
	clang-format -n *.c

test: s21_cat.o
	chmod +x test_cat.sh
	./test_cat.sh

valgrind:
	valgrind  --trace-children=yes --track-fds=yes --leak-check=full --show-leak-kinds=all --track-origins=yes  ./s21_cat ../bytes.txt

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c

clean:
	rm -rf *.o s21_cat log.txt

rebuild:clean all

.PHONY: lint cppcheck valgrind