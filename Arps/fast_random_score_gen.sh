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
echo "aOut vco2 iAmp, iFreq" >> randomscore.csd
echo "out aOut*0.65" >> randomscore.csd
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
#run the arp generator to generate the score
#USAGE: ./ArpGen.o <measurestopattern> <repeatpattern> <beatspermeasure> <rhythmdivisions> <highestnote> <lowestnote>
./ArpGen.o 4 2 8 3 40 16 >> randomscore.csd
echo "</CsScore>" >> randomscore.csd
echo "</CsoundSynthesizer>" >> randomscore.csd
