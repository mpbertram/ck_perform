public class FadeFunctionAdding extends FadeFunctionMode {
    fun void exec(float f, NoteSequence n, ChordSequence c) {
        if (n != null) {
            n.withGain(n.g.gain() + f);
        }

        if (c != null) {
            c.withGain(c.g.gain() + f);
        }
    }
}
