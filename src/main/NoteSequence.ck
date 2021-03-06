public class NoteSequence extends ck_timesig__MeasureListener {
    UGenPreparation @ up;
    NoteDuration notes[0];
    UGenChain outGate;
    Envelope e;
    Gain g;
    1::second => dur tdt;

    0 => int on;
    0 => int chucked;

    fun static NoteSequence of(UGenPreparation uGen) {
        NoteSequence n;
        uGen @=> n.up;
        return n;
    }

    fun NoteSequence withUGenPrep(UGenPreparation uGen) {
        uGen @=> this.up;
        return this;
    }
    
    fun NoteSequence withNote(Note n, WaitFunction wb, WaitFunction wd) {
        addNoteDuration(n, wb, wd);
        return this;
    }
    
    fun NoteSequence withOutGate(UGenChain uGenChain) {
        uGenChain @=> this.outGate;
        return this;
    }
    
    fun NoteSequence addOutGate(UGen uGen) {
        outGate.append(uGen);
        return this;
    }
    
    fun NoteSequence withEnvelope(Envelope e) {
        e @=> this.e;
        return this;
    }
    
    fun NoteSequence withTearDownTolerance(dur tdt) {
        tdt => this.tdt;
        return this;
    }
    
    fun NoteSequence withGain(float gain) {
        gain => g.gain;
        return this;
    }

    fun dur tearDownTolerance() {
        return tdt;
    }

    fun void prepare() {
        if (chucked == 0) {
            up.get() => outGate.in();
            outGate.out() => g => e => dac;
            1 => chucked;
        }
    }

    fun void tearDown() {
        if (on == 0) {
            up.get() =< outGate.in();
            outGate.out() =< g =< e =< dac;
            0 => chucked;
        }
    }

    fun void perform() {
        1 => on;
        
        for (0 => int i; i < notes.cap(); ++i) {
            notes[i] @=> NoteDuration nd;
            
            if (nd.n == null) {
                nd.duringNoteWait.wait();
                nd.afterNoteWait.wait();
                continue;
            }
            
            up.prepare(nd.n);
            
            e.keyOn();
            nd.duringNoteWait.wait();
            e.keyOff();
            nd.afterNoteWait.wait();
        }
        
        0 => on;
    }
    
    fun void addNoteDuration(Note n, WaitFunction wb, WaitFunction wd) {
        notes.cap() => int notesCap;
        
        NoteDuration t[notesCap + 1];
        if (notesCap > 0) {
            for (0 => int i; i < notesCap; ++i) {
                notes[i] @=> t[i];
            }
        }
        
        wb.copy() @=> WaitFunction wbCopy;
        this @=> wbCopy.ml;
        
        wd.copy() @=> WaitFunction wdCopy;
        this @=> wdCopy.ml;
        
        NoteDuration.fromNote(n, wbCopy, wdCopy) @=> t[t.cap() - 1];
        
        t @=> notes;
    }
    
    fun void addNoteDuration(float f, WaitFunction wb, WaitFunction wd) {
        Note n;
        f => n.note;
        
        addNoteDuration(n, wb, wd);
    }
    
    fun void addSilence(WaitFunction w) {
        addNoteDuration(null $ Note, w, WaitFunctions.WAIT_NOTHING);
    }
}
