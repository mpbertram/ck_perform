public class NoteSequenceCreator {
    fun static create(UGenPreparation up, 
        UGenChain outGate,
        Envelope envelope) {
            return NoteSequence.of(
                up,
                outGate,
                envelope
            );
    }
}
