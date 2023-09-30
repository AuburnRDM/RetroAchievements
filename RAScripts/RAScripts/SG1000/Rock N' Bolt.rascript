// Rock N' Bolt
// #ID = 14728

// $0019: (8 bit) - 04 during gameplay, 00 during logo screen and main menu
// $0050: (bits) - controller inputs
// $0056: [32-bit BE BCD] High Score - Money
//        - The last 2 digits represent the "cents" while the rest of the value is "whole dollars". Ex: 0x903839 displays as $9038.39 
//        - Treat the entire value as a score
HighScore = bcd(dword_be(0x56))
RPHighDollar = bcd(tbyte_be(0x56))
RPHighCents1 = bcd(high4(0x59))
RPHighCents2 = bcd(low4(0x59))
// $005A: [8-bit] High Score - Rounds; add 0x01 to this value to get actual round
HighRound = byte(0x5a)+1
// $005C: [8-bit] Number of rounds cleared in the current run
RoundsCleared = byte(0x5c)
// $0065: (8 bit) - options cursor: both for time and level
//        cannot be used
// $0066: (8 bit) - timer in main menu until demo and during game over
// $0068: [8-bit] Game status
//        - 0x00 - Booting
//        - 0x02 or 0x04 - Title Screen
//        - 0x06 - Choosing settings/in game
//        - 0x08 - Demo
//        - 0x0a - Dialogue in game
MainMenu = byte(0x68) < 8 && byte(0x19) == 0
Demo = byte(0x68) == 8 
// $0075: [8-bit] Number of "cute girl" image pieces unlocked (All: 0x06)
//        - First piece unlocks after completing your 21st puzzle in the current run (regardless of starting round) and another piece unlocks for each of the following 20 puzzles completed in that same run
//        - Requires Time 1 or Time 2 setting to unlock pieces
PicturePieces = byte(0x75)
// $007C: [8-bit] Screw/unscrew action
//        Bit6 - Flips on when player initiates the screw/unscrew action; stays flipped if the button is held after the animation is over, but the player cannot do this action again until the button is let go and this goes back to off
Screw = bit6(0x7c)
// $007F: [8-bit] Time remaining - Frames; 60 frames per second, decrements 0x70 every time this value reaches 0
// $0080: [8-bit] Time remaining - Seconds (ones place)
// $0081: [8-bit] Time remaining - Seconds (tens place)
// $0082: [8-bit] Time remaining - Minutes
TimeLeft = (byte(0x82) * 60) + (byte(0x81) * 10) + byte(0x80)
// $0086: (8 bit) - 00 during menu and demo, 01 - player's gameplay
TimedActive = byte(0x86) == 1
InGame = __ornext(byte(0x68) == 0x06 || byte(0x68) == 0x0a)
// $0088: (8 bit) - time options during game:
//        01 - Time 1
//        02 - Time 2
//        00 - Free play
TimeSetting = byte(0x88)
Time1 = 1
Time2 = 2
FreePlay = 0
RPDifficulty = {
    1:"putting in the bare minimum",
    2:"working efficiently"
}
// $0089: time constraint modifier
// $008A: [32-bit BE BCD] Score (money)
//        - The last 2 digits represent the "cents" while the rest of the value is "whole dollars". Ex: 0x903839 displays as $9038.39
//        - Treat the entire value as a score
Score = bcd(dword_be(0x8a))
RPDollars = bcd(tbyte_be(0x8a))
RPCents1 = bcd(high4(0x8d))
RPCents2 = bcd(low4(0x8d))
// $008E: [16-bit BE BCD] Value of a correct bolt
//        - This is added to your current score every time you correctly place a bolt
//        - The last 2 digits represent the "cents" while the rest of the value is "whole dollars". Ex: 0x3839 displays as $38.39
//        - Value goes up as the rounds progress
// $0090: [8-bit BCD] Floor number displayed on the screen
// $0091: [8-bit] Floor "difficulty" / CurrentFloor
//        - goes up by 0x01 every floor cleared and basically determines the pool of puzzles that can spawn
//        - loops back to the first puzzle after 0xff, but difficulty effectively caps much earlier around 0x11 (around the start of Level 3)
Floor = byte(0x91)
// $0092: [8-bit] Lives remaining
Lives = byte(0x92)
// $0093: [8-bit] Bonus bolt / Extra life
//        - Starts at 0x04 and counts down every time a blinking yellow bolt is collected. Once it reaches 0x00, the next blinking bolt that spawns will be a different color and award an extra life. Value returns to 0x04 after collecting the extra life
BonusBolt = byte(0x93)
ExtraLife = 0
// $00FA: (16 bit) - x coordinates of ingame platform
// $010A: (8 bit) - end of the level platform coordinate. 01 = at the beginning of the level and when everything screwed right and player is ready to go to next level
//        2e = level in progress
//        cannot be used in achievements because player can hop on platform during level and it will raise them to value 01 again
// $0124: [8-bit] Number of frames before the blinking bolt bonus disappears
// $0137: [8-bit] Floor completion status
//        Bit0 - All pieces locked in on the current screen
//        Bit1 - Puzzle solved; player is able to ride the elevator to the next floor
//        -- The puzzle must be solved on all screens of the floor
//        -- All pieces must be in the proper position on blueprint floors
PuzzleStatus = bit1(0x137)
PuzzleSolved = bit1(0x137) == 1
// $0138: [8-bit] Various game states
//        Bit0 - Free Play active
//        Bit1 - Selecting settings
//        Bit2 - Level cleared
//        Bit6 - Adding remaining time to score
LevelComplete = prev(bit2(0x138)) == 0 && bit2(0x138) == 1
ScoreTally = bit6(0x138) == 1
// $0139: [8-bit] Type of floor
//        0x00 - Blueprint
//        0x01 - Standard
FloorType = byte(0x139)
Blueprint = 0
Standard = 1
// $013A: [8-bit] Current screen for current floor; these seem to go up to 3 wide at most
//        0x00 - 1
//        0x01 - 2
//        0x02 - 3
CurrentScreen = byte(0x13a)
// $013B: [8-bit] Number of screens on current floor; these seem to go up to 3 wide
//        0x00 - 1
//        0x01 - 2
//        0x02 - 3
FloorSize = byte(0x13b)+1
// $0144: [8-bit] Screen 1 puzzle completion status
//        0x00 - Not solved / Not applicable if the floor is smaller
//        Bit0 - All pieces locked in
//        Bit1 - Puzzle solved; every piece must be in the correct position on blueprint floors
// $0145: [8-bit] Screen 2 puzzle completion status
//        0x00 - Not solved / Not applicable if the floor is smaller
//        Bit0 - All pieces locked in
//        Bit1 - Puzzle solved; every piece must be in the correct position on blueprint floors
// $0146: [8-bit] Screen 3 puzzle completion status
//        0x00 - Not solved / Not applicable if the floor is smaller
//        Bit0 - All pieces locked in
//        Bit1 - Puzzle solved; every piece must be in the correct position on blueprint floors
achievement(
    title="Following the Plan", points=1,
    description="Successfully complete your first blueprint floor.",
    trigger= InGame && FloorType == Blueprint && PuzzleSolved && LevelComplete
)
achievement(
    title="Unpaid Training", points=3,
    description="Complete floors 1-8 on any setting.",
    trigger= InGame && Floor == 8 && PuzzleSolved && LevelComplete
)
//achievement(
//    title="Level 1 timed", points=1,
//    description="Complete floors 1-8 on any timed difficulty.",
//    trigger= InGame && TimeSetting >= 1 && Floor == 8 && PuzzleSolved && LevelComplete
//)
//achievement( //changed this from time 2 to any time
//    title="Level 1 time 2 part 1", points=3,
//    description="Complete floors 1-4 on any timed difficulty.",
//    trigger= InGame && TimeSetting >= 1 && Floor == 4 && PuzzleSolved && LevelComplete
//)
achievement( //changed this from time 2 to any time
    title="Ready to Work", points=5,
    description="Complete floors 1-8 on any timed difficulty.",
    trigger= InGame && TimeSetting >= 1 && Floor == 8 && PuzzleSolved && LevelComplete
)
achievement(
    title="Star Trainee", points=5,
    description="Complete floors 1-8 on the Time 2 difficulty without losing any lives.",
    trigger= TimeSetting == 2 && once(InGame && Floor == 1 && never(Floor > 8 || !InGame)) && trigger_when(Floor == 8 && PuzzleSolved && LevelComplete) 
            && disable_when(Lives < prev(Lives), Floor > 8 || !InGame)
)

achievement(
    title="Volunteer Work", points=5,
    description="Complete floors 9-16 on any setting.",
    trigger= InGame && Floor == 16 && PuzzleSolved && LevelComplete
)
//achievement(
//    title="Level 2 timed", points=1,
//    description="Complete floors 9-16 on any timed difficulty.",
//    trigger= InGame && TimeSetting >= 1 && Floor == 16 && PuzzleSolved && LevelComplete
//)
achievement( //changed this from time 2 to any time
    title="OSHA Violations All Around", points=5,
    description="Complete floors 9-12 on any timed difficulty.",
    trigger= InGame && TimeSetting >= 1 && Floor == 12 && PuzzleSolved && LevelComplete
)
achievement( //changed this from time 2 to any time
    title="Time for Lunch", points=10,
    description="Complete floors 13-16 on any timed difficulty.",
    trigger= InGame && TimeSetting >= 1 && Floor == 16 && PuzzleSolved && LevelComplete
)
achievement(
    title="Employee of the Month", points=10,
    description="Complete floors 9-16 on the Time 2 difficulty without losing any lives.",
    trigger= TimeSetting == 2 && once(InGame && Floor == 9 && never(Floor < 9 || !InGame)) && trigger_when(Floor == 16 && PuzzleSolved && LevelComplete) 
            && disable_when(Lives < prev(Lives), Floor < 9 || !InGame)
)

achievement(
    title="Free Labor", points=10,
    description="Complete floors 17-24 on any setting.",
    trigger= InGame && Floor == 24 && PuzzleSolved && LevelComplete
)
//achievement(
//    title="Level 3 timed", points=1,
//    description="Complete floors 17-24 on any timed difficulty.",
//    trigger= InGame && TimeSetting >= 1 && Floor == 24 && PuzzleSolved && LevelComplete
//)
achievement( //changed this from time 2 to any time
    title="It's a Long Way Down", points=10,
    description="Complete floors 17-20 on any timed difficulty.",
    trigger= InGame && TimeSetting >= 1 && Floor == 20 && PuzzleSolved && LevelComplete
)
achievement( //changed this from time 2 to any time
    title="Time to Clock Out", points=10,
    description="Complete floors 21-24 on any timed difficulty.",
    trigger= InGame && TimeSetting >= 1 && Floor == 24 && PuzzleSolved && LevelComplete
)
achievement(
    title="Employee of the Year", points=25,
    description="Complete floors 17-24 on the Time 2 difficulty without losing any lives.",
    trigger= TimeSetting == 2 && once(InGame && Floor == 17 && never(Floor < 17 || !InGame)) && trigger_when(Floor == 24 && PuzzleSolved && LevelComplete) 
            && disable_when(Lives < prev(Lives), Floor < 17 || !InGame)
)

achievement(
    title="Bonus Bobby", points=5,
    description="Step on 5 blinking bolts in the same run and earn an extra life.",
    trigger= never(!TimedActive) && measured(tally(5,
        once(prev(BonusBolt) == 4 && BonusBolt == 3),
        once(prev(BonusBolt) == 3 && BonusBolt == 2),
        once(prev(BonusBolt) == 2 && BonusBolt == 1),
        once(prev(BonusBolt) == 1 && BonusBolt == 0),
        once(prev(BonusBolt) == 0 && BonusBolt == 4)
    )) 
)
//removed time setting. add && TimeSetting >= 1 after InGame to use again
achievement(
    title="Forward Thinker", points=2,
    description="Complete a 1-screen blueprint puzzle without removing a bolt or bolting a platform in the wrong position.",
    trigger= FloorType == Blueprint && FloorSize == 1 && trigger_when(PuzzleSolved && LevelComplete) 
            && disable_when(prev(Screw) == 0 && Screw == 1 && prev(Score)>=Score, __ornext(Floor > prev(Floor) || !InGame))
)

achievement(
    title="Careful Planner", points=4,
    description="Complete a 2-screen blueprint puzzle on Floor 9 or higher without removing a bolt or bolting a platform in the wrong position.",
    trigger= Floor >= 9 && FloorType == Blueprint && FloorSize == 2 && trigger_when(PuzzleSolved && LevelComplete)
            && disable_when(prev(Screw) == 0 && Screw == 1 && prev(Score)>=Score, __ornext(Floor > prev(Floor) || !InGame))
)

achievement(
    title="Master Architect", points=5,
    description="Complete a 3-screen blueprint puzzle on Floor 17 or higher without removing a bolt or bolting a platform in the wrong position.",
    trigger= Floor > 17 && FloorType == Blueprint && FloorSize == 3 && trigger_when(PuzzleSolved && LevelComplete)
            && disable_when(prev(Screw) == 0 && Screw == 1 && prev(Score)>=Score, __ornext(Floor > prev(Floor) || !InGame))
)

achievement(
    title="Straight to the Piggy Bank", points=10,
    description="Earn at least $10,000.",
    trigger= InGame && TimeSetting >= 1 && prev(Score) < 1000000 && Score >= 1000000
)
achievement( //add a comment to the achievement to let me know if there are cases that there are less, adjust in GUI for now by adding add hits and measured blank
    title="Structurally Sound", points=5,
    description="Complete floors 1-8 while tightening at least 164 different bolts.",
    trigger= never(!InGame) && never(Floor > 8) && once(InGame && Floor == 1) && Floor == 8 && PuzzleSolved && LevelComplete
            && measured(tally(164,
                !ScoreTally && Score > prev(Score) && prev(BonusBolt) == BonusBolt,
                deduct(!ScoreTally && Score < prev(Score))
            ), when=TimeSetting >= 1)
)

leaderboard(
    title="Coinstar Champion",
    description="Collect as many pennies as you can.",
    start=InGame && prev(Lives) == 1 && Lives == 0 && TimeSetting >= 1,
    cancel=always_false(),
    submit=always_true(),
    value=Score, format="VALUE",
    lower_is_better=false
)
leaderboard(
    title="Casual Worker",
    description="Complete as many rounds as you can on Time 1 difficulty.",
    start=InGame && prev(Lives) == 1 && Lives == 0 && TimeSetting == 1,
    cancel=always_false(),
    submit=always_true(),
    value=RoundsCleared, format="VALUE",
    lower_is_better=false
)
leaderboard(
    title="Hard Worker",
    description="Complete as many rounds as you can on Time 2 difficulty.",
    start=InGame && prev(Lives) == 1 && Lives == 0 && TimeSetting == 2,
    cancel=always_false(),
    submit=always_true(),
    value=RoundsCleared, format="VALUE",
    lower_is_better=false
)


rich_presence_conditional_display(InGame && TimeSetting == FreePlay,"Little Bobby is doing volunteer work on Floor {0} • Round {1}",
        rich_presence_value("Digit", Floor,format="VALUE"),
        rich_presence_value("Digit", RoundsCleared+1,format="VALUE")
)
rich_presence_conditional_display(InGame,"Little Bobby is {5} on Floor {0} • Round {1} • ${2}.{3}{4}",
        rich_presence_value("Digit", Floor,format="VALUE"),
        rich_presence_value("Digit", RoundsCleared+1,format="VALUE"),
        rich_presence_value("Digit", RPDollars,format="VALUE"),
        rich_presence_value("Digit", RPCents1,format="VALUE"),
        rich_presence_value("Digit", RPCents2,format="VALUE"),
        rich_presence_lookup("RPDifficulty",TimeSetting,RPDifficulty)
)
rich_presence_conditional_display(Demo && RPHighDollar == 0,"Little Bobby is showing off in the demo • High Score: $0.00"
)
rich_presence_conditional_display(MainMenu && RPHighDollar == 0,"Little Bobby is on the title screen • High Score: $0.00"
)
rich_presence_conditional_display(Demo,"Little Bobby is showing off in the demo • High Score: ${0}.{1}{2} on Round {3}",
        rich_presence_value("Digit",RPHighDollar,format="VALUE"),
        rich_presence_value("Digit",RPHighCents1,format="VALUE"),
        rich_presence_value("Digit",RPHighCents2,format="VALUE"),
        rich_presence_value("Digit",HighRound,format="VALUE")
)
rich_presence_display("Little Bobby is on the title screen • High Score: ${0}.{1}{2} on Round {3}",
        rich_presence_value("Digit",RPHighDollar,format="VALUE"),
        rich_presence_value("Digit",RPHighCents1,format="VALUE"),
        rich_presence_value("Digit",RPHighCents2,format="VALUE"),
        rich_presence_value("Digit",HighRound,format="VALUE")
)