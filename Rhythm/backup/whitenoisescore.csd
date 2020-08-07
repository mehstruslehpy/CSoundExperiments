<CsoundSynthesizer>
<CsOptions>
-+rtaudio=pulse -o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

;hihat
instr 1
aenv madsr 0.001, .5, .05, 0.2
anoise noise p4, p5
aclip clip anoise, 2, .9	;clip signal
ahipass,alp,abp,abr statevar aclip, p6, p7
      outs ahipass*aenv,ahipass*aenv
endin

;snare
instr 3
aenv madsr 0.001, .7, .05, 0.1
anoise noise p4, p5
aclip clip anoise, 2, .9	;clip signal
ahp,alp,abapass,abr statevar aclip, p6, p7
      outs abapass*aenv,abapass*aenv
endin


;kick
instr 2
aenv madsr 0.001, .2, .01, 0.1
anoise poscil  p4, p5
aclip clip anoise, 2, .9	;clip signal
ahp,alopass,abp,abr statevar aclip, p6, p7
      outs alopass*aenv,alopass*aenv
endin
</CsInstruments>
<CsScore>
;beats per minute
t 0 180
;kick section
;instrument start duration amp cps cutoff res
i2 0 .5 10 20 100 2.5
i2 1 .5 10 20 100 2.5
i2 2 .5 10 20 100 2.5
i2 4 .5 10 20 100 2.5
i2 6 .5 10 20 100 2.5
i2 7 .5 10 20 100 2.5
i2 8 .5 10 20 100 2.5

;snare section
;instrument start duration amp beta cutoff res
i3 3.75 .5 .1 .5 2000 2.0
i3 4 .5 .5 .5 2000 2.0
i3 4.25 .5 .5 .5 2000 2.0
i3 8 .5 .5 .5 2000 2.0

;hi-hat section
;instrument start duration amp beta cutoff res
i1 0 .5 .5 .5 5000 1.5
i1 1 .5 .5 .5 5000 1.5
i1 2 .5 .5 .5 5000 1.5
i1 3 .5 .5 .5 5000 1.5
i1 4 .5 .5 .5 5000 1.5
i1 5 .5 .5 .5 5000 1.5
i1 6 .5 .5 .5 5000 1.5
i1 7 .5 .5 .5 5000 1.5
i1 8 .5 .5 .5 5000 1.5
e
</CsScore>
</CsoundSynthesizer>
