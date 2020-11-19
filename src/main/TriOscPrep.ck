public class TriOscPrep extends UGenPreparation {
    TriOsc s;
    
    fun static TriOscPrep create() {
        return new TriOscPrep;
    }
    
    fun void prepare(Note n) {
        n.note => s.freq;
    }

    fun UGen get() {
        return s;
    }
}
