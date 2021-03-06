public class FadeFunction extends MeasureFunction {
    float gain;
    NoteSequence n;
    ChordSequence c;
    new FadeFunctionMultiplying @=> FadeFunctionMode mode;

    fun static FadeFunction ofNoteSequence(float gain, NoteSequence n) {
        FadeFunction f;

        gain => f.gain;
        n @=> f.n;

        return f;
    }

    fun static FadeFunction ofChordSequence(float gain, ChordSequence c) {
        FadeFunction f;

        gain => f.gain;
        c @=> f.c;

        return f;
    }

    fun void exec() {
        mode.exec(gain, n, c);
    }
}
