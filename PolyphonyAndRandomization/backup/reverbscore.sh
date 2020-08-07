<CsoundSynthesizer>
<CsOptions>
-+rtaudio=pulse -o dac
</CsOptions>
<CsInstruments>

ga1 init 0 

instr 1
iFreq = p4
iAmp = p5
aOut vco2 iAmp, iFreq
ga1+=aOut
endin

instr 2
arev reverb ga1, 5, 1
outs arev, arev 
 
ga1  = 0	;clear
endin


</CsInstruments>
<CsScore>
i2 0 15
i1 0.000000 0.395856 18.350000 8714
i1 0.395856 0.987702 18.350000 5926
i1 1.383558 0.208816 82.410000 5315
i1 1.592373 0.340200 20.600000 7801
i1 1.932574 0.184947 27.500000 4669
i1 2.117520 0.164638 73.420000 4339
i1 2.282158 0.078878 55.000000 4053
i1 2.361036 0.582345 41.200000 5646
i1 2.943381 0.851695 61.740000 3908
i1 3.795076 0.362571 61.740000 1350
i1 4.157647 0.200850 24.500000 4594
i1 4.358497 0.187386 16.350000 6407
i1 4.545884 0.077341 32.700000 2467
i1 4.623225 0.852369 55.000000 6186
i1 5.475594 0.278191 82.410000 6821
i1 5.753785 0.227804 16.350000 7627
i1 5.981588 0.130881 55.000000 7144
i1 6.112470 0.605361 18.350000 4077
i1 6.717831 0.364202 61.740000 1815
i1 7.082032 0.068203 20.600000 7093
i1 0.000000 0.254400 261.630000 3927
i1 0.254400 0.307922 293.660000 2288
i1 0.562322 0.069877 329.630000 5810
i1 0.632199 0.424827 146.830000 8451
i1 1.057026 0.086109 110.000000 6936
i1 1.143135 0.124010 110.000000 3421
i1 1.267145 0.271744 293.660000 4740
i1 1.538890 0.886121 293.660000 3095
i1 2.425011 0.080728 123.470000 2906
i1 2.505739 0.557401 164.810000 1158
i1 3.063140 0.816110 87.310000 5865
i1 3.879250 0.105213 146.830000 3746
i1 3.984463 0.715979 110.000000 5177
i1 4.700442 0.796591 293.660000 7521
i1 5.497033 0.384553 349.230000 7463
i1 5.881586 0.326218 82.410000 4358
i1 6.207804 0.994281 349.230000 2197
i1 7.202085 0.542192 261.630000 7413
i1 7.744277 0.673669 164.810000 4725
i1 8.417946 0.089512 293.660000 8648
i1 0.000000 0.611297 493.880000 3699
i1 0.611297 0.126308 659.250000 4102
i1 0.737605 0.428877 1975.530000 3237
i1 1.166482 0.007098 1760.000000 1763
i1 1.173581 0.984537 1975.530000 8600
i1 2.158117 0.080149 698.460000 3872
i1 2.238266 0.960719 987.770000 7967
i1 3.198985 0.685136 987.770000 3124
i1 3.884121 0.803857 659.250000 7864
i1 4.687978 0.244828 987.770000 6698
i1 4.932806 0.922016 783.990000 1402
i1 5.854822 0.011163 1396.910000 4762
i1 5.865984 0.839499 1174.660000 7437
i1 6.705484 0.221562 392.000000 1403
i1 6.927046 0.966429 659.250000 6917
i1 7.893475 0.893561 987.770000 8136
i1 8.787037 0.818382 587.330000 7139
i1 9.605419 0.929509 880.000000 5555
i1 10.534927 0.921023 1046.500000 3520
i1 11.455950 0.533264 1046.500000 6351
</CsScore>
</CsoundSynthesizer>