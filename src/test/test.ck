class WaitHalfBeat extends WaitFunction {
    ck_timesig__MeasureListener m;
    
    fun void wait() {
        m.waitHalfBeat();
    }
}

class WaitFiveFullBeats extends WaitFunction {
    ck_timesig__MeasureListener m;
    
    fun void wait() {
        m.waitFullBeat();
        m.waitFullBeat();
        m.waitFullBeat();
        m.waitFullBeat();
        m.waitFullBeat();
    }
}

ck_timesig__TimeSignature ts;
[5] @=> ts.beatsPerMeasure;
8 => ts.beatNoteValue;
65 => ts.bpm;
ts.init(5);

ck_timesig__Measure m;
ts @=> m.ts;

ModulatedOscillator mo;

Arpeggio a;
mo @=> a.uGen;

WaitHalfBeat whb;
a @=> whb.m;

Note n1;
Std.mtof(67) => n1.note;

Note n2;
Std.mtof(69) => n2.note;

Note n3;
Std.mtof(74) => n3.note;

Note n4;
Std.mtof(78) => n4.note;

Note n5;
Std.mtof(86) => n5.note;

[
    NoteDuration.fromNote(n1, whb, whb), 
    NoteDuration.fromNote(n2, whb, whb), 
    NoteDuration.fromNote(n3, whb, whb), 
    NoteDuration.fromNote(n4, whb, whb), 
    NoteDuration.fromNote(n5, whb, whb)
] @=> a.notes;

Chord c;
[n1, n2, n3, n4, n5] @=> c.notes;

ModulatedOscillator mo1;
ModulatedOscillator mo2;
ModulatedOscillator mo3;
ModulatedOscillator mo4;
ModulatedOscillator mo5;

for (0 => int i; i < 40; ++i) {
    ck_timesig__Measure m;
    ts @=> m.ts;

    m.register(a);
    m.advanceTime();
}
