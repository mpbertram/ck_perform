public class ModulatedOsc extends UGenPreparation {
    [
        Modulation
            .create()
            .withOsc(new SinOsc)
            .withModulationFunction(new HalfFreqModulationFunction)
            .withGain(100.0)
    ] @=> Modulation modulations[];

    SinOsc carrier;
    0.75 => carrier.gain;

    fun static ModulatedOsc create() {
        return new ModulatedOsc;
    }
    
    fun ModulatedOsc withModulations(Modulation modulations[]) {
        modulations @=> this.modulations;
        return this;
    }

    fun ModulatedOsc withCarrierGain(float g) {
        g => carrier.gain;
        return this;
    }

    fun void reset() {
        for (0 => int i; i < modulations.cap() - 1; ++i) {
            modulations[i].s =< modulations[i + 1].s;
        }
        modulations[modulations.cap() - 1].s =< carrier;

        2 => carrier.sync;
        for (modulations.cap() - 1 => int i; i > 0; --i) {
            2 => modulations[i].s.sync;
        }

        for (0 => int i; i < modulations.cap() - 1; ++i) {
            modulations[i].s => modulations[i + 1].s;
        }
        modulations[modulations.cap() - 1].s => carrier;
    }

    fun void prepare(Note n) {
        reset();

        for (0 => int i; i < modulations.cap(); ++i) {
            modulations[i].mf.apply(n) => modulations[i].s.freq;
        }

        n.note => carrier.freq;
    }

    fun UGen get() {
        return carrier;
    }
}
