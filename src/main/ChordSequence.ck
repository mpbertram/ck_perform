public class ChordSequence extends ck_timesig__MeasureListener {
    UGenPreparation up[0];
    ChordDuration chords[0];
    UGenChain outGates[];
    Envelope e[];
    Gain g;
    1::second => dur tdt;

    0 => int on;
    0 => int chucked;

    fun static ChordSequence of(UGenPreparation uGens[]) {
        ChordSequence c;
        uGens @=> c.up;
        
        for (0 => int i; i < c.up.cap(); ++i) {
            c.up[i].get().gain() / c.up.cap() => c.up[i].get().gain;
        }
        
        return c;
    }
    
    fun ChordSequence withChord(Chord c, WaitFunction wb, WaitFunction wd) {
        addChordDuration(c, wb, wd);
        return this;
    }
    
    fun ChordSequence withOutGates(UGenChain uGenChains[]) {
        uGenChains @=> this.outGates;
        return this;
    }
    
    fun ChordSequence withEnvelopes(Envelope e[]) {
        e @=> this.e;
        return this;
    }
    
    fun ChordSequence withGain(float gain) {
        gain => g.gain;
        return this;
    }
    
    fun ChordSequence withTearDownTolerance(dur tdt) {
        tdt => this.tdt;
        return this;
    }

    fun dur tearDownTolerance() {
        return tdt;
    }

    fun void prepare() {
        if (chucked == 0) {
            if (e == null) {
                Envelope t[up.cap()] @=> e;
            }
            
            for (0 => int i; i < up.cap(); ++i) {
                up[i].get() => outGates[i].in();
                outGates[i].out() => g => e[i] => dac;
            }
            
            1 => chucked;
        }
    }

    fun void tearDown() {
        if (on == 0) {
            for (0 => int i; i < up.cap(); ++i) {
                up[i].get() =< outGates[i].in();
                outGates[i].out() =< g =< e[i] =< dac;
            }
            
            0 => chucked;
        }
    }

    fun void perform() {
        1 => on;
        
        for (0 => int k; k < chords.cap(); ++k) {
            chords[k] @=> ChordDuration cd;
            
            if (cd.c == null) {
                cd.duringChordWait.wait();
                cd.afterChordWait.wait();
                continue;
            }
            
            for (0 => int i; i < e.cap(); ++i) {
                e[i].keyOn();
            }

            for (0 => int i; i < cd.c.notes.cap(); ++i) {
                cd.c.notes[i] @=> Note n;
                up[i] @=> UGenPreparation u;
                
                u.prepare(n);
            }
            
            cd.duringChordWait.wait();

            for (0 => int i; i < e.cap(); ++i) {
                e[i].keyOff();
            }

            cd.afterChordWait.wait();
        }
        
        0 => on;
    }
    
    fun void addUGen(UGenPreparation uGenPreparation) {
        up.cap() => int uGenCap;
        
        UGenPreparation t[uGenCap + 1];
        if (uGenCap > 0) {
            for (0 => int i; i < uGenCap; ++i) {
                up[i] @=> t[i];
            }
        }
        
        uGenPreparation @=> t[t.cap() - 1];
        
        t @=> up;
    }
    
    fun void addChordDuration(Chord c, WaitFunction wb, WaitFunction wd) {
        chords.cap() => int chordsCap;
        
        ChordDuration t[chordsCap + 1];
        if (chordsCap > 0) {
            for (0 => int i; i < chordsCap; ++i) {
                chords[i] @=> t[i];
            }
        }

        wb.copy() @=> WaitFunction wbCopy;
        this @=> wbCopy.ml;
        
        wd.copy() @=> WaitFunction wdCopy;
        this @=> wdCopy.ml;
        
        ChordDuration.fromChord(c, wbCopy, wdCopy) @=> t[t.cap() - 1];
        
        t @=> chords;
    }
    
    fun void addChordDuration(float f[], WaitFunction wb, WaitFunction wd) {
        Note notes[f.cap()];
        
        for (0 => int i; i < f.cap(); ++i) {
            f[i] => notes[i].note;
        }
        
        Chord c;
        notes @=> c.notes;
        
        addChordDuration(c, wb, wd);
    }
    
    fun void addSilence(WaitFunction w) {
        addChordDuration(null $ Chord, w, WaitFunctions.WAIT_NOTHING);
    }
}
