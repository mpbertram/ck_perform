public class ModulatedOsc extends UGenPreparation {
    SinOsc v;
    SinOsc s;
    HalfFreqModulationFunction f @=> ModulationFunction mf;

    100 => float vGain;
    0.05 => float sGain;

    fun static ModulatedOsc create() {
        return new ModulatedOsc;
    }
    
    fun ModulatedOsc withModulationFunction(ModulationFunction mf) {
        mf @=> this.mf;
        return this;
    }
    
    fun ModulatedOsc withVibratoGain(float g) {
        g => vGain;
        return this;
    }
    
    fun ModulatedOsc withOscGain(float g) {
        g => sGain;
        return this;
    }

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
