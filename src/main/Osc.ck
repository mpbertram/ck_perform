public class Osc extends UGenPreparation {
    SinOsc s;
    
    fun static Osc create() {
        return new Osc;
    }
    
    fun void prepare(Note n) {
        n.note => s.freq;
    }

    fun UGen get() {
        return s;
    }
}
