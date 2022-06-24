WaitFunctions.WAIT_NOTHING @=> WaitFunction @ wn;
WaitFunctions.WAIT_SIXTY_FOURTH_BEAT @=> WaitFunction @ wsfb;
WaitFunctions.WAIT_EIGHTH_BEAT @=> WaitFunction @ web;
WaitFunctions.WAIT_QUARTER_BEAT @=> WaitFunction @ wqb;
WaitFunctions.WAIT_HALF_BEAT @=> WaitFunction @ whb;
WaitFunctions.WAIT_FULL_BEAT @=> WaitFunction @ wfb;
WaitFunctionCombination.of([wqb, wqb, wqb]) @=> WaitFunction wtqb;
WaitFunctionCombination.of([wfb, wfb, wfb, wfb]) @=> WaitFunction w4fb;
WaitFunctionCombination.of([wfb, wfb, wfb, wfb, wfb]) @=> WaitFunction w5fb;
WaitFunctionCombination.of([w5fb, w5fb, w5fb, w5fb]) @=> WaitFunction w20fb;

MeasureCreator.create(
    TimeSignatureCreator.create([5], 8, 74, 10),
    16
) @=> ck_timesig__Measure measures[];

createNoteSequence(
    SinOscPrep.create(),
    UGenChain.create().withUGen(createJCRev(.3)),
    createAdsr(10::ms, 8::ms, .5, 500::ms)
) @=> NoteSequence a1;
a1.addNoteDuration(Std.mtof(60), whb, whb);
a1.addNoteDuration(Std.mtof(67), whb, whb);
a1.addNoteDuration(Std.mtof(74), whb, whb);
a1.addNoteDuration(Std.mtof(79), whb, whb);
a1.addNoteDuration(Std.mtof(81), whb, whb);

createNoteSequence(
    SinOscPrep.create(),
    UGenChain.create().withUGen(createJCRev(.3)),
    createAdsr(10::ms, 8::ms, .5, 500::ms)
) @=> NoteSequence a2;
a2.addNoteDuration(Std.mtof(57), whb, whb);
a2.addNoteDuration(Std.mtof(69), whb, whb);
a2.addNoteDuration(Std.mtof(74), whb, whb);
a2.addNoteDuration(Std.mtof(79), whb, whb);
a2.addNoteDuration(Std.mtof(81), whb, whb);

createNoteSequence(
    SinOscPrep.create(),
    UGenChain.create().withUGen(createJCRev(.3)),
    createAdsr(10::ms, 8::ms, .5, 500::ms)
) @=> NoteSequence a3;
a3.addNoteDuration(Std.mtof(59), whb, whb);
a3.addNoteDuration(Std.mtof(67), whb, whb);
a3.addNoteDuration(Std.mtof(74), whb, whb);
a3.addNoteDuration(Std.mtof(79), whb, whb);
a3.addNoteDuration(Std.mtof(81), whb, whb);

createNoteSequence(
    ModulatedOsc.create(),
    UGenChain.create().withUGen(createJCRev(.15)),
    createAdsr(10::ms, 8::ms, .5, 500::ms)
) @=> NoteSequence a4;
a4.addNoteDuration(Std.mtof(81), whb, whb);
a4.addNoteDuration(Std.mtof(79), whb, whb);
a4.addNoteDuration(Std.mtof(86), wqb, wqb);
a4.addNoteDuration(Std.mtof(83), wtqb, wtqb);
a4.addNoteDuration(Std.mtof(81), wqb, wqb);

createNoteSequence(
    ModulatedOsc.create()
        .withCarrierGain(.75)
        .withModulations([
            Modulation
                .create()
                .withModulationFunction(new IdFreqModulationFunction)
                .withGain(100.0),
            Modulation
                .create()
                .withModulationFunction(new HalfFreqModulationFunction)
                .withGain(100.00)
        ]),
    UGenChain.create().withUGen(createJCRev(.15)),
    createAdsr(10::ms, 8::ms, .5, 500::ms)
) @=> NoteSequence a5;
a5.addNoteDuration(Std.mtof(83), wqb, wqb);
a5.addNoteDuration(Std.mtof(81), wqb, wqb);
a5.addNoteDuration(Std.mtof(79), wqb, wqb);
a5.addNoteDuration(Std.mtof(83), wqb, wqb);
a5.addNoteDuration(Std.mtof(81), wqb, wqb);
a5.addNoteDuration(Std.mtof(79), wqb, wqb);
a5.addNoteDuration(Std.mtof(83), wqb, wqb);
a5.addNoteDuration(Std.mtof(81), wqb, wqb);
a5.addNoteDuration(Std.mtof(79), wqb, wqb);
a5.addNoteDuration(Std.mtof(86), wqb, wqb);

createNoteSequence(
    ModulatedOsc.create()
        .withCarrierGain(.75)
        .withModulations([
            Modulation
                .create()
                .withModulationFunction(new ThirdFreqModulationFunction)
                .withGain(100.0),
            Modulation
                .create()
                .withModulationFunction(new QuarterFreqModulationFunction)
                .withGain(100.00)
        ]),
    UGenChain.create().withUGen(createJCRev(.15)),
    createAdsr(150::ms, 50::ms, .5, 500::ms)
) @=> NoteSequence a6;
a6.addNoteDuration(Std.mtof(71), wqb, wqb);
a6.addNoteDuration(Std.mtof(69), wqb, wqb);
a6.addNoteDuration(Std.mtof(67), wqb, wqb);
a6.addNoteDuration(Std.mtof(71), wqb, wqb);
a6.addNoteDuration(Std.mtof(69), wqb, wqb);
a6.addNoteDuration(Std.mtof(67), wqb, wqb);
a6.addNoteDuration(Std.mtof(71), wqb, wqb);
a6.addNoteDuration(Std.mtof(69), wqb, wqb);
a6.addNoteDuration(Std.mtof(67), wqb, wqb);
a6.addNoteDuration(Std.mtof(74), wqb, wqb);

createNoteSequence(
    ModulatedOsc.create()
        .withCarrierGain(.75)
        .withModulations([
            Modulation
                .create()
                .withModulationFunction(new DoubleFreqModulationFunction)
                .withGain(100.0),
            Modulation
                .create()
                .withModulationFunction(new IdFreqModulationFunction)
                .withGain(100.00)
        ]),
    UGenChain.create().withUGen(createJCRev(.15)),
    createAdsr(150::ms, 50::ms, .5, 500::ms)
) @=> NoteSequence a7;
a7.addNoteDuration(Std.mtof(81), wfb, wfb);

createChordSequence([
        new SinOscPrep $ UGenPreparation, 
        new SinOscPrep $ UGenPreparation
    ], [
        UGenChain.create().withUGen(new JCRev),
        UGenChain.create().withUGen(new JCRev)
    ], [
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope,
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope
    ]
) @=> ChordSequence b1;
b1.addChordDuration([Std.mtof(24), Std.mtof(36)], whb, whb);
b1.addChordDuration([Std.mtof(24), Std.mtof(36)], whb, whb);
b1.addChordDuration([Std.mtof(24), Std.mtof(36)], whb, whb);
b1.addChordDuration([Std.mtof(24), Std.mtof(36)], whb, whb);
b1.addChordDuration([Std.mtof(24), Std.mtof(36)], whb, whb);

createChordSequence([
        new SinOscPrep $ UGenPreparation, 
        new SinOscPrep $ UGenPreparation
    ], [
        UGenChain.create().withUGen(new JCRev),
        UGenChain.create().withUGen(new JCRev)
    ], [
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope,
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope
    ]
) @=> ChordSequence b2;
b2.addChordDuration([Std.mtof(33), Std.mtof(45)], w5fb, wn);

createChordSequence([
        new SinOscPrep $ UGenPreparation, 
        new SinOscPrep $ UGenPreparation
    ], [
        UGenChain.create().withUGen(new JCRev),
        UGenChain.create().withUGen(new JCRev)
    ], [
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope,
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope
    ]
) @=> ChordSequence b3;
b3.addChordDuration([Std.mtof(23), Std.mtof(35)], w5fb, wn);

createChordSequence([
        new SinOscPrep $ UGenPreparation, 
        new SinOscPrep $ UGenPreparation, 
        new SinOscPrep $ UGenPreparation
    ], [
        UGenChain.create().withUGen(new Chorus),
        UGenChain.create().withUGen(new Chorus),
        UGenChain.create().withUGen(new Chorus)
    ], [
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope,
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope,
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope
    ]
) @=> ChordSequence h;
h.addChordDuration([Std.mtof(74), Std.mtof(79), Std.mtof(81)], wfb, wn);
h.addChordDuration([Std.mtof(74), Std.mtof(79), Std.mtof(81)], w4fb, w4fb);

createChordSequence(
    [new SinOscPrep $ UGenPreparation, new SinOscPrep $ UGenPreparation, new SinOscPrep $ UGenPreparation],
    [UGenChain.create(), UGenChain.create(), UGenChain.create()],
    [createAdsr(5::ms, 5::ms, 0.025, 125::ms) $ Envelope, createAdsr(5::ms, 5::ms, 0.025, 125::ms) $ Envelope, createAdsr(5::ms, 5::ms, 0.025, 125::ms) $ Envelope]
) @=> ChordSequence d;
d.addChordDuration([45.0, 45.0, 45.0], wsfb, w4fb);
d.addChordDuration([45.0, 45.0, 45.0], wsfb, wfb);

createNoteSequence(
    SinOscPrep.create(),
    UGenChain.create(),
    createAdsr(5::ms, 5::ms, 0.005, 25::ms)
) @=> NoteSequence @ s;
s.addSilence(wfb);
s.addSilence(wfb);
s.addSilence(wfb);
s.addNoteDuration(Std.mtof(72), wsfb, wfb);
s.addSilence(wfb);

measures[0].register(h);
measures[0].register(d);

measures[1].register(a1);
measures[1].register(h);
measures[1].register(d);
measures[1].register(s);

measures[2].register(a2);
measures[2].register(h);
measures[2].register(d);
measures[2].register(s);

measures[3].register(a3);
measures[3].register(h);
measures[3].register(d);
measures[3].register(s);

measures[4].register(a1);
measures[4].register(a4);
measures[4].register(h);
measures[4].register(d);
measures[4].register(s);

measures[5].register(a2);
measures[5].register(a4);
measures[5].register(h);
measures[5].register(d);
measures[5].register(s);

measures[6].register(a3);
measures[6].register(a4);
measures[6].register(h);
measures[6].register(d);
measures[6].register(s);

measures[7].register(a1);
measures[7].register(a4);
measures[7].register(h);
measures[7].register(d);
measures[7].register(s);
measures[7].register(b1);

measures[8].register(a2);
measures[8].register(a4);
measures[8].register(h);
measures[8].register(d);
measures[8].register(s);
measures[8].register(b2);

measures[9].register(a3);
measures[9].register(a4);
measures[9].register(h);
measures[9].register(d);
measures[9].register(s);
measures[9].register(b3);

measures[10].register(a1);
measures[10].register(a4);
measures[10].register(h);
measures[10].register(d);
measures[10].register(s);
measures[10].register(b1);
measures[10].register(a5);

measures[11].register(a2);
measures[11].register(a4);
measures[11].register(h);
measures[11].register(d);
measures[11].register(s);
measures[11].register(b2);
measures[11].register(a5);

measures[12].register(a3);
measures[12].register(a4);
measures[12].register(h);
measures[12].register(d);
measures[12].register(s);
measures[12].register(b3);
measures[12].register(a5);

measures[13].register(a1);
measures[13].register(a4);
measures[13].register(h);
measures[13].register(d);
measures[13].register(s);
measures[13].register(b1);
measures[13].register(a6);

measures[14].register(a2);
measures[14].register(a4);
measures[14].register(h);
measures[14].register(d);
measures[14].register(s);
measures[14].register(b1);
measures[14].register(a6);
measures[14].register(a7);

h.withGain(0.0025);
d.withGain(0.25);
for (0 => int k; k < 4; ++k) {
    measures[0].advanceTime();    
}

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
h.withGain(0.0025);
d.withGain(0.25);
s.withGain(0.2);
for (0 => int k; k < 2; ++k) {
    for (0 => int i; i < 2; ++i) {
        measures[1].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[2].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[3].advanceTime();
    }
}

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
a4.withGain(0.1);
h.withGain(0.0025);
d.withGain(0.25);
s.withGain(0.2);
for (0 => int k; k < 2; ++k) {
    for (0 => int i; i < 4; ++i) {
        measures[4].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[5].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[6].advanceTime();
    }
}

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
a4.withGain(0.15);
h.withGain(0.0025);
d.withGain(0.25);
s.withGain(0.2);
b1.withGain(0.2);
b2.withGain(0.1);
b3.withGain(0.2);
for (0 => int k; k < 2; ++k) {
    for (0 => int i; i < 4; ++i) {
        measures[7].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[8].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[9].advanceTime();
    }
}

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
a4.withGain(0.15);
h.withGain(0.0025);
d.withGain(0.25);
s.withGain(0.2);
b1.withGain(0.2);
b2.withGain(0.1);
b3.withGain(0.2);
a5.withGain(0.1);
for (0 => int k; k < 4; ++k) {
    for (0 => int i; i < 4; ++i) {
        measures[10].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[11].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[12].advanceTime();
    }
}

a1.withGain(0.01);
a2.withGain(0.01);
a3.withGain(0.01);
a4.withGain(0.015);
h.withGain(0.00025);
d.withGain(0.25);
s.withGain(0.2);
b1.withGain(0.2);
b2.withGain(0.1);
b3.withGain(0.2);
a6.withGain(0.1);
for (0 => int k; k < 4; ++k) {
    for (0 => int i; i < 4; ++i) {
        measures[13].advanceTime();
    }
}

a1.withGain(0.01);
a2.withGain(0.01);
a3.withGain(0.01);
a4.withGain(0.015);
h.withGain(0.00025);
d.withGain(0.25);
s.withGain(0.2);
b1.withGain(0.2);
b2.withGain(0.1);
b3.withGain(0.2);
a6.withGain(0.1);
a7.withGain(0.1);
for (0 => int k; k < 4; ++k) {
    for (0 => int i; i < 4; ++i) {
        measures[14].advanceTime();
    }
}

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
h.withGain(0.0025);
d.withGain(0.25);
s.withGain(0.2);
for (0 => int k; k < 2; ++k) {
    for (0 => int i; i < 2; ++i) {
        measures[1].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[2].advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        measures[3].advanceTime();
    }
}

h.withGain(0.0025);
d.withGain(0.25);
for (0 => int k; k < 4; ++k) {
    measures[0].advanceTime();    
}

fun NoteSequence createNoteSequence(
    UGenPreparation up,
    UGenChain outGate,
    Envelope envelope) {
        return NoteSequence.of(up)
            .withOutGate(outGate)
            .withEnvelope(envelope);
}

fun ChordSequence createChordSequence(
        UGenPreparation up[],
        UGenChain outGates[],
        Envelope envelopes[]) {
    return ChordSequence.of(up)
        .withOutGates(outGates)
        .withEnvelopes(envelopes);
}

fun ADSR createAdsr(dur a, dur d, float s, dur r) {
    ADSR e;
    e.set(a, d, s, r);
    return e;
}

fun JCRev createJCRev(float mix) {
    JCRev r;
    mix => r.mix;
    return r;
}
