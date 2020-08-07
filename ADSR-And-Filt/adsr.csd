<CsoundSynthesizer>
<CsInstruments>

instr 1
iFreq = p4
iAmp = p5
iAtt = 0.1
iDec = 0.4
iSus = 0.6
iRel = 0.7
kEnv madsr iAtt, iDec, iSus, iRel 
aOut vco2 iAmp, iFreq
out aOut*kEnv
endin

</CsInstruments>
<CsScore>
i1 0 1 100 1000
i1 1 1 200 1000
i1 2 1 300 1000
i1 3 1 200 1000
i1 4 1 100 1000
</CsScore>
</CsoundSynthesizer>
