public class Arpeggio extends ck_timesig__MeasureListener {
    UGenPreparation up;
    NoteDuration notes[0];
    Envelope e;

    0 => int on;
    0 => int chucked;

    fun void prepare() {
        if (chucked == 0) {
            up.get() => e => dac;
            1 => chucked;
        }
    }

    fun void tearDown() {
        if (on == 0) {
            up.get() =< e =< dac;
            0 => chucked;
        }
    }

    fun void perform() {
        1 => on;
        
        for (0 => int i; i < notes.cap(); ++i) {
            notes[i] @=> NoteDuration nd;
            
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
    
    fun void clearNotes() {
        NoteDuration nd[0] @=> notes;
    }
}
