public class MeasureFunctionDuration {
    fun static MeasureFunctionDuration fromFunction(
            MeasureFunction f, WaitFunction w) {
        
        MeasureFunctionDuration fd;
        
        f @=> fd.f;
        w @=> fd.w;
        
        return fd;
    }

    MeasureFunction f;
    WaitFunction w;
}
