// ~Hack~ Super "Sonic Saves the World" World
// #ID = 18191

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

function MainMenu() => GameState <= 0x0a
function Overworld() => GameState <= 0x0e 
function InLevel() => GameState >= 0x0f

// $00010B: [16-bit] Most recent screen ID loaded (Does not change when entering the overworld until a new level is selected)
//          0xc7 - Main Menu
//          --- Intro
//          0xc5 - Intro - Bridge
//          0xc4 - Intro - Elevator
//          0xc3 - Intro - Eclipse
//          0xc2 - Intro - Elevator #2
//          --- General Overworld
//          0x104 - Information Kiosk
//          0xef - Play a different level warning
//          ---
//          0x0a - I. Only Yesterday
//          0x12 - The Unbearable Quickness of Hedgehog; start
//          0x15 - Fossil Fueled; start
//          0x02 - Shells at Dawn; start
//          0x105 - Zephy Leaves the Nest; start
//          ---
//          0x0b - II. The Cost of Living
//          0x130 - The Letter "P"; start
//          0x13e - The Letter "P"; final screen (prev 0x13d)
//          0x11 - Your Pal Ted; start
//          0x01 - Shells at Midday; start
//          0x10c - For Whomst the Charles Charges; start
//          0x111 - For Whomst the Charles Charges; final screen (prev 0x110)
//          ---
//          0x0c - III. Life on Earth
//          0x123 - Life on Mars; start
//          0x125 - Life on Mars; Elon's Tower (prev 0x124)
//          0x126 - Life on Mars; Boss
//          0x127 - Life on Mars; final story
//          0x112 - Good Vibes Only; start
//          0x14f - Good Vibes Only; final small screen
//          0x149 - Good Vibes Only; start of last area
//          0x14b - Good Vibes Only; final screen (prev 0x14a)
//          0x20 - Shells All Night; start
//          0x107 - Late Night Terror Club; start
//          0x10a - Late Night Terror Club; final screen (prev 0x109)
//          ---
//          0x0d - IV. The End is Near
//          0x21 - In This House; start
//          0x22 - In This House; final screen (prev 0x21)
//          0x23 - In This House; troll exit
//          0x102 - Celeste (2018); intro scene
//          0x154 - Celeste (2018); first screen with control
//          0x15f - Celeste (2018); Badeline Celeste first screen
//          0x167 - Celeste (2018); Badeline Celeste final screen (next 0x168)
//          0x179 - Celeste (2018); last screen with control
//          0x17b - Celeste (2018); first screen of credits
//          0x101 - Terminal Ferocity; only screen
//          0x10 - Mega Mole Fucks; start
//          ---
//          0x0e - V. The End
//          0x103 - Me, Reaping; start
//          0x12c - Break the Targets!; splash intro
//          0x1a0 - Break the Targets!; first real screen
//          ~
//          0x1af - Break the Targets!; final level
//          0x1b0 - Break the Targets!; complete screen--level "finishes" here
//          0x12d - Float Like a Princess; start
//          0x1b5 - Float Like a Princess; carnival area (prev 0x1b4)
//          0x128 - Dream Within a Dream; only screen
//          ---
//          0x0f - VI. Oblivion
//          0x1f - Disinformation Kiosk
//          --Daddy's Castle
//          0x129 - Daddy's Castle; intro
//          0x180 - Daddy's Castle; first real screen
//          - Back Door
//          0x12e - Back Door; start
//          0x181 - Back Door; Safe Word exit
//          0x190 - Back Door; Key challenge
//          0x191 - Back Door; Platform challenge
//          0x192 - Back Door; Yoshi challenge
//          0x193 - Back Door; Shell challenge
//          0x194 - Back Door; Switch challenge
//          0x195 - Back Door; Dolphin challenge
//          0x196 - Back Door; Statue challenge
//          0x197 - Back Door; Ghost challenge
//          0x183 - Back Door; Finished gauntlet 5/7
//          0x184 - Back Door; Finished gauntlet 7/7 (moon available)
//          - Full Moon Eclipse
//          0x12f - Full Moon Eclipse (prev 0x183 or 0x184 if backdoor was complete, 0x181 if safe word)
//          0x19a - Credits
//          0x19b - Final screen

ScreenID = word(0x10b)
  Bridge = 0xc5
  PPurpleEnd = 0x135
  PBlueStart = 0x136
  prevElonTower = 0x124
  ElonTower = 0x125
  ElonBoss = 0x126
  ElonBossWin = 0x127
  TerrorMessage = 0x107
  VibesMessage = 0x11c
  prevBadelineStart = 0x15e
  BadelineStart = 0x15f
  BadelineEnd = 0x167
  BadelineEndNext = 0x168
  prevPrincessCarnival = 0x1b4
  PrincessCarnival = 0x1b5
  DaddyStart = 0x180
  BackDoorStart = 0x12e
  SafeWord = 0x181
  FullMoon = 0x12f
  FinalScreen = 0x19b
  InformationKiosk = 0x104
  DisinformationKiosk = 0x1f
  Warning = 0xef
// $000DBF: [8-bit] Amount of coins/rings picked up on the current life

Rings = byte(0xDBF)

// $000DD5: [8-bit] Method stage is exited
//          0x00 - No exit ocurring
//          0x01 - Stage exit via normal exit
//          0x02 - Stage exit via keyhole
//          0x80 - Stage exit via Start+Select
StageExit = byte(0xdd5)

function NormalExit() => prev(StageExit) == 0 && StageExit == 1

// $000F5E: [8-bit] Various events
//          --- Break the Targets ($13bf = 0x50)
//          Number of targets broken in Break the Targets!
//          --- Back Door ($13bf = 0x4d)
//          Number of challenge rooms entered in current attempt (max: 0x08)

BackDoorRooms = byte(0xf5e)

// $000F5F: [8-bit] Various events
//          --- Break the Targets ($13bf = 0x50)
//          Number of targets to break in Break the Targets!
// $000F60: [8-bit] Various events
//          --- Break the Targets ($13bf = 0x50)
//          Break the Targets! seconds remaining
//          --- Float Like a Princess ($13bf = 0x09)
//          Number of times Birdo is hit; Birdo is defeated after 0x07 hits and then this value immediately changes to 0x08
//          --- Back Door ($13bf = 0x4d)
//          Current Challenge
//          0x00 - Key
//          0x01 - Platform
//          0x02 - Yoshi
//          0x03 - Shell
//          0x04 - Switch
//          0x05 - Dolphin
//          0x06 - Bowser statue
//          0x07 - Ghost
//          0xfe - Challenge complete
//          0xff - None; happens at initial checkpoint
// $000F61: [8-bit] Various events
//          --- Break the Targets ($13bf = 0x50)
//          Break the Targets! frames remaining (per second)
//          --- Back Door ($13bf = 0x4d)
//          Key challenge status
//          0x00 - Not entered
//          0x01 - Currently in/complete
//          0x02 - Failed

BackDoorChallenges = byte(0xF61) + byte(0xF62) + byte(0xF63) + byte(0xF64) + byte(0xF65) + byte(0xF66) + byte(0xF67) + byte(0xF68) 

// $000F62: [8-bit] Various events
//          --- Break the Targets ($13bf = 0x50)
//          Break the Targets! timer state
//          0x00 - Timer didn't start
//          0x01 - Timer counting down
//          0x02 - Timer expired, next ground causes death
//          --- Back Door ($13bf = 0x4d)
//          Platform challenge status
//          0x00 - Not entered
//          0x01 - Currently in/complete
//          0x02 - Failed
// $000F63: [8-bit] Various events
//          --- Back Door ($13bf = 0x4d)
//          Yoshi challenge status
//          0x00 - Not entered
//          0x01 - Currently in/complete
//          0x02 - Failed
// $000F64: [8-bit] Various events
//          --- Back Door ($13bf = 0x4d)
//          Shell challenge status
//          0x00 - Not entered
//          0x01 - Currently in/complete
//          0x02 - Failed
// $000F65: [8-bit] Various events
//          --- Back Door ($13bf = 0x4d)
//          Switch challenge status
//          0x00 - Not entered
//          0x01 - Currently in/complete
//          0x02 - Failed
// $000F66: [8-bit] Various events
//          --- Back Door ($13bf = 0x4d)
//          Dolphin challenge status
//          0x00 - Not entered
//          0x01 - Currently in/complete
//          0x02 - Failed
// $000F67: [8-bit] Various events
//          --- Back Door ($13bf = 0x4d)
//          Bowser statue challenge status
//          0x00 - Not entered
//          0x01 - Currently in/complete
//          0x02 - Failed
// $000F68: [8-bit] Various events
//          --- Back Door ($13bf = 0x4d)
//          Ghost challenge status
//          0x00 - Not entered
//          0x01 - Currently in/complete
//          0x02 - Failed
// $0013BF: [8-bit] Level ID of most recently entered stage (final rooms when protection is needed)
//          0x00 - Main Menu / Intro; may change momentarily when a message box pops up
//          --- General Overworld
//          0x28 - Information Kiosk
//          0x15 - Play a different level warning
//          0x0a - I. Only Yesterday
//          0x0b - II. The Cost of Living
//          0x0c - III. Life on Earth
//          0x0d - IV. The End is Near
//          0x0e - V. The End
//          0x0f - VI. Oblivion
//          --- World 1
//          0x15 - The Unbearable Quickness of Hedgehog
//          0x12 - Fossil Fueled
//          0x02 - Shells at Dawn
//          0x29 - Zephy Leaves the Nest
//          --- Zone 2
//          0x54 - The Letter "P" (0x13e, prior 0x13d)
//          0x11 - Your Pal Ted
//          0x01 - Shells at Midday
//          0x30 - For Whomst the Charles Charges (0x111, prior 0x110)
//          --- Chapter 3
//          0x47 - Life on Mars
//          0x36 - Good Vibes Only (0x14b, prior 0x14a)
//          0x20 - Shells All Night
//          0x2b - Late Night Terror Club (0x10a, prior 0x109)
//          --- Act 4
//          0x21 - In This House, (0x22, prior 0x21)
//          0x26 - Celeste (2018)
//          0x25 - Terminal Ferocity
//          0x10 - Mega Mole Fucks
//          --- Book 5
//          0x27 - Me, Reaping
//          0x50 - Break the Targets!
//          0x51 - Float Like a Princess (0x1b9, prior 0x1b8)
//          0x09 - Float Like a Princess; after Birdo is defeated (0x1b9, prior 0x1b8)
//          0x4c - Dream Within a Dream
//          --- Denouement
//          0x1f - Disinformation Kiosk
//          0x4d - Daddy's Castle / "Back" "Door" / Full Moon Eclipse (credits)
StageID = byte(0x13bf)
    Brain1 = 0x0a
    Brain2 = 0x0b
    Brain3 = 0x0c
    Brain4 = 0x0d
    Brain5 = 0x0e
    Brain6 = 0x0f
    DaddysCastle = 0x4d
// $001426: [8-bit] Message box status; some messages are assigned to 0x01 and others are assigned to 0x02. This may change "Level ID (0x13bf)" temporarily, use "Screen ID (0x10b)"
//          0x00 - Nothing
//          0x01 - Message shown on screen: Warning, room 0xef; Good Vibes (first try), room 0x11c; Charles (1), room 0x141; Charles (2), room 0x142; Charles (3), room 0x170; Late Night Terror Club, room 0x107
//          0x02 - Message shown on screen
//          0x09 - Loading "Retry" display
//          0x0a - Retry
//          0x0e - Retry
MessageBox = byte(0x1426)
  Message1 = 1
  Message2 = 2
// $001493: [8-bit] End level timer
//          Value is 0x00 until a goal is touched and the end level fanfare begins; value will tick down each frame until it reaches 0x01 and begin exiting the stage on the next frame

EndTimer = byte(0x1493)

// $00150B: [8-bit] Elon head #1 HP; starts at 0x03 and dies at 0x00
// $00150C: [8-bit] Elon head #2 HP; starts at 0x03 and dies at 0x00
// $00150D: [8-bit] Elon head #3 HP; starts at 0x03 and dies at 0x00

Elon1HP = byte(0x150B)
Elon2HP = byte(0x150C)
Elon3HP = byte(0x150D)

// $00153C: birdo hp?
// $001EA4: shells at dawn
// $001EAC: [8-bit] Overworld flags - I. Only Yesterday
// $001F2E: [8-bit] Exits cleared on current save (Max: 0x1b); 0x1b displays as '69'
Exits = byte(0x1f2e)
// $001FEE: moon start
// $001FF0: [8-bit] Moons pt. 1 (stage; screen)
//          Bit2 - The Unbearable Quickness of Hedgehog (0x15; 0x17)
//          Bit5 - Fossil Fueled (0x12; 0x12)
QuicknessMoon = bit2(0x1ff0)
FossilMoon = bit5(0x1ff0)
// $001FF2: [8-bit] Moons pt. 2 (stage;screen)
//          Bit0 - Me, Reaping (0x27, 0x1b1)
//          Bit2 - Terminal Ferocity (0x25, 0x101)
//          Bit6 - In This House, (0x21, 0x22)
ReapingMoon = bit0(0x1ff2)
TerminalMoon = bit2(0x1ff2)
HouseMoon = bit6(0x1ff2)
// $001FF4: [8-bit] Moons pt. 3 (stage; screen)
//          Bit1 - Good Vibes Only (0x36; 0x14a)
//          Bit7 - For Whomst the Charles Charges (0x10c; 0x141)
VibesMoon = bit1(0x1ff4)
CharlesMoon = bit7(0x1ff4)
// $001FF6: [8-bit] Moons pt. 4 (stage; screen)
//          Bit0 - Life on Mars (0x47, 0x125)
MarsMoon = bit0(0x1ff6)
// $001FF7: [8-bit] Moons pt. 5 (stage; screen)
//          Bit2 - Daddy's Castle (0x4d; 0x184, prev 0x190-0x197)
DaddyMoon = bit2(0x1ff7)
// $001FF8: [8-bit] Moons pt. 6 (stage; screen)
//          Bit3 - The Letter "P" (0x54; 0x185, prev 0x137)
//          Bit6 - Float Like a Princess (0x51; 0x1b6, prev 0x1b5)
PMoon = bit3(0x1ff8)
PrincessMoon = bit6(0x1ff8)

// $001FF9: moon end
function AllMoons() => QuicknessMoon + FossilMoon + ReapingMoon + TerminalMoon + HouseMoon + VibesMoon + CharlesMoon + MarsMoon + DaddyMoon + PMoon + PrincessMoon
// $01B403: [16-bit] Current checkpoint
//          0x1c5 - Intro - Bridge
//          0xc3 - Intro - Eclipse
//          --- General Overworld
//          0x104 - Information Kiosk
//          0x15 - Play a different level warning
//          0x0a - I. Only Yesterday
//          0x0b - II. The Cost of Living
//          0x0c - III. Life on Earth
//          0x0d - IV. The End is Near
//          0x0e - V. The End
//          0x0f - VI. Oblivion
//          0x1f - Disinformation Kiosk
//          
//          For Whomst The Charles Charges
//          0x90c - "Midway" (prev, 0x10f); goes to room 0x10c (0x10b address)
//          
//          0x0554 - Celeste (2018); first screen with control
//          
//          0x5a0 - Break the Targets!; first real screen
//          
//          0x580 - Daddy's Castle; first real screen
//          0x12e - "Back" "Door" - Start / gauntlet of challenges
//          0x92e - Back Door - Midway #1 / gauntlet of challenges (not necessary)
//          0x583 - Finished gauntlet 5/7
//          0x184 - Finished gauntlet 7/7 (moon available)
//          0x52f - Full Moon Eclipse - Start

Checkpoint = word(0x1b403)

// $01B405: [8-bit] Retry status
//          Bit0 - Retry chosen
// $020500: [8-bit] Overall File Death Count (Ones place)
DeathOnes = byte(0x20500)
// $020501: [8-bit] Overall File Death Count (Tens place)
// $020502: [8-bit] Overall File Death Count (Hundreds place)
// $020503: [8-bit] Overall File Death Count (Thousands place)
// $020504: [8-bit] Overall File Death Count (Ten Thousands place)
// $020505: [8-bit] Overall File Death Count (One Hundred Thousands place)

Dead = prev(DeathOnes) != DeathOnes
TotalDeaths = byte(0x20500) + (byte(0x20501) * 10) + (byte(0x20502) * 100) + (byte(0x20503) * 1000) + (byte(0x20504) * 10000) + (byte(0x20505) * 100000)

// $020510: Timers pause on the overworld and when the game is paused; they do not pause when "Retry" is shown after dying. Time is stored between save files--delete the SRAM to start fresh. Initial time does not start until the first level is entered from the overworld
//          ---
//          [8-bit] Overall game time - Hours
// $020511: [8-bit] Overall game time - Minutes
// $020512: [8-bit] Overall game time - Seconds
// $020513: [8-bit] Overall game time - Frames

TotalTimeFrames = byte(0x20513) + (byte(0x20512) * 60) + (byte(0x20511) * 3600) + (byte(0x20510) * 216000)
TotalTimeSeconds = byte(0x20512) + (byte(0x20511) * 60) + (byte(0x20510) * 3600)
TotalTimeMinutes = byte(0x20511) + (byte(0x20510) * 60)

// $020564: [8-bit] Overall game time until Overworld level is entered - Hours
// $020565: [8-bit] Overall game time until Overworld level is entered - Minutes
// $020566: [8-bit] Overall game time until Overworld level is entered - Seconds
// $020567: [8-bit] Overall game time until Overworld level is entered - Frames

//RP Library
StageRP = {
    0x15:"The Unbearable Quickness of Hedgehog",
    0x12:"Fossil Fueled",
    0x2:"Shells at Dawn",
    0x29:"Zephy Leaves the Nest",
    0x54:"The Letter ''P''",
    0x11:"Your Pal Ted",
    0x1:"Shells at Midday",
    0x30:"For Whomst the Charles Charges",
    0x47:"Life on Mars",
    0x36:"Good Vibes Only",
    0x20:"Shells All Night",
    0x2b:"Late Night Terror Club",
    0x21:"In This House,",
    0x26:"Celeste (2018)",
    0x04:"Celeste (2018)",
    0x25:"Terminal Ferocity",
    0x10:"Mega Mole Fucks",
    0x27:"Me, Reaping",
    0x50:"Break the Targets!",
    0x51:"Float Like a Princess",
    0x9:"Float Like a Princess",
    0x4c:"Dream Within a Dream",
    0x4d:"Daddy's Castle"
}

//Data

StageData = {
    1:{"Name":"The Unbearable Quickness of Hedgehog","ID":0x15,"endID":0x15,"firstC":0x15,"finalS":0x1c,"moonS":0x17},
    2:{"Name":"Fossil Fueled","ID":0x12,"endID":0x12,"firstC":0x12,"finalS":0x140,"moonS":0x12},
    3:{"Name":"Shells at Dawn","ID":0x02,"endID":0x02,"firstC":0x02,"finalS":0x1c5},
    4:{"Name":"Zephy Leaves the Nest","ID":0x29,"endID":0x29,"firstC":0x105,"finalS":0x106},
    5:{"Name":"The Letter ''P''","ID":0x54,"endID":0x54,"firstC":0x130,"finalS":0x13e,"priorS":0x13d,"moonS":0x185,"priorMoon":0x137},
    6:{"Name":"Your Pal Ted","ID":0x11,"endID":0x11,"firstC":0x11,"finalS":0x1e},
    7:{"Name":"Shells at Midday","ID":0x01,"endID":0x01,"firstC":0x01,"finalS":0x1dc},
    8:{"Name":"For Whomst the Charles Charges","ID":0x30,"endID":0x30,"firstC":0x10c,"finalS":0x111,"priorS":0x110,"moonS":0x141},
    9:{"Name":"Life on Mars","ID":0x47,"endID":0x47,"firstC":0x123,"finalS":0x126,"moonS":0x125},
    10:{"Name":"Good Vibes Only","ID":0x36,"endID":0x36,"firstC":0x112,"finalS":0x14b,"priorS":0x14a,"moonS":0x14a},
    11:{"Name":"Shells All Night","ID":0x20,"endID":0x20,"firstC":0x20,"finalS":0x148},
    12:{"Name":"Late Night Terror Club","ID":0x2b,"endID":0x2b,"firstC":0x107,"finalS":0x10a,"priorS":0x109},
    13:{"Name":"In This House,","ID":0x21,"endID":0x21,"firstC":0x21,"finalS":0x22,"priorS":0x21,"moonS":0x22},
    14:{"Name":"Celeste (2018)","ID":0x26,"endID":0x04,"firstC":0x554,"finalS":0x17b,"priorS":0x179},
    15:{"Name":"Terminal Ferocity","ID":0x25,"endID":0x25,"firstC":0x101,"finalS":0x101,"moonS":0x101},
    16:{"Name":"Mega Mole Fucks","ID":0x10,"endID":0x10,"firstC":0x10,"finalS":0x14},
    17:{"Name":"Me, Reaping","ID":0x27,"endID":0x27,"firstC":0x103,"finalS":0x1b2,"moonS":0x1b1},
    18:{"Name":"Break the Targets!","ID":0x50,"endID":0x50,"firstC":0x5a0,"finalS":0x1b0,"priorS":0x1af},
    19:{"Name":"Float Like a Princess","ID":0x51,"endID":0x09,"firstC":0x12d,"finalS":0x1b9,"priorS":0x1b8,"moonS":0x1b6,"priorMoon":0x1b5},
    20:{"Name":"Dream Within a Dream","ID":0x4c,"endID":0x4c,"firstC":0x128,"finalS":0x128},
    21:{"Name":"Daddy's Castle","ID":0x4d,"endID":0x4d,"firstC":0x580,"finalS":0x12e,"priorS":0x180},
    22:{"Name":"''Back'' ''Door''","ID":0x4d,"endID":0x4d,"firstC":0x12e,"moonS":0x184,"priorMoon":0x190-197},
    23:{"Name":"Full Moon Eclipse","ID":0x4d,"endID":0x4d,"firstC":0x52f}
}
AchData = {
    1:{"clearT":"RIP Sonic","clearP":10,"clearFlav":"a"},
    2:{"clearT":"Wild Ride","clearP":10,"clearFlav":"b"},
    3:{"clearT":"When Shells Are On a Bagel","clearP":10,"clearFlav":"c"},
    4:{"clearT":"Our Little Sonic, All Grown Up","clearP":10,"clearFlav":"d"},
    5:{"clearT":"Paid Programming","clearP":10,"clearFlav":"e"},
    6:{"clearT":"ted title","clearP":10,"clearFlav":"f"},
    7:{"clearT":"You Can Have Shells Any Time","clearP":10,"clearFlav":"g"},
    8:{"clearT":"All Star","clearP":25,"clearFlav":"h"},
    9:{"clearT":"Special Delivery","clearP":10,"clearFlav":"i"},
    10:{"clearT":"We're Having Fun","clearP":25,"clearFlav":"j"},
    11:{"clearT":"We Own These Streets","clearP":25,"clearFlav":"k"},
    12:{"clearT":"terror title","clearP":10,"clearFlav":"l"},
    13:{"clearT":"We Believe","clearP":10,"clearFlav":"m"},
    14:{"clearT":"Celeste, A Performance","clearP":25,"clearFlav":"n"},
    15:{"clearT":"terminal title","clearP":10,"clearFlav":"o"},
    16:{"clearT":"mega mole title","clearP":25,"clearFlav":"p"},
    17:{"clearT":"reaping title","clearP":25,"clearFlav":"q"},
    18:{"clearT":"Complete!","clearP":10,"clearFlav":"r"},
    19:{"clearT":"She Chose Violence","clearP":25,"clearFlav":"s"},
    20:{"clearT":"dream title","clearP":25,"clearFlav":"t"}
}
//Functions and such

LevelComplete = EndTimer > 0
FossilXCheck = XPos >= 0x1720 && ScreenID == 0x140 && EndTimer == 0 && GameState == Active
TerrorYCheck = YPos <= 0x120
DaddyXCheck= XPos <= 0x30
IntroXCheck = XPos <= 0x9f
FullMoonXCheck = XPos >= 0x3838 // find the actual value for passing the goal line
function BackDoorMoonProtection() => BackDoorChallenges == 8 && BackDoorRooms == 8
function BackDoorExit() => __ornext(prev(ScreenID) == 0x183 || prev(ScreenID) == 0x184) && ScreenID == 0x12f

function NormalClear(stage) {
    achievement(
        title=AchData[stage]["clearT"],points=AchData[stage]["clearP"],
        description="Complete " + StageData[stage]["Name"] + ". " + AchData[stage]["clearFlav"],
        trigger=__ornext(StageID == StageData[stage]["ID"] || StageID== StageData[stage]["endID"]) && NormalExit()
    )
}
function ProtectedClear(stage) { //5,8,12,13,14,19
    achievement(
        title=AchData[stage]["clearT"],points=AchData[stage]["clearP"],
        description="Complete " + StageData[stage]["Name"] + ". " + AchData[stage]["clearFlav"],
        trigger=__ornext(StageID == StageData[stage]["ID"] || StageID== StageData[stage]["endID"]) && NormalExit() &&
        once(InLevel() && prev(ScreenID) == StageData[stage]["priorS"] && ScreenID == StageData[stage]["finalS"])
    )
}
function NormalMoon(stage) => StageID == StageData[stage]["ID"] && ScreenID == StageData[stage]["moonS"]

function Speedrun(stage,time) =>
        once(StageID == StageData[stage]["ID"] && GameState == Active && Checkpoint == StageData[stage]["firstC"]) &&
        __ornext(StageID == StageData[stage]["ID"] || StageID== StageData[stage]["endID"]) &&
        unless(repeated(time, once(GameState == Active) && once(Checkpoint == StageData[stage]["firstC"]) && always_true())) && (always_false() || never(Overworld()))

//Achievements

//Intro
achievement(
    title="Rebellious",points=1,
    description="Defy platformer standards on the initial screen for a special message.",
    trigger= ScreenID == Bridge && InLevel() && IntroXCheck
)
achievement(
    title="Where Is This Thing Taking Me!?",points=1,
    description="Complete floor 14 on the elevator ride. Is this thing ever going to stop?",
    trigger= prev(ScreenID) == 0xc3 && ScreenID == 0xc2 && InLevel()
)

achievement( //todo get the values for the boxes
    title="Knowledge is Power",points=1,
    description="Read all of the boxes in Information Kiosk. There is more information to be found on the RA forum of this game to make challenges more accessible--please check it out!",
    trigger= ScreenID == InformationKiosk && InLevel() && measured(tally(10,
            once(MessageBox == 2 && StageID == 0x23), once(MessageBox == 1 && StageID == 0x2a),
            once(MessageBox == 1 && StageID == 0x27), once(MessageBox == 2 && StageID == 0x27),
            once(MessageBox == 1 && StageID == 0x25), once(MessageBox == 2 && StageID == 0x26),
            once(MessageBox == 2 && StageID == 0x24), once(MessageBox == 2 && StageID == 0x25),
            once(MessageBox == 1 && StageID == 0x28), once(MessageBox == 1 && StageID == 0x23))) && 
            never(Overworld())
)
achievement(
    title="Spice Up Your Life",points=1,type="missable",
    description="Get threatened with the dangers of playing levels in order.",
    trigger=ScreenID == Warning && InLevel() && prev(MessageBox) == 0 && MessageBox == 1
)

//World 1

//The Unbearable Quickness of Hedgehog
NormalClear(1)
achievement(
    title="Blending In",points=1,
    description="Collect the moon in The Unbearable Quickness of Hedgehog.",
    trigger= NormalMoon(1) && prev(QuicknessMoon) == 0 && QuicknessMoon == 1
)
achievement(
    title="Rtest",points=1,
    description="beat quickness within 2m",
    trigger= Speedrun(1,7201) && trigger_when(ScreenID == StageData[1]["finalS"] && LevelComplete)
)

//Fossil Fueled
NormalClear(2)
achievement(
    title="Secure Your Belongings Before Riding",points=1,
    description="Collect the moon in Fossil Fueled.",
    trigger= NormalMoon(2) && prev(FossilMoon) == 0 && FossilMoon == 1
)

//Shells at Dawn
NormalClear(3)
achievement(
    title="Rtest2",points=1,
    description="beat shells at dawn within 2m",
    trigger= Speedrun(3,7201) && trigger_when(ScreenID == StageData[3]["finalS"] && LevelComplete)
)

//Zephy Leaves the Nest
NormalClear(4)

//Zone 2
achievement(
    title="Hello, Brain",points=1,type="progression",
    description="Unlock Zone 2: The City of Freaks.",
    trigger= StageID == Brain2 && NormalExit()
)

//The Letter P
achievement(
    title="Brought To You By",points=1,
    description="Clear all of the purple rooms in The Letter ''P''.",
    trigger= StageID == StageData[5]["ID"] && InLevel() && prev(ScreenID) == PPurpleEnd && ScreenID == PBlueStart
)
ProtectedClear(5)
achievement(
    title="Writing on the Wall",points=1,
    description="Collect the moon in The Letter ''P''.",
    trigger= NormalMoon(5) && prev(PMoon) == 0 && PMoon == 1
)

//Your Pal Ted
NormalClear(6)

//Shells at Midday
NormalClear(7)
achievement(
    title="Rtest3",points=1,
    description="beat shells at midday within 2m",
    trigger= Speedrun(7,7201) && trigger_when(ScreenID == StageData[7]["finalS"] && LevelComplete)
)

//For Whomst the Charles Charges
ProtectedClear(8)
achievement(
    title="Art Connoisseur",points=1,
    description="Collect the moon in For Whomst the Charles Charges.",
    trigger= NormalMoon(8) && prev(CharlesMoon) == 0 && CharlesMoon == 1
)

//Chapter 3
achievement(
    title="Hello, Brain3",points=1,type="progression",
    description="Unlock Chapter 3: Wealth & Power.",
    trigger= StageID == Brain3 && NormalExit()
)

//Life on Mars
achievement(
    title="Knock, Knock",points=1,
    description="Arrive at Elon's Tower in Life on Mars. Of course he won't come down to the lobby.",
    trigger= StageID == StageData[5]["ID"] && InLevel() && prev(ScreenID) == prevElonTower && ScreenID == ElonTower
)
NormalClear(9)
achievement(
    title="To the Mooon!",points=1,
    description="Collect the moon in Life on Mars.",
    trigger= NormalMoon(9) && prev(MarsMoon) == 0 && MarsMoon == 1
)
//elon boss challenge
achievement(
    title="Systematic Destruction",points=10,
    description="Defeat each Elon Musk head without damaging another in Life on Mars.",
    trigger=StageID == StageData[9]["ID"] && prev(ScreenID) == ElonBoss && trigger_when(ScreenID == ElonBossWin) &&
            once(StageID == StageData[9]["ID"] && ScreenID == ElonBoss && GameState == Active && Elon1HP == 3 && Elon2HP == 3 && Elon3HP == 3) &&
            never(ScreenID == ElonBoss && __ornext(Elon2HP == 1 || Elon2HP == 2 || Elon3HP == 1 || Elon3HP == 2) && Elon1HP < prev(Elon1HP)) &&
            never(ScreenID == ElonBoss && __ornext(Elon1HP == 1 || Elon1HP == 2 || Elon3HP == 1 || Elon3HP == 2) && Elon2HP < prev(Elon2HP)) &&
            never(ScreenID == ElonBoss && __ornext(Elon1HP == 1 || Elon1HP == 2 || Elon2HP == 1 || Elon2HP == 2) && Elon3HP < prev(Elon3HP)) 
)

//Good Vibes Only
NormalClear(10)
achievement(
    title="good vibes moon",points=1,
    description="Collect the moon in Good Vibes Only.",
    trigger= NormalMoon(10) && prev(VibesMoon) == 0 && VibesMoon == 1
)
achievement(
    title="Wow, First Try!",points=3,
    description="Hit a certain information block on the first try in Good Vibes Only.",
    trigger=ScreenID == VibesMessage && InLevel() && prev(MessageBox) == 0 && MessageBox == 1
)
achievement(
    title="A Good Time",points=1,
    description="beat the good vibes within 2m",
    trigger= Speedrun(10,7201) && trigger_when(prev(ScreenID) == 0x14f && ScreenID == 0x149)
)

//Shells All Night
NormalClear(11)

//Late Night Terror Club
ProtectedClear(12)
//find the hidden info box todo
achievement(
    title="The Distance",points=3,
    description="Find the hidden message block in Late Night Terror Club.",
    trigger=ScreenID == TerrorMessage && InLevel() && prev(MessageBox) == 0 && MessageBox == 1
)

//Act IV
achievement(
    title="Hello, Brain4",points=1,type="progression",
    description="Unlock Act IV: Kaizo Mario World.",
    trigger= StageID == Brain4 && NormalExit()
)

//In This House,
ProtectedClear(13)
achievement(
    title="This is a Safe Space",points=1,
    description="Collect the moon in In This House,.",
    trigger= NormalMoon(13) && prev(HouseMoon) == 0 && HouseMoon == 1
)

//Celeste (2018)
achievement( // double check that this is actually the best part to do this. perhaps should change over when ch 5  is beaten
    title="reach badeline",points=1,
    description="Complete Chapter 5 in Celeste (2018).",
    trigger= StageID == StageData[14]["ID"] && InLevel() && prev(ScreenID) == prevBadelineStart && ScreenID == BadelineStart
)
NormalClear(14)
achievement(
    title="badeline", points=10,
    description="Defeat Badeline Celeste in 20 or less deaths in Celeste (2018).",
    trigger= StageID == StageData[14]["ID"] && trigger_when(prev(ScreenID) == BadelineEnd && ScreenID == BadelineEndNext) &&
            once(StageID == StageData[14]["ID"] && ScreenID == BadelineStart && GameState == Active) &&
            unless(tally(21,Dead)) && never(Overworld()) && never(ScreenID == prevBadelineStart)
)

//Terminal Ferocity
NormalClear(15)
achievement(
    title="Level Design Is My Passion",points=1,
    description="Collect the moon in Terminal Ferocity.",
    trigger= NormalMoon(15) && prev(TerminalMoon) == 0 && TerminalMoon == 1
)

//Mega Mole Fucks
NormalClear(16)

//Book 5
achievement(
    title="Hello, Brain5",points=1,type="progression",
    description="Unlock Book 5: Comeuppance.",
    trigger= StageID == Brain5 && NormalExit()
)

//Me, Reaping
NormalClear(17)
achievement(
    title="reaping moon",points=1,
    description="Collect the moon in Terminal Ferocity.",
    trigger= NormalMoon(17) && prev(ReapingMoon) == 0 && ReapingMoon == 1
)

//Break the Targets!
NormalClear(18)
achievement(
    title="A New Record!",points=1,
    description="beat the break within 2m",
    trigger= Speedrun(18,7201) && trigger_when(prev(ScreenID) == 0x1af && ScreenID == 0x1b0)
)

//Float Like a Princess -- adding an extra bit of flavor. maybe a trigger?
achievement(
    title="carnival",points=1,
    description="Find yourself at a carnival in Float Like a Princess.",
    trigger= StageID == StageData[19]["ID"] && InLevel() && prev(ScreenID) == prevPrincessCarnival && ScreenID == PrincessCarnival
)
ProtectedClear(19)
achievement(
        title=AchData[19]["clearT"],points=AchData[19]["clearP"],
        description="Defeat Birdo and complete Float Like a Princess",
        trigger=__ornext(StageID == StageData[19]["ID"] || StageID== StageData[19]["endID"]) && NormalExit() &&
        once(InLevel() && prev(ScreenID) == StageData[19]["priorS"] && ScreenID == StageData[19]["finalS"])
)
achievement(
    title="princess moon",points=1,
    description="Collect the moon in Terminal Ferocity.",
    trigger= NormalMoon(19) && prev(PrincessMoon) == 0 && PrincessMoon == 1 && prior(ScreenID) == StageData[19]["priorMoon"]
)

//Dream Within a Dream
NormalClear(20)

//Denouement
achievement(
    title="Hello, Brain6",points=1,type="progression",
    description="Unlock Denouement: Daddy's Castle.",
    trigger= StageID == Brain6 && NormalExit()
)

//Disinformation Kiosk
//all boxes todo
achievement(
    title="info",points=1,
    description="Read all of the message boxes in Disinformation Kiosk.",
    trigger= ScreenID == DisinformationKiosk && measured(tally(7,
            once(MessageBox == 1 && StageID == 0x4d), once(MessageBox == 2 && StageID == 0x49),
            once(MessageBox == 2 && StageID == 0x4a), once(MessageBox == 1 && StageID == 0x4b),
            once(MessageBox == 2 && StageID == 0x4b), once(MessageBox == 1 && StageID == 0x4c),
            once(MessageBox == 1 && StageID == 0x23))) && never(Overworld())
)

//Daddy's Castle
achievement(
    title="daddy's castle",points=1,type="progression",
    description="Complete the first screen of Daddy's Castle and enter the ''Back'' ''Door''",
    trigger= StageID == DaddysCastle && InLevel() && prev(ScreenID) == DaddyStart && ScreenID == BackDoorStart
)
//Complete the first screen of Daddy's Castle without collecting any power-ups.
achievement(
    title="daddy's castle challenge",points=1,
    description="Complete the first screen of Daddy's Castle and enter the ''Back'' ''Door'' without using power-ups.",
    trigger= StageID == DaddysCastle && InLevel() && prev(ScreenID) == DaddyStart && trigger_when(ScreenID == BackDoorStart) &&
            once(StageID == DaddysCastle && ScreenID == DaddyStart && GameState == Active && DaddyXCheck) &&
            never(Overworld()) && never(Dead) && never(PowerUp != 0)
)

//Back Door
achievement(
    title="Pineapple! Pineapple!!",points=1,
    description="Use the safe word and skip the ''Back'' ''Door'' section of Daddy's Castle. Boundaries are important.",
    trigger= StageID == DaddysCastle && prev(ScreenID) == SafeWord && ScreenID == FullMoon
)
achievement(
    title="Consistency Check",points=25,
    description="Complete the ''Back'' ''Door'' section of Daddy's Castle the proper way.",
    trigger= StageID == DaddysCastle && InLevel() && BackDoorExit()
)
achievement(
    title="No Room Left Behind",points=100,
    description="Collect the moon in Terminal Ferocity.",
    trigger= NormalMoon(22) && prev(DaddyMoon) == 0 && DaddyMoon == 1 && BackDoorMoonProtection()
)

//Full Moon Eclipse
achievement(
    title="Saved the World?",points=10,type="win_condition",
    description="Finish the game and save the world?",
    trigger= StageID == DaddysCastle && NormalExit()
)
achievement(
    title="Humble Hedgehog", points=10,
    description="Complete Full Moon Eclipse without collecting more than 30 rings or coins.",
    trigger= StageID == DaddysCastle && ScreenID == FullMoon && trigger_when(FullMoonXCheck) &&
            unless(tally(31,ScreenID == FullMoon && Rings != prev(Rings))) && never(Dead) && never(Overworld())
)

//100% levels
achievement(
    title="Nice.",points=10,
    description="Reach a completed exit count of ''69''.",
    trigger= GameState > MainMenu && prev(Exits) == 0x1a && Exits == 0x1b
)

//Leaderboards

//Full game leaderboards
//any% speed/death;  100% speed/death in-game. RTA any%, daddy%, 100% 
//consider bit7(0x1eef) == 0 for any% with saves to stop it from triggering every time it's beaten
leaderboard(
    title="Full Game [Saves Allowed] - Any%",
    description="Complete the game as fast as you can.",
    start= StageID == 0x4d && LevelComplete && ScreenID == FinalScreen,
    cancel= always_false(),
    submit= always_true(),
    value=TotalTimeFrames, format="FRAMES", //  maybe do minutes
    lower_is_better=true
)
leaderboard(
    title="Full Game [Saves Allowed] - Any% Deaths",
    description="Complete the game with as few deaths as you can.",
    start=StageID == 0x4d && LevelComplete && ScreenID == FinalScreen,
    cancel= always_false(),
    submit= always_true(),
    value=TotalDeaths, format="VALUE",
    lower_is_better=true
)
leaderboard(
    title="Full Game [Saves Allowed] - 100%",
    description="Complete every exit and collect every moon as fast as you can.",
    start=(AllMoons() == 11 && prev(Exits) == 0x1a && Exits == 0x1b) ||
          (Exits == 0x1b && prev(AllMoons()) == 10 && AllMoons() == 11),
    cancel= always_false(),
    submit= always_true(),
    value=TotalTimeFrames, format="FRAMES", //  maybe do minutes
    lower_is_better=true
)
leaderboard(
    title="Full Game [Saves Allowed] - 100% Deaths",
    description="Complete every exit and collect every moon with as few deaths as you can.",
    start=(AllMoons() == 11 && prev(Exits) == 0x1a && Exits == 0x1b) ||
          (Exits == 0x1b && prev(AllMoons()) == 10 && AllMoons() == 11),
    cancel= always_false(),
    submit= always_true(),
    value=TotalDeaths, format="VALUE",
    lower_is_better=true
)
//RTA LB -- maybe make these submit when you cross the last bar

leaderboard(
    title="Full Game [RTA/Single Session] - Any%",
    description="Skip the Intro from the bridge then complete the game as fast as you can.",
    start= ScreenID == Bridge && Exits == 0 && GameState == Overworld,
    cancel= always_false(),
    submit= StageID == 0x4d && LevelComplete && ScreenID == FinalScreen,
    value=measured(always_true()), format="FRAMES", 
    lower_is_better=true
)
leaderboard(
    title="Full Game [RTA/Single Session] - Daddy%",
    description="Skip the Intro from the bridge then complete the game while completing ''Back'' ''Door'' the proper way as fast as you can.",
    start= ScreenID == Bridge && Exits == 0 && GameState == Overworld,
    cancel= always_false(),
    submit= StageID == 0x4d && LevelComplete && once(BackDoorExit()),
    value=measured(always_true()), format="FRAMES",
    lower_is_better=true
)
leaderboard(
    title="Full Game [RTA/Single Session] - 100%",
    description="Skip the Intro from the bridge then complete every exit and collect every moon as fast as you can.",
    start= ScreenID == Bridge && Exits == 0 && GameState == Overworld,
    cancel= MainMenu(),
    submit=(AllMoons() == 11 && prev(Exits) == 0x1a && Exits == 0x1b) ||
          (Exits == 0x1b && prev(AllMoons()) == 10 && AllMoons() == 11),
    value=measured(always_true()), format="FRAMES",
    lower_is_better=true
)


//IL leaderboards
function Leaderboard(stage) {
    leaderboard(
        title=StageData[stage]["Name"],
        description="Complete " + StageData[stage]["Name"] + " as fast as you can.",
        start= StageID == StageData[stage]["ID"] && GameState == Active && Checkpoint == StageData[stage]["firstC"],
        cancel= Overworld(),
        submit= __ornext(StageID == StageData[stage]["ID"] || StageID== StageData[stage]["endID"]) && ScreenID == StageData[stage]["finalS"] && LevelComplete,
        value= measured(always_true()), format="FRAMES",lower_is_better=true
    )
}
//Broken up simply to keep things in order as 2,12,14,18 need custom checks
//The Unbearable Quickness of Hedgehog
Leaderboard(1)
//Fossil Fueled
leaderboard(
        title=StageData[2]["Name"],
        description="Complete " + StageData[2]["Name"] + " as fast as you can.",
        start= StageID == StageData[2]["ID"] && GameState == Active && Checkpoint == StageData[2]["firstC"],
        cancel= Overworld(),
        submit= __ornext(StageID == StageData[2]["ID"] || StageID== StageData[2]["endID"]) && ScreenID == StageData[2]["finalS"] && LevelComplete && 
                once(FossilXCheck) && never(Overworld()),
        value= measured(always_true()), format="FRAMES",lower_is_better=true
)
//Shells at Dawn through Shells All Night
for i in range(3,11)
    Leaderboard(i)
//Late Night Terror Club
leaderboard(
        title=StageData[12]["Name"],
        description="Complete " + StageData[12]["Name"] + " as fast as you can.",
        start= StageID == StageData[12]["ID"] && GameState == Active && Checkpoint == StageData[12]["firstC"],
        cancel= Overworld(),
        submit= __ornext(StageID == StageData[12]["ID"] || StageID== StageData[12]["endID"]) && ScreenID == StageData[12]["finalS"] && LevelComplete && TerrorYCheck,
        value= measured(always_true()), format="FRAMES",lower_is_better=true
)
//In This House, 
Leaderboard(13)
//Celeste (2018)
leaderboard(
        title=StageData[14]["Name"],
        description="Complete " + StageData[14]["Name"] + " as fast as you can.",
        start= StageID == StageData[14]["ID"] && GameState == Active && Checkpoint == StageData[14]["firstC"],
        cancel= Overworld(),
        submit= __ornext(StageID == StageData[14]["ID"] || StageID== StageData[14]["endID"]) && prev(ScreenID) == 0x179 && ScreenID == 0x17b,
        value= measured(always_true()), format="FRAMES",lower_is_better=true
)
//Terminal Ferocity through Me, Reaping
for i in range(15,17)
    Leaderboard(i)
//Break the Targets!
leaderboard(
        title=StageData[18]["Name"],
        description="Complete " + StageData[18]["Name"] + " as fast as you can.",
        start= StageID == StageData[18]["ID"] && GameState == Active && Checkpoint == StageData[18]["firstC"],
        cancel= Overworld(),
        submit= __ornext(StageID == StageData[18]["ID"] || StageID== StageData[18]["endID"]) && prev(ScreenID) == 0x1af && ScreenID == 0x1b0,
        value= measured(always_true()), format="FRAMES",lower_is_better=true
)
//Float Like a Princes and Dream Within a Dream
for i in range(19,20)
    Leaderboard(i)
//Daddy's Castle levels
leaderboard(
        title="Daddy's Castle",
        description="Complete the first screen of Daddy's Castle as fast as you can.",
        start= StageID == StageData[21]["ID"] && GameState == Active && Checkpoint == StageData[21]["firstC"],
        cancel= Overworld(),
        submit= StageID == StageData[21]["ID"] && prev(ScreenID) == 0x180 && ScreenID == 0x12e,
        value= measured(always_true()), format="FRAMES",lower_is_better=true
)
leaderboard(
        title="''Back'' ''Door''",
        description="Complete ''Back'' 'Door'' the proper way as fast as you can.",
        start= StageID == StageData[22]["ID"] && GameState == Active && Checkpoint == StageData[22]["firstC"],
        cancel= __ornext(Overworld() || ScreenID == SafeWord),
        submit= StageID == StageData[22]["ID"] && BackDoorExit(),
        value= measured(always_true()), format="FRAMES",lower_is_better=true
)
//leaderboard for Good Vibes challenge
leaderboard(
        title="A Good Time",
        description="Complete the good vibes of Good Vibes Only as fast as you can.",
        start= StageID == StageData[10]["ID"] && GameState == Active && Checkpoint == StageData[10]["firstC"],
        cancel= Overworld(),
        submit= StageID == StageData[10]["ID"] && prev(ScreenID) == 0x14f && ScreenID == 0x149,
        value= measured(always_true()), format="FRAMES",lower_is_better=true
)
leaderboard(
        title="Badeline Challenge",
        description="Defeat Badeline Celeste in Celeste (2018) with as few deaths as you can.",
        start= StageID == StageData[14]["ID"] && ScreenID == BadelineStart && GameState == Active,
        cancel= Overworld(),
        submit= StageID == StageData[14]["ID"] && prev(ScreenID) == BadelineEnd && ScreenID == BadelineEndNext,
        value= Dead, format="VALUE",lower_is_better=true
)
//RP
rich_presence_conditional_display(MainMenu(),"Sonic is getting ready to work through some things.")
rich_presence_conditional_display(GameState > 9 && GameState < 15, "Sonic is selecting their fate • 💀[{0}] • ⏱️[{1}] • 🚩️[{2}]",
      rich_presence_value("Digit",TotalDeaths,format="VALUE"),
      rich_presence_value("Minutes",TotalTimeMinutes,format="MINUTES"),
      rich_presence_value("Digit",Exits,format="VALUE")
)
rich_presence_conditional_display(InLevel() && __ornext(MessageBox == 1 || MessageBox == 2), "Sonic is {0} • 💀[{1}] • ⏱️[{2}] • 🚩️[{3}]",
      rich_presence_lookup("Stage",prior(StageID),StageRP),
      rich_presence_value("Digit",TotalDeaths,format="VALUE"),
      rich_presence_value("Minutes",TotalTimeMinutes,format="MINUTES"),
      rich_presence_value("Digit",Exits,format="VALUE")
)
rich_presence_display("Sonic is {0} • 💀[{1}] • ⏱️[{2}] • 🚩️[{3}]",
      rich_presence_lookup("Stage",StageID,StageRP),
      rich_presence_value("Digit",TotalDeaths,format="VALUE"),
      rich_presence_value("Minutes",TotalTimeMinutes,format="MINUTES"),
      rich_presence_value("Digit",Exits,format="VALUE")
)

//Cheaterboards -- These will submit if the player reloads a save or leaves the stage on an exit screen (nothing but hit the exit)
function Cheaterboard(stage) {
      leaderboard(
          title=StageData[stage]["Name"] + " - Old",
          description="Earn as many points as you can in " + StageData[stage]["Name"],
          start= __ornext(StageID == StageData[stage]["ID"] || StageID== StageData[stage]["endID"]) && ScreenID == StageData[stage]["finalS"] && LevelComplete &&
                prior(ScreenID) != StageData[stage]["priorS"],
          cancel=always_false(),
          submit=always_true(),
          value=measured(Exits),format="VALUE"
    )
}
//Run Cheaterboards
for i in [5,8,10,12,13,18]
    Cheaterboard(i)
