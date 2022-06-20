public class QuarterFreqModulationFunction extends ModulationFunction {
    fun float apply(Note n) {
        return n.note / 4;
    }
}
