[
    me.sourceDir() + "../../lib/ck_timesig/CkTimesig.ck",
    me.sourceDir() + "/WaitFunction.ck",
    me.sourceDir() + "/WaitFunctions.ck",
    me.sourceDir() + "/WaitFunctionCombination.ck",
    me.sourceDir() + "/MeasureFunction.ck",
    me.sourceDir() + "/Note.ck",
    me.sourceDir() + "/NoteDuration.ck",
    me.sourceDir() + "/Chord.ck",
    me.sourceDir() + "/ChordDuration.ck",
    me.sourceDir() + "/MeasureFunctionDuration.ck",
    me.sourceDir() + "/UGenPreparation.ck",
    me.sourceDir() + "/UGenChain.ck",
    me.sourceDir() + "/ModulationFunction.ck",
    me.sourceDir() + "/Modulation.ck",
    me.sourceDir() + "/IdModulationFunction.ck",
    me.sourceDir() + "/HalfFreqModulationFunction.ck",
    me.sourceDir() + "/ThirdFreqModulationFunction.ck",
    me.sourceDir() + "/QuarterFreqModulationFunction.ck",
    me.sourceDir() + "/DoubleFreqModulationFunction.ck",
    me.sourceDir() + "/TripleFreqModulationFunction.ck",
    me.sourceDir() + "/SinOscPrep.ck",
    me.sourceDir() + "/SawOscPrep.ck",
    me.sourceDir() + "/SqrOscPrep.ck",
    me.sourceDir() + "/TriOscPrep.ck",
    me.sourceDir() + "/ModulatedOsc.ck",
    me.sourceDir() + "/Noiser.ck",
    me.sourceDir() + "/NoteSequence.ck",
    me.sourceDir() + "/ChordSequence.ck",
    me.sourceDir() + "/MeasureFunctionSequence.ck",
    me.sourceDir() + "/FadeFunctionMode.ck",
    me.sourceDir() + "/FadeFunctionAdding.ck",
    me.sourceDir() + "/FadeFunctionMultiplying.ck",
    me.sourceDir() + "/FadeFunctionAbsolute.ck",
    me.sourceDir() + "/FadeFunction.ck"
] @=> string sources[];

for (0 => int i; i < sources.cap(); ++i) {
    sources[i] => string source;
    
    Machine.add(source) => int sId;
    Shred.fromId(sId) @=> Shred s;

    while(!s.done()) 100::ms => now;
}
