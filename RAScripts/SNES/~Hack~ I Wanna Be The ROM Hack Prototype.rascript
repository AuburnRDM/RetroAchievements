// ~Hack~ I Wanna Be The ROM Hack: Prototype
// #ID = 30919

// $020100: [8-bit] Game Status
//          0x00-0x06 - Booting
//          0x07 - Title Screen
//          0x0a - Main Menu
//          0x0f - Respawn
//          0x14 - In a level (fully loaded)
GameState = byte(0x20100)
    MainMenu = 0x0a
    Active = 0x14
    
InGame = GameState > MainMenu
// $02010B: [16-bit] Screen ID; this can mostly be used as a level identifier. "Screens" consist of multiple rooms; a typical SMW level is just big with smooth scrolling, but this game forces level transition sorts of scrolls between rooms
//          0xc7 - Main menu
//          0x01 - First world
//          0x02 - Cloud level - up until the scrolling screen
//          0x03 - Cloud level -  scrolling screen
//          0x04 - Castle level
//          0x05 - Transition into the lava climb level
//          0x06 - Lava climb level
//          0x07 - Portrait room before boss
//          0x08 - Boss
//          0x09 - Credits
//          0x25 - Secret needle platforming screen
//          0x26 - Secret needle reward screen
ScreenID = byte(0x2010B)
    MainMenuScreen = 0xc7
    Beginning = 1
    Cloud1 = 2
    Cloud2 = 3
    Castle = 4
    prevLava = 5
    Lava = 6
    Portrait = 7
    Boss = 8
    Credits = 9
    Secret = 0x25
    SecretWin = 0x26
ScreenRP = {
    1:"is learning the ropes in the beginning area",
    2:"is flying high in the cloud area",
    3:"is going the distance in the cloud area",
    4:"is braving the dangers of the castle area",
    5:"is falling into a bit of danger",
    6:"is climbing for their life in the lava climb area",
    7:"is admiring the greats in the portrait hallway",
    8:"is locked in battle with a deadly fruit",
    9:"has become the ROM hack",
    0x25:"is trying to prove their needle skills",
    0x26:"has proved their needle skills",
    0xc7:"is on the main menu"
}
// $020DC4: [8-bit] Room ID in relation to X; lower is left
//          0x00 - Beginning secret (y:0x00, screen ID 0x01); prev x: 0x01
//          0x02 - Beginning initial room
//          0x05 - Castle secret (y:0x00, screen ID 0x04); prev x: 0x04
RoomX = byte(0x20DC4)
// $020DC6: [8-bit] Room ID in relation to Y; lower is up
RoomY = byte(0x20DC6)
BeginningSecret = prev(RoomX) == 1 && RoomX == 0 && RoomY == 0 && ScreenID == Beginning
CastleSecret = prev(RoomX) == 4 && RoomX == 5 && RoomY == 0 && ScreenID == Castle
// $020DD9: [8-bit] Boss HP display
//          0xa0 - Full
//          0x50 - Half (phase 2)
//          0xff - Dead
BossDead = prev(byte(0x20DD9)) != 0xFF && byte(0x20DD9) == 0xFF
// $020F42: [8-bit] Boss checkpoint status
//          0x00 - Not fighting
//          0x01 - Fight engaged; stays this value when dying
//          0x02 - Midway checkpoint active
BossCheckpoint = byte(0x20F42)
    BeforeFight = 0
    Fighting = 1
    BossMidway = 2
// $02A403: [16-bit] Current checkpoint
//          0x00 - Main menu
//          0x01 - Game start; no checkpoint picked up
//          0x216- Forest area; first checkpoint picked up
//          0x205 - Forest area; last checkpoint
//          0x206 - Cloud area; first checkpoint
//          0x20a - Cloud area; last checkpoint
//          0x20b - Castle area; first checkpoint
//          0x213 - Castle area; last checkpoint
//          0x214 - Lava climb
//          0x215 - Portrait room/checkpoint after beating boss (credits)
//          0x217 - Boss
//          0x200 - Secret level; outside
//          0x425 - Secret level
Checkpoint = word(0x2A403)
    GameStart = 1
// $02A420: [8-bit] Deaths; ten thousands place (x10,000)
// $02A421: [8-bit] Deaths; thousands place (x1,000)
// $02A422: [8-bit] Deaths; hundreds place (x100)
// $02A423: [8-bit] Deaths; tens place (x10)
// $02A424: [8-bit] Deaths; ones place (x1)
Dead = prev(byte(0x02A424)) != byte(0x02A424)
TotalDeaths = (byte(0x02A424)) + (byte(0x2A423) * 10) + (byte(0x2A422) * 100) + (byte(0x2A421) * 1000) + (byte(0x2A420) * 10000)
// $03A002: [16-bit] Checkpoint of saved game
PlatformingStart = Checkpoint == GameStart && GameState == Active && RoomX == 0x02 && RoomY == 0x00 && ScreenID == Beginning
DeathlessStart = GameState == Active && RoomX == 0x02 && RoomY == 0x00 && ScreenID == Beginning

//Achievements
achievement(
    title="Humbling Beginnings",points=5,type="progression",
    description="Clear the beginning area.",
    trigger=InGame && prev(ScreenID) == Beginning && ScreenID == Cloud1
)
achievement(
    title="Head in the Clouds",points=5,type="progression",
    description="Clear the cloud area.",
    trigger=InGame && prev(ScreenID) == Cloud2 && ScreenID == Castle
)
achievement(
    title="Storming the Castle",points=10,type="progression",
    description="Clear the castle area.",
    trigger=InGame && prev(ScreenID) == Castle && ScreenID == prevLava
)
achievement(
    title="Climb for Your Life",points=5,type="progression",
    description="Clear the lava climb area.",
    trigger=InGame && prev(ScreenID) == Lava && ScreenID == Portrait
)
achievement(
    title="My Heart is Thwomping",points=10,type="progression",
    description="Reach the checkpoint in the boss fight.",
    trigger=InGame && ScreenID == Boss && prev(BossCheckpoint) == Fighting && BossCheckpoint == BossMidway
)
achievement(
    title="Delicious Taste of Victory",points=25,type="win_condition",
    description="Defeat the Hell Fruit and become The ROM Hack.",
    trigger=InGame && prev(ScreenID) == Boss && ScreenID == Credits
)
achievement(
    title="True Fangame Experience",points=50,
    description="Defeat the Hell Fruit without using a checkpoint.",
    trigger=InGame && prev(ScreenID) == Boss && trigger_when(ScreenID == Credits) &&
            once(BossCheckpoint == Fighting && ScreenID == Boss && GameState == Active) &&
            never(Dead) && never(ScreenID == MainMenuScreen)
)
achievement(
    title="Living Legend",points=10,
    description="Clear the beginning area without dying.",
    trigger=InGame && prev(ScreenID) == Beginning && trigger_when(ScreenID == Cloud1) &&
            once(DeathlessStart) && never(Dead) && never(ScreenID == MainMenuScreen)
)
achievement(
    title="Miyamoto Marathon",points=25,
    description="Rush to the portrait hallway from the start of the game within 8 minutes.",
    trigger=InGame && trigger_when(prev(ScreenID) == Lava && ScreenID == Portrait) &&
            once(PlatformingStart) && never(tally(28801, once(PlatformingStart) && always_true())) &&
            never(ScreenID == MainMenuScreen)
)
achievement(
    title="Threading the Needle",points=10,
    description="Find and complete the secret area.",
    trigger=InGame && prev(ScreenID) == Secret && ScreenID == SecretWin
)
achievement(
    title="Secret Within a Secret",points=1,
    description="Find the secret portrait in the beginning area.",
    trigger=InGame && BeginningSecret
)
achievement(
    title="Keyhole in the Cracks",points=1,
    description="Find the secret portrait in the castle area.",
    trigger=InGame && CastleSecret
)
//Leaderboards
leaderboard(
    title  = "Full Game [Single Session/RTA] - Any%",
    description = "Complete the entire game as fast as you can.",
    start  = PlatformingStart,
    cancel = ScreenID == MainMenuScreen,
    submit = InGame && ScreenID == Boss && BossDead,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)
leaderboard(
    title  = "Full Game [Single Session/RTA] - Deaths",
    description = "Complete the entire game with as few deaths as you can.",
    start  = once(PlatformingStart) && InGame && ScreenID == Boss && BossDead,
    cancel = always_false(),
    submit = always_true(),
    value  = TotalDeaths,
    format = "VALUE", lower_is_better = true
)
leaderboard(
    title  = "Miyamoto Marathon",
    description = "Rush to the portrait hallway from the start of the game as fast as you can.",
    start  = PlatformingStart,
    cancel = ScreenID == MainMenuScreen,
    submit = InGame && prev(ScreenID) == Lava && ScreenID == Portrait,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    title  = "Miyamoto Marathon - Deaths",
    description = "Rush to the portrait hallway from the start of the game with as few deaths as you can.",
    start  = once(PlatformingStart) && InGame && prev(ScreenID) == Lava && ScreenID == Portrait && never(ScreenID == MainMenuScreen),
    cancel = always_false(),
    submit = always_true(),
    value  = TotalDeaths,
    format = "VALUE", lower_is_better = true
)
leaderboard(
    title  = "Hell Fruit",
    description = "Defeat the Hell Fruit as fast as you can.",
    start  = ScreenID == Boss && GameState == Active && BossCheckpoint == Fighting,
    cancel = __ornext(ScreenID == MainMenuScreen || (Dead && BossCheckpoint == Fighting)),
    submit = InGame && ScreenID == Boss && BossDead,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)
leaderboard(
    title  = "Full Game [Saves Allowed] - Deaths",
    description = "Complete the entire game with as few deaths as you can.",
    start  = InGame && ScreenID == Boss && BossDead,
    cancel = always_false(),
    submit = always_true(),
    value  = TotalDeaths,
    format = "VALUE", lower_is_better = true
)
//RP
rich_presence_conditional_display(InGame,"The Kid {0} • 💀[{1}]",
        rich_presence_lookup("Stage",ScreenID,ScreenRP),
        rich_presence_value("Digit",TotalDeaths,format="VALUE")
)
rich_presence_display("The Kid is on the menus")
        