public class MeasureFunctionSequence extends ck_timesig__MeasureListener {
    MeasureFunctionDuration measureFunctions[0];

    fun static MeasureFunctionSequence create() {
        return new MeasureFunctionSequence;
    }

    fun void addMeasureFunctionDuration(MeasureFunction f, WaitFunction w) {
        measureFunctions.cap() => int measureFunctionCap;
        
        MeasureFunctionDuration t[measureFunctionCap + 1];
        if (measureFunctionCap > 0) {
            for (0 => int i; i < measureFunctionCap; ++i) {
                measureFunctions[i] @=> t[i];
            }
        }
        
        w.copy() @=> WaitFunction wCopy;
        this @=> wCopy.ml;
        
        MeasureFunctionDuration.fromFunction(f, wCopy) @=> t[t.cap() - 1];
        
        t @=> measureFunctions;
    }

    fun void addNoopDuration(WaitFunction w) {
        addMeasureFunctionDuration(null $ MeasureFunction, w);
    }

    fun void perform() {
        for (0 => int i; i < measureFunctions.cap(); ++i) {
            measureFunctions[i] @=> MeasureFunctionDuration mfd;
            
            if (mfd.f == null) {
                mfd.w.wait();
                continue;
            }
            
            mfd.f.exec();
            mfd.w.wait();
        }
    }
}
