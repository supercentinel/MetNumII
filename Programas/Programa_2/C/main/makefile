# Default Compiler
# for C use gcc
# for C++ use g++
CC:= gcc

# Directories to headers and objects
TOPDIR:= ../
INCLUDE:= ${TOPDIR}/include
SOURCE:= ${TOPDIR}/source

# Flags
CFLAGS:= -I $(INCLUDE)

_DEPS:= diferencias_divididas.h matriz.h
DEPS:= $(patsubst %,$(INCLUDE)/%,$(_DEPS))

_MAIN:= main.c
_SRC:= diferencias_divididas.c matriz.c
SRC:= $(patsubst %,$(SOURCE)/%,$(_SRC))
OBJ:= $(SRC:.c=.o) $(_MAIN:.c=.o)

# Program name
ifeq ($(OS), Windows_NT)
	EXE:= main.exe
else
	EXE:= main.out
endif

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(EXE): $(OBJ)
	gcc -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f ./*.o ${SOURCE}/*.o
