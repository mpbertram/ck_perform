/* WaitFunction.ck */

class WaitFunction {
    fun pure void wait();
}

class WaitFullBeat extends WaitFunction {
    MeasureListener m;
    
    fun void wait() {
        m.waitFullBeat();
    }
}

class WaitHalfBeat extends WaitFunction {
    MeasureListener m;
    
    fun void wait() {
        m.waitHalfBeat();
    }
}

class WaitQuarterBeat extends WaitFunction {
    MeasureListener m;
    
    fun void wait() {
        m.waitQuarterBeat();
    }
}

class WaitEighthBeat extends WaitFunction {
    MeasureListener m;
    
    fun void wait() {
        m.waitEighthBeat();
    }
}

class WaitSixteenthBeat extends WaitFunction {
    MeasureListener m;
    
    fun void wait() {
        m.waitSixteenthBeat();
    }
}

class WaitThirtySecondBeat extends WaitFunction {
    MeasureListener m;
    
    fun void wait() {
        m.waitThirtySecondBeat();
    }
}
