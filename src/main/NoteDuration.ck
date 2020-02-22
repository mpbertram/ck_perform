public class NoteDuration {
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
