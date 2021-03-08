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
b2.addNoteDuration(Std.mtof(45), w5fb, wn);

createNoteSequence() @=> NoteSequence b3;
b3.addNoteDuration(Std.mtof(35), w5fb, wn);

createChordSequence() @=> ChordSequence h;
h.addChordDuration([Std.mtof(74), Std.mtof(79), Std.mtof(81)], wfb, wn);
h.addChordDuration([Std.mtof(74), Std.mtof(79), Std.mtof(81)], w4fb, w4fb);

createDrum() @=> NoteSequence @ d;
d.addNoteDuration(45, wsfb, w4fb);
d.addNoteDuration(45, wsfb, wfb);

createSnare() @=> NoteSequence @ s;
s.addSilence(wfb);
s.addSilence(wfb);
s.addSilence(wfb);
s.addNoteDuration(Std.mtof(72), wsfb, wfb);
s.addSilence(wfb);

m0.register(h);
m0.register(d);

m1.register(a1);
m1.register(h);
m1.register(d);
m1.register(s);

m2.register(a2);
m2.register(h);
m2.register(d);
m2.register(s);

m3.register(a3);
m3.register(h);
m3.register(d);
m3.register(s);

m4.register(a1);
m4.register(a4);
m4.register(h);
m4.register(d);
m4.register(s);

m5.register(a2);
m5.register(a4);
m5.register(h);
m5.register(d);
m5.register(s);

m6.register(a3);
m6.register(a4);
m6.register(h);
m6.register(d);
m6.register(s);

m7.register(a1);
m7.register(a4);
m7.register(h);
m7.register(d);
m7.register(s);
m7.register(b1);

m8.register(a2);
m8.register(a4);
m8.register(h);
m8.register(d);
m8.register(s);
m8.register(b2);

m9.register(a3);
m9.register(a4);
m9.register(h);
m9.register(d);
m9.register(s);
m9.register(b3);

m10.register(a1);
m10.register(a4);
m10.register(h);
m10.register(d);
m10.register(s);
m10.register(b1);
m10.register(a5);

m11.register(a2);
m11.register(a4);
m11.register(h);
m11.register(d);
m11.register(s);
m11.register(b2);
m11.register(a5);

m12.register(a3);
m12.register(a4);
m12.register(h);
m12.register(d);
m12.register(s);
m12.register(b3);
m12.register(a5);

h.withGain(0.0025);
d.withGain(0.5);
for (0 => int k; k < 4; ++k) {
    m0.advanceTime();    
}

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
h.withGain(0.0025);
d.withGain(0.5);
s.withGain(0.2);
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

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
a4.withGain(0.1);
h.withGain(0.0025);
d.withGain(0.5);
s.withGain(0.2);
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

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
a4.withGain(0.15);
h.withGain(0.0025);
d.withGain(0.5);
s.withGain(0.2);
b1.withGain(0.2);
b2.withGain(0.1);
b3.withGain(0.2);
for (0 => int k; k < 4; ++k) {
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

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
a4.withGain(0.15);
h.withGain(0.0025);
d.withGain(0.5);
s.withGain(0.2);
b1.withGain(0.2);
b2.withGain(0.1);
b3.withGain(0.2);
a5.withGain(0.1);
for (0 => int k; k < 16; ++k) {
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

a1.withGain(0.1);
a2.withGain(0.1);
a3.withGain(0.1);
h.withGain(0.0025);
d.withGain(0.5);
s.withGain(0.2);
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

h.withGain(0.0025);
d.withGain(0.5);
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
    JCRev r;
    .15 => r.mix;
    
    return NoteSequence.of(SinOscPrep.create())
        .withOutGate(
            UGenChain.create()
                .withUGen(r))
        .withEnvelope(
            createAdsr(10::ms, 8::ms, .5, 500::ms));
}

fun NoteSequence createLongLastingNoteSequence() {
    return createNoteSequence()
        .withTearDownTolerance(1::week);
}

fun NoteSequence createDrum() {
   return NoteSequence.of(SinOscPrep.create())
        .withEnvelope(
            createAdsr(5::ms, 5::ms, 0.025, 125::ms));
}

fun NoteSequence createSnare() {
    return NoteSequence.of(SinOscPrep.create())
        .withEnvelope(
            createAdsr(5::ms, 5::ms, 0.005, 25::ms));
}

fun ChordSequence createChordSequence() {
    return ChordSequence.of([
        new SinOscPrep $ UGenPreparation, 
        new SinOscPrep $ UGenPreparation, 
        new SinOscPrep $ UGenPreparation])
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
