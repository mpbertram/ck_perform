public class Noiser extends UGenPreparation {
    Noise n => Gain g;
    UGenChain outGate;

    fun static Noiser create() {
        return new Noiser;
    }
    
    fun void reset() {
        g =< outGate.in();
        g => outGate.in();
    }

    fun void prepare(Note n) {
        reset();
        
        if (n.note == 0.0) {
            0 => g.gain;
        } else {
            1 => g.gain;
        }
    }

    fun UGen get() {
        return outGate.out();
    }
}
