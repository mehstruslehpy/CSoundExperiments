#!/bin/sh
echo "<CsoundSynthesizer>" > randomscore.csd
echo "<CsOptions>" >> randomscore.csd
#use pulse audio
echo "-+rtaudio=pulse -o dac" >> randomscore.csd
echo "</CsOptions>" >> randomscore.csd

echo "<CsInstruments>" >> randomscore.csd

#instrument two for chords
echo "instr 2" >> randomscore.csd
echo "iFreq = p4" >> randomscore.csd
echo "iAmp = p5" >> randomscore.csd
echo "aenv madsr 0.0001, 1, 2, 1" >> randomscore.csd
echo "aOut vco2 iAmp, iFreq" >> randomscore.csd
echo "out aOut*aenv*0.65" >> randomscore.csd
echo "endin" >> randomscore.csd

#instrument one for lead voice
echo "instr 1" >> randomscore.csd
echo "iFreq = p4" >> randomscore.csd
echo "iAmp = p5" >> randomscore.csd
echo "aOut vco2 iAmp, iFreq" >> randomscore.csd
echo "out aOut*1.15" >> randomscore.csd
echo "endin" >> randomscore.csd
echo "</CsInstruments>" >> randomscore.csd
echo "<CsScore>" >> randomscore.csd
#tempo is set in bpm by second number
echo "t 0 270" >> randomscore.csd
echo ";Format:" >> randomscore.csd
echo ";instrument start duration frequency volume" >> randomscore.csd
#run the frequency generator to generate the score
#usage ./diatonic <instrument name> <minnotecount> <lowernote> <uppernote>
./FreqGens/diatonic/diatonic.o i1 60 24 32 >> randomscore.csd
echo "</CsScore>" >> randomscore.csd
echo "</CsoundSynthesizer>" >> randomscore.csd
