// Super Mario World
// #ID = 228
// $000019: [8-bit] Power-up
//          0x00 - None
//          0x01 - Mushroom
//          0x02 - Cape
//          0x03 - Fire

PowerUp = byte(0x19)
  None = 0
// $000078: [8-bit] Player sprite status
//          0x7f - Hidden; used when riding the bone cars in Fossil Fueled

InCar = byte(0x78) == 0x7f

RidingYoshi = byte(0x187a) > 0
StarPower = byte(0x1490) > 0

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

StageExit = byte(0xdd5)
function NormalExit() => prev(StageExit) == 0 && StageExit == 1
function SpecialExit() => prev(StageExit) == 0 && StageExit == 2
Overworld = 0x80

StageID = byte(0x13bf)
Midway = byte(0x13ce) == 1
Music = byte(0x1dfb)

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
function LevelComplete() => prev(StageExit) == 0 && __ornext(StageExit == 1 || StageExit == 2)

Pause = bit0(0x13d4)

XPos = word(0x94)
YPos = word(0x96)

MessageBox = byte(0x1426)

//level flags for any% leaderboard
Any1 = bit7(0x1ecb) Any2 = bit7(0x1ecc) Any3 = bit7(0x1ecd) Any4 = bit7(0x1ed2) Any5 = bit7(0x1ec8) Any6 = bit7(0x1ed4) Any7 = bit7(0x1ed6) Any8 = bit7(0x1ee6)

function Orb() => byte(0x1493) > 0
function Key() => byte(0x1434) > 0
function LBExitKey(stage) => StageID == StageData[stage]["ID"] && Key()
function LBExitOrb(stage) => StageID == StageData[stage]["ID"] && Orb()

//either figure out how to reset only if the level hasn't been completed, or
//check if midway value at 0x13ce works

function MiniStageComplete(stage) =>
        once(StageID == StageData[stage]["ID"] && LevelStart() &&
            PowerUp == 0 && never(Overworld()) && !RidingYoshi && bit6(StageData[stage]["Midway"]) == 0
            ) && 
            (StageID == StageData[stage]["ID"] && LevelComplete &&
            never(prev(PowerUp) == 0 && PowerUp > 0 && StageID == StageData[stage]["ID"]) &&
            never(StarPower && StageID == Stagedata[stage]["ID"]) &&
            never(RidingYoshi && StageID == StageData[stage]["ID"]))

achievement(
        title="Mini Mario vs. Yoshi's Island",points=5,
        description="Clear each of the 5 stages in Yoshi's Island as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(5,
                once(MiniStageComplete(Yoshi1)),
                once(MiniStageComplete(Yoshi2)),
                once(MiniStageComplete(Yoshi3)),
                once(MiniStageComplete(Yoshi4)),
                once(MiniStageComplete(IggyCastle))
                ))
)

                    





