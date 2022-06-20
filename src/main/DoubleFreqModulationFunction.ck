public class DoubleFreqModulationFunction extends ModulationFunction {
    fun float apply(Note n) {
        return n.note * 2;
    }
}
