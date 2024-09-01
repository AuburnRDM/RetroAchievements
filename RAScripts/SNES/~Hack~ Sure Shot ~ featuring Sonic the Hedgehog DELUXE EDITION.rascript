// ~Hack~ Sure Shot ~ featuring Sonic the Hedgehog DELUXE EDITION
// #ID = 24709
Level = byte(0x13bf)
LivingKnife = 0x29
SureShot = 0x2a
ThriceGhosted = 0x2b
BigMidway = 0x30
SayingWords = 0x26
AtomicClock = 0x32
HangingThread = 0x34
StopRunning = 0x44
AnatomicallyClocked = 0x33
SureNot = 0x28
TransFights = 0x35

LevelLookup = {
    0:"Intro",
    0x29:"Living on the Knife",
    0x2a:"Sure Shot",
    0x2b:"Thrice Ghosted",
    0x30:"The Big Midway in the Sky",
    0x26:"Saying Words",
    0x32:"Atomic Clock",
    0x34:"Hanging by a Thread",
    0x44:"Stop Running",
    0x33:"Anatomically Clocked",
    0x28:"Sure Not (Margot Edit)",
    0x35:"Trans Fights Are Human Fights"
}

Moon = bit1(0x1ff2)

Exit = byte(0xdd5)
function NormalExit() => prev(Exit) == 0 && Exit == 1
function SpecialExit() => prev(Exit) == 0 && Exit == 2
Overworld = 0x80

//only Thrice Ghosted & Stop Running have multiple screens -- otherwise just use level ID
Screen = word(0x10b)
MainMenu = 0xc7
Intro = 0xc5
Ghost1 = 0x107
Ghost2 = 0x109
Ghost3 = 0x10b
Running1 = 0x120
Running2 = 0x121

Checkpoint = word(0x1b403)
CLivingKnife = 0x105
CSureShot = 0x106
CThriceGhosted = 0x107
CBigMidway = 0x10c
CSayingWords = 0x102
CAtomicClock = 0x10e
CHangingThread = 0x110
CStopRunning = 0x120
CAnatomicallyClocked = 0x10f
CSureNot = 0x104
CTransFights = 0x111

CRingStart = 0x208
CRingEnd = 0x209

CStopRunning1 = 0x270 // no slowdown
CStopRunning2 = 0x271
CStopRunning3 = 0x272
CStopRunning4 = 0x273
CStopRunning5 = 0x274
CStopRunning6 = 0x275
CStopRunning7 = 0x276
CStopRunning8 = 0x521

CTransFights1 = 0x27f
CTransFights2 = 0x281
CTransFights3 = 0x282
CTransFights4 = 0x283
CTransFights5 = 0x284
CTransFights6 = 0x285
CTransFights7 = 0x286

Music = byte(0x1dfb)

ClockSec = byte(0xf62)
ClockMSec = byte(0xf61)
ClockSwitch = bit0(0xf60)
ClockDisplay = bit0(0xf63)

function Clock(target) => ClockSec == target && ClockMSec == 0 && ClockSwitch == 1 && prev(ClockDisplay) == 0 && ClockDisplay == 1
function ClockEnd(target) => __ornext(ClockSec != target || ClockMSec != 0) && ClockSwitch == 1 && prev(ClockDisplay) == 0 && ClockDisplay == 1 || 
         (ClockDisplay == 1 && prev(ClockSwitch) == 0 && ClockSwitch == 1)

Character = byte(0xdb3)
Sonic = 0 
Tails = 1

CharacterLookup = {
    0:"Sonic",
    1:"Tails"
}

Save = byte(0x10a)

Retry = bit0(0x1b405)
Death = byte(0x1b424)
Rings = byte(0xdbf)

GameStatus = byte(0x100)
function Overworld() => __ornext(GameStatus <= 0x0e || (Character == Tails && Retry > prev(Retry)))
Start = 0x14
Exits = byte(0x1f2e)

Pause = bit0(0x13d4)
Slowdown = byte(0x140b) // anything other than 0 slows down the game

XPos = word(0x94)
YPos = word(0x96)

BridgeLeft = 0x1370
BridgeRight = 0x1600

MidwayPlatformLeft = 0xc5
MidwayPlatformRight = 0xda
MidwayPlatformY = 0xd0
MidwayWall = 0x102

PogCheepLeft = 0xf30
PogCheepRight = 0x1000
PogCheepDown = 0x16c
PogPlatformLeft = 0xf64
PogPlatformRight = 0xf7a
PogPlatformY = 0x130

KaizoLivingKnife1 = byte(0x1e94b)
KaizoLivingKnife2 = byte(0x1f3f0)
KaizoLivingKnife3 = byte(0x1f3f1)
KaizoThriceGhosted = byte(0x1e479)
MessageBox = byte(0x1426)

//level flags for any% leaderboard
Any1 = bit7(0x1ecb) Any2 = bit7(0x1ecc) Any3 = bit7(0x1ecd) Any4 = bit7(0x1ed2) Any5 = bit7(0x1ec8) Any6 = bit7(0x1ed4) Any7 = bit7(0x1ed6) Any8 = bit7(0x1ee6)

function Orb() => byte(0x1493) > 0
function Key() => byte(0x1434) > 0
function LevelStart(level) => once(GameStatus == Start && level == Level)
function LBStart(level,checkpoint) => GameStatus == Start && Level == level && Checkpoint == checkpoint
function LBExitKey(level) => Level == level && Key()
function LBExitOrb(level) => Level == level && Orb()
function SpeedKey(level,checkpoint,time) => Level == level && trigger_when(Key()) && once(GameStatus == Start && Checkpoint == checkpoint) &&
            unless(repeated(time, once(GameStatus == Start) && once(Checkpoint == checkpoint) && always_true())) && (always_false() || never(Overworld()))
function SpeedOrb(level,checkpoint,time) => Level == level && trigger_when(Orb()) && once(GameStatus == Start && Checkpoint == checkpoint) &&
            unless(repeated(time, once(GameStatus == Start) && once(Checkpoint == checkpoint) && always_true())) && (always_false() || never(Overworld()))
function SpeedMidway(time) => Level == BigMidway && trigger_when(prev(Music) == 0x3a && Music == 0x80) && once(GameStatus == Start && Checkpoint == CBigMidway) &&
            unless(repeated(time, once(GameStatus == Start) && once(Checkpoint == CBigMidway) && always_true())) && (always_false() || never(Overworld()))
function Any() => (Any1 + Any2 + Any3 + Any4 + Any5 + Any6 + Any7 + Any8)


achievement("Cutting the Tension", "Complete Living on the Knife.", 10,
    trigger = Level == LivingKnife && SpecialExit()
)

achievement("Don’t Be Greedy", "Pass the enemy bridge checkpoint in Living on the Knife without collecting more than 18 rings.", 5,
    trigger = Level == LivingKnife && GameStatus == 0x14 && prev(Checkpoint) == CRingStart && trigger_when(Checkpoint == CRingEnd) &&
            disable_when(repeated(19,XPos > BridgeLeft && XPos < BridgeRight && Rings > prev(Rings)), Retry > prev(Retry))
)

achievement("Blade Runner", "Rush through Living on the Knife and reach the exit within 4 minutes and 30 seconds.", 10, // maybe longer
    trigger = SpeedKey(LivingKnife,CLivingKnife,16201)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Living on the Knife",
    description = "Complete Living on the Knife as fast as you can.",
    start  = LBStart(LivingKnife, CLivingKnife),
    cancel = Overworld(),
    submit = LBExitKey(LivingKnife),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Living on the Knife - Deaths",
    description = "Complete Living on the Knife with as few deaths as you can.",
    start  = LBStart(LivingKnife, CLivingKnife),
    cancel = Overworld(),
    submit = LBExitKey(LivingKnife),
    value = measured(prev(Death) != Death),
    format = "VALUE"
)


achievement("Shell Shot", "Complete Sure Shot.", 10,
    trigger = Level == SureShot && NormalExit()
)

achievement("Key Jumps Optional", "Rush through Sure Shot and reach the exit within 3 minutes and 30 seconds.", 10, // maybe 3:45
    trigger = SpeedOrb(SureShot,CSureShot,12601)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Sure Shot",
    description = "Complete Sure Shot as fast as you can.",
    start  = LBStart(SureShot,CSureShot),
    cancel = Overworld(),
    submit = LBExitOrb(SureShot),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Sure Shot - Deaths",
    description = "Complete Sure Shot with as few deaths as you can.",
    start  = LBStart(SureShot,CSureShot),
    cancel = Overworld(),
    submit = LBExitOrb(SureShot),
    value = measured(prev(Death) != Death),
    format = "VALUE"
)

achievement("Ghost Me Once, Shame on You", "Complete Thrice Ghosted.", 10,
    trigger = Level == ThriceGhosted && SpecialExit()
)

achievement("It's Time to Move On", "Rush through Thrice Ghosted and reach the exit within 5 minutes.", 10, // maybe 4:30
    trigger = SpeedKey(ThriceGhosted,CThriceGhosted,18001) && trigger_when(Screen == Ghost3)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Thrice Ghosted",
    description = "Complete Thrice Ghosted as fast as you can.",
    start  = LBStart(ThriceGhosted, CThriceGhosted),
    cancel = Overworld(),
    submit = LBExitKey(ThriceGhosted) && Screen == Ghost3,
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Thrice Ghosted - Deaths",
    description = "Complete Thrice Ghosted with as few deaths as you can.",
    start  = LBStart(ThriceGhosted, CThriceGhosted),
    cancel = Overworld(),
    submit = LBExitKey(ThriceGhosted) && Screen == Ghost3,
    value = measured(prev(Death) != Death),
    format = "VALUE"
)

achievement("All Hedgehogs Go to Heaven", "Complete The Big Midway in the Sky.", 10,
    trigger = Level == BigMidway && NormalExit()
)

achievement("Speedrunning Life", "Rush through The Big Midway in the Sky and reach the exit within 2 minutes and 30 seconds.", 10, // maybe 2:45
    trigger = SpeedMidway(9001)
)

leaderboard(
    id = 0, lower_is_better=true, title = "The Big Midway in the Sky",
    description = "Complete The Big Midway in the Sky as fast as you can.",
    start  = LBStart(BigMidway, CBigMidway),
    cancel = Overworld(),
    submit = Level == BigMidway && prev(Music) == 0x3a && Music == 0x80,
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "The Big Midway in the Sky - Deaths",
    description = "Complete The Big Midway in the Sky with as few deaths as you can.",
    start  = LBStart(BigMidway, CBigMidway),
    cancel = Overworld(),
    submit = Level == BigMidway && prev(Music) == 0x3a && Music == 0x80,
    value = measured(prev(Death) != Death),
    format = "VALUE"
)

achievement("Words of Affirmation", "Complete Saying Words.", 10,
    trigger = Level == SayingWords && NormalExit()
)

achievement("Receiving Gifts", "Collect the 3-up moon in Saying Words.", 5,
    trigger = Level == SayingWords && prev(Moon) == 0 && Moon == 1
)

achievement("Quality Time", "Rush through Saying Words and reach the exit within 3 minutes and 45 seconds.", 10, // maybe 4:00
    trigger = SpeedOrb(SayingWords,CSayingWords,13501)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Saying Words",
    description = "Complete Saying Words as fast as you can.",
    start  = LBStart(SayingWords, CSayingWords),
    cancel = Overworld(),
    submit = LBExitOrb(SayingWords),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Saying Words - Deaths",
    description = "Complete Saying Words with as few deaths as you can.",
    start  = LBStart(SayingWords, CSayingWords),
    cancel = Overworld(),
    submit = LBExitOrb(SayingWords),
    value = measured(prev(Death) != Death),
    format = "VALUE"
)

achievement("No Radio Necessary", "Complete Atomic Clock.", 5,
    trigger = Level == AtomicClock && SpecialExit() 
)

achievement("Human Stopwatch", "Hit the target time in Atomic Clock twice in a row without failing or quitting to the overworld.", 10,
    trigger = Level == AtomicClock && trigger_when(repeated(2, Clock(5))) && never(ClockEnd(5)) && never(ClockSec == 8 && ClockDisplay == 1 && Pause == 0) 
            && never(Exit == Overworld) && once(Clock(5))
)

leaderboard(
    id = 0, lower_is_better=false, title = "Atomic Clock - Highest Streak",
    description = "Hit the target time in Atomic Clock as many times as you can in a row without failing or quitting to the overworld.",
    start  = Clock(5) && Level == AtomicClock,
    cancel = Level != AtomicClock,
    submit = Exit == Overworld || ClockEnd(5) || (ClockSec == 8 && ClockDisplay == 1 && Pause == 0),
    value = measured(once(Clock(5))),
    format = "VALUE"
)

achievement("Literally Hanging", "Complete Hanging by a Thread.", 10,
    trigger = Level == HangingThread && SpecialExit()
)

achievement("Low Thread Count", "Rush through Hanging by a Thread and reach the exit within 3 minutes and 45 seconds.", 10, // maybe 4 or 3:45
    trigger = SpeedKey(HangingThread,CHangingThread,13501)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Hanging by a Thread",
    description = "Complete Hanging by a Thread as fast as you can.",
    start  = LBStart(HangingThread, CHangingThread),
    cancel = Overworld(),
    submit = LBExitKey(HangingThread),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Hanging by a Thread - Deaths",
    description = "Complete Hanging by a Thread with as few deaths as you can.",
    start  = LBStart(HangingThread, CHangingThread),
    cancel = Overworld(),
    submit = LBExitKey(HangingThread),
    value = measured(prev(Death) != Death),
    format = "VALUE"
)

achievement("Ain't Nothin' Gonna Break My Stride", "Complete Stop Running.", 25,
    trigger = Level == StopRunning && SpecialExit()
)

//achievement("Won't Stop", "From the start of Stop running, complete every checkpoint and finish the stage without letting time slow down. (Hold L or R)", 25,
//    trigger = Level == StopRunning && once(GameStatus == Start && Checkpoint == CStopRunning) && trigger_when(SpecialExit()) && trigger_when(Screen == Running2) &&
//            trigger_when(once(prev(Checkpoint)==CStopRunning2&&Checkpoint==CStopRunning3) && once(prev(Checkpoint)==CStopRunning3&&Checkpoint==CStopRunning4) &&
//            once(prev(Checkpoint)==CStopRunning4&&Checkpoint==CStopRunning5) && once(prev(Checkpoint)==CStopRunning5&&Checkpoint==CStopRunning6) &&
//            once(prev(Checkpoint)==CStopRunning6&&Checkpoint==CStopRunning7) && once(prev(Checkpoint)==CStopRunning7&&Checkpoint==CStopRunning8)) &&
//            disable_when(Slowdown != 0, Retry > prev(Retry)) && (always_false() || never(Overworld()))
//)

//achievement("Won't Stop", "From the start of Stop running, complete each checkpoint and reach the exit without letting time slow down. (Hold L or R)", 25,
//    trigger = Level == StopRunning && once(GameStatus == Start && Checkpoint == CStopRunning) && trigger_when(SpecialExit()) && trigger_when(Screen == Running2) &&
//            disable_when(Slowdown != 0, Retry > prev(Retry)) && unless(tally(1, once(once(GameStatus == Start && Checkpoint == CStopRunning) &&
//            Checkpoint == CStopRunning1), once(Checkpoint == CStopRunning2), once(Checkpoint == CStopRunning3), once(Checkpoint == CStopRunning4),
//            once(Checkpoint == CStopRunning5), once(Checkpoint == CStopRunning6), once(Checkpoint == CStopRunning7), once(Checkpoint == CStopRunning8),
//            deduct(Checkpoint > prev(Checkpoint)))) && (always_false() || never(Overworld()))
//) backup

//achievement("Nobody Gonna Slow Me Down", "From the start of Stop Running, complete each checkpoint and reach the exit without letting time slow down. (Hold L or R)", 25,
//    trigger = Level == StopRunning && once(GameStatus == Start && Checkpoint == CStopRunning) && trigger_when(Key()) && trigger_when(Screen == Running2) &&
//            disable_when(Slowdown != 0, Retry > prev(Retry)) && unless(tally(1, once(once(GameStatus == Start && Checkpoint == CStopRunning) &&
//            Checkpoint == CStopRunning1), 
//            once(Checkpoint == CStopRunning2), 
//            once(Checkpoint == CStopRunning3), 
//            once(Checkpoint == CStopRunning4),
//            once(Checkpoint == CStopRunning5), 
//            once(Checkpoint == CStopRunning6), 
//            once(Checkpoint == CStopRunning7), 
//            once(Checkpoint == CStopRunning8),
//            deduct(Checkpoint > prev(Checkpoint)))) && (always_false() || never(Overworld()))
//) i was proud of this, but it sucks

achievement("Nobody Gonna Slow Me Down", "From the start of Stop Running, complete each checkpoint and reach the exit without letting time slow down. (Hold L or R)", 25,
    trigger = Level == StopRunning && once(GameStatus == Start && Checkpoint == CStopRunning) && trigger_when(Key()) && trigger_when(Screen == Running2) &&
            disable_when(Slowdown != 0 && Checkpoint == CStopRunning, Retry > prev(Retry) && Checkpoint == CStopRunning) &&
            disable_when(Slowdown != 0 && Checkpoint == CStopRunning2, Retry > prev(Retry) && Checkpoint == CStopRunning2) &&
            disable_when(Slowdown != 0 && Checkpoint == CStopRunning3, Retry > prev(Retry) && Checkpoint == CStopRunning3) &&
            disable_when(Slowdown != 0 && Checkpoint == CStopRunning4, Retry > prev(Retry) && Checkpoint == CStopRunning4) &&
            disable_when(Slowdown != 0 && Checkpoint == CStopRunning5, Retry > prev(Retry) && Checkpoint == CStopRunning5) &&
            disable_when(Slowdown != 0 && Checkpoint == CStopRunning6, Retry > prev(Retry) && Checkpoint == CStopRunning6) &&
            disable_when(Slowdown != 0 && Checkpoint == CStopRunning7, Retry > prev(Retry) && Checkpoint == CStopRunning7) &&
            disable_when(Slowdown != 0 && Checkpoint == CStopRunning8, Retry > prev(Retry) && Checkpoint == CStopRunning8) &&
            (always_false() || never(Overworld()))
)
    
achievement("Oh No, I Got to Keep On Moving", "Rush through Stop Running and reach the exit within 6 minutes and 30 seconds.", 10,
    trigger = SpeedKey(StopRunning,CStopRunning,23401) && trigger_when(Screen == Running2)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Stop Running",
    description = "Complete Stop Running as fast as you can.",
    start  = LBStart(StopRunning, CStopRunning),
    cancel = Overworld(),
    submit = LBExitKey(StopRunning) && Screen == Running2,
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Stop Running - Deaths",
    description = "Complete Stop Running with as few deaths as you can.",
    start  = LBStart(StopRunning, CStopRunning),
    cancel = Overworld(),
    submit = LBExitKey(StopRunning) && Screen == Running2,
    value = measured(prev(Death) != Death),
    format = "VALUE"
)

achievement("Here We Go Again", "Complete Anatomically Clocked.", 10, 
    trigger = Level == AnatomicallyClocked && SpecialExit()
)

achievement("Time Lord", "Hit the target time in Anatomically Clocked twice in a row without failing or quitting to the overworld.", 25, 
    trigger = Level == AnatomicallyClocked && trigger_when(repeated(2, Clock(9))) && never(ClockEnd(9)) && never(ClockSec == 9 && ClockMSec == 0x3b && Pause == 0) 
            && never(Exit == Overworld) && once(Clock(9))
)


leaderboard(
    id = 0, lower_is_better=false, title = "Anatomically Clocked - Highest Streak",
    description = "Hit the target time in Anatomically Clocked as many times as you can in a row without failing or quitting to the overworld.",
    start  = Clock(9) && Level == AnatomicallyClocked,
    cancel = Level != AnatomicallyClocked,
    submit = Exit == Overworld || ClockEnd(9) || (ClockSec == 9 && ClockMSec == 0x3b && Pause == 0),
    value = measured(once(Clock(9))),
    format = "VALUE"
)

achievement("I Thought It Was a Sure Shot", "Complete Sure Not (Margot Edit).", 25,
    trigger = Level == SureNot && NormalExit()
)

achievement("Shell of a Time", "Rush through Sure Not (Margot Edit) and reach the exit within 4 minutes and 30 seconds.", 10,
    trigger = SpeedOrb(SureNot,CSureNot,16201)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Sure Not (Margot Edit)",
    description = "Complete Sure Not as fast as you can.",
    start  = LBStart(SureNot, CSureNot),
    cancel = Overworld(),
    submit = LBExitOrb(SureNot),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Sure Not (Margot Edit) - Deaths",
    description = "Complete Sure Not with as few deaths as you can.",
    start  = LBStart(SureNot, CSureNot),
    cancel = Overworld(),
    submit = LBExitOrb(SureNot),
    value = measured(prev(Death) != Death),
    format = "VALUE"
)

achievement("Fight for Your Rights", "Complete Trans Fights Are Human Fights.", 10,
    trigger = Level == TransFights && SpecialExit()
)

achievement("Welcome to the Discourse Zone", "Complete Trans Fights Are Human Fights without picking up more than 4 checkpoints.", 25,
    trigger = Level == TransFights && trigger_when(SpecialExit()) && once(GameStatus == Start && Level == TransFights && Checkpoint == CTransFights) &&
            never(tally(5, once(prev(Checkpoint) != CTransFights1 && Checkpoint == CTransFights1), once(prev(Checkpoint) != CTransFights2 && Checkpoint == CTransFights2),
            once(prev(Checkpoint) != CTransFights3 && Checkpoint == CTransFights3), once(prev(Checkpoint) != CTransFights4 && Checkpoint == CTransFights4),
            once(prev(Checkpoint) != CTransFights5 && Checkpoint == CTransFights5), once(prev(Checkpoint) != CTransFights6 && Checkpoint == CTransFights6),
            once(prev(Checkpoint) != CTransFights7 && Checkpoint == CTransFights7))) && never(GameStatus == 0x0e)
)

achievement("Agile Advocate", "Rush through Trans Fights Are Human Fights and reach the exit within 4 minutes and 30 seconds.", 10, // maybe change to 4 mins
    trigger = SpeedKey(TransFights,CTransFights,16201)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Trans Fights Are Human Fights",
    description = "Complete Trans Fights Are Human Fights as fast as you can.",
    start  = LBStart(TransFights, CTransFights),
    cancel = Overworld(),
    submit = LBExitKey(TransFights),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Trans Fights Are Human Fights - Deaths",
    description = "Complete Trans Fights Are Human Fights with as few deaths as you can.",
    start  = LBStart(TransFights, CTransFights),
    cancel = Overworld(),
    submit = LBExitKey(TransFights),
    value = measured(prev(Death) != Death),
    format = "VALUE"
)

achievement("She Warned You", "Fall victim to Toadette's mind games the first time you meet her in Living on the Knife.", 1,
    trigger = Level == LivingKnife && prev(KaizoLivingKnife1) == 0 && KaizoLivingKnife1 == 1 && GameStatus == Start
)
achievement("One Day You'll Learn", "Fall victim to Toadette's mind games the second time you meet her in Living on the Knife.", 1,
    trigger = Level == LivingKnife && GameStatus == Start && (prev(KaizoLivingKnife2) == 0 && KaizoLivingKnife2 == 1 ||
            prev(KaizoLivingKnife3) == 0 && KaizoLivingKnife3 == 1)
            
)
achievement("No Checkpoint for You", "Fall victim to Toadette's mind games in Thrice Ghosted.", 1,
    trigger = Level == ThriceGhosted && prev(KaizoThriceGhosted) == 0 && KaizoThriceGhosted == 1 && GameStatus == 0x14 && Screen == Ghost1
)
achievement("Just Go Around", "Fall victim to Toadette's mind games in The Big Midway in the Sky.", 1,
    trigger = Level == BigMidway && once(once(XPos >= MidwayPlatformLeft && XPos <= MidwayPlatformRight && YPos <= MidwayPlatformY) && XPos == MidwayWall) &&
            XPos > MidwayPlatformLeft && Death != prev(Death) && never(GameStatus <= 0x13)
)
achievement("Me Too, Bud", "Fall victim to Toadette's mind games in Hanging by a Thread.", 1,
    trigger = Level == HangingThread && prev(MessageBox) == 0 && MessageBox == 2 && GameStatus == Start
)
achievement("PogCheep", "Fall victim to Toadette's mind games in Trans Fights Are Human Fights.", 1,
    trigger = Level == TransFights && once(XPos >= PogPlatformLeft && XPos <= PogPlatformRight && YPos <= PogPlatformY) && XPos >= PogCheepLeft &&
            XPos <= PogCheepRight && YPos <= PogCheepDown && XPos > MidwayPlatformLeft && Death != prev(Death) && never(GameStatus <= 0x13)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Full Game - Any%",
    description = "[File B/C Only] From a new file, complete the first 8 stages as fast as you can.",
    start  = Exits == 0 && Screen == Intro && Save > 0,
    cancel = Screen == MainMenu,
    submit = prev(Any()) == 7 && Any() == 8,
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Full Game - 100%",
    description = "[File B/C Only] From a new file, complete the all 11 stages as fast as you can.",
    start  = Exits == 0 && Screen == Intro && Save > 0,
    cancel = Screen == MainMenu,
    submit = prev(Exits) == 10 && Exits == 11,
    value = measured(always_true()),
    format = "FRAMES"
)

rich_presence_conditional_display(once(Slowdown != 0 && Slowdown != 0x55 && Level != StopRunning), "{0} is selecting a track. 💿 • 🚩️[{1}/11]",
    rich_presence_lookup("Character", Character, CharacterLookup),
    rich_presence_value("Digit",Exits,format="VALUE")
)

rich_presence_conditional_display(GameStatus <= 9, "{0} is getting ready to load the LP 💿",
    rich_presence_lookup("Character", Character, CharacterLookup)
)

rich_presence_conditional_display(GameStatus > 9 && GameStatus < 15, "{0} is selecting a track 💿 • 🚩️[{1}/11]",
    rich_presence_lookup("Character", Character, CharacterLookup),
    rich_presence_value("Digit",Exits,format="VALUE")
)

rich_presence_display("{0} is listening to 🎵{1}🎵 • 🚩️[{2}/11]",
    rich_presence_lookup("Character", Character, CharacterLookup),
    rich_presence_lookup("Level", Level, LevelLookup),
    rich_presence_value("Digit",Exits,format="VALUE")
)



//cheat detection

leaderboard(
    id = 0, lower_is_better=true, title = "Living on the Knife - Score",
    description = "Complete Living on the Knife with as many points as you can.",
    start  = LBExitKey(LivingKnife) && __ornext(XPos < 0x1300 || YPos < 0x1b0),
    cancel = always_false(),
    submit = always_true(),
    value = measured(XPos),
    format = "VALUE"
)


leaderboard(
    id = 0, lower_is_better=true, title = "Sure Shot - Score",
    description = "Complete Sure Shot with as many points as you can.",
    start  = LBExitOrb(SureShot) && XPos < 0x1e00,
    cancel = always_false(),
    submit = always_true(),
    value = measured(XPos),
    format = "VALUE"
)


leaderboard(
    id = 0, lower_is_better=true, title = "Thrice Ghosted - Score",
    description = "Complete Thrice Ghosted with as many points as you can.",
    start  = LBExitKey(ThriceGhosted) && XPos < 0xe90,
    cancel = always_false(),
    submit = always_true(),
    value = measured(XPos),
    format = "VALUE"
)


leaderboard(
    id = 0, lower_is_better=true, title = "The Big Midway in the Sky - Score",
    description = "Complete The Big Midway in the Sky with as many points as you can.",
    start  = Level == BigMidway && prev(Music) == 0x3a && Music == 0x80 && YPos > 0x50,
    cancel = always_false(),
    submit = always_true(),
    value = measured(YPos),
    format = "VALUE"
)


leaderboard(
    id = 0, lower_is_better=true, title = "Saying Words - Score",
    description = "Complete Saying Words with as many points as you can.",
    start  = LBExitOrb(SayingWords) && __ornext(YPos > 0x2e0 || YPos < 0x250),
    cancel = always_false(),
    submit = always_true(),
    value = measured(YPos),
    format = "VALUE"
)


leaderboard(
    id = 0, lower_is_better=true, title = "Hanging by a Thread - Score",
    description = "Complete Hanging by a Thread with as many points as you can.",
    start  = LBExitKey(HangingThread) && XPos < 0x147a,
    cancel = always_false(),
    submit = always_true(),
    value = measured(XPos),
    format = "VALUE"
)


leaderboard(
    id = 0, lower_is_better=true, title = "Stop Running - Score",
    description = "Complete Stop Running with as many points as you can.",
    start  = LBExitKey(StopRunning) && XPos < 0xc00,
    cancel = always_false(),
    submit = always_true(),
    value = measured(XPos),
    format = "VALUE"
)


leaderboard(
    id = 0, lower_is_better=true, title = "Sure Not - Score",
    description = "Complete Sure Not with as many points as you can.",
    start  = LBExitOrb(SureNot) && XPos < 0x1e00,
    cancel = always_false(),
    submit = always_true(),
    value = measured(XPos),
    format = "VALUE"
)


leaderboard(
    id = 0, lower_is_better=true, title = "Trans Rights Are Human Rights - Score",
    description = "Complete Trans Rights Are Human Rights with as many points as you can.",
    start  = LBExitKey(TransFights) && XPos < 0x1f00,
    cancel = always_false(),
    submit = always_true(),
    value = measured(XPos),
    format = "VALUE"
)
