// Bomb Jack Twin
// #ID = 12001

// $1836: [8-bit] Lives 1P
Lives1P = byte(0x1836)
// $184C: [16-bit BCD] 1P Score - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x00184e
// $184E: [16-bit BCD] 1P Score - rightmost 4 digits - 0000xxxx; add to (0x00184c * 10,000)
Score1P = bcd(word(0x184C)) * 10000 + bcd(word(0x184E))
prevScore1P = high4(0x184c) * 100000 + low4(0x184c) * 10000 + high4(0x184D) * 10000000 + low4(0x184D) * 1000000 +
              high4(0x184e) * 10 + low4(0x184e) + high4(0x184F) * 1000 + low4(0x184F) * 100
// $186A: [8-bit] Number of bombs collected in current round by 1P; 0x18 total in each round
// $186C: [8-bit] Total number of Fire Bombs collected in the current Round by 1P (Max: 0x17)
// $186E: [DNP] [8-bit] Invincibility frames timer; goes to 0x07 at the end of the round
// $1936: [8-bit] Lives 2P
Lives2P = byte(0x1936)
LivesTotal = Lives1P + Lives2P
// $194C: [16-bit BCD] 2P Score - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x00194e
// $194E: [16-bit BCD] 2P Score - rightmost 4 digits - 0000xxxx; add to (0x00194c * 10,000)
Score2P = bcd(word(0x194C)) * 10000 + bcd(word(0x194E))
prevScore2P = high4(0x194c) * 100000 + low4(0x194c) * 10000 + high4(0x194D) * 10000000 + low4(0x194D) * 1000000 +
              high4(0x194e) * 10 + low4(0x194e) + high4(0x194F) * 1000 + low4(0x194F) * 100
// $196A: [8-bit] Number of bombs collected in current round by 2P; 0x18 total in each round
BombsCollected = byte(0x186A) + byte(0x196A)
// $196C: [8-bit] Total number of Fire Bombs collected in the current Round by 2P (Max: 0x17)
FireBombs = byte(0x186C) + byte(0x196C)
// $9801: [8-bit] Players status
//        Bit0 - 2P active
//        Bit1 - 1P active
//        Bit5 - Any player active in stage
//        Bit7 - Game started; this is 0 during demo and on main menu
P1Active = bit1(0x9801) == 1
P2Active = bit0(0x9801) == 1
OnePlayer = bit0(0x9801) + bit1(0x9801) == 1
TwoPlayer = bit0(0x9801) + bit1(0x9801) == 2
InStage = bit5(0x9801) == 1
InGame = bit7(0x9801) == 1

// $9802: [8-bit] Number of credits (max 0x09); still goes down in Free Play--loops back to 0x09 after losing a continue at 0x00
Credits = byte(0x9802)
// $9807: [bitflags] DIP Switches
//        Difficulty
//        Bit4 = 1 & Bit5 = 0 - Easy
//        Bit4 = 0 & Bit5 = 0 - Normal (default)
//        Bit4 = 0 & Bit5 = 1 - Hard
//        Bit4 = 1 & Bit5 = 1 - Hardest
//        ------
//        Lives
//        Bit6 = 1 & Bit7 = 1 - 1 life
//        Bit6 = 0 & Bit7 = 1 - 2 lives
//        Bit6 = 0 & Bit7 = 0 - 3 lives (default)
//        Bit6 = 1 & Bit7 = 0 - 4 lives
//        ------
HardestDifficulty = bit4(0x9807) == 1 && bit5(0x9807) == 1
NormalDifficulty = bit4(0x9807) == 0 && bit5(0x9807) == 0
DifficultyCheck = bit4(0x9807) * 10 + bit5(0x9807)
DifficultyCheckRP={
    0:"Normal",
    1:"Hard",
    10:"Easy",
    11:"Hardest"
    
}
NoMaxLives = bit6(0x9807) * 10 + bit7(0x9807) != 10
MaxLives = (bit6(0x9807) == 1 && bit7(0x9807) == 0)
//        Starting area (just cosmetic)
//        Bits 1,2,3
Freeplay = 1==1
// $9820: [8-bit] Number of levels cleared in current arcade run; - Changing this changes the next level
//        - Goes up to 0x45 and then rolls back to 0x00 and adds 0x01 to $9822 and 'loops' even though there are only 32 unique maps
Stage = byte(0x9820)
StageRP = {
    0x00:"1-1",0x01:"1-2",0x02:"1-3",0x03:"Bonus",
    0x04:"2-1",0x05:"2-2",0x06:"2-3",
    0x07:"3-1",0x08:"3-2",0x09:"3-3",0x0A:"Bonus",
    0x0B:"4-1",0x0C:"4-2",0x0D:"4-3",
    0x0E:"5-1",0x0F:"5-2",0x10:"5-3",0x11:"Bonus",
    0x12:"6-1",0x13:"6-2",0x14:"6-3",
    0x15:"7-1",0x16:"7-2",0x17:"7-3",0x18:"Bonus",
    0x19:"8-1",0x1A:"8-2",0x1B:"8-3",
    0x1C:"9-1",0x1D:"9-2",0x1E:"9-3",0x1F:"Bonus",
    0x20:"10-1",0x21:"10-2",0x22:"10-3",
    0x23:"11-1",0x24:"11-2",0x25:"11-3",0x26:"Bonus",
    0x27:"12-1",0x28:"12-2",0x29:"12-3",
    0x2A:"13-1",0x2B:"13-2",0x2C:"13-3",0x2D:"Bonus",
    0x2E:"14-1",0x2F:"14-2",0x30:"14-3",
    0x31:"15-1",0x32:"15-2",0x33:"15-3",0x34:"Bonus",
    0x35:"16-1",0x36:"16-2",0x37:"16-3",
    0x38:"17-1",0x39:"17-2",0x3A:"17-3",0x3B:"Bonus",
    0x3C:"18-1",0x3D:"18-2",0x3E:"18-3",
    0x3F:"19-1",0x40:"19-2",0x41:"19-3",0x42:"Bonus",
    0x43:"20-1",0x44:"20-2",0x45:"20-3",
}
// $9822: [8-bit] Current 'loop'; this starts at 0x00 and goes up by 0x01 every 20 rounds cleared
Loop = byte(0x9822) 
// $9844: [16-bit BCD] High Score - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x9846
// $9846: [16-bit BCD] High Score - rightmost 4 digits - 0000xxxx; add to (0x9844 * 10,000)
// $9848: [8-bit] Round that the last death was on; starts at 0x00 when starting a new game and will change to 0x01 if player dies in the first round, etc.
// $9850: [16-bit] Countdown for continue
// $9858: [8-bit] Current bomb map (final: 0x1f); starts from 0x00 and rolls back to 0x00 after final map
//        - One rotation is completed after finishing the bonus stage right after 9-3
//        - Continues to loop until 20-3 is completed and then resets to 0x00 to start a new game 'loop'
// $9870: [8-bit] Current multiplier
//        0x00 - x1
//        ~
//        0x04 - x5
Multiplier = byte(0x9870) + 1
// $9872: [8-bit] Progress towards "P" power-up spawn
//        - Normal bomb increments by 0x02
//        - Fire bomb increments by 0x03
//        - "P" power-up appears at 0x14; value resets to 0x00 after the power-up wears off or the level changes
// $9876: [8-bit] "P" color; higher the value, the more points it's worth
//        0x01 - Blue
//        0x02 - Red
//        0x03 - Purple
//        0x04 - Green
//        0x05 - Light blue
//        0x06 - Yellow
//        0x07 - Silver
// $9878: [8-bit] Progress towards extra life; goes up every time an enemy is killed and will spawn a life if the threshold is met and a bonus coin would otherwise spawn
//        - First extra life at 0x2f, next at 0x
//        - Resets with continue
EnemyKills = byte(0x9878)
// $9882: [8-bit] Game states
//        0x01 - Main menu/demo
//        0x02 ~ 0x04 - In a stage (changes in order)
//        0x06 - Stage complete
//        0x07 - Bonus tallying (fire bombs or bonus stage)
//        0x08 - Final game over
//        0x09 - Continue
//        0x0a - Push start/high score
// $988C: [8-bit] Enemy combo while under "P" power-up; resets to 0x00 when next "P" power-up is collected
//        0x07 - Max combo (2000 points)
EnemyCombo = byte(0x988C)
    MaxCombo = 0x07
// $9892: [16-bit BCD] Seconds left in bonus round (fixed 1decimal point)
BonusTime = bcd(word(0x9892))
// $9893: round; loops from 0x01 to 0x09 then 0x00. stays at 0x05 after round 20
// $9894: [8-bit] Current stage in Round; 0x90 when bonus
// $9895: [8-bit BCD] Current round in 'loop'; goes up to 20 and then rolls back to 0 and counts up again; - displays as 0x89 during bonus
// $9900: [16-bit BCD] High Score leaderboard #1 - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x9902
// $9902: [16-bit BCD] High Score leaderboard #1 - rightmost 4 digits - 0000xxxx; add to (0x9900 * 10,000)
// $9904: [8-bit BCD] High Score leaderboard #1 - Round reached

//Data
RoundData = {
    1:{"fTitle":"Fuedal Fuses","fPoints":5,"fBombs":23,"startLevel":0x0,"endLevel":0x2,"fDesc":""},
    2:{"fTitle":"German Engineering","fPoints":5,"fBombs":23,"startLevel":0x4,"endLevel":0x6,"fDesc":""},
    3:{"pTitle":"See the Sights","pPoints":2,"fTitle":"When in Rome","fPoints":5,"fBombs":22,"startLevel":0x7,"endLevel":0x9,"fDesc":"at least "},
    4:{"fTitle":"Bridge Baron","fPoints":5,"fBombs":22,"startLevel":0xb,"endLevel":0xd,"fDesc":"at least "},
    5:{"fTitle":"Taj Kaboom","fPoints":10,"fBombs":21,"startLevel":0xe,"endLevel":0x10,"fDesc":"at least "},
    6:{"pTitle":"Extended Getaway","pPoints":3,"fTitle":"Devil's Detonation","fPoints":10,"fBombs":21,"startLevel":0x12,"endLevel":0x14,"fDesc":"at least "},
    7:{"fTitle":"Great Wall of Explosives","fPoints":10,"fBombs":20,"startLevel":0x15,"endLevel":0x17,"fDesc":"at least "},
    8:{"fTitle":"Spicy Situation","fPoints":10,"fBombs":20,"startLevel":0x19,"endLevel":0x1b,"fDesc":"at least "},
    9:{"pTitle":"Close the Loop","pPoints":5,"fTitle":"City Hero","fPoints":25,"fBombs":20,"startLevel":0x1c,"endLevel":0x1e,"fDesc":"at least "}
}
//Functions
StageComplete = __ornext(prev(BombsCollected) == 22 || prev(BombsCollected) == 23) && BombsCollected == 24
CreditUsed = (Credits < prev(Credits)) || (prev(Credits) == 0 && Credits == 9)
CreditProtection = once(InGame && InStage && BombsCollected == 0)
function CreditProtectionRound(round) =>
    once(InGame && InStage && LivesTotal != 0 && Stage == RoundData[round]["startLevel"] && BombsCollected == 0)

function ProgressionAchievement(round){
    achievement(
        title=RoundData[round]["pTitle"],points=RoundData[round]["pPoints"],type="progression",
        description="Complete Round " + round + " with any settings.",
        trigger= InGame && Stage == RoundData[round]["endLevel"] && StageComplete
)}
function FireBombAchievement(round) {
    achievement(
        title=RoundData[round]["fTitle"],points=RoundData[round]["fPoints"],
        description="Collect " +RoundData[round]["fDesc"] + RoundData[round]["fBombs"] + " fire bombs on all 3 levels of Round " + round + " and complete them without using a credit after collecting the first bomb on " + round + "-1.",
        trigger=InGame && trigger_when(InStage) && CreditProtectionRound(round) && trigger_when(Stage == RoundData[round]["endLevel"]) && trigger_when(StageComplete) &&
                trigger_when(tally(3,
                    once(InGame && Stage == RoundData[round]["startLevel"]     && prev(FireBombs) == RoundData[round]["fBombs"] -1 && FireBombs == RoundData[round]["fBombs"]),
                    once(InGame && Stage == RoundData[round]["startLevel"] + 1 && prev(FireBombs) == RoundData[round]["fBombs"] -1 && FireBombs == RoundData[round]["fBombs"]),
                    once(InGame && Stage == RoundData[round]["startLevel"] + 2 && prev(FireBombs) == RoundData[round]["fBombs"] -1 && FireBombs == RoundData[round]["fBombs"]))) &&
                never(CreditUsed) && never(BombsCollected > (FireBombs + (23 - RoundData[round]["fBombs"]) + 1)) && never(LivesTotal == 0)
        )
}

//Achievements
for i in [3,6,9]
    ProgressionAchievement(i)

achievement(
    title="Around the World",points=5,type="win_condition",
    description="Complete Round 13 with any settings.",
    trigger= InGame && Stage == 0x2c && StageComplete
)
achievement(
    title="Strolling Through", points=10,
    description="Complete the first 9 rounds in 3 or fewer credits on any difficulty with a maximum of 3 starting lives. [1P only]",
    trigger=InGame && CreditProtectionRound(1) && trigger_when(Stage == 0x1e && StageComplete) && 
            never(tally(3,CreditUsed)) && never(TwoPlayer) && never(MaxLives) && never(tally(10,LivesTotal == 0 && !InStage)) && never(prev(!InGame))
)
achievement(
    title="Panic Bomber", points=25,
    description="Complete the first 9 rounds in a single credit on any difficulty with a maximum of 3 starting lives. [1P only]",
    trigger=InGame && CreditProtectionRound(1) && trigger_when(Stage == 0x1e && StageComplete) && 
            never(CreditUsed) && never(TwoPlayer) && never(MaxLives) && never(tally(10,LivesTotal == 0 && !InStage)) && never(!InGame)
)
achievement(
    title="A Taste of Madness", points=25,
    description="Complete the first 9 rounds in 3 or fewer credits on the hardest difficulty with a maximum of 3 starting lives. [1P only]",
    trigger=InGame && HardestDifficulty && CreditProtectionRound(1) && trigger_when(Stage == 0x1e && StageComplete) && 
            never(tally(3,CreditUsed)) && never(TwoPlayer) && never(MaxLives) && never(tally(10,LivesTotal == 0 && !InStage)) && never(prev(!InGame))
)
achievement(
    title="Thrill of the Rush", points=50,
    description="Complete the first 9 rounds in a single credit on the hardest difficulty with a maximum of 3 starting lives. [1P only]",
    trigger=InGame && HardestDifficulty && CreditProtectionRound(1) && trigger_when(Stage == 0x1e && StageComplete) && 
            never(CreditUsed) && never(TwoPlayer) && never(MaxLives) && never(tally(10,LivesTotal == 0 && !InStage)) && never(!InGame)
)
achievement(
    title="Procedural Removal",points=2,
    description="Collect 23 fire bombs on any standard level without using a credit.",
    trigger= InGame && CreditProtection && prev(FireBombs) == 22 && FireBombs == 23 && never(CreditUsed) &&
                Stage != 3 && Stage != 0x0a && Stage != 0x11 && Stage != 0x18 && Stage != 0x1f && 
                Stage != 0x26 && Stage != 0x2d && Stage != 0x34 && Stage != 0x3b && Stage != 0x42
)
achievement(
    title="Swift Defusal",points=3,
    description="Collect 23 fire bombs on any bonus stage.",
    trigger= InGame && prev(FireBombs) == 22 && FireBombs == 23 && 
                __ornext(Stage == 3 || Stage == 0x0a || Stage == 0x11 || Stage == 0x18 || Stage == 0x1f || 
                Stage == 0x26 || Stage == 0x2d || Stage == 0x34 || Stage == 0x3b || Stage == 0x42)
)
for i in range(1,9)
    FireBombAchievement(i)

achievement(
    title="Investment Scoring",points=5,
    description="Reach a x5 multiplier.",
    trigger=InGame && InStage && prev(Multiplier) == 4 && Multiplier == 5
)
achievement(
    title="Kilimanjaro",points=5,
    description="Earn 10,000 points from a single enemy.",
    trigger=InGame && InStage && Multiplier == 5 && EnemyCombo == 7 && prev(EnemyKills) != EnemyKills
)
achievement(
    title="Helping Hand",points=3,
    description="Collect an extra life.",
    trigger=InGame && InStage && ((prior(Lives1P) != 0 && Lives1P > prev(Lives1P)) || 
                (prior(Lives2P) != 0 && Lives2P > prev(Lives2P)))// had to remove enemy kills != 0
//1s on bonus stage
)
achievement(
    title="Down to the Wire",points=3,
    description="Finish a bonus stage with 1 second remaining on the timer for a special reward.",
    trigger= InGame && prev(BombsCollected) == 23 && BombsCollected == 24 && 
                __ornext(Stage == 3 || Stage == 0x0a || Stage == 0x11 || Stage == 0x18 || Stage == 0x1f || 
                Stage == 0x26 || Stage == 0x2d || Stage == 0x34 || Stage == 0x3b || Stage == 0x42) &&
                BonusTime >= 10 && BonusTime <=19
)
achievement(
    title="Saving Up",points=10,
    description="Achieve an individual score of 1,000,000 points or more with a maximum of 3 starting lives.",
    trigger=InGame && ((prev(prevScore1P) < 1000000 && Score1P >= 1000000) || (prev(prevScore2P) < 1000000 && Score2P >= 1000000)) && NoMaxLives
)
achievement(
    title="Drowning in Bombs",points=25,
    description="Achieve an individual score of 2,000,000 points or more with a maximum of 3 starting lives.",
    trigger=InGame && ((prev(prevScore1P) < 2000000 && Score1P >= 2000000) || (prev(prevScore2P) < 2000000 && Score2P >= 2000000)) && NoMaxLives
)
//Leaderboards
leaderboard(
    title="High Score - Any Difficulty 1P",
    description="Earn as many points as you can on any difficulty as one player with a maximum of 3 starting lives.",
    start=InGame && once(OnePlayer) && prev(LivesTotal) == 1 && LivesTotal == 0 && disable_when(TwoPlayer,!InGame) && NoMaxLives,
    cancel=always_false(),
    submit=always_true(),
    value=max_of(Score1P,Score2P),
    format="VALUE",
    lower_is_better=false
)
leaderboard(
    title="High Score - Hardest Difficulty 1P",
    description="Earn as many points as you can on the hardest difficulty as one player with a maximum of 3 starting lives.",
    start=InGame && once(OnePlayer) && prev(LivesTotal) == 1 && LivesTotal == 0 && disable_when(TwoPlayer,!InGame) && NoMaxLives && HardestDifficulty,
    cancel=always_false(),
    submit=always_true(),
    value=max_of(Score1P,Score2P),
    format="VALUE",
    lower_is_better=false
)
leaderboard(
    title="High Score - Extra Buffer 1P",
    description="Earn as many points as you can on any difficulty as one player with 4 starting lives.",
    start=InGame && once(OnePlayer) && prev(LivesTotal) == 1 && LivesTotal == 0 && MaxLives && disable_when(TwoPlayer,!InGame),
    cancel=always_false(),
    submit=always_true(),
    value=max_of(Score1P,Score2P),
    format="VALUE",
    lower_is_better=false
)
leaderboard(
    title="High Score - Any Difficulty 2P",
    description="Earn as many points as you can on any difficulty as two players with a maximum of 3 starting lives. Adds both scores together and submits when both players have 0 lives.",
    start=InGame && once(TwoPlayer) && __ornext(prev(LivesTotal) == 1 || prev(LivesTotal) == 2) && LivesTotal == 0 && never(!InGame) && NoMaxLives,
    cancel=always_false(),
    submit=always_true(),
    value=Score1P + Score2P,
    format="VALUE",
    lower_is_better=false
)
leaderboard(
    title="High Score - Hardest Difficulty 2P",
    description="Earn as many points as you can on the hardest difficulty as two players with a maximum of 3 starting lives. Adds both scores together and submits when both players have 0 lives.",
    start=InGame && once(TwoPlayer) && __ornext(prev(LivesTotal) == 1 || prev(LivesTotal) == 2) && LivesTotal == 0 && never(!InGame) && NoMaxLives && HardestDifficulty,
    cancel=always_false(),
    submit=always_true(),
    value=Score1P + Score2P,
    format="VALUE",
    lower_is_better=false
)
leaderboard(
    title="High Score - Extra Buffer 2P",
    description="Earn as many points as you can on any difficulty as two players with 4 starting lives. Adds both scores together and submits when both players have 0 lives.",
    start=InGame && once(TwoPlayer) && __ornext(prev(LivesTotal) == 1 || prev(LivesTotal) == 2) && LivesTotal == 0 && MaxLives && never(!InGame),
    cancel=always_false(),
    submit=always_true(),
    value=Score1P + Score2P,
    format="VALUE",
    lower_is_better=false
)

//RP
rich_presence_conditional_display(InGame && OnePlayer && P1Active,"Bomb Jack is defusing the situation on {0} • Difficulty: {1} • Score: {2} • Lives: {3}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score1P, format="VALUE"),
    rich_presence_value("Digit",Lives1P, format="VALUE")
)
rich_presence_conditional_display(InGame && OnePlayer && P2Active,"Bomb Jill is defusing the situation on {0} • Difficulty: {1} • Score: {2} • Lives: {3}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score2P, format="VALUE"),
    rich_presence_value("Digit",Lives2P, format="VALUE")
)
rich_presence_conditional_display(InGame && TwoPlayer,"Bomb Jack & Jill are defusing the situation on {0} • Difficulty: {1} • 1P Score: {2} • 1P Lives: {3} • 2P Score: {4} • 2P Lives: {5}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score1P, format="VALUE"),
    rich_presence_value("Digit",Lives1P, format="VALUE"),
    rich_presence_value("Digit",Score2P, format="VALUE"),
    rich_presence_value("Digit",Lives2P, format="VALUE")
)
rich_presence_conditional_display(InGame && OnePlayer && P1Active && Loop > 0,"Bomb Jack is defusing the situation past Round 20! • Difficulty: {1} • Score: {2} • Lives: {3}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score1P, format="VALUE"),
    rich_presence_value("Digit",Lives1P, format="VALUE")
)
rich_presence_conditional_display(InGame && OnePlayer && P2Active && Loop > 0,"Bomb Jill is defusing the situation past Round 20! • Difficulty: {1} • Score: {2} • Lives: {3}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score2P, format="VALUE"),
    rich_presence_value("Digit",Lives2P, format="VALUE")
)
rich_presence_conditional_display(InGame && TwoPlayer  && Loop > 0,"Bomb Jack & Jill are defusing the situation past Round 20! • Difficulty: {1} • 1P Score: {2} • 1P Lives: {3} • 2P Score: {4} • 2P Lives: {5}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score1P, format="VALUE"),
    rich_presence_value("Digit",Lives1P, format="VALUE"),
    rich_presence_value("Digit",Score2P, format="VALUE"),
    rich_presence_value("Digit",Lives2P, format="VALUE")
)
rich_presence_conditional_display(InGame, "Thinking about continuing")
rich_presence_display("Getting ready to play")


