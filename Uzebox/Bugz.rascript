// Bugz
// #ID = 24724

DisplayScoreOnes = low4(0x48)
DisplayScoreTens = (low4(0x47) + 1) * 10
DisplayScoreHundreds = (low4(0x46) + 1) * 100

DisplayScore = DisplayScoreOnes + DisplayScoreTens + DisplayScoreHundreds
// $0F85: [16-bit] X-position; lower is left
// $0F87: [16-bit] Y-position; lower is higher
// $0F94: [8-bit] Player state
//        b0 - Flips to 0 when jumping; does not change from 1 when falling or dropping
//        b1 - Running
//        b3 - On Screen
//        b4 - Dead
//        b6 - Big Cookie collected
Dead = bit4(0xF94) > prev(bit4(0xF94))
BigCookie = bit6(0xF94) > prev(bit6(0xF94))
// $0F95: [8-bit] Controls Pt. 1
//        b0 - Run
//        b2 - Select
//        b3 - Start
//        b4 - Up
//        b5 - Down
//        b6 - Left
//        b7 - Right
Retry = bit3(0xF95) > prev(bit3(0xF95))
// $0F96: [8-bit] Controls Pt. 2
//        b0 - Jump
//        b2 - L
//        b3 - R
// $0FBA: [8-bit] Score (ones place)
// $0FBB: [8-bit] Score (tens place)
// $0FBC: [8-bit] Score (hundreds place)
// $0FBD: [8-bit] Score (thousands place)
// $0FBE: [8-bit] Score (ten thousands place)
ScoreOnes = byte(0xFBA)
ScoreTens = byte(0xFBB)
ScoreHundreds = byte(0xFBC)
ScoreThousands = byte(0xFBD)
ScoreTenThousands = byte(0xFBE)

Score = ScoreOnes + (ScoreTens * 10) + (ScoreHundreds * 100) + (ScoreThousands * 1000) + (ScoreTenThousands * 10000)

P2ScoreOnes = byte(0xFBF)
P2ScoreTens = byte(0xFC0)
P2ScoreHundreds = byte(0xFC1)
P2ScoreThousands = byte(0xFC2)
P2ScoreTenThousands = byte(0xFC3)

P2Score = P2ScoreOnes + (P2ScoreTens * 10) + (P2ScoreHundreds * 100) + (P2ScoreThousands * 1000) + (P2ScoreTenThousands * 10000)
// $0FC9: [8-bit] Total bonus points earned in the current run (ones place)
// $0FCA: [8-bit] Total bonus points earned in the current run (tens place)
// $0FCB: [8-bit] Total bonus points earned in the current run (hundreds place)
// $0FCC: [8-bit] Total bonus points earned in the current run (thousands place)
// $0FCD: [8-bit] Total bonus points earned in the current run (ten thousands place)
TotalBonusOnes = byte(0xFC9)
TotalBonusTens = byte(0xFCA)
TotalBonusHundreds = byte(0xFCB)
TotalBonusThousands = byte(0xFCC)
TotalBonusTenThousands = byte(0xFCD)

//This only applies when playing in 1P mode
TotalBonus = TotalBonusOnes + (TotalBonusTens *10) + (TotalBonusHundreds * 100) + (TotalBonusThousands * 1000) + (TotalBonusTenThousands * 10000)

// $0FD3: [8-bit] Bonus point timer (ones place); flips to 0 when big cookie collected, but before level transition
BonusOnes = byte(0xFD3)
BonusTens = byte(0xFD4)
BonusHundreds = byte(0xFD5)

CurrentBonus = BonusOnes + (BonusTens * 10) + (BonusHundreds * 100)
// $0FD4: [8-bit] Bonus point timer (tens place); flips to 0 when big cookie collected, but before level transition
// $0FD5: [8-bit] Bonus point timer (hundreds place); flips to 0 when big cookie collected, but before level transition
// $0FDA: [8-bit] Number of cookies remaining in the level
//        0x20 - Level 1 requirement; use this with 0 score for level select checks
CookiesLeft = byte(0xFDA)
// $0FEE: [8-bit] Current level
//        0x00 - Main Menu
//        0x01 - Stage 1
//        ~
//        0x15 - Stage 21
//        0x16 - Trophy screen; nothing to do here. start goes back to main menu
Level = byte(0xFEE)
// $0FF1: [8-bit] Game mode
//        b0 - 1 Player
//        b1 - 2 Player
//        b2 - 1P VS 2P
Mode = byte(0xFF1)
P1 = byte(0xFF1) == 1
ModeLookup = {
    1:"1P",
    2:"2P",
    4:"2P VS"
}

BonusTitle = {
    1:"Swift Beginnings",
    2:"Out on the Lawn",
    3:"Crowded Hallway",
    4:"Cookie Burglar",
    5:"Hop to It", 
    6:"Cave of Wonder",
    7:"Buzzing Bridge",
    8:"Superb Symmetry",
    9:"Give Me a Boost",
    10:"Watch Your Head",
    11:"Leaping Ladders",
    12:"Mind the Gap",
    13:"This Is Fine",
    14:"Cookie Cache",
    15:"Like Moths to the Flame",
    16:"Arachnid Acrobatics",
    17:"Digging Deep",
    18:"They Are Not Amused",
    19:"Ant Colony",
    20:"Sky Island Sanctuary",
    21:"In Case of Fire Use Stairs" //stop drop and roll out
}

BonusTarget = {
    1:110,
    2:100,
    3:55,
    4:90,
    5:150,
    6:130,
    7:140,
    8:165,
    9:165,
    10:40,
    11:165,
    12:50,
    13:170,
    14:160,
    15:225,
    16:175,
    17:195,
    18:140,
    19:145,
    20:245,
    21:145
}

function StageLeaderboard(level)
{
    leaderboard(
        title= "Level " + level,
        description= "Complete Level " + level + " with as many bonus points as possible.",
        start=Level == level && CookiesLeft == 0 && BigCookie && P1,
        cancel = always_false(),
        submit = always_true(),
        value = TotalBonus - prev(TotalBonus), //prev(CurrentBonus)
        format = "VALUE",
        lower_is_better = false
    )
}

//backup trigger = Level == level && trigger_when(CookiesLeft == 0) && trigger_when(BigCookie && P1) && TotalBonus - prev(TotalBonus) >= BonusTarget[level]
function LevelBonus(level)
{
    achievement(
        title = BonusTitle[level],
        description = "Quickly finish Level " + level + " with a bonus score of " + BonusTarget[level] + " or more.",
        points = 3,
        trigger = Level == level && trigger_when(CookiesLeft == 0) && trigger_when(BigCookie) && P1 && trigger_when(TotalBonus - prev(TotalBonus) >= BonusTarget[level]) &&
                prev(CurrentBonus) >= BonusTarget[level] //this line is for trigger icon display
    )
}

achievement(
    title = "Bugz Novice",
    description = "Complete levels 1-7. [No skipping with level select]",
    points = 5,
    trigger = once(Level == 1 && CookiesLeft == 0x20) && Level == 7 && BigCookie && never(!P1) && never(Level > 1 && Score == 0) && never(Level == 0)
)
achievement(
    title = "Untouchable",
    description = "Complete levels 1-7 without retrying. [No skipping with level select]",
    points = 10,
    trigger = once(Level == 1 && CookiesLeft == 0x20) && trigger_when(Level == 7 && BigCookie) && never(!P1) && never(Level > 1 && Score == 0) && 
            never(Level == 0) && never(Retry)
)
achievement(
    title = "Bugz Bouncer",
    description = "Complete levels 8-14. [No skipping with level select]",
    points = 5,
    trigger = once(Level == 8 && CookiesLeft == 0x34) && Level == 14 && BigCookie && never(!P1) && never(Level > 8 && Score == 0) && never(Level < 8 || Level > 14)
)
achievement(
    title = "You Deserve a Banana",
    description = "Complete levels 8-14 without retrying. [No skipping with level select]",
    points = 10,
    trigger = once(Level == 8 && CookiesLeft == 0x34) && trigger_when(Level == 14 && BigCookie) && never(!P1) && never(Level > 8 && Score == 0) && 
            never(Level < 8 || Level > 14) && never(Retry)
)
achievement(
    title = "Bugz Champion",
    description = "Complete levels 15-21. [No skipping with level select]",
    points = 5,
    trigger = once(Level == 15 && CookiesLeft == 0x1c) && Level == 21 && BigCookie && never(!P1) && never(Level > 15 && Score == 0) && never(Level < 15)
)
achievement(
    title = "Minion of Legend",
    description = "Complete levels 15-21 without retrying. [No skipping with level select]",
    points = 10,
    trigger = once(Level == 15 && CookiesLeft == 0x1c) && trigger_when(Level == 21 && BigCookie) && never(!P1) && never(Level > 15 && Score == 0) &&
            never(Level < 15) && never(Retry)
)

//Stage speedrun cheevos
for i in range(1,21)
LevelBonus(i)

leaderboard(
    title="Full Game - Speed",
    description = "Finish all 21 levels and reach the victory screen as fast as you can. [No level select]",
    start = Level == 1 && CookiesLeft == 0x20 && P1,
    cancel = __ornext(Level == 0 || !P1) || (Level > 1 && Score == 0),
    submit = prev(Level) == 21 && Level == 22,
    value = always_true(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title="Full Game - Score",
    description = "Reach the victory screen after Level 21 with as many points as you can.",
    start = once(prev(Level) == 21 && Level == 22) && never(Level != 22) && P1 && bit6(0xF94) == 0,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    title="Full Game - Bonus Points",
    description = "Reach the victory screen after Level 21 with as many bonus points as you can.",
    start = prev(Level) == 21 && Level == 22 && P1,
    cancel = always_false(),
    submit = always_true(),
    value = TotalBonus,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    title="Full Game - Retries",
    description = "Finish all 21 levels and reach the victory screen with as few retries as you can. [No level select]",
    start = Level == 1 && CookiesLeft == 0x20 && P1,
    cancel = __ornext(Level == 0 || !P1) || (Level > 1 && Score == 0),
    submit = prev(Level) == 21 && Level == 22,
    value = Retry,
    format = "VALUE",
    lower_is_better = true
)

//Level leaderboards
for i in range (1,21)
StageLeaderboard(i)

//RP
rich_presence_conditional_display(Mode == 1 && Level == 22, "[1P] Minion has beaten the game! | Score: {0} | Total Bonus Points: {1}",
        rich_presence_value("Digit", Score, format="VALUE"),
        rich_presence_value("Digit", TotalBonus, format="VALUE")
        
)
rich_presence_conditional_display(Mode == 1 && Level > 0, "[1P] Minion is collecting cookies on Level {0} | Score: {1} | Total Bonus Points: {2}",
        rich_presence_value("Digit", Level, format="VALUE"),
        rich_presence_value("Digit", Score, format="VALUE"),
        rich_presence_value("Digit", TotalBonus, format="VALUE")
)
rich_presence_conditional_display(Mode >= 2 && Level == 22, "[{2}] Minions have beaten the game! | 1P Score: {0} | 2P Score: {1}",
        rich_presence_value("Digit", Score, format="VALUE"),
        rich_presence_value("Digit", TotalBonus, format="VALUE"),
        rich_presence_lookup("Mode", Mode, ModeLookup)        
)
rich_presence_conditional_display(Mode >= 2 && Level > 0, "[{3}] Minions are collecting cookies on Level {0} | 1P Score: {1} | 2P Score: {2}",
        rich_presence_value("Digit", Level, format="VALUE"),
        rich_presence_value("Digit", Score, format="VALUE"),
        rich_presence_value("Digit", TotalBonus, format="VALUE"),
        rich_presence_lookup("Mode", Mode, ModeLookup)
)
rich_presence_display("Minion is on the Main Menu")
    