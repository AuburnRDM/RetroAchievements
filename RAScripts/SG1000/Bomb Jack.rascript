// Bomb Jack
// #ID = 13950

// $0000: [8-bit] Pause status
//        Bit0 - Active
Pause = bit0(0x00)
// $0010: [8-bit] Frame timer for how much longer enemies stay frozen from "P" power-up
// $0011: [8-bit] Enemy combo while under "P" power-up; resets to 0x00 when next "P" power-up is collected
EnemyCombo = byte(0x11)
// $001C: [8-bit] Player's Y-position; lower is up
// $001D: [8-bit] Player's X-position; lower is left
// $0054: [24-Bit BCD] High Score
//        - Ones place is always 0 in-game and not represented in this value; multiply by 10 for the true score
HighScore = bcd(tbyte(0x54))
// $0057: [8-bit] Current Round selected via Round Select; disappears after starting the game
RoundSelect = byte(0x57)
// $0059: [8-bit] Regarding 2-Player Mode
//        Bit7 - 2P Mode active; switches off when 1P runs out of lives
//        Bit0 - 2P in control; switches off when 1P in control
TwoPlayerMode = bit7(0x59) == 1
TwoPlayerActive = bit0(0x59) == 1
// $005A: related to bonus pointsppp
// $005B: [24-Bit BCD] Score of current player
//        - Ones place is always 0 in-game and not represented in this value; multiply by 10 for the true score
CurrentScore = bcd(tbyte(0x5b))
// $005E: [8-bit] Total number of Fire Bombs collected in the current Round (Max: 0x17)
//        - Value goes to 0x19 when collecting a "C" coin
FireBombs = byte(0x5e)
// $005F: [8-bit] Progress towards "P" power-up spawn
//        - Normal bomb increments by 0x01
//        - Fire bomb increments by 0x02
//        - "P" power-up appears at 0x10; value resets to 0x00 after collecting the power-up and does not increment again until the power-up wears off
// $0060: [8-bit] Total number of Bombs remaining in the current Round; starts at 0x18
BombsRemaining = byte(0x60)
All = 0x18
// $0061: [8-bit] Remaining lives
Lives = byte(0x61)
// $0063: [8-bit] Current Multiplier (Max: 0x05)
Multiplier = byte(0x63)
// $0064: [8-bit] Current Round
//        - There are 50 rounds and this value loops back to 0x29 (Round 41) when reaching "Round 51" on the display value at 0x0065; this repeats every 10 levels
Round = byte(0x64)
// $0065: [8-bit BCD] Round displayed on the screen; differs from current Round value at 0x64 after Round 50
RoundDisplay = bcd(byte(0x65))
// $0066: start of sprite data
// $00C6: 80 when level starting
// $03FE: [8-bit] Game State
//        0x00 - Booting / SEGA logo
//        0x01 / 0x38 - Main Menu (Can flicker between these values on the Main Menu)
//        0x02 - Loading Demo
//        0x03 - Demo
//        0x04 - Playing
GameState = byte(0x3fe)
Boot = 0
MainMenu = 1
MainMenu2 = 38
Demo = 3
Active = 4

InGame = prev(GameState) == Active && GameState == Active

LevelBlock = {
    "1":{"titleProg":"Desert Heat","titleBomb":"Bombs of the Sphinx","titleSpeed":"Short Fuse I", 
        "points":5,"pointsBomb":10,"pointsSpeed":10, "start":1, "last":10, "firebombtarget":22, "speedDesc":"3 minutes","speedrun":10801},
    "11":{"titleProg":"Chariots of Fire","titleBomb":"Bombs in The Parthenon","titleSpeed":"Short Fuse II", 
        "points":5,"pointsBomb":10,"pointsSpeed":10, "start":11, "last":20, "firebombtarget":22, "speedDesc":"3 minutes and 15 seconds", "speedrun":11701},
    "21":{"titleProg":"Royal Flames","titleBomb":"Bombs in the Castle","titleSpeed":"Short Fuse III", 
        "points":5,"pointsBomb":10,"pointsSpeed":10, "start":21, "last":30, "firebombtarget":21, "speedDesc":"3 minutes and 30 seconds","speedrun":12601},
    "31":{"titleProg":"Tense Situations","titleBomb":"Bombs in the City","titleSpeed":"Short Fuse IV", 
        "points":5,"pointsBomb":10,"pointsSpeed":10, "start":31, "last":40, "firebombtarget":20, "speedDesc":"3 minutes and 30 seconds","speedrun":12601},
    "41":{"titleProg":"California Sun","titleBomb":"Bombs on the Horizon","titleSpeed":"Short Fuse V", 
        "points":10,"pointsBomb":25,"pointsSpeed":25, "start":41, "last":50, "firebombtarget":20, "speedDesc":"3 minutes and 45 seconds","speedrun":13501}
}

level_array = [1,11,21,31,41]

function Progression(start,last) => InGame && once(GameState == Active && RoundDisplay == start && BombsRemaining == All) 
        && prev(RoundDisplay) == last && RoundDisplay == last + 1 && never(prev(GameState) != Active) && never(Lives == 0)
    
function ProgressionTrigger(start,last) => InGame && once(GameState == Active && RoundDisplay == start && BombsRemaining == All) 
        && trigger_when(prev(RoundDisplay) == last && RoundDisplay == last + 1) && never(prev(GameState) != Active) && never(Lives == 0)
    
function ProgAchievement(startround) { achievement(
    title = LevelBlock[startround]["titleProg"], points = LevelBlock[startround]["points"],
    description = "Beat rounds " + LevelBlock[startround]["start"] + "-" + LevelBlock[startround]["last"] + " without getting a game over.",
    trigger = Progression(LevelBlock[startround]["start"],LevelBlock[startround]["last"])
    )
}
    
//progression achievements
for level_array in LevelBlock
    ProgAchievement(level_array)
    
function BombAchievement(startround) { achievement(
    title = LevelBlock[startround]["titleBomb"], points = LevelBlock[startround]["pointsBomb"],
    description = "Beat rounds " + LevelBlock[startround]["start"] + "-" + LevelBlock[startround]["last"] + " while collecting " + LevelBlock[startround]["firebombtarget"] +
        " or more fire bombs in each round without getting a game over.",
    trigger = ProgressionTrigger(LevelBlock[startround]["start"],LevelBlock[startround]["last"]) &&
        trigger_when(tally(10,
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"] && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+1 && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+2 && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+3 && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+4 && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+5 && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+6 && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+7 && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+8 && FireBombs >= LevelBlock[startround]["firebombtarget"]),
            once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"]+9 && FireBombs >= LevelBlock[startround]["firebombtarget"]))) &&
        never(BombsRemaining != 0 && BombsRemaining + FireBombs < LevelBlock[startround]["firebombtarget"]) &&
        never(prev(Round) != Round && prev(BombsRemaining) > 0) && 
        never(TwoPlayerActive)
)}

//firebomb achievements
for level_array in LevelBlock
    BombAchievement(level_array)

function SpeedAchievement(startround) {achievement(
    title = LevelBlock[startround]["titleSpeed"], points = LevelBlock[startround]["pointsSpeed"],
    description = "Beat rounds " + LevelBlock[startround]["start"] + "-" + LevelBlock[startround]["last"] + " in " + LevelBlock[startround]["speedDesc"] +
        " or less without getting a game over.",
    trigger = ProgressionTrigger(LevelBlock[startround]["start"],LevelBlock[startround]["last"]) &&
        never(repeated(LevelBlock[startround]["speedrun"], once(GameState == Active && RoundDisplay == LevelBlock[startround]["start"] && BombsRemaining == All)
        && always_true())) && disable_when(TwoPlayerActive, GameState != 4)
)}

//speedrun achievements

for level_array in LevelBlock
    SpeedAchievement(level_array)

achievement(
    title = "Mighty Bomb Jack", points = 25,
    description = "Beat rounds 1-50 without getting a game over.",
    trigger = InGame && once(GameState == Active && RoundDisplay == 1 && BombsRemaining == All) 
        && trigger_when(prev(RoundDisplay) == 50 && RoundDisplay == 51) && never(prev(GameState) != Active) && never(Lives == 0) && 
        disable_when(TwoPlayerActive, GameState != 4)
)

achievement(
    title = "Bomb Collector", points = 5,
    description = "Achieve a score of 500,000 points or more.",
    trigger = InGame && prev(CurrentScore) < 50000 && CurrentScore >= 50000
)
achievement(
    title = "Bomb Hoarder", points = 10,
    description = "Achieve a score of 1,000,000 points or more.",
    trigger = InGame && prev(CurrentScore) < 100000 && CurrentScore >= 100000
)

achievement(
    title = "Big Money", points = 2,
    description = "Reach a x5 score multiplier.",
    trigger = InGame && prev(Multiplier) > 0 && prev(Multiplier) < 5 && Multiplier == 5
)
achievement(
    title = "The Bomb Squad", points = 5,
    description = "Have 5 extra lives at once.",
    trigger = InGame && prev(Lives) == 5 && Lives == 6
)
achievement(
    title = "Monster Combo", points = 5,
    description = "Defeat 8 enemies in a single 'P' power-up.",
    trigger = InGame && prev(EnemyCombo) == 7 && EnemyCombo == 8
)
achievement(
    title = "He's On Fire", points = 2,
    description = "Collect all 23 fire bombs in a single round and obtain the maximum bonus.",
    trigger = InGame && prev(FireBombs) == 22 && FireBombs == 23
)
achievement( // test this
    title = "Lucky Player", points = 2,
    description = "Collect the 'S' token and learn how to use the round select.",
    trigger = InGame && RoundDisplay > prev(RoundDisplay) && prev(BombsRemaining) > 0 && prior(FireBombs) != 0x19
)
achievement(
    title = "Coin Collector", points = 4,
    description = "Collect the 'C' token and automatically finish the round with a massive bonus.",
    trigger = InGame && prev(FireBombs) < 0x19 && FireBombs == 0x19
)

leaderboard(
    title="Bomb Hoarder",
    description="Score as many points as you can.",
    start= InGame && prev(Lives) == 1 && Lives == 0,
    cancel=always_false(),
    submit=always_true(),
    value=CurrentScore * 10,
    format="VALUE",
    lower_is_better= false
)

leaderboard(
    title="Mighty Bomb Jack",
    description="Beat rounds 1-50 without a game over as fast as you can.",
    start=GameState == Active && RoundDisplay == 1 && BombsRemaining == All,
    cancel=__ornext(prev(GameState) != Active || Lives == 0 || TwoPlayerActive),
    submit=prev(RoundDisplay) == 50 && RoundDisplay == 51,
    value=always_true(),
    format="FRAMES",
    lower_is_better= true
)

function SpeedLeaderboard(startround) { leaderboard(
    title=LevelBlock[startround]["titleSpeed"],
    description="Beat rounds " + LevelBlock[startround]["start"] + "-" + LevelBlock[startround]["last"] + " without a game over as fast as you can.",
    start=GameState == Active && RoundDisplay == LevelBlock[startround]["start"] && BombsRemaining == All,
    cancel=__ornext(prev(GameState) != Active || Lives == 0 || TwoPlayerActive),
    submit=prev(RoundDisplay) == LevelBlock[startround]["last"] && RoundDisplay == LevelBlock[startround]["last"] + 1,
    value=always_true(),
    format="FRAMES",
    lower_is_better= true
)}

for level_array in LevelBlock
    SpeedLeaderboard(level_array)
    
rich_presence_conditional_display(GameState == Active, "Jack is defusing bombs on Round {0} • Score: {1} • Lives: {2}",
        rich_presence_value("Digit", RoundDisplay, format="VALUE"),
        rich_presence_value("Digit", CurrentScore * 10, format="VALUE"),
        rich_presence_value("Digit", Lives, format="VALUE")
)
rich_presence_conditional_display(GameState == Demo || GameState == 2, "Jack is putting on a show during the demo play")
rich_presence_display("Jack is on the menus • High Score: {0}",
        rich_presence_value("Digit", HighScore * 10, format="VALUE")
)