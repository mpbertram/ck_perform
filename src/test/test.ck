class WaitHalfBeat extends WaitFunction {
    ck_timesig__MeasureListener m;
    
    fun void wait() {
        m.waitHalfBeat();
    }
}

ck_timesig__TimeSignature ts;
[5] @=> ts.beatsPerMeasure;
8 => ts.beatNoteValue;
65 => ts.bpm;
ts.init(5);

ck_timesig__Measure m;
ts @=> m.ts;

WaitHalfBeat whb;
createArpeggio() @=> Arpeggio a;
a @=> whb.m;

m.register(a);

for (0 => int k; k < 40; ++k) {
    for (0 => int i; i < 4; ++i) {
        a.clearNotes();
        
        a.addNoteDuration(Std.mtof(60), whb, whb);
        a.addNoteDuration(Std.mtof(67), whb, whb);
        a.addNoteDuration(Std.mtof(74), whb, whb);
        a.addNoteDuration(Std.mtof(79), whb, whb);
        a.addNoteDuration(Std.mtof(81), whb, whb);

        m.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        a.clearNotes();
        
        a.addNoteDuration(Std.mtof(57), whb, whb);
        a.addNoteDuration(Std.mtof(69), whb, whb);
        a.addNoteDuration(Std.mtof(74), whb, whb);
        a.addNoteDuration(Std.mtof(79), whb, whb);
        a.addNoteDuration(Std.mtof(81), whb, whb);

        m.advanceTime();
    }

    for (0 => int i; i < 1; ++i) {
        a.clearNotes();
        
        a.addNoteDuration(Std.mtof(59), whb, whb);
        a.addNoteDuration(Std.mtof(67), whb, whb);
        a.addNoteDuration(Std.mtof(74), whb, whb);
        a.addNoteDuration(Std.mtof(79), whb, whb);
        a.addNoteDuration(Std.mtof(81), whb, whb);

        m.advanceTime();
    }
}

fun Arpeggio createArpeggio() {
    ModulatedOscillator mo;
    JCRev r @=> mo.outGate;

    ADSR e;
    e.set( 10::ms, 8::ms, .5, 500::ms );

    Arpeggio a;
    mo @=> a.uGen;
    e @=> a.e;

    return a;
}
