WaitFunctions.WAIT_NOTHING @=> WaitFunction @ wn;
WaitFunctions.WAIT_SIXTY_FOURTH_BEAT @=> WaitFunction @ wsfb;
WaitFunctions.WAIT_QUARTER_BEAT @=> WaitFunction @ wqb;
WaitFunctions.WAIT_HALF_BEAT @=> WaitFunction @ whb;
WaitFunctions.WAIT_FULL_BEAT @=> WaitFunction @ wfb;
WaitFunctionCombination.of([wqb, wqb, wqb]) @=> WaitFunction wtqb;
WaitFunctionCombination.of([wfb, wfb, wfb, wfb]) @=> WaitFunction w4fb;
WaitFunctionCombination.of([wfb, wfb, wfb, wfb, wfb]) @=> WaitFunction w5fb;
WaitFunctionCombination.of([w5fb, w5fb, w5fb, w5fb]) @=> WaitFunction w20fb;

createTimeSignature() @=> ck_timesig__TimeSignature ts;
createMeasure(ts) @=> ck_timesig__Measure m0;
createMeasure(ts) @=> ck_timesig__Measure m1;
createMeasure(ts) @=> ck_timesig__Measure m2;
createMeasure(ts) @=> ck_timesig__Measure m3;
createMeasure(ts) @=> ck_timesig__Measure m4;
createMeasure(ts) @=> ck_timesig__Measure m5;
createMeasure(ts) @=> ck_timesig__Measure m6;
createMeasure(ts) @=> ck_timesig__Measure m7;
createMeasure(ts) @=> ck_timesig__Measure m8;
createMeasure(ts) @=> ck_timesig__Measure m9;
createMeasure(ts) @=> ck_timesig__Measure m10;
createMeasure(ts) @=> ck_timesig__Measure m11;
createMeasure(ts) @=> ck_timesig__Measure m12;

createNoteSequence() @=> NoteSequence a1;
a1.addNoteDuration(Std.mtof(60), whb, whb);
a1.addNoteDuration(Std.mtof(67), whb, whb);
a1.addNoteDuration(Std.mtof(74), whb, whb);
a1.addNoteDuration(Std.mtof(79), whb, whb);
a1.addNoteDuration(Std.mtof(81), whb, whb);

createNoteSequence() @=> NoteSequence a2;
a2.addNoteDuration(Std.mtof(57), whb, whb);
a2.addNoteDuration(Std.mtof(69), whb, whb);
a2.addNoteDuration(Std.mtof(74), whb, whb);
a2.addNoteDuration(Std.mtof(79), whb, whb);
a2.addNoteDuration(Std.mtof(81), whb, whb);

createNoteSequence() @=> NoteSequence a3;
a3.addNoteDuration(Std.mtof(59), whb, whb);
a3.addNoteDuration(Std.mtof(67), whb, whb);
a3.addNoteDuration(Std.mtof(74), whb, whb);
a3.addNoteDuration(Std.mtof(79), whb, whb);
a3.addNoteDuration(Std.mtof(81), whb, whb);

createNoteSequence() @=> NoteSequence a4;
a4.addNoteDuration(Std.mtof(81), whb, whb);
a4.addNoteDuration(Std.mtof(79), whb, whb);
a4.addNoteDuration(Std.mtof(86), wqb, wqb);
a4.addNoteDuration(Std.mtof(83), wtqb, wtqb);
a4.addNoteDuration(Std.mtof(81), wqb, wqb);

createNoteSequence() @=> NoteSequence a5;
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

createLongLastingNoteSequence() @=> NoteSequence b1;
b1.addNoteDuration(Std.mtof(36), w20fb, wn);

createNoteSequence() @=> NoteSequence b2;
b2.addNoteDuration(Std.mtof(33), w5fb, wn);

createNoteSequence() @=> NoteSequence b3;
b3.addNoteDuration(Std.mtof(35), w5fb, wn);

createChordSequence() @=> ChordSequence h;
h.addChordDuration([Std.mtof(74), Std.mtof(79), Std.mtof(81)], wfb, wn);
h.addChordDuration([Std.mtof(74), Std.mtof(79), Std.mtof(81)], w4fb, w4fb);

createDrum() @=> NoteSequence @ d;
d.addNoteDuration(Std.mtof(11), wsfb, w4fb);
d.addNoteDuration(Std.mtof(11), wsfb, wfb);

createSnare() @=> NoteSequence @ s;
s.addSilence(wfb);
s.addSilence(wfb);
s.addSilence(wfb);
s.addNoteDuration(Std.mtof(72), wsfb, wfb);
s.addSilence(wfb);

m0.register(h.withGain(0.05));
m0.register(d.withGain(2));

m1.register(a1.withGain(0.2));
m1.register(h.withGain(0.05));
m1.register(d.withGain(2));
m1.register(s.withGain(0.75));

m2.register(a2.withGain(0.2));
m2.register(h.withGain(0.05));
m2.register(d.withGain(2));
m2.register(s.withGain(0.75));

m3.register(a3.withGain(0.2));
m3.register(h.withGain(0.05));
m3.register(d.withGain(2));
m3.register(s.withGain(0.75));

m4.register(a1.withGain(0.2));
m4.register(a4.withGain(0.2));
m4.register(h.withGain(0.05));
m4.register(d.withGain(2));
m4.register(s.withGain(0.75));

m5.register(a2.withGain(0.15));
m5.register(a4.withGain(0.25));
m5.register(h.withGain(0.05));
m5.register(d.withGain(2));
m5.register(s.withGain(0.75));

m6.register(a3.withGain(0.15));
m6.register(a4.withGain(0.25));
m6.register(h.withGain(0.05));
m6.register(d.withGain(2));
m6.register(s.withGain(0.75));

m7.register(a1.withGain(0.10));
m7.register(a4.withGain(0.15));
m7.register(h.withGain(0.05));
m7.register(d.withGain(2));
m7.register(s.withGain(0.75));
m7.register(b1.withGain(0.25));

m8.register(a2.withGain(0.10));
m8.register(a4.withGain(0.15));
m8.register(h.withGain(0.05));
m8.register(d.withGain(2));
m8.register(s.withGain(0.75));
m8.register(b2.withGain(0.25));

m9.register(a3.withGain(0.10));
m9.register(a4.withGain(0.15));
m9.register(h.withGain(0.05));
m9.register(d.withGain(2));
m9.register(s.withGain(0.75));
m9.register(b3.withGain(0.15));

m10.register(a1.withGain(0.05));
m10.register(a4.withGain(0.1));
m10.register(h.withGain(0.05));
m10.register(d.withGain(2));
m10.register(s.withGain(0.75));
m10.register(b1.withGain(0.25));
m10.register(a5.withGain(0.2));

m11.register(a2.withGain(0.05));
m11.register(a4.withGain(0.1));
m11.register(h.withGain(0.05));
m11.register(d.withGain(2));
m11.register(s.withGain(0.75));
m11.register(b2.withGain(0.25));
m11.register(a5.withGain(0.2));

m12.register(a3.withGain(0.05));
m12.register(a4.withGain(0.1));
m12.register(h.withGain(0.05));
m12.register(d.withGain(2));
m12.register(s.withGain(0.75));
m12.register(b3.withGain(0.15));
m12.register(a5.withGain(0.2));

for (0 => int k; k < 4; ++k) {
    m0.advanceTime();    
}

for (0 => int k; k < 2; ++k) {
    for (0 => int i; i < 2; ++i) {
        m1.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m2.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m3.advanceTime();
    }
}

for (0 => int k; k < 2; ++k) {
    for (0 => int i; i < 4; ++i) {
        m4.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m5.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m6.advanceTime();
    }
}

for (0 => int k; k < 2; ++k) {
    for (0 => int i; i < 4; ++i) {
        m7.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m8.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m9.advanceTime();
    }
}

for (0 => int k; k < 8; ++k) {
    for (0 => int i; i < 4; ++i) {
        m10.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m11.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m12.advanceTime();
    }
}

for (0 => int k; k < 2; ++k) {
    for (0 => int i; i < 2; ++i) {
        m1.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m2.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        m3.advanceTime();
    }
}

for (0 => int k; k < 4; ++k) {
    m0.advanceTime();    
}

fun ck_timesig__Measure createMeasure(ck_timesig__TimeSignature ts) {
    ck_timesig__Measure m;
    ts @=> m.ts;
    
    return m;
}

fun ck_timesig__TimeSignature createTimeSignature() {
    ck_timesig__TimeSignature ts;
    [5] @=> ts.beatsPerMeasure;
    8 => ts.beatNoteValue;
    70 => ts.bpm;
    ts.init(10);

    return ts;
}

fun NoteSequence createNoteSequence() {
    return NoteSequence.of(Osc.create())
    .withOutGate(
        UGenChain.create()
            .withUGen(new JCRev))
    .withEnvelope(
        createAdsr(10::ms, 8::ms, .5, 500::ms));
}

fun NoteSequence createLongLastingNoteSequence() {
    return createNoteSequence()
        .withTearDownTolerance(1::week);
}

fun NoteSequence createDrum() {
    return NoteSequence.of(ModulatedOsc.create())
    .withOutGate(
        UGenChain.create()
            .withUGen(new JCRev))
    .withEnvelope(
        createAdsr(5::ms, 5::ms, 0.0125, 500::ms));
}

fun NoteSequence createSnare() {
    return NoteSequence.of(Osc.create())
    .withOutGate(
        UGenChain.create()
            .withUGen(new JCRev))
    .withEnvelope(
        createAdsr(5::ms, 5::ms, 0.005, 10::ms));
}

fun ChordSequence createChordSequence() {
    return ChordSequence.of([
        new Osc $ UGenPreparation, 
        new Osc $ UGenPreparation, 
        new Osc $ UGenPreparation])
    .withOutGates([
        UGenChain.create().withUGen(new Chorus),
        UGenChain.create().withUGen(new Chorus),
        UGenChain.create().withUGen(new Chorus)])
    .withEnvelopes([
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope,
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope,
        createAdsr(10::ms, 8::ms, .5, 500::ms) $ Envelope]);
}

fun ADSR createAdsr(dur a, dur d, float s, dur r) {
    ADSR e;
    e.set(a, d, s, r);
    return e;
}
