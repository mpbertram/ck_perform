class NoWait extends WaitFunction {
    fun void wait() {}
    
    fun WaitFunction copy() {
        return new NoWait;
    }
}

class WaitFullBeat extends WaitFunction {
    fun void wait() {
        ml.waitFullBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitFullBeat;
    }
}

class WaitFourFullBeats extends WaitFunction {
    fun void wait() {
        ml.waitFullBeat();
        ml.waitFullBeat();
        ml.waitFullBeat();
        ml.waitFullBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitFourFullBeats;
    }
}

class WaitHalfBeat extends WaitFunction {
    fun void wait() {
        ml.waitHalfBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitHalfBeat;
    }
}

class WaitQuarterBeat extends WaitFunction {
    fun void wait() {
        ml.waitQuarterBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitQuarterBeat;
    }
}

class WaitThreeQuarterBeat extends WaitFunction {
    fun void wait() {
        ml.waitQuarterBeat();
        ml.waitQuarterBeat();
        ml.waitQuarterBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitThreeQuarterBeat;
    }
}

NoWait nw;
WaitQuarterBeat wqb;
WaitHalfBeat whb;
WaitThreeQuarterBeat wtqb;
WaitFullBeat wfb;
WaitFourFullBeats wffb;

createTimeSignature() @=> ck_timesig__TimeSignature ts;

createMeasure(ts) @=> ck_timesig__Measure m1;
createMeasure(ts) @=> ck_timesig__Measure m2;
createMeasure(ts) @=> ck_timesig__Measure m3;

createMeasure(ts) @=> ck_timesig__Measure m4;
createMeasure(ts) @=> ck_timesig__Measure m5;
createMeasure(ts) @=> ck_timesig__Measure m6;

createArpeggio() @=> Arpeggio a1;
a1.addNoteDuration(Std.mtof(60), whb, whb);
a1.addNoteDuration(Std.mtof(67), whb, whb);
a1.addNoteDuration(Std.mtof(74), whb, whb);
a1.addNoteDuration(Std.mtof(79), whb, whb);
a1.addNoteDuration(Std.mtof(81), whb, whb);

createArpeggio() @=> Arpeggio a2;
a2.addNoteDuration(Std.mtof(57), whb, whb);
a2.addNoteDuration(Std.mtof(69), whb, whb);
a2.addNoteDuration(Std.mtof(74), whb, whb);
a2.addNoteDuration(Std.mtof(79), whb, whb);
a2.addNoteDuration(Std.mtof(81), whb, whb);

createArpeggio() @=> Arpeggio a3;
a3.addNoteDuration(Std.mtof(59), whb, whb);
a3.addNoteDuration(Std.mtof(67), whb, whb);
a3.addNoteDuration(Std.mtof(74), whb, whb);
a3.addNoteDuration(Std.mtof(79), whb, whb);
a3.addNoteDuration(Std.mtof(81), whb, whb);

createArpeggio() @=> Arpeggio a4;
a4.addNoteDuration(Std.mtof(81), whb, whb);
a4.addNoteDuration(Std.mtof(79), whb, whb);
a4.addNoteDuration(Std.mtof(86), wqb, wqb);
a4.addNoteDuration(Std.mtof(83), wtqb, wtqb);
a4.addNoteDuration(Std.mtof(81), wqb, wqb);

createHarmony() @=> Harmony h;
h.addChordDuration([Std.mtof(74), Std.mtof(79), Std.mtof(81)], wfb, nw);
h.addChordDuration([Std.mtof(74), Std.mtof(79), Std.mtof(81)], wffb, wffb);

m1.register(a1);
m1.register(h);

m2.register(a2);
m2.register(h);

m3.register(a3);
m3.register(h);

m4.register(a1);
m4.register(a4);
m4.register(h);

m5.register(a2);
m5.register(a4);
m5.register(h);

m6.register(a3);
m6.register(a4);
m6.register(h);

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

for (0 => int k; k < 40; ++k) {
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

fun ck_timesig__Measure createMeasure(ck_timesig__TimeSignature ts) {
    ck_timesig__Measure m;
    ts @=> m.ts;
    
    return m;
}

fun ck_timesig__TimeSignature createTimeSignature() {
    ck_timesig__TimeSignature ts;
    [5] @=> ts.beatsPerMeasure;
    8 => ts.beatNoteValue;
    65 => ts.bpm;
    ts.init(10);

    return ts;
}

fun Arpeggio createArpeggio() {
    ModulatedOscillator mo;
    
    UGenChain uc;
    uc.append(JCRev r);
    uc @=> mo.outGate;

    ADSR e;
    e.set( 10::ms, 8::ms, .5, 500::ms );

    Arpeggio a;
    mo @=> a.up;
    e @=> a.e;

    return a;
}

fun Harmony createHarmony() {
    ModulatedOscillator mo1;
    ModulatedOscillator mo2;
    ModulatedOscillator mo3;

    Gain g;
    0.25 => g.gain;

    UGenChain uc;
    uc.append(g);
    uc.append(Chorus c);
    
    uc @=> mo1.outGate;
    uc @=> mo2.outGate;
    uc @=> mo3.outGate;

    Envelope @ t[3];
    for (0 => int i; i < 3; ++i) {
        ADSR e;    
        e.set( 10::ms, 8::ms, .5, 500::ms );
        e @=> t[i];
    }
    
    Harmony h;

    t @=> h.e;

    h.addUGen(mo1);
    h.addUGen(mo2);
    h.addUGen(mo3);

    return h;
}
