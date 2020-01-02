class ModulationFunction {
    fun pure float apply(Note n);
}

class HalfFreqModulationFunction extends ModulationFunction {
    fun float apply(Note n) {
        return n.note / 2;
    }
}

class ModulatedOscillator extends UGenPreparation {
    SinOsc v;
    SinOsc s;
    HalfFreqModulationFunction f @=> ModulationFunction mf;

    100 => float vGain;
    0.05 => float sGain;

    fun void reset() {
        v =< s;

        2 => s.sync;

        vGain => v.gain;
        sGain => s.gain;

        v => s;
    }

    fun void prepare(Note n) {
        reset();

        mf.apply(n) => v.freq;
        n.note => s.freq;
    }

    fun UGen get() {
        return s;
    }
}
