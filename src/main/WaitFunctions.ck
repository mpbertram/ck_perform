class WaitNothing extends WaitFunction {
    fun void wait() {}
    
    fun WaitFunction copy() {
        return new WaitNothing;
    }
}

class WaitSixtyFourthBeat extends WaitFunction {
    fun void wait() {
        ml.waitSixtyFourthBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitSixtyFourthBeat;
    }
}

class WaitThirtySecondBeat extends WaitFunction {
    fun void wait() {
        ml.waitThirtySecondBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitThirtySecondBeat;
    }
}

class WaitSixteenthBeat extends WaitFunction {
    fun void wait() {
        ml.waitSixteenthBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitSixteenthBeat;
    }
}

class WaitEighthBeat extends WaitFunction {
    fun void wait() {
        ml.waitEighthBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitEighthBeat;
    }
}

class WaitQuarterBeat extends WaitFunction {
    fun void wait() {
        ml.waitQuarterBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitQuarterBeat;
    }
}

class WaitHalfBeat extends WaitFunction {
    fun void wait() {
        ml.waitHalfBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitHalfBeat;
    }
}

class WaitFullBeat extends WaitFunction {
    fun void wait() {
        ml.waitFullBeat();
    }
    
    fun WaitFunction copy() {
        return new WaitFullBeat;
    }
}


public class WaitFunctions {
    static WaitFunction @ WAIT_NOTHING;
    static WaitFunction @ WAIT_SIXTY_FOURTH_BEAT;
    static WaitFunction @ WAIT_THIRTY_SECOND_BEAT;
    static WaitFunction @ WAIT_SIXTEENTH_BEAT;
    static WaitFunction @ WAIT_EIGHTH_BEAT;
    static WaitFunction @ WAIT_QUARTER_BEAT;
    static WaitFunction @ WAIT_HALF_BEAT;
    static WaitFunction @ WAIT_FULL_BEAT;
}

new WaitNothing             @=> WaitFunctions.WAIT_NOTHING;
new WaitSixtyFourthBeat     @=> WaitFunctions.WAIT_SIXTY_FOURTH_BEAT;
new WaitThirtySecondBeat    @=> WaitFunctions.WAIT_THIRTY_SECOND_BEAT;
new WaitSixteenthBeat       @=> WaitFunctions.WAIT_SIXTEENTH_BEAT;
new WaitEighthBeat          @=> WaitFunctions.WAIT_EIGHTH_BEAT;
new WaitQuarterBeat         @=> WaitFunctions.WAIT_QUARTER_BEAT;
new WaitHalfBeat            @=> WaitFunctions.WAIT_HALF_BEAT;
new WaitFullBeat            @=> WaitFunctions.WAIT_FULL_BEAT;
