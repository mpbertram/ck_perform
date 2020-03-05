public class Harmony extends ck_timesig__MeasureListener {
    UGenPreparation up[0];
    ChordDuration cd;
    Envelope e[];

    0 => int on;
    0 => int chucked;

    fun void prepare() {
        if (chucked == 0) {
            Envelope t[cd.c.notes.cap()] @=> e;
            
            for (0 => int i; i < up.cap(); ++i) {
                1.0 / up.cap() => up[i].get().gain;
                up[i].get() => e[i] => dac;
            }
            
            1 => chucked;
        }
    }

    fun void tearDown() {
        if (on == 0) {
            for (0 => int i; i < up.cap(); ++i) {
                up[i].get() =< e[i] =< dac;
            }
            
            0 => chucked;
        }
    }

    fun void perform() {
        1 => on;
        
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
    
    fun void setChordDuration(Chord c, WaitFunction wb, WaitFunction wd) {
        wb.copy() @=> WaitFunction wbCopy;
        this @=> wbCopy.ml;
        
        wd.copy() @=> WaitFunction wdCopy;
        this @=> wdCopy.ml;
        
        ChordDuration.fromChord(c, wbCopy, wdCopy) @=> cd;
    }
    
    fun void setChordDuration(float f[], WaitFunction wb, WaitFunction wd) {
        Note notes[f.cap()];
        
        for (0 => int i; i < f.cap(); ++i) {
            f[i] => notes[i].note;
        }
        
        Chord c;
        notes @=> c.notes;
        
        setChordDuration(c, wb, wd);
    }
}
