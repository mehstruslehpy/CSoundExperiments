echo "<CsoundSynthesizer>" > randomscore.csd
echo "<CsOptions>" >> randomscore.csd
echo "-+rtaudio=pulse -o dac" >> randomscore.csd
echo "</CsOptions>" >> randomscore.csd
echo "<CsInstruments>" >> randomscore.csd
echo "instr 1" >> randomscore.csd
echo "iFreq = p4" >> randomscore.csd
echo "iAmp = p5" >> randomscore.csd
echo "aOut vco2 iAmp, iFreq" >> randomscore.csd
echo "out aOut" >> randomscore.csd
echo "endin" >> randomscore.csd
echo "</CsInstruments>" >> randomscore.csd
echo "<CsScore>" >> randomscore.csd
./FreqGens/diatonic/diatonic.o i1 50 0 16 >> randomscore.csd
sleep 1
./FreqGens/diatonic/diatonic.o i1 50 16 32 >> randomscore.csd
sleep 1
./FreqGens/diatonic/diatonic.o i1 50 32 48 >> randomscore.csd
echo "</CsScore>" >> randomscore.csd
echo "</CsoundSynthesizer>" >> randomscore.csd
