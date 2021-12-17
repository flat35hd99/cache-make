CC=gcc

INPUT=$(shell ls src/*.c)
OUTPUT=$(INPUT:src/%.c=dist/%.o)

all: $(OUTPUT)

dist/%.o: src/%.c dist/
	$(CC) -c $< -o $@

dist/:
	mkdir dist/