echo "<CsoundSynthesizer>" > randomscore.csd
echo "<CsOptions>" >> randomscore.csd
echo "-+rtaudio=pulse -o dac" >> randomscore.csd
echo "</CsOptions>" >> randomscore.csd
echo "<CsInstruments>" >> randomscore.csd

echo "instr 2" >> randomscore.csd
echo "iFreq = p4" >> randomscore.csd
echo "iAmp = p5" >> randomscore.csd
echo "aenv madsr 0.0001, 1, 2, 1" >> randomscore.csd
echo "aOut vco2 iAmp, iFreq" >> randomscore.csd
echo "out aOut*aenv*0.65" >> randomscore.csd
echo "endin" >> randomscore.csd

echo "instr 1" >> randomscore.csd
echo "iFreq = p4" >> randomscore.csd
echo "iAmp = p5" >> randomscore.csd
echo "aOut vco2 iAmp, iFreq" >> randomscore.csd
echo "out aOut*1.15" >> randomscore.csd
echo "endin" >> randomscore.csd

echo "</CsInstruments>" >> randomscore.csd
echo "<CsScore>" >> randomscore.csd
./FreqGens/diatonic/diatonic.o i1 20 24 32 >> randomscore.csd
echo "</CsScore>" >> randomscore.csd
echo "</CsoundSynthesizer>" >> randomscore.csd
