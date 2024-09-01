// Mr. Run and Jump
// #ID = 30131

// $002A: [8-bit] Various states pt.1
//        Bit0 - Screen change modifier; if Bit0 is 0, move forward one screen. if Bit0 is 1, move back one screen
//        Bit1 - Changing screens; check with Bit0
//        Bit2 - Jumping
//        Bit5 - Moving left/right
//        Bit6 - Climbing
//        Bit7 - Dead
Dead = bit7(0x2a) == 1
// $002B: [8-bit] Various states pt.2
//        Bit6 - Direction character is facing (on = right, off = left)
//        Bit7 - On title screen
Title = bit7(0x2b) == 1
// $0030: [16-bit] Player x-position
// $0032: [16-bit BE] Player y-position
// $003E: [8-bit] Screen ID
//        0x01 - Level 1 start / title screen
//        0x0d - Level 1 before final screen
//        0x0f - Level 2 start
//        0x1d - Level 2 before final screen
//        0x1f - Level 3 start
//        0x2c - Level 3 before final screen
//        0x2e - Level 4 start
//        0x3b - Level 4 before final screen
//        0x3d - Level 5 start
//        0x4a - Level 5 before final screen
//        0x4c - Level 6 start
//        0x52 - Level 6 before final screen
//        0xff - Final screen (win on level 6)
// $0046: [8-bit] Current level/color pallette; changing this value doesn't change the level set as each screen seems to be hard coded to the next,
//               but finishing a level when set to 0x05 does move to the win screen
//        0x00 - Level 1 - Blue
//        0x01 - Level 2 - Green
//        0x02 - Level 3 - Yellow
//        0x03 - Level 4 - Red
//        0x04 - Level 5 - Monochrome
//        0x05 - Level 6 - Dark
//        0x06 - You Win
Stage = byte(0x46) + 1
StageRP = {
    1:"Blue",
    2:"Green",
    3:"Yellow",
    4:"Red",
    5:"Monochrome",
    6:"Dark"
}
// $0055: [8-bit] Score - Ten thousands; counts down by 0x02. divide by 2 to get the actual value
// $0056: [8-bit] Score - Thousands; counts down by 0x02. divide by 2 to get the actual value
// $0057: [8-bit] Score - Hundreds; counts down by 0x02. divide by 2 to get the actual value
// $0058: [8-bit] Score - Tens; counts down by 0x02. divide by 2 to get the actual value
// $0059: [8-bit] Score - Ones; counts down by 0x02. divide by 2 to get the actual value
// $005A: [8-bit] Frame counter
//        - Decrements 0x59 (ones place) by 0x02 every time this reaches 0x00
//        - Continues to tick even when the total score reaches 0
Frames = byte(0x5a)
Score = byte(0x000055) * 0x1388 + byte(0x000056) * 0x1F4 + byte(0x000057) * 0x32 + byte(0x000058) * 0x05 + byte(0x000059) / 0x02
//Data Table -- target is in seconds and converted in the formula to frames
Data = {
    1:{"titleP":"Feeling Blue", "pointsP":3,"titleSpeed":"Mr. Blue Blur","pointsSpeed":3,"target":41,"color":"Blue","flavor":""},
    2:{"titleP":"It Not Easy Beating Green", "pointsP":5,"titleSpeed":"Mr. Green Streak","pointsSpeed":5,"target":45,"color":"Green","flavor":""},
    3:{"titleP":"Yellow Brick Crush'ems", "pointsP":10,"titleSpeed":"Mr. Yellow Flash","pointsSpeed":10,"target":46,"color":"Yellow","flavor":""},
    4:{"titleP":"Red Letter Day", "pointsP":10,"titleSpeed":"Mr. Red Line","pointsSpeed":10,"target":50,"color":"Red","flavor":""},
    5:{"titleP":"Monochromatic Shock", "pointsP":10,"titleSpeed":"Mr. Monochrome Mile","pointsSpeed":10,"target":65,"color":"Monochrome","flavor":""},
    6:{"titleP":"Into the Dark", "pointsP":25,"titleSpeed":"Mr. Dark Dasher","pointsSpeed":10,"target":50,"color":"Dark","flavor":" and finish the game"}
}

//Achievements
function Progression(stage) {
    achievement(
        title=Data[stage]["titleP"], points=Data[stage]["pointsP"],
        description= "Complete the " + Data[stage]["color"] + " Realm"+Data[stage]["flavor"]+".",
        trigger=!Title && prev(Stage) == stage && Stage == stage +1 && Score != 25000
    )
}

for i in Data
    Progression(i)

function Speedrun(stage) {//this needs fixed because it doesn't tick a frame between screen changes
    achievement(
        title=Data[stage]["titleSpeed"],points=Data[stage]["pointsSpeed"],
        description="Complete the " + Data[stage]["color"] + " Realm in under " + Data[stage]["target"] + " seconds.",
        trigger=!Title && prev(Stage) == stage && trigger_when(Stage == stage +1) && Score != 25000 &&
                disable_when(once(Stage == stage && prev(Frames) != Frames) &&
                    tally(Data[stage]["target"]*60,always_true()),
                    until= Title || Dead)
    )
}
for i in Data
    Speedrun(i)

//achievement(
//        title="Mr. Half Score", points=10,
//        description= "Finish the game with a score of 11,111 or more.",
//        trigger=!Title && prev(Stage) == 6 && Stage == 7 && Score != 25000 && Score >= 11111
//) decided against it
   
achievement(
        title="Mr. High Score", points=25,
        description= "Finish the game with a score of 24,000 or more.",
        trigger=!Title && prev(Stage) == 6 && Stage == 7 && Score != 25000 && Score >= 24000
)

//Leaderboards
leaderboard(
    title = "Mr. High Score",
    description = "Finish the game with as many points as you can.",
    start  = !Title && prev(Stage) == 6 && Stage == 7 && Score != 25000,
    cancel = always_false(),
    submit = always_true(),
    value  = Score,
    format = "VALUE"
)

leaderboard(
        title= "Mr. Speedrun",
        description= "Finish the game as fast as you can.",
        start = !Title && Stage == 1 && prev(Frames) != Frames,
        cancel = Title,
        submit = prev(Stage) == 6 && Stage == 7 && Score != 25000,
        value = always_true(),
        format = "FRAMES",
        lower_is_better = true
)
    
function SpeedLB(stage) {
    leaderboard(
        title= Data[stage]["titleSpeed"],
        description= "Complete the " + Data[stage]["color"] + " Realm as fast as you can.",
        start = !Title && Stage == stage && prev(Frames) != Frames,
        cancel = Dead || Title,
        submit = prev(Stage) == stage && Stage == stage + 1 && Score != 25000,
        value = always_true(),
        format = "FRAMES",
        lower_is_better = true
    )
}

for i in Data
    SpeedLB(i)

//Rich Presence
rich_presence_conditional_display(Stage == 7, "Mr. Run and Jump has found Leap! • Score: {0}",
        rich_presence_value("Score", Score, format="VALUE")
)
rich_presence_conditional_display(!Title, "Mr. Run and Jump is searching the {0} Realm for Leap • Score: {1}",
        rich_presence_lookup("Realm", Stage, StageRP),
        rich_presence_value("Score", Score, format="VALUE")
)
rich_presence_display("Mr. Run and Jump is chasing Leap on the title screen")
