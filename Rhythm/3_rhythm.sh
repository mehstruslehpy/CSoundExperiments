#!/bin/sh
echo "<CsoundSynthesizer>">randomscore.csd
echo "<CsOptions>">>randomscore.csd
echo "-+rtaudio=pulse -o dac">>randomscore.csd
echo "</CsOptions>">>randomscore.csd
echo "<CsInstruments>">>randomscore.csd
echo "sr = 44100">>randomscore.csd
echo "ksmps = 32">>randomscore.csd
echo "nchnls = 2">>randomscore.csd
echo "0dbfs  = 1">>randomscore.csd
echo "">>randomscore.csd
echo ";hihat">>randomscore.csd
echo "instr 1">>randomscore.csd
echo "aenv madsr 0.001, .5, .03, 0.2">>randomscore.csd
echo "anoise noise p4, p5">>randomscore.csd
echo "aclip clip anoise, 2, .9	;clip signal">>randomscore.csd
echo "ahipass,alp,abp,abr statevar aclip, p6, p7">>randomscore.csd
echo "      outs ahipass*aenv*0.5,ahipass*aenv*0.5">>randomscore.csd
echo "endin">>randomscore.csd
echo "">>randomscore.csd
echo ";snare">>randomscore.csd
echo "instr 3">>randomscore.csd
echo "aenv madsr 0.001, .3, .05, 0.1">>randomscore.csd
echo "anoise noise p4, p5">>randomscore.csd
echo "aclip clip anoise, 2, .5	;clip signal">>randomscore.csd
echo "ahp,alp,abapass,abr statevar aclip, p6, p7">>randomscore.csd
echo "      outs abapass*aenv,abapass*aenv">>randomscore.csd
echo "endin">>randomscore.csd
echo "">>randomscore.csd
echo "">>randomscore.csd
echo ";kick">>randomscore.csd
echo "instr 2">>randomscore.csd
echo "aenv madsr 0.001, .2, .01, 0.1">>randomscore.csd
echo "anoise poscil  p4, p5">>randomscore.csd
echo "aclip clip anoise, 2, .9	;clip signal">>randomscore.csd
echo "ahp,alopass,abp,abr statevar aclip, p6, p7">>randomscore.csd
echo "      outs alopass*aenv*1.5,alopass*aenv*1.5">>randomscore.csd
echo "endin">>randomscore.csd
echo "</CsInstruments>">>randomscore.csd
echo "<CsScore>">>randomscore.csd
echo "">>randomscore.csd
echo ";beats per minute">>randomscore.csd
echo "t 0 180">>randomscore.csd
#USAGE: ./BeatGen <measures> <beatspermeasure> <kick-div> <hat-div> <snare-div>
./BeatGen.o 12 3 1 3 1 >> randomscore.csd
echo "">>randomscore.csd
echo "</CsScore>">>randomscore.csd
echo "</CsoundSynthesizer>">>randomscore.csd
