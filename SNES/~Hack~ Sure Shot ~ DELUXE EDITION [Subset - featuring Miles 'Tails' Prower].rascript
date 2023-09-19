// ~Hack~ Sure Shot ~ DELUXE EDITION [Subset - featuring Miles "Tails" Prower]
// #ID = 8714
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

Moon = bit1(0x1ff2)

Exit = byte(0xdd5)
function NormalExit() => prev(Exit) == 0 && Exit == 1
function SpecialExit() => prev(Exit) == 0 && Exit == 2
Overworld = 0x80

//only Thrice Ghosted & Stop Running have multiple screens -- otherwise just use level ID
Screen = word(0x10b)
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

CThriceGhostedFinal = 0x222
CStopRunningFinal = 0x521

Character = byte(0xdb3)
Sonic = 0x00
Tails = 0x01

Retry = bit1(0x1b405)
Death = byte(0x1b424)


GameStatus = byte(0x100)
function Overworld() => GameStatus <= 0x0e
Start = 0x14

function Orb() => byte(0x1493) > 0
function Key() => byte(0x1434) > 0
function LevelStart(level) => once(GameStatus == Start && level == Level)
function LBStart(level,checkpoint) => GameStatus == Start && Level == level && Checkpoint == checkpoint
function LBExitKey(level) => Level == level && Key()
function LBExitOrb(level) => Level == level && Orb()

function Tails(level,checkpoint) => once(GameStatus == Start && Level == level && Checkpoint == checkpoint) && never(prev(Death) != Death) && Character == Tails && 
        Checkpoint == checkpoint && never(GameStatus == 0x0e)

achievement("I'd Rather a Wrench", "Complete Living on the Knife as Tails. (No Midways)", 25,
    trigger = Level == LivingKnife && SpecialExit() && Tails(LivingKnife, CLivingKnife)
)

achievement("One Shot", "Complete Sure Shot as Tails. (No Midways)", 25,
    trigger = Level == SureShot && NormalExit() && Tails(SureShot, CSureShot)
)


achievement("Please Call Me", "Complete Thrice Ghosted as Tails. (No Midways)", 50,
    trigger = Level == ThriceGhosted && SpecialExit() && Tails(ThriceGhosted, CThriceGhosted) && Screen == Ghost3
)


achievement("All Foxes Go to Heaven", "Complete The Big Midway in the Sky as Tails. (No Midways)", 10,
    trigger = Level == BigMidway && NormalExit() && Tails(BigMidway, CBigMidway)
)

achievement("He Never Listens", "Complete Saying Words as Tails. (No Midways)", 50,
    trigger = Level == SayingWords && NormalExit() && Tails(SayingWords, CSayingWords)
)

//achievement("atomic clock", "Complete Atomic Clock as Tails. (No Midways)", 3,
//    trigger = Level == AtomicClock && SpecialExit() && Tails(AtomicClock, CAtomicClock)
//)

achievement("If Only I Could Fly", "Complete Hanging by a Thread as Tails. (No Midways)", 50,
    trigger = Level == HangingThread && SpecialExit() && Tails(HangingThread, CHangingThread)
)

achievement("Running for Miles", "Complete Stop Running as Tails. (No Midways)", 100,
    trigger = Level == StopRunning && SpecialExit() && Tails(StopRunning, CStopRunning) && Screen == Running2
)

//achievement("anatomically clock", "Complete Anatomically Clocked as Tails. (No Midways)", 10, 
//    trigger = Level == AnatomicallyClocked && SpecialExit() && Tails(AnatomicallyClocked, CAnatomicallyClocked)
//)

achievement("Maybe the Hero One Day", "Complete Sure Not (Margot Edit) as Tails. (No Midways)", 50,
    trigger = Level == SureNot && NormalExit() && Tails(SureNot, CSureNot)
)

achievement("Transatlantic Flight", "Complete Trans Fights Are Human Fights as Tails. (No Midways)", 50,
    trigger = Level == TransFights && SpecialExit() && Tails(TransFights, CTransFights)
)