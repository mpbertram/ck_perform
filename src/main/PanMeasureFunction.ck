public class PanMeasureFunction extends MeasureFunction {
    Pan2 p;
    0.0 => float pos;

    fun static PanMeasureFunction createOf(float pos) {
        new PanMeasureFunction @=> PanMeasureFunction pmf;
        pos => pmf.pos;
        return pmf;
    }

    fun void exec() {
        pos => p.pan;
    }

    fun Pan2 get() {
        return p;
    }
}
