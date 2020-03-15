WaitFunctions.WAIT_NOTHING @=> WaitFunction @ wn;
WaitFunctions.WAIT_SIXTY_FOURTH_BEAT @=> WaitFunction wsfb;
WaitFunctions.WAIT_QUARTER_BEAT @=> WaitFunction wqb;
WaitFunctions.WAIT_HALF_BEAT @=> WaitFunction whb;
WaitFunctions.WAIT_FULL_BEAT @=> WaitFunction wfb;
WaitFunctionCombination.of([wqb, wqb, wqb]) @=> WaitFunction wtqb;
WaitFunctionCombination.of([wfb, wfb]) @=> WaitFunction w2fb;
WaitFunctionCombination.of([wfb, wfb, wfb]) @=> WaitFunction w3fb;
WaitFunctionCombination.of([wfb, wfb, wfb, wfb]) @=> WaitFunction w4fb;
WaitFunctionCombination.of([wfb, wfb, wfb, wfb, wfb]) @=> WaitFunction w5fb;

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

createNoteSequence() @=> NoteSequence b1;
b1.addNoteDuration(Std.mtof(48), w3fb, wfb);

createNoteSequence() @=> NoteSequence b2;
b2.addNoteDuration(Std.mtof(45), w3fb, w5fb);

createNoteSequence() @=> NoteSequence b3;
b3.addNoteDuration(Std.mtof(47), w3fb, w5fb);

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

for (0 => int k; k < 8; ++k) {
    m0.advanceTime();    
}

for (0 => int k; k < 4; ++k) {
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

for (0 => int k; k < 40; ++k) {
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
    ModulatedOsc mo;
    
    UGenChain uc;
    uc.append(JCRev r);
    uc @=> mo.outGate;

    ADSR e;
    e.set(10::ms, 8::ms, .5, 500::ms);

    NoteSequence a;
    mo @=> a.up;
    e @=> a.e;

    return a;
}

fun NoteSequence createDrum() {
    createNoteSequence() @=> NoteSequence @ d;

    ADSR e;
    e.set(5::ms, 5::ms, 0.025, 500::ms);
    e @=> d.e;

    return d;
}

fun NoteSequence createSnare() {
    ModulatedOsc mo;

    Gain g;
    10 => g.gain;

    UGenChain uc;
    uc.append(new JCRev);
    uc.append(g);
    uc @=> mo.outGate;

    ADSR e;
    e.set(5::ms, 5::ms, 0.005, 10::ms);

    NoteSequence s;
    mo @=> s.up;
    e @=> s.e;
    
    return s;
}

fun ChordSequence createChordSequence() {
    ModulatedOsc mo1;
    ModulatedOsc mo2;
    ModulatedOsc mo3;

    Gain g;
    1 => g.gain;

    UGenChain uc;
    uc.append(g);
    uc.append(Chorus c);
    
    uc @=> mo1.outGate;
    uc @=> mo2.outGate;
    uc @=> mo3.outGate;

    Envelope @ t[3];
    for (0 => int i; i < 3; ++i) {
        ADSR e;    
        e.set(10::ms, 8::ms, .5, 500::ms);
        e @=> t[i];
    }
    
    ChordSequence h;

    t @=> h.e;

    h.addUGen(mo1);
    h.addUGen(mo2);
    h.addUGen(mo3);

    return h;
}
