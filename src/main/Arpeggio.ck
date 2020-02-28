public class Arpeggio extends ck_timesig__MeasureListener {
    UGenPreparation uGen;
    NoteDuration notes[0];
    Envelope e;

    fun void onInit() {
        uGen.get() => e => dac;
    }

    fun void onDestroy() {
        uGen.get() =< e =< dac;
    }

    fun void perform() {
        for (0 => int i; i < notes.cap(); ++i) {
            notes[i] @=> NoteDuration nd;
            
            uGen.prepare(nd.n);
            
            e.keyOn();
            nd.duringNoteWait.wait();
            e.keyOff();
            nd.afterNoteWait.wait();
        }
    }
    
    fun void addNoteDuration(Note n, WaitFunction wb, WaitFunction wa) {
        notes.cap() => int notesCap;
        
        NoteDuration t[notesCap + 1];
        if (notesCap > 0) {
            for (0 => int i; i < notesCap; ++i) {
                notes[i] @=> t[i];
            }
        }
        
        NoteDuration.fromNote(n, wb, wa) @=> t[t.cap() - 1];
        
        t @=> notes;
    }
    
    fun void addNoteDuration(float f, WaitFunction wb, WaitFunction wa) {
        Note n;
        f => n.note;
        
        addNoteDuration(n, wb, wa);
    }
    
    fun void clearNotes() {
        NoteDuration nd[0] @=> notes;
    }
}
