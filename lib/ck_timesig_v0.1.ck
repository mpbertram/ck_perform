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
