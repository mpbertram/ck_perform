public class SinOscPrep extends UGenPreparation {
    SinOsc s;
    
    fun static SinOscPrep create() {
        return new SinOscPrep;
    }
    
    fun void prepare(Note n) {
        n.note => s.freq;
    }

    fun UGen get() {
        return s;
    }
}
