public class WaitFunctionCombination extends WaitFunction {
    WaitFunction @ functions[];
    
    fun static WaitFunctionCombination of(WaitFunction functions[]) {
        WaitFunctionCombination wfc;
        functions @=> wfc.functions;
        return wfc;
    }
    
    fun void wait() {
        for (0 => int i; i < functions.cap(); ++i) {
            ml @=> functions[i].ml;
            functions[i].wait();
        }
    }
    
    fun WaitFunction copy() {
        WaitFunction @ t[functions.cap()];
        for (0 => int i; i < functions.cap(); ++i) {
            functions[i].copy() @=> t[i];
        }
        
        return WaitFunctionCombination.of(t);
    }
}
