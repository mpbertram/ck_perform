public class FadeFunctionAbsolute extends FadeFunctionMode {
    fun void exec(float f, NoteSequence n, ChordSequence c) {
        if (n != null) {
            n.withGain(f);
        }

        if (c != null) {
            c.withGain(f);
        }
    }
}
