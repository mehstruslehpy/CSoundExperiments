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
aenv madsr 0.001, .5, .03, 0.2
anoise noise p4, p5
aclip clip anoise, 2, .9	;clip signal
ahipass,alp,abp,abr statevar aclip, p6, p7
      outs ahipass*aenv*0.5,ahipass*aenv*0.5
endin

;snare
instr 3
aenv madsr 0.001, .3, .05, 0.1
anoise noise p4, p5
aclip clip anoise, 2, .5	;clip signal
ahp,alp,abapass,abr statevar aclip, p6, p7
      outs abapass*aenv,abapass*aenv
endin


;kick
instr 2
aenv madsr 0.001, .2, .01, 0.1
anoise poscil  p4, p5
aclip clip anoise, 2, .9	;clip signal
ahp,alopass,abp,abr statevar aclip, p6, p7
      outs alopass*aenv*1.5,alopass*aenv*1.5
endin
</CsInstruments>
<CsScore>

;beats per minute
t 0 210
;kick pattern:
instrument start duration amp p5 cutoff res
;T F F T T F T T 
;measure 1.000000
i2 0.000000 0.5 10.000000 20.000000 100 2.500000
i2 1.500000 0.5 10.000000 20.000000 100 2.500000
i2 2.000000 0.5 10.000000 20.000000 100 2.500000
i2 3.000000 0.5 10.000000 20.000000 100 2.500000
i2 3.500000 0.5 10.000000 20.000000 100 2.500000
;measure 2.000000
i2 4.500000 0.5 10.000000 20.000000 100 2.500000
i2 6.000000 0.5 10.000000 20.000000 100 2.500000
i2 6.500000 0.5 10.000000 20.000000 100 2.500000
i2 7.500000 0.5 10.000000 20.000000 100 2.500000
i2 8.000000 0.5 10.000000 20.000000 100 2.500000
;measure 3.000000
i2 9.000000 0.5 10.000000 20.000000 100 2.500000
i2 10.500000 0.5 10.000000 20.000000 100 2.500000
i2 11.000000 0.5 10.000000 20.000000 100 2.500000
i2 12.000000 0.5 10.000000 20.000000 100 2.500000
i2 12.500000 0.5 10.000000 20.000000 100 2.500000
;measure 4.000000
i2 13.500000 0.5 10.000000 20.000000 100 2.500000
i2 15.000000 0.5 10.000000 20.000000 100 2.500000
i2 15.500000 0.5 10.000000 20.000000 100 2.500000
i2 16.500000 0.5 10.000000 20.000000 100 2.500000
i2 17.000000 0.5 10.000000 20.000000 100 2.500000
;measure 5.000000
i2 18.000000 0.5 10.000000 20.000000 100 2.500000
i2 19.500000 0.5 10.000000 20.000000 100 2.500000
i2 20.000000 0.5 10.000000 20.000000 100 2.500000
i2 21.000000 0.5 10.000000 20.000000 100 2.500000
i2 21.500000 0.5 10.000000 20.000000 100 2.500000
;measure 6.000000
i2 22.500000 0.5 10.000000 20.000000 100 2.500000
i2 24.000000 0.5 10.000000 20.000000 100 2.500000
i2 24.500000 0.5 10.000000 20.000000 100 2.500000
i2 25.500000 0.5 10.000000 20.000000 100 2.500000
i2 26.000000 0.5 10.000000 20.000000 100 2.500000
;measure 7.000000
i2 27.000000 0.5 10.000000 20.000000 100 2.500000
i2 28.500000 0.5 10.000000 20.000000 100 2.500000
i2 29.000000 0.5 10.000000 20.000000 100 2.500000
i2 30.000000 0.5 10.000000 20.000000 100 2.500000
i2 30.500000 0.5 10.000000 20.000000 100 2.500000
;measure 8.000000
i2 31.500000 0.5 10.000000 20.000000 100 2.500000
i2 33.000000 0.5 10.000000 20.000000 100 2.500000
i2 33.500000 0.5 10.000000 20.000000 100 2.500000
i2 34.500000 0.5 10.000000 20.000000 100 2.500000
i2 35.000000 0.5 10.000000 20.000000 100 2.500000
;measure 9.000000
i2 36.000000 0.5 10.000000 20.000000 100 2.500000
i2 37.500000 0.5 10.000000 20.000000 100 2.500000
i2 38.000000 0.5 10.000000 20.000000 100 2.500000
i2 39.000000 0.5 10.000000 20.000000 100 2.500000
i2 39.500000 0.5 10.000000 20.000000 100 2.500000
;measure 10.000000
i2 40.500000 0.5 10.000000 20.000000 100 2.500000
i2 42.000000 0.5 10.000000 20.000000 100 2.500000
i2 42.500000 0.5 10.000000 20.000000 100 2.500000
i2 43.500000 0.5 10.000000 20.000000 100 2.500000
i2 44.000000 0.5 10.000000 20.000000 100 2.500000
;measure 11.000000
i2 45.000000 0.5 10.000000 20.000000 100 2.500000
i2 46.500000 0.5 10.000000 20.000000 100 2.500000
i2 47.000000 0.5 10.000000 20.000000 100 2.500000
i2 48.000000 0.5 10.000000 20.000000 100 2.500000
i2 48.500000 0.5 10.000000 20.000000 100 2.500000
;measure 12.000000
i2 49.500000 0.5 10.000000 20.000000 100 2.500000
i2 51.000000 0.5 10.000000 20.000000 100 2.500000
i2 51.500000 0.5 10.000000 20.000000 100 2.500000
i2 52.500000 0.5 10.000000 20.000000 100 2.500000
i2 53.000000 0.5 10.000000 20.000000 100 2.500000


;hat pattern:
;T T F T T F T F 
;measure 1.000000
i1 0.000000 0.5 0.500000 0.500000 5000 1.500000
i1 0.500000 0.5 0.500000 0.500000 5000 1.500000
i1 1.500000 0.5 0.500000 0.500000 5000 1.500000
i1 2.000000 0.5 0.500000 0.500000 5000 1.500000
i1 3.000000 0.5 0.500000 0.500000 5000 1.500000
;measure 2.000000
i1 4.500000 0.5 0.500000 0.500000 5000 1.500000
i1 5.000000 0.5 0.500000 0.500000 5000 1.500000
i1 6.000000 0.5 0.500000 0.500000 5000 1.500000
i1 6.500000 0.5 0.500000 0.500000 5000 1.500000
i1 7.500000 0.5 0.500000 0.500000 5000 1.500000
;measure 3.000000
i1 9.000000 0.5 0.500000 0.500000 5000 1.500000
i1 9.500000 0.5 0.500000 0.500000 5000 1.500000
i1 10.500000 0.5 0.500000 0.500000 5000 1.500000
i1 11.000000 0.5 0.500000 0.500000 5000 1.500000
i1 12.000000 0.5 0.500000 0.500000 5000 1.500000
;measure 4.000000
i1 13.500000 0.5 0.500000 0.500000 5000 1.500000
i1 14.000000 0.5 0.500000 0.500000 5000 1.500000
i1 15.000000 0.5 0.500000 0.500000 5000 1.500000
i1 15.500000 0.5 0.500000 0.500000 5000 1.500000
i1 16.500000 0.5 0.500000 0.500000 5000 1.500000
;measure 5.000000
i1 18.000000 0.5 0.500000 0.500000 5000 1.500000
i1 18.500000 0.5 0.500000 0.500000 5000 1.500000
i1 19.500000 0.5 0.500000 0.500000 5000 1.500000
i1 20.000000 0.5 0.500000 0.500000 5000 1.500000
i1 21.000000 0.5 0.500000 0.500000 5000 1.500000
;measure 6.000000
i1 22.500000 0.5 0.500000 0.500000 5000 1.500000
i1 23.000000 0.5 0.500000 0.500000 5000 1.500000
i1 24.000000 0.5 0.500000 0.500000 5000 1.500000
i1 24.500000 0.5 0.500000 0.500000 5000 1.500000
i1 25.500000 0.5 0.500000 0.500000 5000 1.500000
;measure 7.000000
i1 27.000000 0.5 0.500000 0.500000 5000 1.500000
i1 27.500000 0.5 0.500000 0.500000 5000 1.500000
i1 28.500000 0.5 0.500000 0.500000 5000 1.500000
i1 29.000000 0.5 0.500000 0.500000 5000 1.500000
i1 30.000000 0.5 0.500000 0.500000 5000 1.500000
;measure 8.000000
i1 31.500000 0.5 0.500000 0.500000 5000 1.500000
i1 32.000000 0.5 0.500000 0.500000 5000 1.500000
i1 33.000000 0.5 0.500000 0.500000 5000 1.500000
i1 33.500000 0.5 0.500000 0.500000 5000 1.500000
i1 34.500000 0.5 0.500000 0.500000 5000 1.500000
;measure 9.000000
i1 36.000000 0.5 0.500000 0.500000 5000 1.500000
i1 36.500000 0.5 0.500000 0.500000 5000 1.500000
i1 37.500000 0.5 0.500000 0.500000 5000 1.500000
i1 38.000000 0.5 0.500000 0.500000 5000 1.500000
i1 39.000000 0.5 0.500000 0.500000 5000 1.500000
;measure 10.000000
i1 40.500000 0.5 0.500000 0.500000 5000 1.500000
i1 41.000000 0.5 0.500000 0.500000 5000 1.500000
i1 42.000000 0.5 0.500000 0.500000 5000 1.500000
i1 42.500000 0.5 0.500000 0.500000 5000 1.500000
i1 43.500000 0.5 0.500000 0.500000 5000 1.500000
;measure 11.000000
i1 45.000000 0.5 0.500000 0.500000 5000 1.500000
i1 45.500000 0.5 0.500000 0.500000 5000 1.500000
i1 46.500000 0.5 0.500000 0.500000 5000 1.500000
i1 47.000000 0.5 0.500000 0.500000 5000 1.500000
i1 48.000000 0.5 0.500000 0.500000 5000 1.500000
;measure 12.000000
i1 49.500000 0.5 0.500000 0.500000 5000 1.500000
i1 50.000000 0.5 0.500000 0.500000 5000 1.500000
i1 51.000000 0.5 0.500000 0.500000 5000 1.500000
i1 51.500000 0.5 0.500000 0.500000 5000 1.500000
i1 52.500000 0.5 0.500000 0.500000 5000 1.500000


;snare pattern:
;F T F F F F F T 
;measure 1.000000
i3 0.500000 0.5 0.500000 0.500000 2000 2.000000
i3 3.500000 0.5 0.500000 0.500000 2000 2.000000
;measure 2.000000
i3 5.000000 0.5 0.500000 0.500000 2000 2.000000
i3 8.000000 0.5 0.500000 0.500000 2000 2.000000
;measure 3.000000
i3 9.500000 0.5 0.500000 0.500000 2000 2.000000
i3 12.500000 0.5 0.500000 0.500000 2000 2.000000
;measure 4.000000
i3 14.000000 0.5 0.500000 0.500000 2000 2.000000
i3 17.000000 0.5 0.500000 0.500000 2000 2.000000
;measure 5.000000
i3 18.500000 0.5 0.500000 0.500000 2000 2.000000
i3 21.500000 0.5 0.500000 0.500000 2000 2.000000
;measure 6.000000
i3 23.000000 0.5 0.500000 0.500000 2000 2.000000
i3 26.000000 0.5 0.500000 0.500000 2000 2.000000
;measure 7.000000
i3 27.500000 0.5 0.500000 0.500000 2000 2.000000
i3 30.500000 0.5 0.500000 0.500000 2000 2.000000
;measure 8.000000
i3 32.000000 0.5 0.500000 0.500000 2000 2.000000
i3 35.000000 0.5 0.500000 0.500000 2000 2.000000
;measure 9.000000
i3 36.500000 0.5 0.500000 0.500000 2000 2.000000
i3 39.500000 0.5 0.500000 0.500000 2000 2.000000
;measure 10.000000
i3 41.000000 0.5 0.500000 0.500000 2000 2.000000
i3 44.000000 0.5 0.500000 0.500000 2000 2.000000
;measure 11.000000
i3 45.500000 0.5 0.500000 0.500000 2000 2.000000
i3 48.500000 0.5 0.500000 0.500000 2000 2.000000
;measure 12.000000
i3 50.000000 0.5 0.500000 0.500000 2000 2.000000
i3 53.000000 0.5 0.500000 0.500000 2000 2.000000

</CsScore>
</CsoundSynthesizer>