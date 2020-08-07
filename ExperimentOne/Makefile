realtime: experiment-one-rtout.csd
	csound experiment-one-rtout.csd 
realtime-nocsoptions: experiment-one-rtout-nocsoptions.csd
	csound -+rtaudio=pulse -o dac experiment-one-rtout-nocsoptions.csd
file: experiment-one-file.csd
	csound experiment-one-make.csd 
play: experiment-one-file.csd
	csound experiment-one-file.csd 
	aplay test.wav
clean: test.wav
	rm test.wav
