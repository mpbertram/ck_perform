public class SqrOscPrep extends UGenPreparation {
    SqrOsc s;
    
    fun static SqrOscPrep create() {
        return new SqrOscPrep;
    }
    
    fun void prepare(Note n) {
        n.note => s.freq;
    }

    fun UGen get() {
        return s;
    }
}
