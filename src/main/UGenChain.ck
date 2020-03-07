public class UGenChain {
    Gain g;
    [g $ UGen] @=> UGen uGens[];
    
    public void append(UGen uGen) {
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
    
    public UGen in() {
        return uGens[0];
    }
    
    public UGen out() {
        return uGens[uGens.cap() - 1];
    }
}
