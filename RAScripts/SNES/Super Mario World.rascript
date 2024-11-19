// Super Mario World
// #ID = 228
// $000019: [8-bit] Power-up
//          0x00 - None
//          0x01 - Mushroom
//          0x02 - Cape
//          0x03 - Fire

PowerUp = byte(0x19)

// $000078: [8-bit] Player sprite status
//          0x7f - Hidden; used when riding the bone cars in Fossil Fueled

InCar = byte(0x78) == 0x7f

// $000094: [16-bit] Player's X-position (Left of map is 0x0000)
//          0x0030 - Start of Daddy's Castle
//          0x009f - Intro easter egg
//          0x1720 - Fossil Fueled (screen 0x140); before final car that needs to be activated (use with $78) (and $1493 = 0)

XPos = word(0x94)

// $000096: [16-bit] Player's Y-position (Top of map is 0x0000)
//          0x120 - Late Night Terror Club; check that Y is less than this value for exit

YPos= word(0x96)

// $000100: [8-bit] Game Status
//          0x01 - Dedication
//          0x07 - Title Screen
//          0x0a - Main Menu
//          0x0e - Overworld
//          0x0f - Respawn/In pipe
//          0x14 - In a level (fully loaded)

GameState = byte(0x100)
  MainMenu = 0x0a
  Overworld = 0x0e
  Active = 0x14

Moon = bit1(0x1ff2)

Exit = byte(0xdd5)
function NormalExit() => prev(Exit) == 0 && Exit == 1
function SpecialExit() => prev(Exit) == 0 && Exit == 2
Overworld = 0x80

ScreenID = word(0x10b)
StageID = byte(0x13bf)
Music = byte(0x1dfb)

ClockSec = byte(0xf62)
ClockMSec = byte(0xf61)
ClockSwitch = bit0(0xf60)
ClockDisplay = bit0(0xf63)

function Clock(target) => ClockSec == target && ClockMSec == 0 && ClockSwitch == 1 && prev(ClockDisplay) == 0 && ClockDisplay == 1
function ClockEnd(target) => __ornext(ClockSec != target || ClockMSec != 0) && ClockSwitch == 1 && prev(ClockDisplay) == 0 && ClockDisplay == 1 || 
         (ClockDisplay == 1 && prev(ClockSwitch) == 0 && ClockSwitch == 1)

Save = byte(0x10a)
Checkpoint = word(0x1b403)
Retry = bit0(0x1b405)
Death = byte(0x1b424)
Rings = byte(0xdbf)

GameState = byte(0x100)
    MainMenu = 0x0a
    Overworld = 0x0e
    Active = 0x14

function MainMenu() => GameState <= 0x0a
function Overworld() => GameState <= 0x0e 
function InLevel() => GameState >= 0x0f
function LevelStart() => prev(GameState) <= 0x0e && GameState >= 0x0f

Pause = bit0(0x13d4)
Slowdown = byte(0x140b) // anything other than 0 slows down the game

XPos = word(0x94)
YPos = word(0x96)

MessageBox = byte(0x1426)

//level flags for any% leaderboard
Any1 = bit7(0x1ecb) Any2 = bit7(0x1ecc) Any3 = bit7(0x1ecd) Any4 = bit7(0x1ed2) Any5 = bit7(0x1ec8) Any6 = bit7(0x1ed4) Any7 = bit7(0x1ed6) Any8 = bit7(0x1ee6)

function Orb() => byte(0x1493) > 0
function Key() => byte(0x1434) > 0
function LBExitKey(level) => Level == level && Key()
function LBExitOrb(level) => Level == level && Orb()

either figure out how to reset only if the level hasn't been competed, or

function MiniStageComplete(stage) =>
        once(StageID == StageData[stage]["ID"] && Checkpoint == StageData[stage]["Checkpoint"] && LevelStart() &&
            never(Overworld()) && never(RidingYoshi)
            ) && 
            
            never(RidingYoshi)

achievement(
        title="Mini Mario vs. Yoshi's Island",points=5,
        description=Clear each of the 5 stages in Yoshi's Island as small Mario without using power-ups, checkpoints, or riding Yoshi.",
        trigger=never(MainMenu()) && 
            measured(tally(5,
                once(MiniStageComplete(Yoshi1)),
                once(MiniStageComplete(Yoshi2)),
                once(MiniStageComplete(Yoshi3)),
                once(MiniStageComplete(Yoshi4)),
                once(MiniStageComplete(IggyCastle))
                ))
)

                    





