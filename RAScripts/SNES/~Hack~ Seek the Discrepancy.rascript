// ~Hack~ Seek the Discrepancy
// #ID = 25318

// $000094: [16-bit] Player X-position; lower is left
//          0x2a0 - Halcyon Hollow 2 (no fail, greater than)
XPos = word(0x94)
// $000096: [16-bit] Player Y-position; lower is up
//          0x3b0 - Placid Plateau 2 / Placid Plateau 3 (no fail, less than)
//          0x4b0 - Serene Woods 2 / Serene Woods 3 / Halcyon Hollow 3 (no fail, less than)
YPos = word (0x96)
GameStatus = byte(0x100)
InGame = GameStatus == 0x14
Room = word(0x10b)
// $00010B: [16-bit] Most recent screen ID loaded (Does not change when entering the overworld until a new level is selected)
//          0xc7 - Title Screen
Title = 0xc7
//          ---Quiescence
//          0x03 - Respite - Start
//          0x2a - Respite - Screen 1
//          0x2b - Respite - Screen 2
//          0x2c - Respite - Screen 3
//          0x2d - Respite - 1Up Screen
//          0x135 - Viaduct - Start
RespitePuzzleRoom = 0x2d
ViaductExit = 0x135
//          ---Serene Woods
//          0x01 - Serene Woods 1 - Start (secret)
//          0x31 - Serene Woods 1 - Screen 2 (puzzle)
//          0x32 - Serene Woods 1 - Exit
//          0x04 - Serene Woods 2 - Start / Exit
//          0x33 - Serene Woods 2 - Secret
//          0x34 - Serene Woods 2 - Screen 2 (puzzle)
//          0x05 - Serene Woods 3 - Start
//          0x30 - Serene Woods 3 - Screen 2 (puzzle/secret)
//          0x35 - Serene Woods 3 - Exit
//          0x08 - Western Switch (1)
Serene1Exit = 0x32
Serene2Exit = 0x04
Serene3Exit = 0x35
Serene2Puzzle = 0x34
Serene3Puzzle = 0x30
Serene1Secret = 0x01
Serene2Secret = prev(Room) == 0x04 && Room == 0x33
Serene3Secret = 0x30
//          ---Placid Plateau
//          0x0d - Placid Plateau 1 - Start (secret)
//          0x3f - Placid Plateau 1 - Screen 2 (puzzle/exit)
//          0x0f - Placid Plateau 2 - Start (secret)
//          0x3d - Placid Plateau 2 - Screen 2 (puzzle)
//          0x3e - Placid Plateau 2 - Exit
//          0x10 - Placid Plateau 3 - Start
//          0x149 - Placid Plateau 3 - Screen 2 (puzzle/secret)
//          0x14a - Placid Plateau 3 - Keyhole screen
//          0x14 - Eastern Switch (2)
Placid1Exit = 0x3f
Placid2Exit = 0x3e
Placid3Exit = 0x14a
Placid2Puzzle = 0x3d
Placid3Puzzle = 0x149
Placid1Secret = 0x0d
Placid2Secret = 0x0f
Placid3Secret = 0x149
//          ---Halcyon Hollow
//          0x116 - Halcyon Hollow 1 - Start
//          0x145 - Halcyon Hollow 1 - Secret
//          0x146 - Halcyon Hollow 1 - Screen 2 (puzzle)
//          0x156 - Halcyon Hollow 1 - Exit
//          0x117 - Halcyon Hollow 2 - Start
//          0x157 - Halcyon Hollow 2 - Screen 2 (puzzle)
//          0x158 - Halcyon Hollow 2 - Secret
//          0x159 - Halcyon Hollow 2 - Exit
//          0x118 - Halcyon Hollow 3 - Start
//          0x15a - Halcyon Hollow 3 - Screen 2 (puzzle/exit)
//          0x15b - Halcyon Hollow 3 - Secret
//          0x121 - Southern Switch (3)
Halcyon1Exit = 0x156
Halcyon2Exit = 0x159
Halcyon3Exit = 0x15a
Halcyon2Puzzle = 0x157
Halcyon3Puzzle = 0x15a
Halcyon1Secret = prev(Room) == 0x116 && Room == 0x145
Halcyon2Secret = prev(Room) == 0x157 && Room == 0x158
Halcyon3Secret = prev(Room) == 0x15a && Room == 0x15b
//          ---Mountain of Dormant
//          0x13a - Somnolence (with a moon)
//          0x136 - Requiescence
//          0x123 - Requiescence - Screen 2 (puzzle)
//          0x124 - Requiescence - Normal exit
//          0x1b7 - Requiescence - Secret puzzle
//          0x139 - Requiescence - Secret exit
//          0x137 - Somnolence (credits)
//          0x140 - Somnolence (credits) - Final screen
//          0x138 - Ataraxia
RequiescenceNormalExit = 0x124
RequiescenceSecretExit = 0x139
// $000DD5: [8-bit] Method stage is exited
//          0x01 - Stage exit via normal exit
//          0x02 - Stage exit via special exit
//          0x80 - Stage exit via Start+Select
Exit = byte(0xdd5)
Normal = 1
Key = 2
Menu = 0x80
// $0013BF: [8-bit] Level ID of most recently entered stage
//          0x01 - Serene Woods 1 (goal)
//          0x03 - Respite (tutorial)
//          0x04 - Serene Woods 2 (key)
//          0x05 - Serene Woods 3 (goal)
//          0x08 - Western Switch (1)
//          0x0d - Placid Plateau 1 (orb)
//          0x0f - Placid Plateau 2 (goal)
//          0x10 - Placid Plateau 3 (key)
//          0x14 - Eastern Switch (2)
//          0x3a - Halcyon Hollow 1 (orb)
//          0x3b - Halcyon Hollow 2 (goal)
//          0x3c - Halcyon Hollow 3 (key)
//          0x45 - Southern Switch (3)
//          0x59 - Viaduct (goal)
//          0x5a - Requiescence (secret is goal/normal is special)
//          0x5c - Ataraxia
//          0x5e - Somnolence (moon)
//          0x5b - Somnolence (credits)
Respite = 0x03
Serene1 = 0x01
Serene2 = 0x04
Serene3 = 0x05
Placid1 = 0x0d
Placid2 = 0x0f
Placid3 = 0x10
Halcyon1 = 0x3a
Halcyon2 = 0x3b
Halcyon3 = 0x3c
Viaduct = 0x59
Requiescence = 0x5a
WesternSwitch = 0x08
EasternSwitch = 0x14
SouthernSwitch = 0x45

Level = byte(0x13bf)
LevelRP = {
    0x01:"attempting to solve Serene Woods 1",
    0x03:"learning the ropes in Respite",
    0x04:"attempting to solve Serene Woods 2",
    0x05:"attempting to solve Serene Woods 3",
    0x08:"reaching for the Western Switch",
    0x0d:"attempting to solve Placid Plateau 1",
    0x0f:"attempting to solve Placid Plateau 2",
    0x10:"attempting to solve Placid Plateau 3",
    0x14:"reaching for the Eastern Switch",
    0x3a:"attempting to solve Halcyon Hollow 1",
    0x3b:"listening carefully in Halcyon Hollow 2",
    0x3c:"attempting to solve Halcyon Hollow 3",
    0x45:"reaching for the Southern Switch",
    0x59:"traveling through the Viaduct",
    0x5a:"attempting to solve Requiescence",
    0x5c:"reading a message in Ataraxia",
    0x5e:"admiring the view in Somnolence",
    0x5b:"watching the Credits"
}

// $001421: [8-bit] Progress towards completing a 1-Up puzzle
//          -- Goes up 0x01 for an applicable successful guess
//          -- Flips back to 0x00 when an incorrect guess is made and is unable to increment until going back to the start
//          -- 1-Up spawns when reaching 0x04
//          -- Some puzzles do not increment by 0x01 when guessing correctly, but will still flip back to 0x00 if incorrect
Puzzle1UP = byte(0x1421)
// $001434: [8-bit] End level timer - Key exit; Value is 0x00 until a keyhole is entered and the end level fanfare begins; value will tick down each frame until it reaches 0x01 and begin exiting the stage on the next frame
// $001462: [16-bit] Layer 1 X-position; lower is left
//          0x5a0 - Placid Plateau 1 (greater than)
//          0x2c0 - Placid Plateau 2 (greater than)
ScreenX = word(0x1462)
// $001464: [16-bit] Layer 1 Y-position; lower is up
//          0xc0 - Serene Woods 1 secret (less than)
//          0x618 - Serene Woods 3 secret (greater than)
//          0x520 - Placid Plateau 3 secret (greater than)
ScreenY = word(0x1464)
// $001493: [8-bit] End level timer - Normal/Orb goal; Value is 0x00 until a goal is touched and the end level fanfare begins; value will tick down each frame until it reaches 0x01 and begin exiting the stage on the next frame
Overworld = byte(0x1f11)
SereneOverworld = 1
PlacidOverworld = 2
HalcyonOverworld = 5

GreenSwitch = byte(0x1f27)
GreenSwitchRP = {
    0: "☐",
    1: "🟩"
}
YellowSwitch = byte(0x1f28)
YellowSwitchRP = {
    0: "☐",
    1: "🟨"
}
BlueSwitch = byte(0x1f29)
BlueSwitchRP = {
    0: "☐",
    1: "🟦"
}
TotalExit = byte(0x1f2e)
// $001F3C: [8-bit] Puzzle solved flag Pt. 1
//          b4 - Respite
//          b3 - Serene Woods 2
//          b2 - Serene Woods 3
RespitePuzzle = bit4(0x1f3c)
// $001F3D: [8-bit] Puzzle solved flag Pt. 2
//          b0 - Placid Plateau 2
// $001F3E: [8-bit] Puzzle solved flag Pt. 3
//          b7 - Placid Plateau 3
// $001F43: [8-bit] Puzzle solved flag Pt. 4
//          b4 - Halcyon Hollow 2
//          b3 - Halcyon Hollow 3
// $001F47: [8-bit] Puzzle solved flag Pt. 5
//          b5 - Requiescence Secret
// $01B403: [16-bit] Current checkpoint

function LevelComplete(level,room,exit) => Level == level && Room == room && prev(Exit) == 0 && Exit == exit
function Win1UP(level,room) => Level == level && Room == room && prev(Puzzle1UP) == 3 && Puzzle1UP == 4 
function Fail1UP(level,room,position) => never(Level == level && Room == room && Puzzle1UP == 0 && GameStatus == 0x14 && position) &&
        never(Level == level && Room == room && prev(Puzzle1UP) != 0 && Puzzle1UP == 0 && GameStatus == 0x14)
        // took this out for now -- never(Exit == Menu && GameStatus == 0x0b)
        
function SecretArea(level,room,position) => Level == level && Room == room && position

achievement(
    title = "Learning the Ropes",
    description = "Solve the tutorial puzzles in Respite.",
    points = 1,
    trigger = Level == Respite && Room == RespitePuzzleRoom && prev(RespitePuzzle) == 0 && RespitePuzzle == 1)
    
achievement("Forest of Deception", "Complete Serene Woods 1.", 3, LevelComplete(Serene1, Serene1Exit, Normal))
achievement("Spectral Sights", "Complete Serene Woods 2.", 3, LevelComplete(Serene2, Serene2Exit, Key))
achievement("Treetop Mismatch", "Complete Serene Woods 3.", 3, LevelComplete(Serene3, Serene3Exit, Normal))

achievement(
    title = "Fastidious Forager",
    description = "Starting from the first level, solve every Serene Woods puzzle in order without choosing an incorrect answer or leaving the area.",
    points = 10,
    trigger = once(LevelComplete(Serene1,Serene1Exit,Normal)) &&
            trigger_when(once(
            once(LevelComplete(Serene1,Serene1Exit,Normal)) &&    
            once(Win1UP(Serene2,Serene2Puzzle)) &&
            once(Win1UP(Serene3,Serene3Puzzle)))) &&
            Fail1UP(Serene2,Serene2Puzzle,YPos <= 0x4b0) &&
            Fail1UP(Serene3,Serene3Puzzle,YPos <= 0x4b0) &&
            never(Overworld != SereneOverworld)
)
achievement(
    title = "Secret Scout",
    description = "Find all 3 secret block formations within Serene Woods in a single session.",
    points = 3,
    trigger = measured(tally(3,
            once(SecretArea(Serene1,Serene1Secret,ScreenY < 0xc0)),
            once(Level == Serene2 && Serene2Secret),
            once(SecretArea(Serene3,Serene3Secret,ScreenY > 0x618)))) &&
            never(Room == Title)
)

achievement("Fishy Findings", "Complete Placid Plateau 1.", 3, LevelComplete(Placid1, Placid1Exit, Normal))
achievement("Bait and Switch", "Complete Placid Plateau 2.", 3, LevelComplete(Placid2, Placid2Exit, Normal))
achievement("You'll Get Caught Up in the Crossfire", "Complete Placid Plateau 3.", 3, LevelComplete(Placid3, Placid3Exit, Key))

achievement(
    title = "Meticulous Mountaineer",
    description = "Starting from the first level, solve every Placid Plateau puzzle in order without choosing an incorrect answer or leaving the area.",
    points = 10,
    trigger = once(LevelComplete(Placid1,Placid1Exit,Normal)) &&
            trigger_when(once(
            once(LevelComplete(Placid1,Placid1Exit,Normal)) &&    
            once(Win1UP(Placid2,Placid2Puzzle)) &&
            once(Win1UP(Placid3,Placid3Puzzle)))) &&
            Fail1UP(Placid2,Placid2Puzzle,YPos <= 0x3b0) &&
            Fail1UP(Placid3,Placid3Puzzle,YPos <= 0x3b0) &&
            never(Overworld != PlacidOverworld)
)
achievement(
    title = "Secrets of the Mountain",
    description = "Find all 3 secret block formations within Placid Plateau in a single session.",
    points = 3,
    trigger = measured(tally(3,
            once(SecretArea(Placid1,Placid1Secret,ScreenX > 0x5a0)),
            once(SecretArea(Placid2,Placid2Secret,ScreenX > 0x2c0)),
            once(SecretArea(Placid3,Placid3Secret,ScreenY > 0x520)))) &&
            never(Room == Title)
)

achievement("Digging for Differences", "Complete Halcyon Hollow 1.", 3, LevelComplete(Halcyon1, Halcyon1Exit, Normal))
achievement("Attentive Listener", "Complete Halcyon Hollow 2.", 5, LevelComplete(Halcyon2, Halcyon2Exit, Normal))
achievement("Deep-Sea Discrepancy", "Complete Halcyon Hollow 3.", 3, LevelComplete(Halcyon3, Halcyon3Exit, Key))

achievement(
    title = "Sharp-Eyed Spelunker",
    description = "Starting from the first level, solve every Halcyon Hollow puzzle in order without choosing an incorrect answer or leaving the area.",
    points = 10,
    trigger = once(LevelComplete(Halcyon1,Halcyon1Exit,Normal)) &&
            trigger_when(once(
            once(LevelComplete(Halcyon1,Halcyon1Exit,Normal)) &&    
            once(Win1UP(Halcyon2,Halcyon2Puzzle)) &&
            once(Win1UP(Halcyon3,Halcyon3Puzzle)))) &&
            Fail1UP(Halcyon2,Halcyon2Puzzle,XPos >= 0x2a0) &&
            Fail1UP(Halcyon3,Halcyon3Puzzle,YPos <= 0x4b0) &&
            never(Overworld != HalcyonOverworld)
)
achievement(
    title = "Secret Tunnels",
    description = "Find all 3 secret block formations within Halcyon Hollow in a single session.",
    points = 3,
    trigger = measured(tally(3,
            once(Level == Halcyon1 && Halcyon1Secret),
            once(Level == Halcyon2 && Halcyon2Secret),
            once(Level == Halcyon3 && Halcyon3Secret))) &&
            never(Room == Title)
)

achievement("Seek the Switches", "Activate enough switches and pass through the Viaduct.", 1, LevelComplete(Viaduct, ViaductExit, Normal))
achievement("Summit of The Dormant", "Complete the normal exit of Requiescence.", 10, LevelComplete(Requiescence, RequiescenceNormalExit, Key))
achievement("Thinking Outside of the Box", "Complete the secret exit of Requiescence.", 10, LevelComplete(Requiescence, RequiescenceSecretExit, Normal))

rich_presence_conditional_display(GameStatus >= 0x0b && GameStatus <= 0x0e,"Mario is taking a break on the overworld • Switches: {0} {1} {2} • Exits: {3}/15",
    rich_presence_lookup("Green",GreenSwitch,GreenSwitchRP),
    rich_presence_lookup("Yellow",YellowSwitch,YellowSwitchRP),
    rich_presence_lookup("Blue",BlueSwitch,BlueSwitchRP),
    rich_presence_value("Digit",TotalExit,format="VALUE")
)
rich_presence_conditional_display(GameStatus >= 0x0f,"Mario is {0} • Switches: {1} {2} {3} • Exits: {4}/15",
    rich_presence_lookup("Level",Level,LevelRP),
    rich_presence_lookup("Green",GreenSwitch,GreenSwitchRP),
    rich_presence_lookup("Yellow",YellowSwitch,YellowSwitchRP),
    rich_presence_lookup("Blue",BlueSwitch,BlueSwitchRP),
    rich_presence_value("Digit",TotalExit,format="VALUE")
)
rich_presence_display("Mario is looking for their magnifying lens")
