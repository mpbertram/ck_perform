public class ChordDuration {
    fun static ChordDuration fromChord(Chord c, WaitFunction duringChordWait, 
            WaitFunction afterChordWait) {
        
        ChordDuration cd;
        c @=> cd.c;
        duringChordWait @=> cd.duringChordWait;
        afterChordWait @=> cd.afterChordWait;
        
        return cd;
    }

    Chord c;
    WaitFunction duringChordWait;
    WaitFunction afterChordWait;
}
