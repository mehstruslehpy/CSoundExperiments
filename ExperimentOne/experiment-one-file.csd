<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

instr 1
iFreq = p4
iAmp = p5
aOut vco2 iAmp, iFreq
out aOut
endin

</CsInstruments>
<CsScore>
i1 0 1 1000 5000
i1 1 1 2000 500
i1 2 1 3000 5
</CsScore>
</CsoundSynthesizer>
