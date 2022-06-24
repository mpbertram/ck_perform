public class TimeSignatureCreator {
    fun static ck_timesig__TimeSignature create(
            int beatsPerMeasure[],
            int beatNoteValue,
            int bpm,
            int levels) {
        ck_timesig__TimeSignature ts;
        beatsPerMeasure @=> ts.beatsPerMeasure;
        beatNoteValue => ts.beatNoteValue;
        bpm => ts.bpm;
        ts.init(levels);

        return ts;
    }
}
