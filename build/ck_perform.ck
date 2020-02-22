/* TimeEvent.ck */

class TimeEvent extends Event {
	float timeFraction;
}
/* TimeSignature.ck */

class Tree {
    TimeEvent item;
    
    /* Actually of type Tree (recursive data types not supported) */
    Object left;
    /* Actually of type Tree (recursive data types not supported) */
    Object right;

    fun int isLeaf() {
        return left == null && right == null;
    }
}

class TimeSignature {
    10 => int eventLimit;
    
    int beatsPerMeasure[];
    int beatNoteValue;
    int bpm;
    int levels;
    
    Tree tree;
    null => tree.left;
    null => tree.right;
    
    TimeEvent timeEvent[this.eventLimit];

    fun Tree insertTree(Tree node, TimeEvent te) {
        if (node == null) {
            Tree n;
            te @=> n.item;
            null => n.left;
            null => n.right;
            return n;
        }
        
        insertTree(node.left $ Tree, te) @=> node.left;
        insertTree(node.right $ Tree, te) @=> node.right;
        
        return node;
    }

    fun void init(int levels) {
        levels => this.levels;

        TimeEvent te;
        1.0 => te.timeFraction;
        
        <<< "Initializing " + te.timeFraction + ", " + te >>>;
        te @=> this.timeEvent[0];

        te @=> tree.item;

        for (1 => int i; i < levels; ++i) {
            TimeEvent te;
            this.timeEvent[i - 1].timeFraction / 2.0 => te.timeFraction;

            <<< "Initializing " + te.timeFraction + ", " + te >>>;
            te @=> this.timeEvent[i];

            insertTree(tree, te);
        }
    }
     
    fun void advanceTime() {
        240000 / bpm / beatNoteValue => float delayTimeMs;
        delayTimeMs * timeEvent[levels - 1].timeFraction => float step;
        
        for (0 => int i; i < this.beatsPerMeasure.cap(); ++i) {
            for (0 => int j; j < this.beatsPerMeasure[i]; ++j) {
                traverseTree(tree, step);
            }
        }
    }

    fun void traverseTree(Tree tree, float step) {
        if (tree != null) {
            traverseTree(tree.left $ Tree, step);
            traverseTree(tree.right $ Tree, step);
            
            if (tree.isLeaf()) {
                step::ms => now;
            }
            
            <<< "Emitting " + tree.item.timeFraction + ", " + tree.item >>>;
            tree.item.broadcast();
        }
    }
    
    fun TimeEvent getEvent(int level) {
        return this.timeEvent[level];
    }
}
/* MeasureListener.ck */

class MeasureListener {
    TimeSignature timeSignature;
    
    fun void onInit() {}
    fun void onDestroy() {}
    fun pure void perform();
    
    fun void assignTimeSignature(TimeSignature timeSignature) {
        timeSignature @=> this.timeSignature;
    }
    
    fun void wait(int level) {
        this.timeSignature.getEvent(level) => now;
    }
    
    fun void waitFullBeat() {
        wait(0);
    }
    
    fun void waitHalfBeat() {
        wait(1);
    }
    
    fun void waitQuarterBeat() {
        wait(2);
    }
    
    fun void waitEighthBeat() {
        wait(3);
    }
    
    fun void waitSixteenthBeat() {
        wait(4);
    }
    
    fun void waitThirtySecondBeat() {
        wait(5);
    }
    
    fun void waitSixtyFourthBeat() {
        wait(6);
    }
    
    fun void waitHundredTwentyEighthBeat() {
        wait(7);
    }
    
    fun void waitTwoHundredFiftySixthBeat() {
        wait(8);
    }
    
    fun void waitFiveHundredTwelfthBeat() {
        wait(9);
    }
}
/* Measure.ck */

class Measure {
    100 => int measureListenersLimit;
    0 => int registeredListenersCount;
    
    TimeSignature ts;
    MeasureListener measureListeners[this.measureListenersLimit];
        
    fun void register(MeasureListener measureListener) {
        if (this.registeredListenersCount >= this.measureListenersLimit) {
            <<< "Could not register listener " + measureListener + ": limit achieved" >>>;
            return;
        }
        
        <<< "Adding listener " + measureListener + " in position " + registeredListenersCount >>>;
        measureListener.assignTimeSignature(this.ts);
        measureListener @=> this.measureListeners[this.registeredListenersCount];
        ++registeredListenersCount;
    } 
    
    fun void advanceTime() {
        Shred shreds[this.registeredListenersCount];
        
        for (0 => int i; i < this.registeredListenersCount; ++i) {
            measureListeners[i].onInit();
            spork ~ measureListeners[i].perform() @=> shreds[i];
            <<< "Sporked shred " + shreds[i] >>>;
        }
        
        ts.advanceTime();
        
        for (0 => int i; i < this.registeredListenersCount; ++i) {
            <<< "Killing shred " + shreds[i] >>>;
            measureListeners[i].onDestroy();
            shreds[i].exit();
        }
    }
}
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
/* Note.ck */

class Note {
    float note;
}

class NoteDuration {
    fun static NoteDuration fromNote(Note n, WaitFunction duringNoteWait, 
            WaitFunction afterNoteWait) {
        
        NoteDuration nd;
        n @=> nd.n;
        duringNoteWait @=> nd.duringNoteWait;
        afterNoteWait @=> nd.afterNoteWait;
        
        return nd;
    }
    
    Note n;
    WaitFunction duringNoteWait;
    WaitFunction afterNoteWait;    
}

class Chord {
    Note notes[];
}

class ChordDuration {
    fun static ChordDuration fromChord(Chord c, WaitFunction duringChordWait, 
            WaitFunction afterChordWait) {
        
        ChordDuration cd;
        c @=> cd.c;
        duringChordWait @=> cd.duringChordWait;
        afterChordWait @=> cd.afterChordWait;
        
        return cd;
    }

    Chord c;
    WaitFunction duringChordWait;
    WaitFunction afterChordWait;
}
/* UGenPreparation.ck */

class UGenPreparation {
    fun pure UGen get();
    fun pure void prepare(Note n);
}
/* Arpeggio.ck */

class Arpeggio extends MeasureListener {
    UGenPreparation uGen;
    NoteDuration notes[];
    Envelope e;

    fun void onInit() {
        uGen.get() => e => dac;
    }

    fun void onDestroy() {
        uGen.get() =< e =< dac;
    }

    fun void perform() {
        for (0 => int i; i < notes.cap(); ++i) {
            notes[i] @=> NoteDuration nd;
            
            uGen.prepare(nd.n);
            
            e.keyOn();
            nd.duringNoteWait.wait();
            e.keyOff();
            nd.afterNoteWait.wait();
        }
    }
}
class ModulationFunction {
    fun pure float apply(Note n);
}

class HalfFreqModulationFunction extends ModulationFunction {
    fun float apply(Note n) {
        return n.note / 2;
    }
}

class ModulatedOscillator extends UGenPreparation {
    SinOsc v;
    SinOsc s;
    HalfFreqModulationFunction f @=> ModulationFunction mf;

    100 => float vGain;
    0.05 => float sGain;

    fun void reset() {
        v =< s;

        2 => s.sync;

        vGain => v.gain;
        sGain => s.gain;

        v => s;
    }

    fun void prepare(Note n) {
        reset();

        mf.apply(n) => v.freq;
        n.note => s.freq;
    }

    fun UGen get() {
        return s;
    }
}
/* Harmony.ck */

class Harmony extends MeasureListener {
    UGenPreparation uGen[0];
    ChordDuration cd;
    Envelope e[];

    fun void addUGen(UGenPreparation up) {
        uGen.cap() => int uGenCap;
        
        UGenPreparation t[uGenCap + 1];
        if (uGenCap > 0) {
            for (0 => int i; i < uGenCap; ++i) {
                uGen[i] @=> t[i];
            }
        }
        
        up @=> t[t.cap() - 1];
        
        t @=> uGen;
    }
    
    fun void onInit() {
        Envelope t[cd.c.notes.cap()] @=> e;
        
        for (0 => int i; i < uGen.cap(); ++i) {
            1.0 / uGen.cap() => uGen[i].get().gain;
            uGen[i].get() => e[i] => dac;
        }
    }

    fun void onDestroy() {
        for (0 => int i; i < uGen.cap(); ++i) {
            uGen[i].get() =< e[i] =< dac;
        }
    }

    fun void perform() {
        for (0 => int i; i < e.cap(); ++i) {
            e[i].keyOn();
        }

        for (0 => int i; i < cd.c.notes.cap(); ++i) {
            cd.c.notes[i] @=> Note n;
            uGen[i] @=> UGenPreparation u;
            
            u.prepare(n);
        }
        
        cd.duringChordWait.wait();

        for (0 => int i; i < e.cap(); ++i) {
            e[i].keyOff();
        }

        cd.afterChordWait.wait();
    }
}
