public class Modulation {
    SinOsc s;
    ModulationFunction mf;

    fun static Modulation create() {
        return new Modulation;
    }

    fun Modulation withOsc(SinOsc s) {
        s @=> this.s;
        return this;
    }

    fun Modulation withModulationFunction(ModulationFunction mf)  {
        mf @=> this.mf;
        return this;
    }

    fun Modulation withGain(float g) {
        g => s.gain;
        return this;
    }
}
