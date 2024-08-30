// Bomb Jack Twin
// #ID = 12001

// $1836: [8-bit] Lives 1P
Lives1P = byte(0x1836)
// $184C: [16-bit BCD] 1P Score - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x00184e
// $184E: [16-bit BCD] 1P Score - rightmost 4 digits - 0000xxxx; add to (0x00184c * 10,000)
Score1P = (bcd(word(0x184C)) * 10000) + bcd(word(0x184E))
// $186A: [8-bit] Number of bombs collected in current round by 1P; 0x18 total in each round
// $186C: [8-bit] Total number of Fire Bombs collected in the current Round by 1P (Max: 0x17)
// $186E: [DNP] [8-bit] Invincibility frames timer; goes to 0x07 at the end of the round
// $1936: [8-bit] Lives 2P
Lives2P = byte(0x1936)
// $194C: [16-bit BCD] 2P Score - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x00194e
// $194E: [16-bit BCD] 2P Score - rightmost 4 digits - 0000xxxx; add to (0x00194c * 10,000)
Score1P = (bcd(word(0x194C)) * 10000) + bcd(word(0x194E))
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
MaxLives = bit6(0x9807) == 1 && bit7(0x9807) == 0
//        Starting area (just cosmetic)
//        Bits 1,2,3
// $9820: [8-bit] Number of levels cleared in current arcade run; - Changing this changes the next level
//        - Goes up to 0x45 and then rolls back to 0x00 and adds 0x01 to $9822 and 'loops' even though there are only 32 unique maps
Stage = byte(0x9820)
StageRP = {
    1:"1-1",2:"1-2",3:"1-3",4:"Bonus"
// $9822: [8-bit] Current 'loop'; this starts at 0x00 and goes up by 0x01 every 20 rounds cleared
Loop = byte(0x9822) + 1
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
Multiplier = byte(0x9870)
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
// $9893: round; loops from 0x01 to 0x09 then 0x00. stays at 0x05 after round 20
// $9894: [8-bit] Current stage in Round; 0x90 when bonus
// $9895: [8-bit BCD] Current round in 'loop'; goes up to 20 and then rolls back to 0 and counts up again; - displays as 0x89 during bonus
// $9900: [16-bit BCD] High Score leaderboard #1 - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x9902
// $9902: [16-bit BCD] High Score leaderboard #1 - rightmost 4 digits - 0000xxxx; add to (0x9900 * 10,000)
// $9904: [8-bit BCD] High Score leaderboard #1 - Round reached

//Data
RoundData = {
    1:{"fTitle":"bomb1","fPoints":5,"fBombs":23,"startLevel":0x0,"endLevel":0x2},
    2:{"fTitle":"bomb2","fPoints":5,"fBombs":23,"startLevel":0x4,"endLevel":0x6},
    3:{"pTitle":"3prog","pPoints":2,"fTitle":"bomb3","fPoints":5,"fBombs":22,"startLevel":0x7,"endLevel":0x9,"fDesc":"at least "},
    4:{"fTitle":"bomb4","fPoints":5,"fBombs":22,"startLevel":0xb,"endLevel":0xd,"fDesc":"at least "},
    5:{"fTitle":"bomb5","fPoints":10,"fBombs":21,"startLevel":0xe,"endLevel":0x1a,"fDesc":"at least "},
    6:{"pTitle":"6prog","pPoints":3,"fTitle":"bomb6","fPoints":10,"fBombs":21,"startLevel":0x1c,"endLevel":0x1e,"fDesc":"at least "},
    7:{"fTitle":"bomb7","fPoints":10,"fBombs":20,"startLevel":0x1f,"endLevel":0x21,"fDesc":"at least "},
    8:{"fTitle":"bomb8","fPoints":10,"fBombs":20,"startLevel":0x22,"endLevel":0x25,"fDesc":"at least "},
    9:{"pTitle":"9prog","pPoints":5,"fTitle":"bomb9","fPoints":25,"fBombs":20,"startLevel":0x26,"endLevel":0x28,"fDesc":"at least "}

//Functions
CreditUsed = (Credit < prev(Credit)) || (FreePlay && prev(Credit) == 0 && Credit == 9)
CreditProtection = once(InGame && InStage && BombsCollected == 0)
function CreditProtectionRound(round) =>
    once(InGame && InStage && Stage == RoundData[round]["startLevel"] && BombsCollected == 0)

function ProgressionAchievement(round)=>
    achievement(
        title=RoundData[round]["pTitle"],points=RoundData[round]["pPoints"],type=Progression,
        description="Complete all of Round " + RoundData[round]["Round"] + " with any settings.",
        title= InGame && prev(Stage) == RoundData[round]["endLevel"] && Stage == RoundData[round]["endLevel"] + 1
function FireBombAchievement(round) =>
    achievement(
        title=RoundData[round]["fTitle"],points=RoundData[round]["fPoints"],
        description="Collect " +RoundData[round]["fDesc"] + RoundData[round]["fBombs"] + " on all 3 levels of Round " + round + " without using a credit after collecting the first bomb on " + round + "-1.",
        trigger=InGame && InStage && CreditProtectionRound(round) &&
                trigger_when(tally(3,
                    once(InGame && Stage == RoundData[stage]["startLevel"] && prev(FireBombs) == RoundData[round]["fBombs"] -1 && FireBombs == RoundData[round]["fBombs"]),
                    once(InGame && Stage == RoundData[stage]["startLevel"] + 1 && prev(FireBombs) == RoundData[round]["fBombs"] -1 && FireBombs == RoundData[round]["fBombs"]),
                    once(InGame && Stage == RoundData[stage]["startLevel"] + 2 && prev(FireBombs) == RoundData[round]["fBombs"] -1 && FireBombs == RoundData[round]["fBombs"]))) &&
                never(CreditUsed) &&
                never(BombsCollected > (FireBombs + (23 - RoundData[round]["fBombs]) + 1))

//fill in BonusArray[4,etc]
//Achievements
for i in [3,6,9]
    ProgressionAchievement(i)

achievement(
    title="Around the World",points=5,
    description="Complete Round 13 with any settings.",
    trigger= InGame && prev(Stage) == //find this && Stage == (+1)

//1/3CC
achievement(
    title="3cc any", points=10,
    description="Complete the first 9 rounds in 3 or fewer credits on any difficulty with a maximum of 3 starting lives. [1P only]",
    trigger=InGame && OnePlayer && CreditProtectionRound(1) && never(tally(3,CreditUsed) && never(TwoPlayer)
//23 fire bomb any
achievement(
    title="any bonus",points=2,
    description="Collect 23 fire bombs on any stage without using a credit.",
    trigger= InGame && CreditProtection && prev(FireBombs) == 22 && FireBombs == 23 && never(CreditUsed)
//23 fire bomb bonus
achievement(
    title="any bonus",points=2,
    description="Collect 23 fire bombs on any bonus stage.",
    trigger= InGame && Stage == [BonusArray] && prev(FireBombs) == 22 && FireBombs == 23

for i in range(1,9)
    FireBombAchievement(i)

achievement(
    title="x5 multi",points=5,
    description="Reach a x5 multiplier.",
    trigger=InGame && prev(Multiplier) == 4 && Multiplier == 5
achievement(
    title="10k enemy",points=5,
    description="Earn 10,000 points from a single enemy.",
    trigger=InGame && Multiplier == 5 && EnemyCombo == 7 && prev(EnemyKills) != EnemyKills
achievement(
    title="extra life",points=3,
    description="Collect an extra life.",
    trigger=InGame && InStage && EnemyKills != 0 && __ornext(Lives1P > prev(Lives1P) || Lives2P > prev(Lives2P))
//1s on bonus stage
achievement(
    title="1m score",points=10,
    description="Achieve a score of 1,000,000 or more.",
    trigger=InGame && (prev(Score1P) < 1000000 && Score1P >= 1000000) || (prev(Score2P) < 1000000 && Score2P >= 1000000)
achievement(
    title="1m score",points=25,
    description="Achieve a score of 2,000,000 or more.",
    trigger=InGame && (prev(Score1P) < 2000000 && Score1P >= 2000000) || (prev(Score2P) < 2000000 && Score2P >= 2000000)
//Leaderboards

//RP
rich_presence_conditional_display(InGame && OnePlayer && P1Active,"Bomb Jack is defusing the situation on {0} • Difficulty:  {1} • Score: {2} • Lives:{3}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score1P, format="VALUE"),
    rich_presence_value("Digit",Lives1P, format="VALUE")
)
rich_presence_conditional_display(InGame && OnePlayer && P2Active,"Bomb Jill is defusing the situation on {0} • Difficulty:  {1} • Score: {2} • Lives:{3}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score2P, format="VALUE"),
    rich_presence_value("Digit",Lives2P, format="VALUE")
)
rich_presence_conditional_display(InGame && TwoPlayer,"Bomb Jack & Jill is defusing the situation on {0} • Difficulty:  {1} • 1P Score: {2} • 1P Lives:{3} • 1P Score: {4} • 1P Lives:{5}",
    rich_presence_lookup("Stage",Stage,StageRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score1P, format="VALUE"),
    rich_presence_value("Digit",Lives1P, format="VALUE"),
    rich_presence_value("Digit",Score2P, format="VALUE"),
    rich_presence_value("Digit",Lives2P, format="VALUE")
)
rich_presence_display("Getting ready to play")
    
