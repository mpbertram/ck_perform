public class Arpeggio extends ck_timesig__MeasureListener {
    UGenPreparation uGen;
    NoteDuration notes[];
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
}
