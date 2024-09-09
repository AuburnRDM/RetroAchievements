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

DaddyXCheck= XPos <= 0x30
IntroXCheck = XPos <= 0x9f


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

// $001FF2: [8-bit] Moons pt. 2 (stage;screen)
//          Bit0 - Me, Reaping (0x27, 0x1b1)
//          Bit2 - Terminal Ferocity (0x25, 0x101)
//          Bit6 - In This House, (0x21, 0x22)
// $001FF4: [8-bit] Moons pt. 3 (stage; screen)
//          Bit1 - Good Vibes Only (0x36; 0x14a)
//          Bit7 - For Whomst the Charles Charges (0x10c; 0x141)
// $001FF6: [8-bit] Moons pt. 4 (stage; screen)
//          Bit0 - Life on Mars (0x47, 0x125)
// $001FF7: [8-bit] Moons pt. 5 (stage; screen)
//          Bit2 - Daddy's Castle (0x4d; 0x184, prev 0x190-0x197)
// $001FF8: [8-bit] Moons pt. 6 (stage; screen)
//          Bit3 - The Letter "P" (0x54; 0x185, prev 0x137)
//          Bit6 - Float Like a Princess (0x51; 0x1b6, prev 0x1b5)
// $001FF9: moon end
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

// $020564: [8-bit] Overall game time until Overworld level is entered - Hours
// $020565: [8-bit] Overall game time until Overworld level is entered - Minutes
// $020566: [8-bit] Overall game time until Overworld level is entered - Seconds
// $020567: [8-bit] Overall game time until Overworld level is entered - Frames

//Data
StageData = {
    1:{"Name":"The Unbearable Quickness of Hedgehog","ID":0x15,"firstC":0x15,"finalS":0x1c,"moonS":0x17},
    2:{"Name":"Fossil Fueled","ID":0x12,"firstC":0x12,"finalS":0x140,"moonS":0x12},
    3:{"Name":"Shells at Dawn","ID":0x02,"firstC":0x02,"finalS":0x1c5},
    4:{"Name":"Zephy Leaves the Nest","ID":0x29,"firstC":0x105,"finalS":0x106},
    5:{"Name":"The Letter ''P''","ID":0x54,"firstC":0x130,"finalS":0x13e,"priorS":0x13d,"moonS":0x185,"priorMoon":0x137},
    6:{"Name":"Your Pal Ted","ID":0x11,"firstC":0x11,"finalS":0x1e},
    7:{"Name":"Shells at Midday","ID":0x01,"firstC":0x01,"finalS":0x1dc},
    8:{"Name":"For Whomst the Charles Charges","ID":0x30,"firstC":0x10c,"finalS":0x111,"priorS":0x110,"moonS":0x141},
    9:{"Name":"Life on Mars","ID":0x47,"firstC":0x123,"finalS":0x126,"moonS":0x125},
    10:{"Name":"Good Vibes Only","ID":0x36,"firstC":0x112,"finalS":0x14b,"priorS":0x14a,"moonS":0x14a},
    11:{"Name":"Shells All Night","ID":0x20,"firstC":0x20,"finalS":0x148},
    12:{"Name":"Late Night Terror Club","ID":0x2b,"firstC":0x107,"finalS":0x10a,"priorS":0x109},
    13:{"Name":"In This House,","ID":0x21,"firstC":0x21,"finalS":0x22,"priorS":0x21,"moonS":0x22},
    14:{"Name":"Celeste (2018)","ID":0x26,"endID":0x04,"firstC":0x554,"finalS":0x17b,"priorS":0x179},
    15:{"Name":"Terminal Ferocity","ID":0x25,"firstC":0x101,"finalS":0x101,"moonS":0x101},
    16:{"Name":"Mega Mole Fucks","ID":0x10,"firstC":0x10,"finalS":0x14},
    17:{"Name":"Me, Reaping","ID":0x27,"firstC":0x103,"finalS":0x1b2,"moonS":0x1b1},
    18:{"Name":"Break the Targets!","ID":0x50,"firstC":0x5a0,"finalS":0x1b0,"priorS":0x1af},
    19:{"Name":"Float Like a Princess","ID":0x51,"endID":0x09,"firstC":0x12d,"finalS":0x1b9,"priorS":0x1b8,"moonS":0x1b6,"priorMoon":0x1b5},
    20:{"Name":"Dream Within a Dream","ID":0x4c,"firstC":0x128,"finalS":0x128},
    21:{"Name":"Daddy's Castle","ID":0x4d,"firstC":0x580,"finalS":0x12e,"priorS":0x180},
    22:{"Name":"''Back'' ''Door''","ID":0x4d,"firstC":0x12e,"moonS":0x184,"priorMoon":0x190-197},
    23:{"Name":"Full Moon Eclipse","ID":0x4d,"firstC":0x52f}
}


//Functions and such
LevelComplete = EndTimer > 0
FossilXCheck = XPos >= 0x1720 && ScreenID == 0x140 && EndTimer == 0
function BackDoorMoonProtection() => BackDoorChallenges == 8 && BackDoorRooms == 8
//Achievements

//Leaderboards

//RP


