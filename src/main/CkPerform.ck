[
    me.sourceDir() + "../../lib/ck_timesig/CkTimesig.ck",
    me.sourceDir() + "/WaitFunction.ck",
    me.sourceDir() + "/Note.ck",
    me.sourceDir() + "/NoteDuration.ck",
    me.sourceDir() + "/Chord.ck",
    me.sourceDir() + "/ChordDuration.ck",
    me.sourceDir() + "/UGenPreparation.ck",
    me.sourceDir() + "/ModulationFunction.ck",
    me.sourceDir() + "/HalfFreqModulationFunction.ck",
    me.sourceDir() + "/ModulatedOscillator.ck",
    me.sourceDir() + "/Arpeggio.ck",
    me.sourceDir() + "/Harmony.ck"
] @=> string sources[];

for (0 => int i; i < sources.cap(); ++i) {
    sources[i] => string source;
    
    Machine.add(source) => int sId;
    Shred.fromId(sId) @=> Shred s;

    while(!s.done()) 100::ms => now;
}
