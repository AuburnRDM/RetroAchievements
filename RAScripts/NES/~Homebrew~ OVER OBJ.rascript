// ~Homebrew~ OVER OBJ
// #ID = 26983

// $0016: [bitflags] Debug options
//        Bit7 - Muteki (invincibility)
//        Bit6 - Heranai (lives not consumed)
//        Bit5 - Stage Select
Invincibility = bit7(0x16) == 1
InfiniteShips = bit6(0x16) == 1
InvincibilityLookup = {
    0:"",
    1:" with invincibility"
}
//        [Lower4] Number of starting extra ships (Default: 2)
StartingShips = low4(0x16)
// $0052: [8-bit] BGM selected in debug options
// $0053: [8-bit] SE selected in debug options
// $00B5: [8-bit] Ship X-position; left is lower
//        0x0c - Left bound
//        0xf4 - Right bound
ShipX = word(0xb5)
// $00B6: [8-bit] Ship Y-position; up is lower
//        0x1e - Upper bound
//        0xdc - Lower bound
ShipY = word(0xb6)
// $00B9: [Upper4] Type of main menu active
//        0x0 - Debug options
//        0x1 - Normal
//        0x2 - Debug options selectable (after code is entered)
MenuType = high4(0xb9)
Normal = 1
Debug = 2
//        [Lower4] Menu cursor position
// $0142: [16-bit] Boss HP - Stage 2
// $0178: stage 3 hp 2
// $0181: boss 3 hp
// $018A: [16-bit] Boss HP - Stage 1
// $01DA: some timer for boss status
// $01DB: [8-bit] Mid-boss/Boss status
//        0x00 - Not visible
//        0x01 - Visible
//        0x02 - First attack pattern
//        ... rest depending on fight
// $0603: [16-bit] Time in current level (frames)
LevelTimer = word(0x603)
// $0605: [8-bit] Some sort of game state/area identifier
//        0x01 - Loading
//        0x02~0x08 - WARNING flashing for boss approaching
//        0x08 - Boss about to spawn (after warning stops flashing)
//        0x09 - Boss defeated; stage results / intro to stage
//        0x0a - Main menu
//        0x0b - Game over
//        0x0c - Stage 1 special intro
//        0x0d - Stage 1 begins / final section before boss
//        0x0e - Stage 1 blue ships
//        0x0f - Stage 1 section after ships
//        0x10 - Boss 1 appears
//        0x11 - Stage 2 begins / after mid-boss
//        0x12 - Stage 2 mid-boss
//        0x13 - Stage 2 boss
//        0x14 - Stage 3 begins / final section before boss
//        0x15 - Stage 3 mid-boss
//        0x16 - Stage 3 after mid-boss
//        0x17 - Stage 3 boss (previous value 0x18) - double check
//        0x1a - Stage 3 boss is spawning; counts down to 0x17
//        0x1b - Stage 4 begins / after mid-boss
//        0x1c - Stage 4 mid-boss
//        0x1d - Stage 4 boss (previous value 0x1e)
//        0x20 - Stage 4 boss is spawning; counts down to 0x1d
//        0x21 - Stage 5 begins
//        0x22 - Stage 5 section 2
//        0x24 - Stage 5 section 3
//        0x23 - Stage 5 section 4
//        0x25 - Stage 5 boss
//        0x26 - Stage 6 begins
//        0x0d - Stage 6 'snake' before boss (previous value 0x08)
//        0x28 - Stage 6 boss phase 1
//        0x29 - Stage 6 boss phase 2
//        0x2a~0x2b - Cutscene after final boss
//        0x2c~0x2f - Credits
//        0x30~0x33 - Final scene
//        0x35 - Intro scene
//        0x36 - Thank you for playing
//        0xff - Booting the game
RPScreen ={
    0x0a:"On the Main Menu",
    0x0b:"On the Game Over screen",
    0x35:"Watching the Intro",
    0xff:"On the Main Menu"
}
GameState = byte(0x605)
MainMenu = 0x0a
GameOver = 0x0b
Booting = 0xff
// $0606: changes to 0x04 when warning boss sign flashing
// $060C: [8-bit] Current stage
Stage = byte(0x60c)
// $060D: [24-bit BCD] Current score; ones digit is always 0, multiply by 10 for true score
Score = bcd(tbyte(0x60d)) * 10
// $0610: [24-bit BCD] Last score (ignores demo play); ones digit is always 0, multiply by 10 for true score
LastScore = bcd(tbyte(0x610)) * 10
// $0616: [8-bit] X-position of ship when bullet #4 is fired
// $0617: All bullet data works as follows:
//        - Bullet #1 is always the first to be shot and the rest fire in sequence
//        - There are a maximum of 4 bullets on screen at a time
//        ------
//        [8-bit] Y-position of bullet #4
//        0xff - Bullet #4 is not active
// $0618: [8-bit] Number of frames left for bullet #4 to travel if still active;
//        - Number stops counting when bullet is absorbed or goes off screen
//        - Starts at 0x14, reaches 0 if shot from the bottom and bullet goes off screen
// $0619: [8-bit] X-position of ship when bullet #3 is fired
// $061A: [8-bit] Y-position of bullet #3
//        0xff - Bullet #3 is not active
// $061B: [8-bit] Number of frames left for bullet #3 to travel if still active;
//        - Number stops counting when bullet is absorbed or goes off screen
//        - Starts at 0x14, reaches 0 if shot from the bottom and bullet goes off screen
// $061C: [8-bit] X-position of ship when bullet #2 is fired
// $061D: [8-bit] Y-position of bullet #2
//        0xff - Bullet #2 is not active
// $061E: [8-bit] Number of frames left for bullet #2 to travel if still active;
//        - Number stops counting when bullet is absorbed or goes off screen
//        - Starts at 0x14, reaches 0 if shot from the bottom and bullet goes off screen
// $061F: [8-bit] X-position of ship when bullet #1 is fired
// $0620: [8-bit] Y-position of bullet #1
//        0xff - Bullet #1 is not active
Bullet1 = byte(0x620)
ShotsFired = Bullet1 != 0xff
// $0621: [8-bit] Number of frames left for bullet #1 to travel if still active;
//        - Number stops counting when bullet is absorbed or goes off screen
//        - Starts at 0x14, reaches 0 if shot from the bottom and bullet goes off screen
// $0622: [bitflags] Ship status
//        Bit7 - Ship destroyed / invincibility active from cheats
//        Bit6 - Ship respawning
//        Bit5 - Bombing (invincible)
//        Bit4 - Locked in for level complete
//        [Lower4] Extra ships remaining
ShipDestroyed = bit7(0x622)
ShipRespawn = bit6(0x622)
BombUsed = bit5(0x622)
LevelComplete = prev(bit4(0x622)) == 0 && bit4(0x622) == 1
ExtraShips = low4(0x622)
// $0624: [8-bit] Cutscene / Demo mode
//        Bit0 - Demo mode active
//        Bit7 - Cutscene active (start of Stage 1, ending, credits); persists to main menu after winning game and turns off when starting another stage
DemoActive = bit0(0x624) == 1
// $0626: [Upper4] Starting bombs after respawn
//        [Lower4] Current number of bombs
CurrentBombs = low4(0x626)
// $07F0: [8-bit] Stage to continue from; also used for level select
// $07F1: [24-bit BCD] High score; ones digit is always 0, multiply by 10 for true score
HighScore = bcd(tbyte(0x7f1)) * 10

Protection = !Invincibility && !InfiniteShips && !DemoActive && GameState != MainMenu && GameState != Booting && StartingShips <= 2
ChallengeProtection = never(Invincibility) && !DemoActive && GameState != MainMenu && GameState != Booting

StageData = {
    1:{"titleBeat":"A Looming Threat","titleChallenge":"Warming Up", "pointsBeat":5, "pointsChallenge":10, "start":0xd,"preboss":0x08, "boss":0x10},
    2:{"titleBeat":"In the Trenches","titleChallenge":"Fierce Fighter", "pointsBeat":5, "pointsChallenge":10, "start":0x11,"preboss":0x08, "boss":0x13},
    3:{"titleBeat":"Behind Enemy Lines","titleChallenge":"Going with the Flow", "pointsBeat":10, "pointsChallenge":10, "start":0x14,"preboss":0x08, "boss":0x1a},
    4:{"titleBeat":"Bite the Bullet","titleChallenge":"Ace in the Black Hole", "pointsBeat":10, "pointsChallenge":25, "start":0x1b,"preboss":0x20, "boss":0x1f},
    5:{"titleBeat":"On the Verge of Victory","titleChallenge":"Unstoppable Force", "pointsBeat":10, "pointsChallenge":25, "start":0x21,"preboss":0x08, "boss":0x25},
    6:{"titleBeat":"I'll Be Waiting","titleChallenge":"They Never Stood a Chance", "pointsBeat":25, "pointsChallenge":50, "start":0x26,"preboss":0x0d, "boss":0x28}
}

//Achievements
achievement(
        title= "Hidden Tools", points = 0,
        description="Access the debug options by holding B on the main menu and pressing Right x9, Up x2, Left x2, Down x9. Default or less ships required for many achievements. Stage select is allowed and other cheats are blocked unless noted.",
        trigger = GameState == MainMenu && prev(MenuType) == Normal && MenuType == Debug
)

function StageClear(stage) { 
    achievement(
        title=StageData[stage]["titleBeat"], points=StageData[stage]["pointsBeat"],
        description= "Clear Stage " + stage + ".",
        trigger= Protection && Stage == stage && LevelComplete
    )
}
//Progression cheevos
for i in range(1,6)
    StageClear(i)

function StageChallenge(stage) { 
    achievement(
        title=StageData[stage]["titleChallenge"], points=StageData[stage]["pointsChallenge"],
        description= "Clear Stage " + stage + " without getting hit or using a bomb. [Heranai OK]",
        trigger= ChallengeProtection && Stage == stage && trigger_when(LevelComplete) &&
            once(prev(GameState) == 0x09 && GameState == StageData[stage]["start"]) &&
            never(ShipDestroyed == 1) && never(BombUsed == 1) && never(Stage != stage)
    )
}
//Challenge cheevos except for 6
for i in range(1,5)
    StageChallenge(i)
    
achievement(
        title=StageData[6]["titleChallenge"], points=StageData[6]["pointsChallenge"],
        description= "Clear Stage 6 without getting hit. [Heranai OK]",
        trigger= ChallengeProtection && Stage == 6 && trigger_when(LevelComplete) &&
            once(prev(GameState) == 0x09 && GameState == StageData[6]["start"]) &&
            never(ShipDestroyed == 1) && never(Stage != 6)
)

achievement(
        title="No Firepower Necessary", points=10,
        description="Reach the boss of Stage 1 without shooting or using a bomb.",
        trigger= Protection && Stage == 1 && trigger_when(prev(GameState) == 0x08 && GameState == 0x10) &&
            once(prev(GameState) == 0x09 && GameState == StageData[1]["start"]) &&
            never(ShotsFired) && never(BombUsed == 1) && never(Stage != 1) && never(GameState == GameOver) && never(Invincibility)
)

// boss cheevos here
achievement(
        title="Shot Sidestepper", points = 5,
        description="Time out the Stage 1 boss without getting hit, shooting, or using a bomb. [Heranai OK]",
        trigger= ChallengeProtection && Stage == 1 && trigger_when(LevelComplete) &&
            once(prev(GameState) == 0x08 && GameState == 0x10) &&
            never(ShipDestroyed == 1) && never(BombUsed == 1) && never(Stage != 1) && never(ShotsFired)
)
achievement(
        title="Fancy Flying", points = 10,
        description="Time out the Stage 2 boss without getting hit, shooting, or using a bomb. [Heranai OK]",
        trigger= ChallengeProtection && Stage == 2 && trigger_when(LevelComplete) &&
            once(prev(GameState) == 0x08 && GameState == 0x13) &&
            never(ShipDestroyed == 1) && never(BombUsed == 1) && never(Stage != 2) && never(ShotsFired)
)
achievement(
        title="Bullet Ballet", points = 10,
        description="Time out the Stage 3 boss without getting hit, shooting, or using a bomb. [Heranai OK]",
        trigger= ChallengeProtection && Stage == 3 && trigger_when(LevelComplete) &&
            once(prev(GameState) == 0x08 && GameState == 0x1a) &&
            never(ShipDestroyed == 1) && never(BombUsed == 1) && never(Stage != 3) && never(ShotsFired)
)
achievement(
        title="Up Close and Personal", points = 10,
        description="Defeat the Stage 4 boss within 1 minute without getting hit or using a bomb. [Heranai OK]",
        trigger= ChallengeProtection && Stage == 4 && trigger_when(LevelComplete) &&
            once(prev(GameState) == 0x20 && GameState == 0x1f) &&
            never(ShipDestroyed == 1) && never(BombUsed == 1) && never(Stage != 4) && 
            never((tally(3601,once(prev(GameState) == 0x20 && GameState == 0x1f) && always_true())))
)
achievement(
        title="Danmaku Dancer", points = 10,
        description="Time out the Stage 5 boss without getting hit, shooting, or using a bomb. [Heranai OK]",
        trigger= ChallengeProtection && Stage == 5 && trigger_when(LevelComplete) &&
            once(prev(GameState) == 0x08 && GameState == 0x25) &&
            never(ShipDestroyed == 1) && never(BombUsed == 1) && never(Stage != 5) && never(ShotsFired)
)
achievement(
        title="Stay on Target", points = 10,
        description="Defeat the sphere phase of the Stage 6 boss within 1 minute and 15 seconds without getting hit or using more than 1 bomb. [Heranai OK]",
        trigger= ChallengeProtection && Stage == 6 && trigger_when(prev(GameState) == 0x28 && GameState == 0x29) &&
            once(prev(GameState) == 0x0d && GameState == 0x28) &&
            never(ShipDestroyed == 1) && never(GameState == 0x28 && repeated(2,BombUsed > prev(BombUsed))) && never(Stage != 6) && 
            never((tally(4501,once(prev(GameState) == 0x0d && GameState == 0x28) && always_true())))
)
achievement(//issue with ship destroyed
        title="At All Costs", points = 25,
        description="Defeat the ship phase of the Stage 6 boss within 1 minute and 30 seconds. [Heranai OK]",
        trigger= ChallengeProtection && Stage == 6 && trigger_when(LevelComplete) &&
            once(prev(GameState) == 0x28 && GameState == 0x29) &&
            never(Stage != 6) && never(GameState == 0x0b || GameState == 0x0a) &&
            never((tally(5401,once(prev(GameState) == 0x28 && GameState == 0x29) && always_true())))
)
achievement(
        title="Steadfast Protector", points = 50,
        description= "Finish the entire game without getting a Game Over.",
        trigger = Protection && once(Stage == 1 && prev(GameState) == 0x09 && GameState == StageData[1]["start"]) &&
            trigger_when(Stage == 6 && LevelComplete) && never(GameState == GameOver) && never(GameState == MainMenu) && never(Invincibility)
)

achievement(
        title="First of Many", points = 5,
        description= "Score 100,000 points and earn an extra ship.",
        trigger= Protection && GameState != MainMenu && prev(Score) < 100000 && Score >= 100000
)
achievement(
        title="Minor Massacre", points = 10,
        description= "Score 250,000 points.",
        trigger= Protection && GameState != MainMenu && prev(Score) < 250000 && Score >= 250000
)
achievement(
        title="Pile of Ships", points = 10,
        description= "Score 500,000 points.",
        trigger= Protection && GameState != MainMenu && prev(Score) < 500000 && Score >= 500000
)
achievement(
        title="Celestial Savior", points = 25,
        description= "Score 1,000,000 points.",
        trigger= Protection && GameState != MainMenu && prev(Score) < 1000000 && Score >= 1000000
)

//Leaderboards
leaderboard(
        title="Celestial Savior",
        description="Score as many points as you can.",
        start= Protection && ((prev(GameState) != GameOver && prev(GameState) != 0x36 && GameState == GameOver) || (prev(GameState) == 01 && GameState == 0x2a)),
        cancel= always_false(),
        submit= always_true(),
        value=Score,
        format="VALUE",
        lower_is_better= false
)

function BossLeaderboard(stage) {
    leaderboard(
        title="Stage " + stage + " Boss",
        description="Defeat the Stage " + stage + " boss as fast as you can without getting hit or using a bomb. [Heranai OK]",
        start= ChallengeProtection && Stage == stage && prev(GameState) == StageData[stage]["preboss"] && GameState == StageData[stage]["boss"],
        cancel= __ornext(BombUsed == 1 || ShipDestroyed == 1 || GameState == MainMenu || GameState == GameOver),
        submit= LevelComplete,
        value= always_true(),
        format="FRAMES",
        lower_is_better= true
    )
}
//Speed leaderboard for stage 1-5 bosses
for i in range(1,5)
    BossLeaderboard(i)
    
leaderboard(
        title="Stage 6 Boss - Sphere",
        description="Defeat the sphere phase of the Stage 6 boss as fast as you can without getting hit or using more than 1 bomb. [Heranai OK]",
        start= ChallengeProtection && Stage == 6 && prev(GameState) == 0x0d && GameState == 0x28,
        cancel= __ornext((never(GameState == 0x0a) && GameState == 0x28 && repeated(2,BombUsed > prev(BombUsed))) || ShipDestroyed == 1 || GameState == MainMenu || GameState == GameOver),
        submit= prev(GameState) == 0x28 && GameState == 0x29,
        value= always_true(),
        format="FRAMES",
        lower_is_better= true
)
leaderboard(
        title="Stage 6 Boss - Ship",
        description="Defeat the ship phase of the Stage 6 boss as fast as you can. [Heranai OK]",
        start= ChallengeProtection && Stage == 6 && prev(GameState) == 0x28 && GameState == 0x29,
        cancel= __ornext(GameState == MainMenu || GameState == GameOver),
        submit= LevelComplete,
        value= GameState == 0x29,
        format="FRAMES",
        lower_is_better= true
)
//RP
rich_presence_conditional_display(GameState == 0x35, "Learning more about Objects in the Intro")
rich_presence_conditional_display(DemoActive, "Watching the demo play")
rich_presence_conditional_display(GameState == MainMenu || GameState == GameOver || GameState == 0xff, "{0} • Last Score: {1} • High Score: {2}",
        rich_presence_lookup("Screen", GameState, RPScreen),
        rich_presence_value("Digit", LastScore, format="VALUE"),
        rich_presence_value("Digit", HighScore, format="VALUE")
)
rich_presence_conditional_display((GameState >= 0x2a && GameState <= 0x33) || GameState == 0x36,"Saved Earth from the Object invasion • Final Score: {0}",
        rich_presence_value("Digit", Score, format="VALUE")
)
rich_presence_conditional_display(InfiniteShips, "Flying through Stage {0}{4} • Extra Ships: Infinite • Bombs: {2} • Score: {3}",
        rich_presence_value("Digit", Stage, format="VALUE"),
        rich_presence_value("Digit", ExtraShips, format="VALUE"),
        rich_presence_value("Digit", CurrentBombs, format="VALUE"),
        rich_presence_value("Digit", Score, format="VALUE"),
        rich_presence_lookup("Invincibility", bit7(0x16), InvincibilityLookup)
)
rich_presence_display("Flying through Stage {0}{4} • Extra Ships: {1} • Bombs: {2} • Score: {3}",
        rich_presence_value("Digit", Stage, format="VALUE"),
        rich_presence_value("Digit", ExtraShips, format="VALUE"),
        rich_presence_value("Digit", CurrentBombs, format="VALUE"),
        rich_presence_value("Digit", Score, format="VALUE"),
        rich_presence_lookup("Invincibility", bit7(0x16), InvincibilityLookup)
)