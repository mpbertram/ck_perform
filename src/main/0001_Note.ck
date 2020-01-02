/* Note.ck */

class Note {
    float note;
}

class NoteDuration {
    fun static NoteDuration fromNote(Note n, WaitFunction duringNoteWait, 
            WaitFunction afterNoteWait) {
        
        NoteDuration nd;
        n @=> nd.n;
        duringNoteWait @=> nd.duringNoteWait;
        afterNoteWait @=> nd.afterNoteWait;
        
        return nd;
    }
    
    Note n;
    WaitFunction duringNoteWait;
    WaitFunction afterNoteWait;    
}

class Chord {
    Note notes[];
}

class ChordDuration {
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
