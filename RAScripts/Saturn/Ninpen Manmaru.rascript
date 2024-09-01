// Ninpen Manmaru
// #ID = 25007

// $1666B0: Minutes Remaining
Minutes = byte(0x1666B0)
// $1666B2: Seconds Remaining
Seconds = byte(0x1666B2)
// $1666B4: Frame Counter (30 FPS)
Frames = byte(0x1666B4) //30 fps
TimeCalculation = 36000 - (Minutes * 3600) - (Seconds * 60) - (60 - (Frames * 2))
BossTimeCalculation = 10800 - (Minutes * 3600) - (Seconds * 60) - (60 - (Frames * 2))
// $16673E: Animation
//          0x28 = Triple Jump
// $166745: Coins (Display)
// $166746: [8-bit] Coin chain status
//          b0 - Active
// $166747: [8-bit] Current coin chain; does not seem to actually do anything, but can be used to track coins picked up
// $166845: [8-bit] Thrown object status
//          b0 - Being destroyed when coming in contact with an enemy; usually adds coins if it's a small enemy
// $166859: [8-bit] Enemy status
//          b0 - Defeated
EnemyDefeated = bit0(0x166859) == 1
// $1677B0: Stage Coins Bits
// $167CB4: [8-bit] Game State
//          0x00 - Booting
//          0x01 - Opening movie
//          0x02 - Main Menu
//          0x03 - Main Menu - Continue selected
//          0x04 - Stage cutscene
//          0x05 - Stage introduction
//          0x06 - Stage loaded/playing
//          0x08 - Credits
//          0x09 - Game Over minigame
//          0x0a - Main Menu - New Game selected / Opening cutscene
//          0x0b - Ending cutscene
StateRP = {
    0:"Booting the game",
    1:"Watching the opening movie",
    2:"On the Main Menu",
    3:"On the Main Menu",
    4:"Watching the stage cutscene",
    5:"Being introduced to the next stage",
    6:"Playing the game",
    8:"Watching the credits",
    9:"Fighting Roberto for a continue", //check his name
    0x0a:"Getting ready to start a new adventure",
    0x0b:"Watching the final scene"
}
State = byte(0x167CB4)
    MainMenu = 2
    StageCutscene = 4
    StageIntro = 5
    InGame = 6
    ContinueMinigame = 9
    Credits = 8
    Ending = 0x0b
// $167CB6: [8-bit] Current area in stage
//          0x00 - Area 1
//          0x01 - Area 2
//          0x02 - Area 3
//          0x03 - Area 4
//          0x04 - Boss
Area = byte(0x167CB6) + 1
    Boss = 5
// $167CB7: [8-bit] Current stage
//          0x00 - Stage 1: Prancing Plains
//          0x01 - Stage 2: Galloping Grotto
//          0x02 - Stage 3: Bouncing Bridge
//          0x03 - Stage 4: Hopping Highlands
//          0x04 - Stage 5: A New Friend?
//          0x05 - Stage 6: Flipping Fortress
Stage = byte(0x167CB7) + 1
StageRP = {
    1:"Stage 1: Prancing Plains",
    2:"Stage 2: Galloping Grotto",
    3:"Stage 3: Bouncing Bridge",
    4:"Stage 4: Hopping Highlands",
    5:"Stage 5: A New Friend?",
    6:"Stage 6: Flipping Fortress"
}
BossRP = {
    1:"Tanutaro",
    2:"Monro",
    3:"Tsunejiro",
    4:"Ranko",
    5:"Kaede",
    6:"Nenga"
}
// $167CB8: [b0] Stage Clear
StageCleared = prev(bit0(0x167CB8)) == 0 && bit0(0x167CB8) == 1
// $167CB9: [b0] Stage Time Active
Timer = bit0(0x167CB9)
TimerActive = bit0(0x167CB9) == 1
// $167CBE: Health
Health = byte(0x167CBE)
// $167CBF: Lives
Lives = byte(0x167CBF)
// $167CC6: [8-bit] Power-up status
//          b0 - Active
PowerActive = bit0(0x167CC6) == 1
// $167CC7: Coins
Coins = byte(0x167CC7)
// $167CC9: Type of power-up active; 0x00 - None, 0xfc - No jump, 0xfd - No run, 0xfe - High jump 0xff - Fast run
// $167CE8: [8-bit] Manmaru death status
//          b0 - Dead
Dead = bit0(0x167CE8) == 1
// $167CEA: [8-bit] Boss' coins in boss encounters
BossCoins = byte(0x167CEA)
// $167CEB: [8-bit] Manmaru's coins in boss encounters
ManmaruCoins = byte(0x167CEB)

//tables
SpeedData = {
    1:{"title":"Jumping to New Heights","points":2,"target":"20","frames":1200,"stage":1,"area":1,"desc":"1-1"},
    2:{"title":"Sprinting Somersault","points":2,"target":"17","frames":1020,"stage":1,"area":2,"desc":"1-2"},
    3:{"title":"Go Around","points":2,"target":"30","frames":1800,"stage":1,"area":3,"desc":"1-3"},
    4:{"title":"Moving on Up","points":3,"target":"25","frames":1500,"stage":1,"area":4,"desc":"1-4"},
    6:{"title":"Straightforward Sprint","points":3,"target":"68","frames":4080,"stage":2,"area":1,"desc":"2-1"},
    7:{"title":"Pincer Attack","points":3,"target":"30","frames":1800,"stage":2,"area":2,"desc":"2-2"},
    8:{"title":"Spikes Galore","points":3,"target":"40","frames":2400,"stage":2,"area":3,"desc":"2-3"},
    9:{"title":"Looming Lava","points":3,"target":"50","frames":3000,"stage":2,"area":4,"desc":"2-4"},
    11:{"title":"Bridge is Out","points":5,"target":"30","frames":1800,"stage":3,"area":1,"desc":"3-1"},
    12:{"title":"Moving Marvel","points":5,"target":"40","frames":2400,"stage":3,"area":2,"desc":"3-2"},
    13:{"title":"Platform Propulsion","points":5,"target":"25","frames":1500,"stage":3,"area":3,"desc":"3-3"},
    14:{"title":"Against the Flow","points":5,"target":"30","frames":1800,"stage":3,"area":4,"desc":"3-4"},
    16:{"title":"Switching it Up","points":4,"target":"55","frames":3300,"stage":4,"area":1,"desc":"4-1"},
    17:{"title":"Watch Your Step","points":4,"target":"35","frames":2100,"stage":4,"area":2,"desc":"4-2"},
    18:{"title":"Mind the Gaps","points":4,"target":"36","frames":2160,"stage":4,"area":3,"desc":"4-3"},
    19:{"title":"Doing Laps","points":4,"target":"37","frames":2220,"stage":4,"area":4,"desc":"4-4"},
    21:{"title":"Gemless","points":5,"target":"46","frames":2760,"stage":5,"area":1,"desc":"5-1"},
    22:{"title":"Ice to Meet You","points":4,"target":"35","frames":2100,"stage":5,"area":2,"desc":"5-2"},
    23:{"title":"Legend of the Hidden Temple","points":4,"target":"65","frames":3900,"stage":5,"area":3,"desc":"5-3"},
    24:{"title":"Front to Back","points":5,"target":"70","frames":4200,"stage":5,"area":4,"desc":"5-4"},
    26:{"title":"Making the Leap","points":5,"target":"30","frames":1800,"stage":6,"area":1,"desc":"6-1"},
    27:{"title":"No Pain, No Gain","points":5,"target":"40","frames":2400,"stage":6,"area":2,"desc":"6-2"},
    28:{"title":"Perpetual Motion","points":5,"target":"40","frames":2400,"stage":6,"area":3,"desc":"6-3"},
    29:{"title":"Platform Perils","points":10,"target":"50","frames":3000,"stage":6,"area":4,"desc":"6-4"},
}

ProgData = {
    1:{"progTitle":"Plain and Simple","progPoints":5,"deathlessTitle":"Deathless I","deathlessPoints":5,"desc":"Stage 1: Prancing Plains"},
    2:{"progTitle":"In the Jungle","progPoints":5,"deathlessTitle":"King of the Jungle","deathlessPoints":10,"desc":"Stage 2: Galloping Grotto"},
    3:{"progTitle":"Bridge Constructor","progPoints":10,"deathlessTitle":"Stable Footing","deathlessPoints":10,"desc":"Stage 3: Bouncing Bridge"},
    4:{"progTitle":"Walking on Air","progPoints":10,"deathlessTitle":"Penguins Can Fly!","deathlessPoints":10,"desc":"Stage 4: Hopping Highlands"},
    5:{"progTitle":"Top of the Mountain","progPoints":10,"deathlessTitle":"Perfect Climb","deathlessPoints":10,"desc":"Stage 5: A New Friend?"},
    6:{"progTitle":"Final Destination","progPoints":25,"deathlessTitle":"Ninplatformer Manmaru","deathlessPoints":25,"desc":"Stage 6: Flipping Fortress and finish the game"}
}

CoinData = {
    1:{"coinTitle":"Collecting the Plains","coinPoints":5,"coinLevel":6,"coinTotal":23,"stage":1},
    2:{"coinLevel":8},
    3:{"coinLevel":5},
    4:{"coinLevel":4},
    6:{"coinTitle":"Collecting the Grotto","coinPoints":10,"coinLevel":35,"coinTotal":86,"stage":2},
    7:{"coinLevel":33},
    8:{"coinLevel":6},
    9:{"coinLevel":12},
    11:{"coinTitle":"Collecting the Bridge","coinPoints":25,"coinLevel":21,"coinTotal":69,"stage":3},
    12:{"coinLevel":17},
    13:{"coinLevel":18},
    14:{"coinLevel":13},
    16:{"coinTitle":"Collecting the Highlands","coinPoints":10,"coinLevel":28,"coinTotal":69,"stage":4},
    17:{"coinLevel":15},
    18:{"coinLevel":19},
    19:{"coinLevel":7},
    21:{"coinTitle":"Collecting the Mountain","coinPoints":10,"coinLevel":5,"coinTotal":48,"stage":5},
    22:{"coinLevel":16},
    23:{"coinLevel":15},
    24:{"coinLevel":12},
    26:{"coinTitle":"Collecting the Fortress","coinPoints":5,"coinLevel":18,"coinTotal":37,"stage":6},
    27:{"coinLevel":6},
    28:{"coinLevel":13},
    29:{"coinLevel":0},
}

//arrays
SpeedrunLevelArray = [1,2,3,4,6,7,8,9,11,12,13,14,16,17,18,19,21,22,23,24,26,27,28,29]
SpeedrunBossArray = [15,20]
CoinLevelArray = [1,6,11,16,21]
CoinBossArray = [5,25]

//ACHIEVEMENT FUNCTIONS
function ProgAchievement(stage) {
    achievement(
        title=ProgData[stage]["progTitle"], points=ProgData[stage]["progPoints"],
        description= "Complete " + ProgData[stage]["desc"] + ".",
        trigger = State == InGame && Stage == stage && Area == Boss && StageCleared
    )
}

function SpeedAchievement(stage) {
    achievement(
        title=SpeedData[stage]["title"], points=SpeedData[stage]["points"],
        description= "Clear stage " + SpeedData[stage]["desc"] + " within " + SpeedData[stage]["target"] + " seconds.",
        trigger= State == InGame && Stage == SpeedData[stage]["stage"] && Area == SpeedData[stage]["area"] && TimeCalculation <= SpeedData[stage]["frames"]
            && trigger_when(StageCleared)
    )
}
// something like coin > coin for x amount of times, reset when dying on that particular stage
//function CoinAchievement(stage) {
//    achievement(
//        title=CoinData[stage]["coinTitle"], points=CoinData[stage]["coinPoints"],
//        description= "Collect every coin in all areas before the boss in Stage " + CoinData[stage]["stage"] + ".",
//        trigger= State == InGame && Stage == CoinData[stage]["stage"] &&
//                    repeated(CoinData[stage]["coinLevel"],Coins > prev(Coins) && Area == 1 && !EnemyDefeated && never(Dead && Stage == CoinData[stage]["stage"] && Area == 1)) &&
//                    repeated(CoinData[stage+1]["coinLevel"],Coins > prev(Coins) && Area == 2 && !EnemyDefeated && never(Dead && Stage == CoinData[stage]["stage"] && Area == 2)) &&
//                    repeated(CoinData[stage+2]["coinLevel"],Coins > prev(Coins) && Area == 3 && !EnemyDefeated && never(Dead && Stage == CoinData[stage]["stage"] && Area == 3)) &&
//                    repeated(CoinData[stage+3]["coinLevel"],Coins > prev(Coins) && Area == 4 && !EnemyDefeated && never(Dead && Stage == CoinData[stage]["stage"] && Area == 4)) &&
//                never(Stage != CoinData[stage]["stage"] && State == MainMenu)
//    )
//}

//this function ticks up measured when a stage has every coin collected, signaling to move on
function CoinAchievement(stage) {
    achievement(
        title=CoinData[stage]["coinTitle"], points=CoinData[stage]["coinPoints"],
        description= "Collect every coin in all areas before the boss in Stage " + CoinData[stage]["stage"] + " without returning to the Main Menu.",
        trigger= State == InGame && Stage == CoinData[stage]["stage"] &&
                    measured(tally(4,
                    once(repeated(CoinData[stage]["coinLevel"],Stage == CoinData[stage]["stage"] && Area == 1 && !EnemyDefeated && Coins != prev(Coins)) && TimerActive &&
                        never((Health == 0 || Dead) && Stage == CoinData[stage]["stage"] && Area == 1)),
                    once(repeated(CoinData[stage+1]["coinLevel"],Stage == CoinData[stage]["stage"] && Area == 2 && !EnemyDefeated && Coins != prev(Coins)) && TimerActive && 
                        never((Health == 0 || Dead) && Stage == CoinData[stage]["stage"] && Area == 2)),
                    once(repeated(CoinData[stage+2]["coinLevel"],Stage == CoinData[stage]["stage"] && Area == 3 && !EnemyDefeated && Coins != prev(Coins)) && TimerActive &&
                        never((Health == 0 || Dead) && Stage == CoinData[stage]["stage"] && Area == 3)),
                    once(repeated(CoinData[stage+3]["coinLevel"],Stage == CoinData[stage]["stage"] && Area == 4 && !EnemyDefeated && Coins != prev(Coins)) && TimerActive &&
                        never((Health == 0 || Dead) && Stage == CoinData[stage]["stage"] && Area == 4)))) &&
                never(Stage == 1 && State == MainMenu)
    )
}

function DeathlessAchievement(stage) {
    achievement(
        title=ProgData[stage]["deathlessTitle"], points=ProgData[stage]["deathlessPoints"],
        description="Complete all of Stage " + stage + " without dying.",
        trigger= State == InGame && Stage == stage &&
                    once(State == InGame && Stage == stage && Area == 1 && TimerActive) &&
                    never(Dead) && never(State == MainMenu) && never(prev(Lives) > Lives) &&
                    trigger_when(Area == Boss && StageCleared)
    )
}

//ACHIEVEMENT CODE
for i in range(1,6)
    ProgAchievement(i)

for i in SpeedrunLevelArray
    SpeedAchievement(i)
    
for i in CoinLevelArray
    CoinAchievement(i)

//stage 6 final level has no coins, so the function must be adjusted
achievement(
        title=CoinData[26]["coinTitle"], points=CoinData[26]["coinPoints"],
        description= "Collect every coin in all areas before the boss in Stage " + CoinData[26]["stage"] + " without returning to the Main Menu.",
        trigger= State == InGame && Stage == CoinData[26]["stage"] &&
                    measured(tally(3,
                    once(repeated(CoinData[26]["coinLevel"],Stage == CoinData[26]["stage"] && Area == 1 && !EnemyDefeated && Coins != prev(Coins)) && TimerActive &&
                        never((Health == 0 || Dead) && Stage == CoinData[26]["stage"] && Area == 1)),
                    once(repeated(CoinData[26+1]["coinLevel"],Stage == CoinData[26]["stage"] && Area == 2 && !EnemyDefeated && Coins != prev(Coins)) && TimerActive && 
                        never((Health == 0 || Dead) && Stage == CoinData[26]["stage"] && Area == 2)),
                    once(repeated(CoinData[26+2]["coinLevel"],Stage == CoinData[26]["stage"] && Area == 3 && !EnemyDefeated && Coins != prev(Coins)) && TimerActive &&
                        never((Health == 0 || Dead) && Stage == CoinData[26]["stage"] && Area == 3)))) &&
                never(Stage != CoinData[26]["stage"] && State == MainMenu)
    )

for i in range(2,6)
    DeathlessAchievement(i)

//various manual achievements--boss challenges and misc
achievement(
        title="Bested Tanutaro", points=5,
        description= "Collect 21 or more coins in the battle against Tanutaro at the end of Stage 1.",
        trigger= State == InGame && Stage == 1 && Area == Boss && TimerActive && prev(ManmaruCoins) < 21 && trigger_when(ManmaruCoins >= 21)
)
achievement(
        title="Bested Monro", points=5,
        description= "Evade Monro at the end of Stage 2 without getting hit or using power-ups.",
        trigger= State == InGame && Stage == 2 && Area == Boss && trigger_when(StageCleared) && 
                 once(prev(Timer) == 0 && Timer == 1 && State == InGame && Stage == 2 && Area == Boss && never(Health < prev(Health)) && never(PowerActive))
)
achievement(
        title="Bested Tsunejiro", points=3,
        description= "Defeat Tsunejiro at the end of Stage 3 within 10 seconds.",
        trigger= State == InGame && Stage == 3 && Area == Boss && trigger_when(StageCleared) && never(Dead) &&
                 once(prev(Timer) == 0 && Timer == 1 && State == InGame && Stage == 3 && Area == Boss && never(BossTimeCalculation > 600))
)
achievement(
        title="Bested Ranko", points=3,
        description= "Reach Ranko at the end of Stage 4 within 35 seconds.",
        trigger= State == InGame && Stage == 4 && Area == Boss && trigger_when(StageCleared) && never(Dead) &&
                 once(prev(Timer) == 0 && Timer == 1 && State == InGame && Stage == 4 && Area == Boss && never(BossTimeCalculation > 2100))
)
achievement(
        title="Bested Kaede", points=5,
        description= "Collect 40 or more coins in the battle against Kaede at the end of Stage 5.",
        trigger= State == InGame && Stage == 5 && Area == Boss && TimerActive && prev(ManmaruCoins) < 40 && trigger_when(ManmaruCoins >= 40)
)
achievement(
        title="Bested Nenga", points=5,
        description= "Evade Nenga at the end of Stage 6 without getting hit.",
        trigger= State == InGame && Stage == 6 && Area == Boss && trigger_when(StageCleared) && 
                  once(prev(Timer) == 0 && Timer == 1 && State == InGame && Stage == 6 && Area == Boss && never(Health < prev(Health)))
)
achievement(
        title="Many Manmaru", points=3,
        description="Collect 100 coins and earn an extra life.",
        trigger= State == InGame && TimerActive && Lives > prev(Lives)
)

achievement(
        title="Bested Borotto", points=5,
        description= "Collect 25 or more coins in the battle with Borotto for an extra continue.",
        trigger = State == ContinueMinigame && TimerActive && prev(ManmaruCoins) < 25 && trigger_when(ManmaruCoins >= 25)
)
//LEADERBOARDS
function SpeedLeaderboard(stage) {
    leaderboard(
        title="Ninja Running " + SpeedData[stage]["desc"],
        description="Clear stage " + SpeedData[stage]["desc"] + " as fast as you can.",
        start= State == InGame && Stage == SpeedData[stage]["stage"] && Area == SpeedData[stage]["area"] && StageCleared,
        cancel=always_false(),
        submit=always_true(),
        value=TimeCalculation,
        format="FRAMES",
        lower_is_better=true
    )
}

for i in SpeedrunLevelArray
    SpeedLeaderboard(i)

leaderboard(
        title="Bested Tanutaro",
        description="Collect as many coins as you can in the battle against Tanutaro at the end of Stage 1.",
        start= State == InGame && Stage == 1 && Area == Boss && StageCleared,
        cancel=always_false(),
        submit=always_true(),
        value=ManmaruCoins,
        format="VALUE",
        lower_is_better=false
)
leaderboard(
        title="Bested Tsunejiro",
        description="Defeat Tsunejiro at the end of Stage 3 as fast as you can.",
        start= State == InGame && Stage == 3 && Area == Boss && StageCleared,
        cancel=always_false(),
        submit=always_true(),
        value=BossTimeCalculation,
        format="FRAMES",
        lower_is_better=true
)
leaderboard(
        title="Bested Ranko",
        description="Navigate the maze and reach Ranko at the end of Stage 4 as fast as you can.",
        start= State == InGame && Stage == 4 && Area == Boss && StageCleared,
        cancel=always_false(),
        submit=always_true(),
        value=BossTimeCalculation,
        format="FRAMES",
        lower_is_better=true
)
leaderboard(
        title="Bested Kaede",
        description="Collect as many coins as you can in the battle against Kaede at the end of Stage 5.",
        start= State == InGame && Stage == 5 && Area == Boss && StageCleared,
        cancel=always_false(),
        submit=always_true(),
        value=ManmaruCoins,
        format="VALUE",
        lower_is_better=false
)

leaderboard(
        title="Bested Borotto",
        description="Collect as many coins as you can in the battle with Borotto for an extra continue.",
        start= State == ContinueMinigame && StageCleared,
        cancel=always_false(),
        submit=always_true(),
        value=ManmaruCoins,
        format="VALUE",
        lower_is_better=false
)

leaderboard(
        title="Ninja Penguin",
        description="Complete the entire game as fast as you can.",
        start= prev(State) == 0x0a && State == StageIntro && Stage == 1 && Area == 1,
        cancel=State == MainMenu,
        submit=State == InGame && Stage == 6 && Area == Boss && StageCleared,
        value=always_true(),
        format="FRAMES",
        lower_is_better=true
)
//RP
rich_presence_conditional_display(State == InGame && Area == Boss, "Manmaru is challenging {0} • Stage {1} • Lives: {2} • Coins: {3}",
        rich_presence_lookup("Boss",Stage,BossRP),
        rich_presence_value("Number",Stage,"VALUE"),
        rich_presence_value("Number",Lives,"VALUE"),
        rich_presence_value("Number",Coins,"VALUE"))
rich_presence_conditional_display(State == Credits || State == Ending, "Manmaru is watching the ending. He did it!")
rich_presence_conditional_display(State == StageCutscene || State == StageIntro, "Manmaru is watching a scene in {0} • Lives: {1} • Coins: {2}",
        rich_presence_lookup("Stage",Stage,StageRP),
        rich_presence_value("Number",Lives,"VALUE"),
        rich_presence_value("Number",Coins,"VALUE"))
rich_presence_conditional_display(State == InGame, "Manmaru is exploring {0} • Area {1} • Lives: {2} • Coins: {3}",
        rich_presence_lookup("Stage",Stage,StageRP),
        rich_presence_value("Number",Area,"VALUE"),
        rich_presence_value("Number",Lives,"VALUE"),
        rich_presence_value("Number",Coins,"VALUE"))
rich_presence_conditional_display(Stage == ContinueMinigame, "Manmaru is challenging Borotto for a continue")
rich_presence_display("Manmaru is playing a game")
