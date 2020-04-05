public class UGenChain {
    Gain g;
    [g $ UGen] @=> UGen uGens[];
    
    fun static UGenChain create() {
        return new UGenChain;
    }
    
    fun UGenChain withUGen(UGen uGen) {
        append(uGen);
        return this;
    }
    
    fun void append(UGen uGen) {
        uGens.cap() => int uGensCap;
        
        UGen t[uGensCap + 1];
        if (uGensCap > 0) {
            for (0 => int i; i < uGensCap; ++i) {
                uGens[i] @=> t[i];
            }
        }

        uGens[uGensCap - 1] => uGen;
        uGen @=> t[t.cap() - 1];
        
        t @=> uGens;
    }

    fun UGen in() {
        return uGens[0];
    }
    
    fun UGen out() {
        return uGens[uGens.cap() - 1];
    }
}
