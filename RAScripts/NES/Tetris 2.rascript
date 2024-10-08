// Tetris 2
// #ID = 2024

// $004C: [8-bit] Game screen
//        0x01 - Main menu
//        0x02 - Ranking
//        0x03 - Game setup (speed/round/music)
//        0x04 - Cutscene
//        0x07 - 1P mode
//        0x08 - VS mode
//        0x09 - CPU select
//        0x0a - Intro screen
Screen = byte(0x4C)
    MainMenu = 1
    Ranking = 2
    Setup = 3
    Cutscene = 4
    P1Mode = 7
    VSMode = 8
    CPUSelect = 9
    Intro = 0x0a
// $004D: [8-bit] Game state
//        0x00 - Booting
//        0x01 - Watching cutscene / menu / title / waiting to start round
//        0x02 - Main menu
//        0x03 - Various / round loading
//        0x04 - Playing a round
//        0x05 - Round complete
//        0x06 - Round failed
//        0x07 - Start transitioning to next round (1P) / Match won (VS)
//        0x08 - Transitioning to next round (1P) / All matches won (VS)
//        0x09 - Distributing bonus points
State = byte(0x4d)
    Playing = 4
    RoundComplete = 5
    RoundFailed = 6
    Bonus = 9
// $0340: [8-bit] Current round in 1P or VS; changes while selecting in menu
//        - Changes to the next round value immediately upon "ROUND CLEAR" appearing ($4d changing to 0x05) in 1P mode
//        ---
//        0x00 - Round 1
//        ~
//        0x09 - Round 10
//        0x0a - Round 11 / 1st cutscene
//        ~
//        0x13 - Round 20
//        0x14 - Round 21 / 2nd cutscene
//        ~
//        0x1d - Round 30
//        0x1e - Round 31 / 3rd cutscene
//        ~
//        0x27 - Round 40
//        0x28 - Round 41 / 4th cutscene (first 'loop')
//        ~
//        0x31 - Round 50
//        0x32 - Round 51 / 5th cutscene
//        ~
//        0x3b - Round 60
//        0x3c - Round 61 / 6th cutscene
//        ~
//        0x45 - Round 70
//        0x46 - Round 71 / 7th cutscene
//        ~
//        0x4f - Round 80
//        0x50 - Final cutscene (game ends)
Round = byte(0x340)+1
    Final = 0x50-1
// $0341: [8-bit] Number of wins 1P has in VS mode; 3 needed to win
P1Wins = byte(0x341)
// $0343: [8-bit] Game speed (1P)
//        0x00 - Low
//        0x01 - Med
//        0x02 - Hi
Speed = byte(0x343)
    Low = 0
    Med = 1
    High = 2
SpeedRP = {
    0:"Low",
    1:"Med",
    2:"High"
}
// $034D: [8-bit] Combo counter (1P)
Combo = byte(0x34D)
// $034E: [8-bit] Number of blocks (with dots) left to clear the round (1P side in VS)
BlocksRemaining = byte(0x34E)
RoundComplete = prev(BlocksRemaining) != 0 && BlocksRemaining == 0
// $0350: [8-bit] Number of blocks placed by player 1; this value also determines the amount of bonus points given in a level--each block placed lowers the potential bonus points by 1,000
BlocksPlaced = byte(0x350)
// $03C0: [8-bit] Round for CPU in VS
CPURound =byte(0x3C0)+1
// $03C1: [8-bit] Number retries in the current 1P session (resets to 0 when giving up) / Number of wins the opponent has in VS mode
// $03C3: Gamespeed PC
//        
//        00 = Low
//        01 = Med
//        02 = Hi
Retries = byte(0x3C1)
CPUWins = byte(0x3C1)
// $03CE: [8-bit] Number of blocks (with dots) left to clear the round for the 2P/CPU side in VS
// $03D0: [8-bit] Number of blocks placed by 2P/CPU in VS
// $0442: [8-bit] Pause status
//        Bit7 - Paused
Paused = bit7(0x442) == 1
// $046E: [24-bit] Current score
Score = tbyte(0x46E)
// $0471: [24-bit] High score
HighScore = tbyte(0x471)
// $0474: [16-bit] Bonus points given after a round clear; the size of this bonus is based on the round and how many blocks are used to clear
//        *Note: blocks used does not reset when retrying after losing until the player goes back to the menu or reaches the next stage
BonusPoints = word(0x474)
// $0480: [8-bit] Game mode
//        0x00 - 1 Player
//        0x01 - 1P VS 2P
//        0x02 - 1P VS COM
Mode = byte(0x480)
    P1 = 0
    VSP2 = 1
    VSCOM = 2
// $048B: [8-bit] Cursor position in try again menu
//        0x00 - No
//        0x01 - Yes
// $0491: Music Change
//        
//        00 = Off
//        01 = Musik A
//        02 = Musik B
//        03 = Musik C
// $04A4: [8-bit] In game check (pair with $4D)
//        0x00 - In game / on main menu
//        0x01 - On the other menus
// $04AF: [8-bit] CPU difficulty in VS
//        0x00 - Easy
//        0x01 - Normal
//        0x02 - Hard
CPUDifficulty = byte(0x4AF)
    Easy = 0
    Normal = 1
    Hard = 2
DifficultyRP = {
    0:"Easy",
    1:"Normal",
    2:"Hard"
}
// $6580: [8-bit] Demo mode
//        Bit0 - Active
Demo = bit0(0x6580) == 1

InGame1P = Screen == P1Mode && !Demo
InGameVS = Screen == VSMode && !Demo
InGame = !Demo && __ornext(Screen == P1Mode || Screen == VSMode)
//Table

Data1P = {
    10:{"clearT":"Brace for Impact","clearP":1,"anyT":"Easing into It","anyP":5,"highT":"Speeding into It","highP":5},
    20:{"clearT":"Mysterious Discovery","clearP":3,"anyT":"Growing Threat","anyP":5,"highT":"Quickly Growing Threat","highP":10},
    30:{"clearT":"Unidentified Flying Orb","clearP":5,"anyT":"Nerves of Iron","anyP":10,"highT":"Nerves of Steel","highP":25},
    40:{"clearT":"The Cycle Continues","clearP":10,"anyT":"Tetris 2 Master","anyP":25,"highT":"Tetris 2 Grand Master","highP":50},
    50:{"clearT":"Meteor Shower","clearP":25},
    60:{"clearT":"A Prehistoric Discovery","clearP":25},
    70:{"clearT":"Ascending to the Stars","clearP":25},
    80:{"clearT":"Final Frontier","clearP":50}
}

DataVS = {
    1:{"winT":"Baby Steps","winP":1,"hardT":"Don't Stop","hardP":3,"challengeT":"Lightning Fast","challengeP":5},
    5:{"winT":"Moving Up","winP":2,"hardT":"Title Match","hardP":3,"challengeT":"Fast Track","challengeP":5},
    10:{"winT":"Following Suit","winP":3,"hardT":"Aces High","hardP":4,"challengeT":"Straight Flush","challengeP":5},
    15:{"winT":"Final Challenger","winP":5,"hardT":"Top of the Mountain","hardP":5,"challengeT":"Master Stacker","challengeP":10}
}

//Achievements
function RoundClear(round) {
    achievement(
        title=Data1P[round]["clearT"], points=Data1P[round]["clearP"],type="Progression",
        description= "Clear Round " + round + " in 1P mode on any speed.",
        trigger= Mode == P1 && InGame1P && Round == round && RoundComplete
    )
}

for i in [10,20,30,40,50,60,70,80]
    RoundClear(i)
    
function AnyNoFail(round) {
    achievement(
        title=Data1P[round]["anyT"], points=Data1P[round]["anyP"],
        description="Complete rounds " + round-9 + "-" + round + " in 1P mode on any speed without failing or returning to the main menu.",
        trigger= once(InGame1P && Round == round-9 && State == Playing) && 
            Mode == P1 && trigger_when(Round == round && RoundComplete) &&
            never(State == RoundFailed || !InGame1P)
    )
}

for i in [10,20,30,40]
    AnyNoFail(i)
    
function HighNoFail(round) {
    achievement(
        title=Data1P[round]["highT"], points=Data1P[round]["highP"],
        description="Complete rounds " + round-9 + "-" + round + " in 1P mode on High speed without failing or returning to the main menu.",
        trigger= once(InGame1P && Round == round-9 && State == Playing) && 
            Mode == P1 && Speed == High && trigger_when(Round == round && RoundComplete) &&
            never(State == RoundFailed || !InGame1P)
    )
}

for i in [10,20,30,40]
    HighNoFail(i)
    
achievement(
    title="Score Enthusiast", points=10,
    description= "Score 100,000 points in 1P mode.",
    trigger= Mode == P1 && InGame1P && prev(Score) < 100000 && Score >= 100000
)
achievement(
    title="Bonus Fiend", points=25,
    description= "Score 250,000 points in 1P mode.",
    trigger= Mode == P1 && InGame1P && prev(Score) < 250000 && Score >= 250000
)

//code bonus score cheevos -- prev state = 5 && state == 9 && BonusPoints >= #

//achievement(
//    title="bonus 1", points=5,
//    description= "Earn a bonus score of 10,000 points or more on Round 10 or lower in 1P mode.",
//    trigger= Mode == P1 && InGame && prev(State) == 5 && State == 9 && Round <= 11 //the round changes immediately to the next upon clearing blocks
//            && BonusPoints >= 10000
//)

//achievement(
//    title="bonus 2", points=5,
//    description= "Earn a bonus score of 20,000 points or more on Round 20 or lower in 1P mode.",
//    trigger= Mode == P1 && InGame && prev(State) == 5 && State == 9 && Round <= 21 //the round changes immediately to the next upon clearing blocks
//            && BonusPoints >= 20000
//)

//achievement(
//    title="bonus 3", points=5,
//    description= "Earn a bonus score of 30,000 points or more on Round 30 or lower in 1P Mode.",
//    trigger= Mode == P1 && InGame && prev(State) == 5 && State == 9 && Round <= 31 //the round changes immediately to the next upon clearing blocks
//            && BonusPoints >= 30000
//)

//achievement(
//    title="bonus 4", points=5,
//    description= "Earn a bonus score of 40,000 points or more on any round in 1P mode.",
//    trigger= Mode == P1 && InGame && prev(State) == 5 && State == 9
//            && BonusPoints >= 40000
//)

achievement(
    title="Waste Not", points=5,
    description= "Earn a bonus score of 15,000 points or more on Round 20 or lower in 1P Mode.",
    trigger= Mode == P1 && InGame1P && prev(State) == 5 && State == 9 && Round <= 20 //the round changes immediately to the next upon clearing blocks
            && BonusPoints >= 15000
)
achievement(
    title="Precision Stacking", points=10,
    description= "Earn a bonus score of 30,000 points or more in 1P Mode.",
    trigger= Mode == P1 && InGame1P && prev(State) == 5 && State == 9 && BonusPoints >= 30000
)
//rework these, account for being able to get multiple chain at once
//achievement(
//    title="Chain1", points=3,
//    description= "Reach a 3x chain in any mode.",
//    trigger= InGame1P && State == Playing && prev(Combo) < 3 && Combo == 3
//)

achievement(
    title="Calculated Clearing", points=5,
    description= "Clear 6 lines of blocks with a single piece placement. (Split pieces count as a single placement)",
    trigger= InGame && State == Playing && prev(Combo) < 6 && Combo >= 6
)

function AnyCPU(round) {
    achievement(
        title=DataVS[round]["winT"], points=DataVS[round]["winP"],
        description= "Defeat the CPU on any difficulty on Round " + round + ".",
        trigger= Mode == VSCOM && InGameVS && Round == round && prev(P1Wins) == 2 && P1Wins == 3
    )
}

for i in [1,5,10,15]
    AnyCPU(i)
    
function HardCPU(round) {
    achievement(
        title=DataVS[round]["hardT"], points=DataVS[round]["hardP"],
        description= "Defeat the CPU on Hard difficulty on Round " + round + ".",
        trigger= Mode == VSCOM && InGameVS && Round == round && CPUDifficulty == Hard && prev(P1Wins) == 2 && P1Wins == 3
    )
}

for i in [1,5,10,15]
    HardCPU(i)
    
function ChallengeCPU(round) {
    achievement(
        title=DataVS[round]["challengeT"], points=DataVS[round]["challengeP"],
        description= "Defeat the CPU on Hard difficulty on Round " + round + " at High speed without letting the opponent score.",
        trigger= Mode == VSCOM && InGameVS && Round == round && CPUDifficulty == Hard && State != 2 &&
            trigger_when(prev(P1Wins) == 2 && P1Wins == 3) &&
            CPUWins == 0
    )
}

for i in [1,5,10,15]
    ChallengeCPU(i)

achievement(
    title="Dueling Champion",points=10,
    description="Defeat the CPU on Hard difficulty on Round 15 while the CPU is set to Round 10 or lower. (Hold B while changing round to adjust CPU)",
    trigger= Mode == VSCOM && InGameVS && Round == 15 && CPURound <= 10 && CPUDifficulty == Hard && State != 2 && prev(P1Wins) == 2 && P1Wins == 3
)

//function for beat cpu any difficulty 1,5,10,15, beat hard cpu, beat hard cpu without failing on high
//write cheevos for chain, bonus

//Leaderboards
function HighScore(speed) { 
    leaderboard(
        title="Score Attack - " + SpeedRP[speed],
        description="Earn as many points as you can in 1P mode on " + SpeedRP[speed] + " speed.",
        start=!Demo && Mode == P1 && InGame1P && Speed == speed &&
                ((prev(State) != RoundFailed && State == RoundFailed) || (prev(Round) == 80 && Round == 81)),
        cancel=always_false(),
        submit=always_true(),
        value=Score,
        format="VALUE",
        lower_is_better=false
    )
}

for i in range(0,2)
    HighScore(i)  

function HighLevel(speed) { 
    leaderboard(
        title="Pushing Forward - " + SpeedRP[speed],
        description="Clear the highest round you can past 30 in 1P mode on " + SpeedRP[speed] + " speed.",
        start=!Demo && Mode == P1 && InGame1P && Speed == speed && Round > 31 &&
                ((prev(State) != RoundFailed && State == RoundFailed && once(Round > prev(Round) && never(prev(State) == RoundFailed)) ||
                (prev(Round) == 80 && Round == 81))),
        cancel=always_false(),
        submit=always_true(),
        value=Round-1,
        format="VALUE",
        lower_is_better=false
    )
}

for i in range(0,2)
    HighLevel(i)
    
function FewestRetries(speed) { 
    leaderboard(
        title="Careful Stacking - " + SpeedRP[speed],
        description="Reach and clear Round 80 in 1P mode with as few retries as you can on " + SpeedRP[speed] + " speed.",
        start=!Demo && Mode == P1 && InGame1P && Speed == speed && prev(Round) == 80 && Round == 81,
        cancel=always_false(),
        submit=always_true(),
        value=Retries,
        format="VALUE",
        lower_is_better=true
    )
}

for i in range(0,2)
    FewestRetries(i)

leaderboard(
    title="Dueling Champion",
    description="Defeat the CPU on Hard difficulty on Round 15 while the CPU is set as low as you can.",
    start= Mode == VSCOM && InGameVS && Round == 15 && CPUDifficulty == Hard && State != 2 && prev(P1Wins) == 2 && P1Wins == 3,
    cancel=always_false(),
    submit=always_true(),
    value=CPURound,
    format="VALUE",
    lower_is_better=true
)
//Rich Presence
rich_presence_conditional_display(Screen == Ranking, "GAME OVER • Score: {0} • High Score: {1}",
        rich_presence_value("Digit",prior(Score),"VALUE"),
        rich_presence_value("Digit",HighScore,"VALUE")
)
rich_presence_conditional_display(Demo, "Watching the demo")
rich_presence_conditional_display(InGame1P && Mode == P1, "Clearing blocks in 1P mode on Round {0} • Speed: {2} • Score: {1}",
        rich_presence_value("Digit",Round,"VALUE"),
        rich_presence_value("Digit",Score,"VALUE"),
        rich_presence_lookup("Speed",Speed,SpeedRP)
)
rich_presence_conditional_display(InGameVS && Mode == 1, "Facing off against 2P in VS mode on Round {0} • Speed: {3} • 1P {1}/3 • 2P {2}/3 ",
        rich_presence_value("Digit",Round,"VALUE"),
        rich_presence_value("Digit",P1Wins,"VALUE"),
        rich_presence_value("Digit",CPUWins,"VALUE"),
        rich_presence_lookup("Speed",Speed,SpeedRP)
)
rich_presence_conditional_display(InGameVS && Mode == 2, "Facing off against {3} COM in VS mode on Round {0} • Speed: {4} • 1P {1}/3 • COM {2}/3 ",
        rich_presence_value("Digit",Round,"VALUE"),
        rich_presence_value("Digit",P1Wins,"VALUE"),
        rich_presence_value("Digit",CPUWins,"VALUE"),
        rich_presence_lookup("Difficulty",CPUDifficulty,DifficultyRP),
        rich_presence_lookup("Speed",Speed,SpeedRP)
)
rich_presence_conditional_display(Screen == MainMenu, "Deciding which mode to play")
rich_presence_conditional_display(Screen == 0, "Loading")
rich_presence_display("On the menus")
