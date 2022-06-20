public class SawOscPrep extends UGenPreparation {
    SawOsc s;
    
    fun static SawOscPrep create() {
        return new SawOscPrep;
    }
    
    fun void prepare(Note n) {
        n.note => s.freq;
    }

    fun UGen get() {
        return s;
    }
}
