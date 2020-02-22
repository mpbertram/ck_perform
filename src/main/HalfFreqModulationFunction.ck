public class HalfFreqModulationFunction extends ModulationFunction {
    fun float apply(Note n) {
        return n.note / 2;
    }
}
