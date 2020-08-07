
#all: gen play
#gen: random_score_gen.sh
#	./random_score_gen.sh
#play: randomscore.csd
#	csound randomscore.csd 
CC= gcc
LIB=
FLAG= -Wall -Wextra -pedantic -lm
RULES=
OBJ=

#build as a single program
build: BeatGenerator.c $(RULES)
	$(CC) $(LIB) $(FLAG) $(OBJ) BeatGenerator.c -o BeatGen.o
play:
	./RhythmGenerator.sh ;csound randomscore.csd
