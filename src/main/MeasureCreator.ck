public class MeasureCreator {
    fun static ck_timesig__Measure[] create(ck_timesig__TimeSignature ts, int n) {
        ck_timesig__Measure measures[n];
        
        for (0 => int i; i < n; ++i) {
            ck_timesig__Measure m;
            ts @=> m.ts;
            m @=> measures[i];
        }
        
        return measures;
    }
}
