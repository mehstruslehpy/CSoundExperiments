
#all: gen play
#gen: random_score_gen.sh
#	./random_score_gen.sh
#play: randomscore.csd
#	csound randomscore.csd 
CC= gcc
LIB=
FLAG= -g -Wall -Wextra -pedantic -lm
RULES=
OBJ=

#build as a single program
build: ArpGen.c $(RULES)
	$(CC) $(LIB) $(FLAG) $(OBJ) ArpGen.c -o ArpGen.o
play:
	./random_score_gen.sh; csound randomscore.csd
