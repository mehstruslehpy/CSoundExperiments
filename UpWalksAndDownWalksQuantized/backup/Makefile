all: gen play

gen: random_score_gen.sh
	./random_score_gen.sh
play: randomscore.csd
	csound randomscore.csd 
