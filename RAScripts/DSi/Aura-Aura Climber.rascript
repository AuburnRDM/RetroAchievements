// Aura-Aura Climber
// #ID = 22313

// $FFE000: [32 Bit BE] Current Game ASCII
//          41555241 = 'AURA'
AURA = ascii_string_equals(0xFFE000, "AURA")
// $07B7A8: [8 Bit] Input Bits (1)
//          Bit0 = A
//          Bit1 = B
//          Bit2 = Select
//          Bit3 = Pause
//          Bit4 = Right
//          Bit5 = Left
//          Bit6 = Up
//          Bit7 = Down
// $07B7A9: [8 Bit] Input Bits (2)
//          Bit0 = R
//          Bit1 = L
// $07BCF0: [32 Bit] Most recent mode played
//          0x00 - Score Attack
//          0x02 - Endless
//          0x03 - Tutorial
Mode = dword(0x7bcf0)
ScoreAttack = 0
ModeEndless = 2
Tutorial = 3
// $07BCF4: [32 Bit] Most recent level played
//          0x00 - Endless
//          0x01 - Level 1 | Score Attack
//          0x02 - Level 2 | Score Attack
//          0x03 - Level 3 | Score Attack
//          0x04 - Level 4 | Score Attack
//          0x05 - Level 5 | Score Attack
//          0x06 - Level 6 | Score Attack
//          0x07 - Level 7 | Score Attack
//          0x08 - Level 8 | Score Attack
//          0x09 - Level 9 | Score Attack
//          0x0a - Level 10 | Score Attack
//          0x0b - Marathon | Score Attack
//          0x0c - Tutorial
Level = dword(0x7bcf4)
Endless = 0
Marathon = 0x0b
// $07BD0C: [32 Bit] Time Left
//          Time is tracked in microseconds. Divice by 1000 for seconds or 10 for centiseconds.
TimeLeftSpeedrun = dword(0x7bd0c) / 1000
TimeLeftLB = dword(0x7bd0c) / 10

SpeedrunTarget = {
    1:263,
    2:260,
    3:260,
    4:415,
    5:397,
    6:390,
    7:540,
    8:525,
    9:525,
    10:500,
    11:1129
}

InitialTime = {
    1:300000,
    2:300000,
    3:300000,
    4:450000,
    5:450000,
    6:450000,
    7:600000,
    8:600000,
    9:600000,
    10:600000,
    11:1800000
}
SpeedrunTitle = {
    1:"Swift Scaling I",
    2:"Swift Scaling II",
    3:"Swift Scaling III",
    4:"Swift Scaling IV",
    5:"Swift Scaling V",
    6:"Swift Scaling VI",
    7:"Swift Scaling VII",
    8:"Swift Scaling VIII",
    9:"Swift Scaling IX",
    10:"Swift Scaling X",
    11:"Light Speed"
}
// $07BD10: [32-Bit] Character State
//          (Used with 0x07bd14 to prevent mistriggers).
//          -- Value persists when going back to the menu
//          0x00 - Level Complete
//          0x01 - Lost all Health
//          0x04 - In-game
Character = dword(0x7bd10)
// $07BD14: [32-Bit] Gameplay State
//          (Used with 0x07bd10 to prevent mistriggers).
//          -- Value persists when going back to the menu
//          0x00 - Level is starting (countdown)
//          0x01 - In-game
//          0x02 - Level complete
//          0x03 - Level failed
GameState = dword(0x7bd14)
LevelComplete = Character == 0 && GameState == 2
LevelFailed = Character == 1 && GameState == 3
// $07BD1C: [32-bit] Total Score in current attempt
//          Grand total for the stage is calculated after a level is completed and the 'In-Game Check' (0x7be58) flips to 0x00
CurrentScore = dword(0x7bd1c)
// $07BD34: [32-bit] Max Height Reached in current attempt; divide by 4096 for value in meters
MaxHeight = dword (0x7bd34) / 4096
// $07BD69: [8-bit] Classic Mode status
//          Bit5 - On
ClassicMode = bit5(0x7bd69)
// $07BD6C: [32-bit] 1st Place Endless Height; divide by 4096 for value in meters
EndlessRecord = dword(0x7bd6c) / 4096
// $07BD34: [32 Bit] Max Height Reached in Game
// $07BD78: [32 Bit] 1st Place Score | Level 1
Level1FirstPlace = dword(0x07bd78)
// $07BD7C: [32 Bit] 2nd Place Score | Level 1
// $07BD80: [32 Bit] 3rd Place Score | Level 1
// $07BD84: [32 Bit] 1st Place Score | Level 2
// $07BD88: [32 Bit] 2nd Place Score | Level 2
// $07BD8C: [32 Bit] 3rd Place Score | Level 2
// $07BD90: [32 Bit] 1st Place Score | Level 3
// $07BD94: [32 Bit] 2nd Place Score | Level 3
// $07BD98: [32 Bit] 3rd Place Score | Level 3
// $07BD9C: [32 Bit] 1st Place Score | Level 4
// $07BDA0: [32 Bit] 2nd Place Score | Level 4
// $07BDA4: [32 Bit] 3rd Place Score | Level 4
// $07BDA8: [32 Bit] 1st Place Score | Level 5
// $07BDAC: [32 Bit] 2nd Place Score | Level 5
// $07BDB0: [32 Bit] 3rd Place Score | Level 5
// $07BDB4: [32 Bit] 1st Place Score | Level 6
// $07BDB8: [32 Bit] 2nd Place Score | Level 6
// $07BDBC: [32 Bit] 3rd Place Score | Level 6
// $07BDC0: [32 Bit] 1st Place Score | Level 7
// $07BDC4: [32 Bit] 2nd Place Score | Level 7
// $07BDC8: [32 Bit] 3rd Place Score | Level 7
// $07BDCC: [32 Bit] 1st Place Score | Level 8
// $07BDD0: [32 Bit] 2nd Place Score | Level 8
// $07BDD4: [32 Bit] 3rd Place Score | Level 8
// $07BDD8: [32 Bit] 1st Place Score | Level 9
// $07BDDC: [32 Bit] 2nd Place Score | Level 9
// $07BDE0: [32 Bit] 3rd Place Score | Level 9
// $07BDE4: [32 Bit] 1st Place Score | Level 10
// $07BDE8: [32 Bit] 2nd Place Score | Level 10
// $07BDEC: [32 Bit] 3rd Place Score | Level 10
// $07BDF0: [32 Bit] 1st Place Score | Marathon
// $07BDF4: [32 Bit] 2nd Place Score | Marathon
// $07BDF8: [32 Bit] 3rd Place Score | Marathon
// $07BDFF: [8 Bit] 1st Place Rank | Level 1
//          00 = S | 01 = A | 02 = B | 03 = C / None
S1 = byte(0x7bdff)
// $07BE00: [8 Bit] 2nd Place Rank | Level 1
// $07BE01: [8 Bit] 3rd Place Rank | Level 1
// $07BE02: [8 Bit] 1st Place Rank | Level 2
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S2 = byte(0x7be02)
// $07BE03: [8 Bit] 2nd Place Rank | Level 2
// $07BE04: [8 Bit] 3rd Place Rank | Level 2
// $07BE05: [8 Bit] 1st Place Rank | Level 3
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S3 = byte(0x7be05)
// $07BE06: [8 Bit] 2nd Place Rank | Level 3
// $07BE07: [8 Bit] 3rd Place Rank | Level 3
// $07BE08: [8 Bit] 1st Place Rank | Level 4
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S4 = byte(0x7be08)
// $07BE09: [8 Bit] 2nd Place Rank | Level 4
// $07BE0A: [8 Bit] 3rd Place Rank | Level 4
// $07BE0B: [8 Bit] 1st Place Rank | Level 5
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S5 = byte(0x7be0b)
// $07BE0C: [8 Bit] 2nd Place Rank | Level 5
// $07BE0D: [8 Bit] 3rd Place Rank | Level 5
// $07BE0E: [8 Bit] 1st Place Rank | Level 6
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S6 = byte(0x7be0e)
// $07BE0F: [8 Bit] 2nd Place Rank | Level 6
// $07BE10: [8 Bit] 3rd Place Rank | Level 6
// $07BE11: [8 Bit] 1st Place Rank | Level 7
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S7 = byte(0x7be11)
// $07BE12: [8 Bit] 2nd Place Rank | Level 7
// $07BE13: [8 Bit] 3rd Place Rank | Level 7
// $07BE14: [8 Bit] 1st Place Rank | Level 8
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S8 = byte(0x7be14)
// $07BE15: [8 Bit] 2nd Place Rank | Level 8
// $07BE16: [8 Bit] 3rd Place Rank | Level 8
// $07BE17: [8 Bit] 1st Place Rank | Level 9
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S9 = byte(0x7be17)
// $07BE18: [8 Bit] 2nd Place Rank | Level 9
// $07BE19: [8 Bit] 3rd Place Rank | Level 9
// $07BE1A: [8 Bit] 1st Place Rank | Level 10
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
S10 = byte(0x7be1a)
// $07BE1B: [8 Bit] 2nd Place Rank | Level 10
// $07BE1C: [8 Bit] 3rd Place Rank | Level 10
// $07BE1D: [8 Bit] 1st Place Rank | Marathon
//          0x00 - S | 0x01- A | 0x02 - B | 0x03 - C / None
SM = byte(0x7be1d)
SCounter = tally(12,once(S1 == 0),once(S2 == 0),once(S3 ==0),once(S4 ==0),once(S5 ==0),once(S6 ==0),
        once(S7 ==0),once(S8 ==0),once(S9 ==0),once(S10 ==0),once(SM ==0)) && never(!AURA) && never(Level1FirstPlace == 0)
// $07BE1E: [8 Bit] 2nd Place Rank | Marathon
// $07BE1F: [8 Bit] 3rd Place Rank | Marathon
SRankTarget = {
    1:40000,
    2:55000,
    3:75000,
    4:65000,
    5:75000,
    6:100000,
    7:105000,
    8:135000,
    9:125000,
    10:190000,
    11:950000
}
SRankDescription = {
    1:"40,000",
    2:"55,000",
    3:"75,000",
    4:"65,000",
    5:"75,000",
    6:"100,000",
    7:"105,000",
    8:"135,000",
    9:"125,000",
    10:"190,000",
    11:"950,000"
}
SRankTitle = {
    1:"Making the Grade I",
    2:"Making the Grade II",
    3:"Making the Grade III",
    4:"Making the Grade IV",
    5:"Making the Grade V",
    6:"Making the Grade VI",
    7:"Making the Grade VII",
    8:"Making the Grade VIII",
    9:"Making the Grade IX",
    10:"Making the Grade X",
    11:"Advanced Placement"
}
StagePoints = {
    1:3,
    2:3,
    3:5,
    4:5,
    5:5,
    6:5,
    7:10,
    8:10,
    9:10,
    10:10,
    11:25
}
LevelDescription ={
    1:"Score Attack 1",2:"Score Attack 2",3:"Score Attack 3",4:"Score Attack 4",5:"Score Attack 5",
    6:"Score Attack 6",7:"Score Attack 7",8:"Score Attack 8",9:"Score Attack 9",10:"Score Attack 10",
    11:"Marathon"
}
// $07BE20: [8 Bit] Medal Bitflags (1)
//          Bit0 = Clear | Score Attack
//          Bit1 = Bronze | Score Attack
//          Bit2 = Silver | Score Attack
//          Bit3 = Gold | Score Attack
//          Bit4 = Platinum | Score Attack
//          Bit5 = Bronze | Endless
//          Bit6 = Silver | Endless
//          Bit7 = Gold | Endless
MedalPt1 = bitcount(0x7be20)
MedalPt2 = bitcount(0x7be21)
MedalPt3 = bitcount(0x7be22)
MedalPt4 = bitcount(0x7be23)
TotalMedal = MedalPt1 + MedalPt2 + MedalPt3 + MedalPt4
// $07BE21: [8 Bit] Medal Bitflags (2)
//          Bit0 - Platinum | Endless
//          Bit1 - Earth | Hidden
//          Bit2 - Water | Hidden
//          Bit3 - Fire | Hidden
//          Bit4 - Lightning | Hidden
//          Bit5 - Air | Hidden
//          Bit6 - Metal | Hidden
//          Bit7 - Fury | Hidden
PlatinumEndless = bit0(0x7be21)
EarthMedal = bit1(0x7be21)
WaterMedal = bit2(0x7be21)
FireMedal = bit3(0x7be21)
LightningMedal = bit4(0x7be21)
AirMedal = bit5(0x7be21)
MetalMedal = bit6(0x7be21)
FuryMedal = bit7(0x7be21)
// $07BE22: [8 Bit] Medal Bitflags (3)
//          Bit0 - Lessons Learned | Extra 1
//          Bit1 - Light Speed | Extra 1
//          Bit2 - Bomb Master | Extra 1
//          Bit3 - Invincible Master | Extra 1
//          Bit4 - Minimalist | Extra 1
//          Bit5 - Collector | Extra 1
//          Bit6 - Pure Climber | Extra 1
//          Bit7 - Careful Climber | Extra 2
LessonsLearned = bit0(0x7be22)
LightSpeed = bit1(0x7be22)
BombMaster = bit2(0x7be22)
InvincibleMaster = bit3(0x7be22)
Minimalist = bit4(0x7be22)
Collector = bit5(0x7be22)
PureClimber = bit6(0x7be22)
CarefulClimber = bit7(0x7be22)
// $07BE23: [8 Bit] Medal Bitflags (4)
//          Bit0 - Close Call | Extra 2
//          Bit1 - Daring Escape | Extra 2
//          Bit2 - Bungee Jump | Extra 2
//          Bit3 - Swing Crazy | Extra 2
//          Bit4 - Perfect Path | Extra 2
//          Bit5 - Master Climber | Extra 2
CloseCall = bit0(0x7be23)
DaringEscape = bit1(0x7be23)
BungeeJump = bit2(0x7be23)
SwingCrazy = bit3(0x7be23)
PerfectPath = bit4(0x7be23)
MasterClimber = bit5(0x7be23) // just the medal. don't use this for the "Master Climber" achievement

// $07BE58: [32 Bit] In Game Check
InGame = dword(0x7be58)
ScoreCalculation = prev(InGame) == 1 && InGame == 0
ScoreCalculationTrigger = prev(InGame) == 1 && trigger_when(InGame == 0)
// $07BF50: [24-bit] Pointer
//          +0x53C - Current height -- Divide by 4096 to get the height in meters
CurrentHeight = dword(tbyte(0x7bf50) + 0x53c) / 4096
PrevCurrentHeight = prev(dword(tbyte(0x7bf50) + 0x53c)) / 4096
// $07C724: [8-bit] Gameplay paused
//          b0 - Paused
Pause = bit0(0x7c724)
// $1507DC: [32-bit] Frames not hanging from a node or touching the ground; resets to 0 when either condition is fulfilled
// $ED1C90: [24 Bit Pointer] Gameplay Related
//          +7A8 = [32 Bit] Current Health
//          +7BC = [32 Bit] Frames Moving
//          +9A8 = [32 Bit] Total Bombs
//          +9BC = [8 Bit] Current Grapple Arm Level
CurrentHP = dword(tbyte(0xed1c90) + 0x7a8)
CurrentBombs = dword(tbyte(0xed1c90) + 0x9a8)
CurrentArm = byte(tbyte(0xed1c90) + 0x9bc)
UFOCombo = byte(tbyte(0xed1c90) + 0x9ea)
UFOSpawn = dword(tbyte(0xed1c90) + 0x9ec)
UFOCollect = dword(tbyte(0xed1c90) + 0x9e4)
ActivePlay = GameState == 1 && InGame == 1 && Character == 4
MarathonEndless = (Mode == ScoreAttack && Level == Marathon) || (Mode == ModeEndless && Level == Endless)

//Achievements
achievement(
    title = "Baby Jumps", points = 2,
    description = "Complete Score Attack 1.",
    trigger = AURA && Mode == ScoreAttack && Level == 1 && LevelComplete && ScoreCalculation
)
achievement(
    title = "Don't Look Down", points = 5,
    description = "Complete Score Attack 5.",
    trigger = AURA && Mode == ScoreAttack && Level == 5 && LevelComplete && ScoreCalculation
)
achievement(
    title = "Amateur Climber", points = 10,
    description = "Complete Score Attack 10 and unlock Marathon.",
    trigger = AURA && Mode == ScoreAttack && Level == 10 && LevelComplete && ScoreCalculation
)

achievement(
    title = "Professional Climber", points = 10,
    description = "Complete Marathon.",
    trigger = AURA && Mode == ScoreAttack && Level == Marathon && LevelComplete && ScoreCalculation
)

function SRankCheevo(level)
{
    achievement(
        title = SRankTitle[level],
        description = "Earn an S rank on " + LevelDescription[level] + " by scoring at least " + SRankDescription[level] + " points.",
        points = StagePoints[level],
        trigger = AURA && Mode == ScoreAttack && Level == level && (LevelComplete || LevelFailed) && CurrentScore >= SRankTarget[level] && ScoreCalculation
    )
}

//Score Attack S Ranks
for i in range(1,11)
SRankCheevo(i)

function SpeedrunCheevo(level)
{
    achievement(
        title = SpeedrunTitle[level],
        description = "Finish " + LevelDescription[level] + " with " + SpeedrunTarget[level] + " or more seconds remaining.",
        points = StagePoints[level],
        trigger = AURA && Level == level && trigger_when(LevelComplete) && TimeLeftSpeedrun >= SpeedrunTarget[level] && trigger_when(ScoreCalculation) &&
            prev(InGame) != 0 // this line is for the trigger
    )
}

//Score Attack Speedruns
for i in range(1,11)
SpeedrunCheevo(i)

achievement(
    title = "Reach for the Remote", points = 5,
    description = "Reach 1,000m in Endless.",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && PrevCurrentHeight < 1000 && CurrentHeight >= 1000
)
achievement(
    title = "Reach for the Top", points = 10,
    description = "Reach 2,500m in Endless.",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && PrevCurrentHeight < 2500 && CurrentHeight >= 2500
)
achievement(
    title = "Reach for the Sky", points = 10,
    description = "Reach 5,000m in Endless.",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && PrevCurrentHeight < 5000 && CurrentHeight >= 5000
)
achievement(
    title = "Reach for the Stars", points = 25,
    description = "Reach 7,500m in Endless.",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && PrevCurrentHeight < 7500 && CurrentHeight >= 7500
)
achievement(
    title = "Keep it Going!", points = 25,
    description = "Reach 10,000m in Endless.",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && PrevCurrentHeight < 10000 && CurrentHeight >= 10000
)

achievement(
    title = "Proof of Earth", points = 3,
    description = "Collect the Earth Medal for the first time. (Endless 0-1,000m)",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && prev(EarthMedal) == 0 && EarthMedal == 1
)
achievement(
    title = "Proof of Water", points = 3,
    description = "Collect the Water Medal for the first time. (Endless 1,001m-2,000m)",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && prev(WaterMedal) == 0 && WaterMedal == 1
)
achievement(
    title = "Proof of Fire", points = 5,
    description = "Collect the Fire Medal for the first time. (Endless 2,001m-3,000m)",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && prev(FireMedal) == 0 && FireMedal == 1
)
achievement(
    title = "Proof of Lightning", points = 5,
    description = "Collect the Lightning Medal for the first time. (Endless 3,001m-4,000m)",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && prev(LightningMedal) == 0 && LightningMedal == 1
)
achievement(
    title = "Proof of Air", points = 5,
    description = "Collect the Air Medal for the first time. (Endless 4,001m-5,000m)",
    trigger = AURA && Mode == ModeEndless && Level == Endless && ActivePlay && prev(AirMedal) == 0 && AirMedal == 1
)
achievement(
    title = "Proof of Metal", points = 3,
    description = "Collect the Metal Medal for the first time. (Score Attack 6)",
    trigger = AURA && Mode == ScoreAttack && __ornext(Level == 6 || Level == Marathon) && ActivePlay && prev(MetalMedal) == 0 && MetalMedal == 1
)
achievement(
    title = "Proof of Fury", points = 3,
    description = "Collect the Fury Medal for the first time. (Score Attack 9)",
    trigger = AURA && Mode == ScoreAttack && __ornext(Level == 9 || Level == Marathon) && ActivePlay && prev(FuryMedal) == 0 && FuryMedal == 1
)

achievement(
    title = "Lessons Learned", points = 10,
    description = "Clear Score Attack 10 without taking damage.",
    trigger = AURA && Mode == ScoreAttack && Level == 10 && trigger_when(LevelComplete) && 
            ((ScoreCalculationTrigger && disable_when(ActivePlay && prev(CurrentHP) > CurrentHP)) || 
            (prev(LessonsLearned) == 0 && LessonsLearned == 1) || 
            never(TimeLeftSpeedrun == 600) && always_false()) 
)

achievement(
    title = "Bungee Jump", points = 3,
    description = "Earn a medal for performing a swing-back worth more than 600 points in Score Attack.",
    trigger = AURA && ActivePlay && prev(BungeeJump) == 0 && BungeeJump == 1
)

achievement(
    title = "Minimalist", points = 10,
    description = "Earn a medal for climbing 5,000m in Marathon or Endless with minimum arm length.",
    trigger = AURA && ActivePlay && MarathonEndless && CurrentArm == 0 && prev(Minimalist) == 0 && trigger_when(Minimalist == 1)
)

achievement(
    title = "Pure Climber", points = 10,
    description = "Earn a medal for climbing 5,000m in Marathon or Endless without using a bomb.",
    trigger = AURA && ActivePlay && prev(PureClimber) == 0 && PureClimber == 1
)

achievement(
    title = "Careful Climber", points = 10,
    description = "Reach 3,000m in Marathon or Endless without taking damage.",
    trigger = AURA && ActivePlay && MarathonEndless && 
            ((once(CurrentHeight == 0 && never(prev(CurrentHP) > CurrentHP)) && trigger_when(CurrentHeight >= 3000)) || 
            (prev(CarefulClimber) == 0 && CarefulClimber == 1))
)
//needs trigger and confirmation if it's consecutive
achievement(
    title = "Daring Escape", points = 5,
    description = "Earn a medal for climbing 1,500m in Marathon or Endless while at one health.",
    trigger = AURA && ActivePlay && MarathonEndless && CurrentHP == 1 && prev(DaringEscape) == 0 && trigger_when(DaringEscape == 1)
)

achievement(
    title = "Perfect Path", points = 10,
    description = "Earn a medal for climbing 2,500m in Marathon or Endless without touching the same grapple point twice",
    trigger = AURA && ActivePlay && MarathonEndless && prev(PerfectPath) == 0 && PerfectPath == 1
)
achievement(
    title = "Time to Spare", points = 5,
    description = "Have 300 or more seconds remaining in Endless.",
    trigger = AURA && ActivePlay && Mode == ModeEndless && Level == Endless && prev(TimeLeftSpeedrun) < 300 && TimeLeftSpeedrun >= 300
)    
achievement(
    title = "All the Time in the World", points = 10,
    description = "Have 500 or more seconds remaining in Endless.",
    trigger = AURA && ActivePlay && Mode == ModeEndless && Level == Endless && prev(TimeLeftSpeedrun) < 500 && TimeLeftSpeedrun >= 500
)    
//needs some adjustment to pop if the time is over 30 just in case. change in the GUI manually
achievement(
    title = "Close Call", points = 10,
    description = "Have less than 30 seconds remaining for more than 2 consecutive minutes in Endless.",
    trigger = AURA && ActivePlay && Mode == ModeEndless && Level == Endless && 
            ((trigger_when(repeated(7200, TimeLeftSpeedrun < 30 && Pause == 0 && ActivePlay)) && never(TimeLeftSpeedrun >= 30)) ||
            (prev(CloseCall) == 0 && trigger_when(CloseCall == 1)))
)

achievement(
    title = "A Bonus from Beyond", points = 5,
    description = "Earn the largest bonus by collecting the platinum UFO. Each UFO will spawn by climbing on 12 normal nodes without touching the same grapple point twice or taking damage.",
    trigger = AURA && ActivePlay && UFOCombo == 4 && UFOSpawn != 0 && prev(UFOCollect) == 0 && UFOCollect == UFOSpawn
)

achievement(
    title = "Explosive Encounter", points = 3,
    description = "Earn a medal for killing more than 15 enemies with a single bomb.",
    trigger = AURA && ActivePlay && prev(BombMaster) == 0 && BombMaster == 1
)

achievement(
    title = "Unstoppable", points = 3,
    description = "Earn a medal for killing 7 enemies with a single Invincibility power-up.",
    trigger = AURA && ActivePlay && prev(InvincibleMaster) == 0 && InvincibleMaster == 1
)

achievement(
    title = "Collector", points = 5,
    description = "Possess 5 bombs, maximum arm length, and full health all at the same time.",
    trigger = AURA && ActivePlay && (((prev(CurrentBombs) + prev(CurrentArm) + prev(CurrentHP) == 11) && (CurrentBombs + CurrentArm + CurrentHP == 12)) ||
            (prev(Collector) == 0 && Collector == 1))
)

achievement(
    title = "Swing Crazy", points = 3,
    description = "Earn a medal for performing 3 consecutive swing-backs without coming to a stop or using a bomb.",
    trigger = AURA && ActivePlay && prev(SwingCrazy) == 0 && SwingCrazy == 1
)

achievement(
    title = "Master Climber", points = 25,
    description = "Earn all 30 medals and unlock Classic mode.",
    trigger = AURA && prev(TotalMedal) > 26 && prev(TotalMedal) < 30 && measured(TotalMedal == 30, Mode <= 3)
)

achievement(
    title = "Monochrome Marathon", points = 10,
    description = "Complete Marathon with Classic mode enabled.",
    trigger = AURA && Mode == ScoreAttack && Level == Marathon && trigger_when(LevelComplete) && ScoreCalculationTrigger && ClassicMode == 1
)
//Leaderboards
leaderboard(
        title = "Endless - Height",
        description = "Reach as high as you can in Endless.",
        start = AURA && Mode == ModeEndless && Level == Endless && LevelFailed && ScoreCalculation,
        cancel = always_false(),
        submit = always_true(),
        value = MaxHeight,
        format = "VALUE", lower_is_better = false
)
leaderboard(
        title = "Endless - Time",
        description = "Have as much extra time as you can when losing all HP in Endless.",
        start = AURA && Mode == ModeEndless && Level == Endless && LevelFailed && ScoreCalculation,
        cancel = always_false(),
        submit = always_true(),
        value = TimeLeftLB,
        format = "MILLISECS", lower_is_better = false
)
    
function ScoreLeaderboard(level)
{
    leaderboard(
        title = LevelDescription[level] + " - Points",
        description = "Earn as many points as you can in " + LevelDescription[level] + ".",
        start = AURA && Mode == ScoreAttack && Level == level && (LevelComplete || LevelFailed) && ScoreCalculation,
        cancel = always_false(),
        submit = always_true(),
        value = CurrentScore,
        format = "VALUE", lower_is_better = false
    )
}

//Score Attack Score Leaderboards
for i in range(1,11)
ScoreLeaderboard(i)

function SpeedLeaderboard(level)
{
    leaderboard(
        title = LevelDescription[level] + " - Speed",
        description = "Complete " + LevelDescription[level] + " as fast as you can.",
        start = AURA && Mode == ScoreAttack && Level == level && LevelComplete && ScoreCalculation,
        cancel = always_false(),
        submit = always_true(),
        value = InitialTime[level]/10 - TimeLeftLB,
        format = "MILLISECS", lower_is_better = true
    )
}

//Score Attack Speed Leaderboards
for i in range(1,11)
SpeedLeaderboard(i)

//Rich Presence
rich_presence_conditional_display(AURA && InGame == 0 && CurrentScore > 0 && Mode == ScoreAttack,"Aura is in the menus • [Recent: {2} - {3} Points] • [S-Ranks: {0}/11] [Medals: {1}/30]",
    rich_presence_value("Digit",SCounter,format="VALUE"),
    rich_presence_value("Digit",TotalMedal,format="VALUE"),
    rich_presence_lookup("Level",Level,LevelDescription),
    rich_presence_value("Digit",CurrentScore,format="VALUE")
)
rich_presence_conditional_display(AURA && InGame == 0 && CurrentHeight > 0 && Mode == ModeEndless,"Aura is in the menus • [Recent: Endless - {3}m] • [S-Ranks: {0}/11] [Medals: {1}/30]",
    rich_presence_value("Digit",SCounter,format="VALUE"),
    rich_presence_value("Digit",TotalMedal,format="VALUE"),
    rich_presence_lookup("Level",Level,LevelDescription),
    rich_presence_value("Digit",MaxHeight,format="VALUE")
)
rich_presence_conditional_display(AURA && InGame == 0,"Aura is in the menus • [S-Ranks: {0}/11] [Medals: {1}/30]",
    rich_presence_value("Digit",SCounter,format="VALUE"),
    rich_presence_value("Digit",TotalMedal,format="VALUE")
)
rich_presence_conditional_display(AURA && InGame == 1 && Mode == Tutorial,"Aura is learning how to climb in the Tutorial • [S-Ranks: {0}/11] [Medals: {1}/30]",
    rich_presence_value("Digit",SCounter,format="VALUE"),
    rich_presence_value("Digit",TotalMedal,format="VALUE")
)
rich_presence_conditional_display(AURA && InGame == 1 && (CurrentArm > 1000 || CurrentBombs > 1000 || CurrentHP > 1000),
    "Aura is getting ready to climb • [S-Ranks: {0}/11] [Medals: {1}/30]",
    rich_presence_value("Digit",SCounter,format="VALUE"),
    rich_presence_value("Digit",TotalMedal,format="VALUE"),
    rich_presence_value("Digit",CurrentHeight,format="VALUE")
)
rich_presence_conditional_display(AURA && InGame == 1 && Mode == ScoreAttack,
    "Aura is climbing in {0} [Points: {1}] [Time Left: {2}s] • [HP: {3}/3] [Bombs: {4}/5] [Arm: {5}/5] • [S-Ranks: {6}/11] [Medals: {7}/30]",
    rich_presence_lookup("Level",Level,LevelDescription),
    rich_presence_value("Digit",CurrentScore,format="VALUE"),
    rich_presence_value("Digit",TimeLeftSpeedrun,format="VALUE"),
    rich_presence_value("Digit",CurrentHP,format="VALUE"),
    rich_presence_value("Digit",CurrentBombs,format="VALUE"),
    rich_presence_value("Digit",CurrentArm + 1,format="VALUE"),
    rich_presence_value("Digit",SCounter,format="VALUE"),
    rich_presence_value("Digit",TotalMedal,format="VALUE")
)
rich_presence_conditional_display(AURA && InGame == 1 && Mode == ModeEndless,
    "Aura is climbing in Endless [Current: {0}m] [Best: {1}m] • [HP: {2}/3] [Bombs: {3}/5] [Arm: {4}/5] • [S-Ranks: {5}/11] [Medals: {6}/30]",
    rich_presence_value("Digit",MaxHeight,format="VALUE"),
    rich_presence_value("Digit",EndlessRecord,format="VALUE"),
    rich_presence_value("Digit",CurrentHP,format="VALUE"),
    rich_presence_value("Digit",CurrentBombs,format="VALUE"),
    rich_presence_value("Digit",CurrentArm + 1,format="VALUE"),
    rich_presence_value("Digit",SCounter,format="VALUE"),
    rich_presence_value("Digit",TotalMedal,format="VALUE")
)
rich_presence_display("In the DSi menus")