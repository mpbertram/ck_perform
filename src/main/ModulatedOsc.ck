public class ModulatedOsc extends UGenPreparation {
    SinOsc v;
    SinOsc s;
    UGenChain outGate;
    HalfFreqModulationFunction f @=> ModulationFunction mf;

    100 => float vGain;
    0.05 => float sGain;

    fun void reset() {
        v =< s;
        s =< outGate.in();

        2 => s.sync;

        vGain => v.gain;
        sGain => s.gain;

        v => s;
        s => outGate.in();
    }

    fun void prepare(Note n) {
        reset();

        mf.apply(n) => v.freq;
        n.note => s.freq;
    }

    fun UGen get() {
        return outGate.out();
    }
}
