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
Balloon = byte(0x1891) > 0
//level flags for any% leaderboard
Any1 = bit7(0x1ecb) Any2 = bit7(0x1ecc) Any3 = bit7(0x1ecd) Any4 = bit7(0x1ed2) Any5 = bit7(0x1ec8) Any6 = bit7(0x1ed4) Any7 = bit7(0x1ed6) Any8 = bit7(0x1ee6)

StageData = {
    Yoshi1:{"ID":0x29,"Midway":0x1ecb},
    Yoshi2:{"ID":0x2a,"Midway":0x1ecc},
    Yoshi3:{"ID":0x27,"Midway":0x1ec9},
    Yoshi4:{"ID":0x26,"Midway":0x1ec8},
    IggyCastle:{"ID":0x25,"Midway":0x1ec7},
    Donut1:{"ID":0x15,"Midway":0x1eb7},
    Donut2:{"ID":0x9,"Midway":0x1eab},
    Donut3:{"ID":0x5,"Midway":0x1ea7},
    Donut4:{"ID":0x6,"Midway":0x1ea8},
    DonutGhost:{"ID":0x4,"Midway":0x1ea6},
    DonutSecret1:{"ID":0x0a,"Midway":0x1eac},
    DonutSecret2:{"ID":0x2f,"Midway":0x1ed1},
    DonutSecretGhost:{"ID":0x13,"Midway":0x1eb5},
    MortonCastle:{"ID":0x7,"Midway":0x1ea9},
    Vanilla1:{"ID":0x3e,"Midway":0x1ee0},
    Vanilla2:{"ID":0x3c,"Midway":0x1ede},
    Vanilla3:{"ID":0x2e,"Midway":0x1ed0},
    Vanilla4:{"ID":0x3d,"Midway":0x1edf},
    VanillaGhost:{"ID":0x2b,"Midway":0x1ecd},
    VanillaSecret1:{"ID":0x2d,"Midway":0x1ecf},
    VanillaSecret2:{"ID":0x1,"Midway":0x1ea3},
    VanillaSecret3:{"ID":0x2,"Midway":0x1ea4},
    VanillaFortress:{"ID":0x0b,"Midway":0x1ead},
    LemmyCastle:{"ID":0x40,"Midway":0x1ee2},
    Butter1:{"ID":0x0c,"Midway":0x1eae},
    Butter2:{"ID":0x0d,"Midway":0x1eaf},
    CheeseBridge:{"ID":0x0f,"Midway":0x1eb1},
    CookieMountain:{"ID":0x10,"Midway":0x1eb2},
    SodaLake:{"ID":0x11,"Midway":0x1eb3},
    LudwigCastle:{"ID":0x0e,"Midway":0x1eb0},
    Forest1:{"ID":0x42,"Midway":0x1ee4},
    Forest2:{"ID":0x44,"Midway":0x1ee6},
    Forest3:{"ID":0x47,"Midway":0x1ee9},
    Forest4:{"ID":0x43,"Midway":0x1ee5},
    ForestGhost:{"ID":0x41,"Midway":0x1ee3},
    ForestSecret:{"ID":0x46,"Midway":0x1ee8},
    ForestFortress:{"ID":0x1f,"Midway":0x1ec1},
    RoyCastle:{"ID":0x20,"Midway":0x1ec2},
    Chocolate1:{"ID":0x22,"Midway":0x1ec4},
    Chocolate2:{"ID":0x24,"Midway":0x1ec6},
    Chocolate3:{"ID":0x23,"Midway":0x1ec5},
    Chocolate4:{"ID":0x1d,"Midway":0x1ebf},
    Chocolate5:{"ID":0x1c,"Midway":0x1ebe},
    ChocolateGhost:{"ID":0x21,"Midway":0x1ec3},
    ChocolateSecret:{"ID":0x3b,"Midway":0x1edd},
    ChocolateFortress:{"ID":0x1b,"Midway":0x1ebd},
    WendyCastle:{"ID":0x1a,"Midway":0x1ebc},
    Bowser1:{"ID":0x3a,"Midway":0x1edc},
    Bowser2:{"ID":0x39,"Midway":0x1edb},
    Bowser3:{"ID":0x37,"Midway":0x1ed9},
    Bowser4:{"ID":0x33,"Midway":0x1ed5},
    BowserGhost:{"ID":0x38,"Midway":0x1eda},
    BowserFortress:{"ID":0x35,"Midway":0x1ed7},
    LarryCastle:{"ID":0x34,"Midway":0x1ed6},
    BowserCastle:{"ID":0x31,"Midway":0x1ed3},
    Gnarly:{"ID":0x4e,"Midway":0x1ef0},
    Tubular:{"ID":0x4f,"Midway":0x1ef1},
    WayCool:{"ID":0x50,"Midway":0x1ef2},
    Awesome:{"ID":0x51,"Midway":0x1ef3},
    Groovy:{"ID":0x4c,"Midway":0x1eee},
    Mondo:{"ID":0x4b,"Midway":0x1eed},
    Outrageous:{"ID":0x4a,"Midway":0x1eec},
    Funky:{"ID":0x49,"Midway":0x1eeb}
}

function Orb() => byte(0x1493) > 0
function Key() => byte(0x1434) > 0
function LBExitKey(stage) => StageID == StageData[stage]["ID"] && Key()
function LBExitOrb(stage) => StageID == StageData[stage]["ID"] && Orb()

//either figure out how to reset only if the level hasn't been completed, or
//check if midway value at 0x13ce works

function MiniStageComplete2(stage) =>
        once(StageID == StageData[stage]["ID"] && LevelStart() &&
            PowerUp == 0 && never(Overworld()) && !RidingYoshi && bit6(StageData[stage]["Midway"]) == 0
            ) && 
            (StageID == StageData[stage]["ID"] && LevelComplete() &&
            never(prev(PowerUp) == 0 && PowerUp > 0 && StageID == StageData[stage]["ID"]) &&
            never(StarPower && StageID == Stagedata[stage]["ID"]) &&
            never(RidingYoshi && StageID == StageData[stage]["ID"]))

function MiniStageComplete(stage) =>
        once(once(StageID == StageData[stage]["ID"] && LevelStart() &&
            PowerUp == 0 && !RidingYoshi && bit6(StageData[stage]["Midway"]) == 0
            ) &&
            StageID == StageData[stage]["ID"] && LevelComplete() &&
            never(prev(PowerUp) == 0 && PowerUp > 0 && StageID == StageData[stage]["ID"]) &&
            never(StarPower && StageID == StageData[stage]["ID"]) &&
            never(Balloon && StageID == StageData[stage]["ID"]) &&
            never(prev(!RidingYoshi) && RidingYoshi && StageID == StageData[stage]["ID"]))

achievement(
        title="Mini Mario vs. Yoshi's Island",points=5,
        description="Clear each of the 5 stages in Yoshi's Island as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(5,
                MiniStageComplete(Yoshi1),
                MiniStageComplete(Yoshi2),
                MiniStageComplete(Yoshi3),
                MiniStageComplete(Yoshi4),
                MiniStageComplete(IggyCastle)
                ))
)
achievement(
        title="Mini Mario vs. Donut Plains",points=10,
        description="Clear each of the 9 stages in Donut Plains as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(9,
                MiniStageComplete(Donut1),
                MiniStageComplete(Donut2),
                MiniStageComplete(Donut3),
                MiniStageComplete(Donut4),
                MiniStageComplete(DonutGhost),
                MiniStageComplete(DonutSecret1),
                MiniStageComplete(DonutSecret2),
                MiniStageComplete(DonutSecretGhost),
                MiniStageComplete(MortonCastle)
                ))
)            
achievement(
        title="Mini Mario vs. Vanilla Dome",points=10,
        description="Clear each of the 10 stages in Vanilla Dome as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(10,
                MiniStageComplete(Vanilla1),
                MiniStageComplete(Vanilla2),
                MiniStageComplete(Vanilla3),
                MiniStageComplete(Vanilla4),
                MiniStageComplete(VanillaGhost),
                MiniStageComplete(VanillaSecret1),
                MiniStageComplete(VanillaSecret2),
                MiniStageComplete(VanillaSecret3),
                MiniStageComplete(VanillaFortress),
                MiniStageComplete(LemmyCastle)
                ))
)
achievement(
        title="Mini Mario vs. Twin Bridges",points=10,
        description="Clear each of the 6 stages in Twin Bridges as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(6,
                MiniStageComplete(Butter1),
                MiniStageComplete(Butter2),
                MiniStageComplete(CheeseBridge),
                MiniStageComplete(CookieMountain),
                MiniStageComplete(SodaLake),
                MiniStageComplete(LudwidCastle)
                ))
)
achievement(
        title="Mini Mario vs. Forest of Illusion",points=10,
        description="Clear each of the 8 stages in Forest of Illusion as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(8,
                MiniStageComplete(Forest1),
                MiniStageComplete(Forest2),
                MiniStageComplete(Forest3),
                MiniStageComplete(Forest4),
                MiniStageComplete(ForestGhost),
                MiniStageComplete(ForestSecret),
                MiniStageComplete(ForestFortress),
                MiniStageComplete(RoyCastle)
                ))
)
achievement(
        title="Mini Mario vs. Chocolate Island",points=10,
        description="Clear each of the 9 stages in Chocolate Island as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(9,
                MiniStageComplete(Chocolate1),
                MiniStageComplete(Chocolate2),
                MiniStageComplete(Chocolate3),
                MiniStageComplete(Chocolate4),
                MiniStageComplete(Chocolate5),
                MiniStageComplete(ChocolateGhost),
                MiniStageComplete(ChocolateSecret),
                MiniStageComplete(ChocolateFortress),
                MiniStageComplete(WendyCastle)
                ))
)
achievement(
        title="Mini Mario vs. Valley of Bowser",points=10,
        description="Clear each of the 8 stages in Valley of Bowser as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(8,
                MiniStageComplete(Bowser1),
                MiniStageComplete(Bowser2),
                MiniStageComplete(Bowser3),
                MiniStageComplete(Bowser4),
                MiniStageComplete(BowserGhost),
                MiniStageComplete(BowserFortress),
                MiniStageComplete(LarryCastle),
                MiniStageComplete(BowserCastle)
                ))
)
achievement(
        title="Mini Mario vs. Special World",points=25,
        description="Clear each of the 8 stages in Special World as small Mario without using power-ups, checkpoints, or riding Yoshi in a single session.",
        trigger=never(MainMenu()) && 
            measured(tally(8,
                MiniStageComplete(Gnarly),
                MiniStageComplete(Tubular),
                MiniStageComplete(WayCool),
                MiniStageComplete(Awesome),
                MiniStageComplete(Groovy),
                MiniStageComplete(Mondo),
                MiniStageComplete(Outrageous),
                MiniStageComplete(Funky)
                ))
)
