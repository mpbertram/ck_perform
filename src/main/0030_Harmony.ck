/* Harmony.ck */

class Harmony extends MeasureListener {
    UGenPreparation uGen[0];
    ChordDuration cd;
    Envelope e[];

    fun void addUGen(UGenPreparation up) {
        uGen.cap() => int uGenCap;
        
        UGenPreparation t[uGenCap + 1];
        if (uGenCap > 0) {
            for (0 => int i; i < uGenCap; ++i) {
                uGen[i] @=> t[i];
            }
        }
        
        up @=> t[t.cap() - 1];
        
        t @=> uGen;
    }
    
    fun void onInit() {
        Envelope t[cd.c.notes.cap()] @=> e;
        
        for (0 => int i; i < uGen.cap(); ++i) {
            1.0 / uGen.cap() => uGen[i].get().gain;
            uGen[i].get() => e[i] => dac;
        }
    }

    fun void onDestroy() {
        for (0 => int i; i < uGen.cap(); ++i) {
            uGen[i].get() =< e[i] =< dac;
        }
    }

    fun void perform() {
        for (0 => int i; i < e.cap(); ++i) {
            e[i].keyOn();
        }

        for (0 => int i; i < cd.c.notes.cap(); ++i) {
            cd.c.notes[i] @=> Note n;
            uGen[i] @=> UGenPreparation u;
            
            u.prepare(n);
        }
        
        cd.duringChordWait.wait();

        for (0 => int i; i < e.cap(); ++i) {
            e[i].keyOff();
        }

        cd.afterChordWait.wait();
    }
}
