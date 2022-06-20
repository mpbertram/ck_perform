public class ThirdFreqModulationFunction extends ModulationFunction {
    fun float apply(Note n) {
        return n.note / 3;
    }
}
