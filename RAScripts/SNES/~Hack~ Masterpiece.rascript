// ~Hack~ Masterpiece
// #ID = 33726

// $000019: [8-bit] Power-up
//          0x00 - None
//          0x01 - Mushroom
//          0x02 - Cape
//          0x03 - Fire

PowerUp = byte(0x19)

// $000035: [16-bit] house, flipping House position
//          0xe8ff - Completely upside-down
//          0xf0ff - Mostly upside-down (close right)
//          0xd8ff - Mostly upside-down (loose left)
//          0xf8ff - Mostly upside-down (loose right)
//          0xe0ff - Mostly upside-down (close left)

HouseChallenge = word(0x35) >= 0xe0ff && word(0x35) <= 0xf8ff

// $000060: [8-bit] hath thou soup? events (Screen: 0x012d)
//          0x00 - No soup fed
//          0x01 - Soup locked
//          0x02~04 - Mouth opening and closing
//          0x05 - yum yum!
//          0x06 - Wall starts to come down
// $000071: [8-bit] Mario state
//          0x06 - Loading into stage after death / entering a vertical pipe
//          0x09 - Dead

Dead = byte(0x71) == 0x09

// $000094: [16-bit] Player's X-position (Left of map is 0x0000)

XPos = word(0x94)

// $000096: [16-bit] Player's Y-position (Top of map is 0x0000)

YPos= word(0x96)

// $0000F0: [8-bit] General boss HP remaining
// $000100: [8-bit] Game Status
//          0x01 - Dedication
//          0x07 - Title Screen
//          0x08 - Select file
//          0x0a - Loading existing file
//          0x2a - Selecting lives mode
//          0x0b - Fade to overworld
//          0x0e - Overworld
//          0x0f - Respawn/In pipe
//          0x13 - Loading into level
//          0x14 - In a level (fully loaded)
GameState = byte(0x100)

Overworld = GameState <= 0x0e
MainMenu = GameState <= 0x0a
LevelStart = prev(GameState) == 0x13 && GameState == 0x14
InLevel = GameState >= 0x0f


// $00010B: [16-bit] Most recent screen ID loaded (Does not change when entering the overworld until a new level is selected)
//          --- World 1
//          0x04 - gwyneth paltrow
//          0x0b - over the top
//          0x01 - hello old friend
//          0x101 - cozy kaizo
//          0x105 - left leaning
//          0x09 - Monster Energy Drink fortress; first screen
//          0x36 - Monster Energy Drink fortress; boss
//          0x07 - bouncin' on it palace; screen 1
//          0x34 - bouncin' on it palace; switch screen
//          0x10d - world 1 secret
//          --- World 2
//          0x06 - im not washed up
//          0x10c - dopamine detox
//          0x116 - this level, rocks
//          0x121 - climbing up the walls
//          0x13b - Alive, and, well,
//          0x08 - american justice; first screen
//          0x35 - american justice; boss
//          0x0a - Jeff Bezos Climate Pledge palace; first screen
//          0x44 - Jeff Bezos Climate Pledge palace; switch screen
//          0x10e - world 2 secret
//          --- World 3
//          0x05 - shitty forest
//          0x02 - the overton window
//          0x11f - born and raised; first screen
//          0x1c8 - born and raised; goal
//          0x115 - the world's richest man
//          0x112 - orpheo looks back
//          0x17 - a lonely shell in repose
//          0x113 - tony hawkemoto's pro kaizo 3; first screen
//          0x114 - tony hawkemoto's pro kaizo 3; boss
//          0x0c - bicurious palace; first screen
//          0x54 - bicurious palace; switch screen
//          0x1a - Monster Energy Drink ocean spire
//          0x10f - world 3 secret
//          --- World 4
//          0x103 - fish bish
//          0x03 - thinly veiled threat
//          0x117 - the left hand of darkness
//          0x10b - microdosing
//          0x102 - sigma star
//          0x1e - this level crashes the game
//          0x0e - ovulation station; first screen
//          0x37 - ovulation station; boss
//          0x0f - palace of dead friends; first screen
//          0x64 - palace of dead friends; switch screen
//          0x110 - world 4 secret
//          --- World 5
//          0x11 - i should call her
//          0x10 - thrice GOATed
//          0x13 - ABR (Always Be Reaping)
//          0x12 - dream catcher
//          --- Daddy's Castle
//          0x18 - return to daddy's castle; start
//          0x78 - return to daddy's castle; challenge clear (no moon)
//          0x79 - return to daddy's castle; challenge clear (moon)
//          0x7a - return to daddy's castle; boss
//          --- Chapter 2 part 1
//          0x0d - live and learn (credits)
//          0x19 - incantation (requires 3 secrets)
//          0x84 - secret exit 1
//          0x83 - secret exit 2
//          0x85 - secret exit 3
//          --- Chapter 2 part 2
//          0x122 - A/B Testing
//          0x124 - enter haimari; sonic fight
//          0x122 - enter haimari; goal screen
//          0x128 - bedlam
//          0x129 - poetry in motion
//          0x12b - milk crisis; opening
//          0x7c - milk crisis; actual stage
//          0x6a - milk crsis; final screen
//          0x123 - proxy war
//          0x126 - malicious appliance
//          0x12c - Boss Bass World Championship '86; start
//          0x38 - Boss Bass World Championship '86; first challenger intro
//          0x39 - Boss Bass World Championship '86; first challenger fight
//          0x3c - Boss Bass World Championship '86; second challenger intro
//          0x3d - Boss Bass World Championship '86; second challenger fight
//          0x55- Boss Bass World Championship '86; finals intro
//          0x58 - Boss Bass World Championship '86; finals cutscene
//          0x56 - Boss Bass World Championship '86; finals fight
//          0x59 - Boss Bass World Championship '86; podium screen
//          0x6b - Boss Bass World Championship '86; goal screen
//          0x127 - suckin a dick
//          0x12a - KOOPA KEEP - ABERI; start
//          0x69 - KOOPA KEEP - ABERI; goal screen
//          0x130 - house, flipping; house, flipping
//          0x66 - house, flipping; actual stage
//          0x65 - house, flipping; goal screen
//          0x12d - hath thou soup? - start/end screen
//          0x6c - hath thou soup? - temple start
//          0x6d - hath thou soup? - temple altar
//          0x6e - hath thou soup? - temple yoshi
//          0x6f - hath thou soup? - temple soup
//          --- NICE
//          0x14 - all your friends; start
//          0x45 - all your friends; 1st boss
//          0x46 - all your friends; after first boss
//          0x47 - all your friends; 2nd boss
//          0x48 - all your friends; after 2nd boss
//          0x49 - all your friends; 3rd boss
//          0x4a - all your friends; after 3rd boss
//          0x4b - all your friends; 4th boss
//          0x4c - all your friends; after 4th boss
//          0x4d - all your friends; last boss
//          0x4e - all your friends; exit
//          
//          0x139 - indulge me; start
//          0xc0 - indulge me; shuffle screen
//          0xa0~0xbf - indulge me; challenge screens
//          0xc1 - indulge me; goal screen
//          --- Final Overworld
//          0x137 - god's final message to her creation
//          0x138 - inner critic; start
//          0xf0 - inner critic; level 1
//          0xe0~0xff - inner critic; levels
//          0xef - inner critic; level 32
//          0xd4 - inner critic; goal/exit
//          0x13a - masterpiece

ScreenID = word(0x10b)

// $000DBE: [8-bit] Lives (during 99 Lives mode)
//          0xff - Game Over

Lives = byte(0xdbe)
GameOver = Lives == 0xff

// $000DBF: [8-bit] Current rings (coins)

Rings = byte(0xdbf)

// $000DC0: [8-bit] Amount of rings left to collect before the star block produces a 1-up
// $000DD5: [8-bit] Method stage is exited
//          0x00 - No exit ocurring
//          0x01 - Stage exit via normal exit
//          0x02 - Stage exit via keyhole
//          0x80 - Stage exit via Start+Select

StageExit = byte(0xdd5)

// $0013BF: [8-bit] Level ID; updates immediately when on the stage in overworld
//          0x04 - gwyneth paltrow
//          0x0b - over the top
//          0x01 - hello old friend
//          0x25 - cozy kaizo
//          0x29 - left leaning
//          0x09 - Monster Energy Drink™ fortress
//          0x07 - bouncin' on it palace
//          0x31 - world 1 secret
//          0x2a - i keep crawlin back
//          0x06 - im not washed up
//          0x30 - dopamine detox
//          0x3a - this level, rocks
//          0x45 - climbing up the walls
//          0x5f - Alive, and, well,
//          0x08 - american justice
//          0x0a - Jeff Bezos Climate Pledge palace
//          0x32 - world 2 secret
//          0x2a - i keep crawlin back
//          0x05 - shitty forest
//          0x02 - the overton window
//          0x43 - born and raised
//          0x39 - the world's richest man
//          0x36 - orpheo looks back
//          0x17 - a lonely shell in repose
//          0x37 - tony hawkemoto's pro kaizo 3
//          0x0c - bicurious palace
//          0x1a - Monster Energy Drink™ ocean spire
//          0x33 - world 3 secret
//          0x2a - i keep crawlin back
//          0x27 - fish bish
//          0x03 - thinly veiled threat
//          0x3b - the left hand of darkness
//          0x2f - microdosing
//          0x26 - sigma star
//          0x1e - this level crashes the game
//          0x0e - ovulation station
//          0x0f - palace of the dead friends
//          0x34 - world 4 secret
//          0x2a - i keep crawlin back
//          0x11 - i should call her
//          0x10 - thrice GOATed
//          0x13 - ABR (Always Be Reaping)
//          0x12 - dream catcher
//          0x18 - return to daddy's castle
//          0x0d - live and learn
//          0x19 - incantation
//          0x46 - A/B testing
//          0x48 - enter haimari
//          0x4c - bedlam
//          0x4d - poetry in motion
//          0x4f - milk crisis
//          0x47 - proxy war
//          0x4a - malicious appliance
//          0x50 - Boss Bass World Championship '86
//          0x4b - suckin a dick
//          0x4e - KOOPA KEEP - ABERI
//          0x54 - house, flipping
//          0x51 - hath thou soup?
//          0x14 - all your friends
//          0x5d - indulge me
//          0x5b - god's final message to her creation
//          0x5c - inner critic
//          0x5e - masterpiece

StageID = byte(0x13bf)

// $0013D4: [8-bit] Pause status
//          0x00 - Not paused
//          0x01 - Paused

Pause = byte(0x13d4)

// $001426: [8-bit] Message box status; some messages are assigned to 0x01 and others are assigned to 0x02. This may change "Level ID (0x13bf)" temporarily, use "Screen ID (0x10b)"
//          
//          --- hath thou soup? (box status; stage)
//          (0x01; 0x03), (0x02; 0x03), (0x02; 0x06), (0x01; 0x06), (0x02; 0x08),
//          (0x01; 0x01), (0x01; 0x04), (0x02; 0x04)
//          final (0x01; 0x09)
//          
//          yum yum! (0x01; 0x51)

MessageBox = byte(0x1426)

// $001434: [8-bit] End level timer - Key exit
//          Value is 0x00 until a keyhole is entered and the end level fanfare begins; value will tick down each frame until it reaches 0x01 and begin exiting the stage on the next frame

KeyComplete = prev(byte(0x1434)) == 0 && byte(0x1434) > 0

// $00148F: [8-bit] Holding something (ex: a shell)
//          0x00 - Not holding
//          0x01 - Holding
// $001493: [8-bit] End level timer - Normal/Orb goal
//          Value is 0x00 until a goal is touched and the end level fanfare begins; value will tick down each frame until it reaches 0x01 and begin exiting the stage on the next frame

NormalComplete = prev(byte(0x1493)) == 0 && byte(0x1493) > 0

// $0014AF: [8-bit] Switch value
//          0x00 - Off
//          0x01 - On

Switch = byte(0x14af)
        Off = 0
        On = 1

// $001531: [8-bit] return to daddy's castle / all my friends - Final boss hits taken; this works differently than other boss HP and counts up instead of down. The boss dies once this counter goes from 5 > 6

FinalBossHits = byte(0x1531)
FinalBossDead = prev(FinalBossHits) == 5 && FinalBossHits == 6

// $00153B: [8-bit] ovulation station / all my friends - Wendy HP

WendyHP = byte(0x153b)

// $00157A: [8-bit] Sonic's HP (boss) - enter haimari; starts at 0x03 and the encounter ends when it reaches 0x00

SonicHaimariHP = byte(0x157a)

// $001615: [8-bit] all your friends - Magikoopa (solo) HP

SoloMagikoopaHP = byte(0x1615)

// $001619: [8-bit] tony hawkemoto's pro kaizo 3 / all your friends - Magikoopa (Reznor) HP

MagikoopaDuoHP = byte(0x1619)

// $001881: [8-bit] Monster Energy Drink fortress / all my friends - Right Reznor HP
// $001882: [8-bit] Monster Energy Drink fortress / all my friends - Left Reznor HP

ReznorHP = byte(0x1881) + byte(0x1882)

// $0018C5: [8-bit] inner critic - Number of lives that will be added to the player's total if the screen is completed; this is 0x03 when you collect the 3-UP
InnerCriticBonus = byte(0x18c5)
// $001F27: [8-bit] Green switch
//          bit0 - Active

GreenSwitch = bit0(0x1f27)

// $001F28: [8-bit] Yellow switch
//          bit0 - Active

YellowSwitch = bit0(0x1f28)

// $001F29: [8-bit] Blue switch
//          bit0 - Active

BlueSwitch = bit0(0x1f29)

// $001F2A: [8-bit] Red switch
//          bit0 - Active

RedSwitch = bit0(0x1f2a)

// $001F2E: [8-bit] Number of exits cleared (max: 0x40; 64)

Exits = byte(0x1f2e)

// $001FD5: exits 2
// $001FEE: [8-bit] Moons (stage; screen)
//          bit0 - bouncin' on it palace (0x07; 0x34)
// $001FEF: [8-bit] Moons (stage; screen)
//          bit0 - palace of the dead friends (0x0f; 0x64)
//          bit3 - bicurious palace (0x0c; 0x54)
//          bit5 - Jeff Bezos Climate Pledge palace (0x0a, 0x44)
// $001FF0: [8-bit] Moons (stage; screen)
//          bit3 - all your friends (0x14; 0x4e)
//          bit4 - ABR (Always Be Reaping) (0x13; 0x13)
//          bit6 - i should call her (0x11; 0x11)
// $001FF1: [8-bit] Moons (stage; screen)
//          bit5 - Monster Energy Drink ocean spire moon (0x1a; 0x1a)
//          bit7 - Daddy's Castle moon (0x18; 0x79)
// $001FF3: [8-bit] Moons (stage; screen)
//          bit5 - i keep crawlin back moon (0x21; 0x13c)
// $001FF7: [8-bit] Moons (stage; screen)
//          bit1 - KOOPA KEEP - ABERI (0x4e; 0x12a)
//          bit2 - poetry in motion (0x4d; 0x129)
// $001FF9: [8-bit] Moons (stage; screen)
//          bit1 - masterpiece
//          bit3 - inner critic (0x5c; 0xd4)
// $001FFF: [8-bit] Game mode
//          0x00 - 99 Lives
//          0x01 - Infinite Lives

LivesMode = byte(0x1fff) == 0

// $01B403: [16-bit] Current checkpoint
// $01B405: [8-bit] Retry status
//          Bit0 - Retry chosen

Retry = bit0(0x1b405) > prev(bit0(0x1b405))

// $01B420: [8-bit] Overall File Death Count (Ten Thousands place)
// $01B421: [8-bit] Overall File Death Count (Thousands place)
// $01B422: [8-bit] Overall File Death Count (Hundreds place)
// $01B423: [8-bit] Overall File Death Count (Tens place)
// $01B424: [8-bit] Overall File Death Count (Ones place)

TotalDeaths = byte(0x1B424) + (byte(0x1B423) * 10) + (byte(0x1B422) * 100) + (byte(0x1B421) * 1000) + (byte(0x1B420) * 10000)

// $01B425: [8-bit] "Wins" for "HOME" (boss) team - Ones
// $01B426: [8-bit] "Wins" for "HOME" (boss) team - Tens
// $01B427: [8-bit] "Wins" for "HOME" (boss) team - Hundreds
// $01B604: [8-bit] Visible hearts on boss scoreboard
// $01BA00: [8-bit] Various
//          Current lives in limited lives stages
//          --- indulge me - Total screens complete
//          --- milk crisis - Event status
//          0x00 - No event
//          0x01 - Camera approaching Bowser
//          0x02 - Bowser dialogue
//          0x03 - Axe grabbed
//          0x04~0x06 - Bridge breaking through scene ending

LimitedLives = byte(0x1ba00)
MilkCrisisClear = prev(byte(0x1ba00)) == 0x02 && byte(0x1ba00) == 3

// $01BA01: [8-bit] Default lives in current limited lives stage
// $01BA04: [8-bit] Various
//          --- indulge me - Current chain; the amount of screens done without failing
//          --- inner critic - Current level

InnerCriticLevel = byte(0x1ba04)

//Data
StageData = {
    1:{"name":"gwyneth paltrow","ID":0x04,"firstC":0x04,"firstS":0x04,"finalS":0x04,"exit":1},
    2:{"name":"over the top","ID":0x0b,"firstC":0x0b,"firstS":0x0b,"finalS":0x0b,"exit":1},
    3:{"name":"hello old friend","ID":0x01,"firstC":0x01,"firstS":0x01,"finalS":0x01,"exit":1},
    4:{"name":"cozy kaizo","ID":0x25,"firstC":0x101,"firstS":0x101,"finalS":0x101,"exit":1},
    5:{"name":"left leaning","ID":0x29,"firstC":0x105,"firstS":0x105,"finalS":0x105,"exit":1},
    6:{"name":"Monster Energy Drink™ fortress","ID":0x09,"firstC":0x09,"firstS":0x09,"finalS":0x36,"exit":1},
    7:{"name":"bouncin' on it palace","ID":0x07,"firstC":0x07,"firstS":0x07,"finalS":0x34,"moonS":0x34,"exit":1},
    8:{"name":"world 1 secret","ID":0x31,"firstC":0x10d,"firstS":0x10d,"finalS":0x10d,"exit":2},
    9:{"name":"i keep crawlin back","ID":0x2a,"firstC":0x106,"firstS":0x106,"finalS":0x13c,"moonS":0x13c,"exit":1},
    10:{"name":"im not washed up","ID":0x06,"firstC":0x06,"firstS":0x06,"finalS":0x06,"exit":1},
    11:{"name":"dopamine detox","ID":0x30,"firstC":0x10c,"firstS":0x10c,"finalS":0x10c,"exit":1},
    12:{"name":"this level, rocks","ID":0x3a,"firstC":0x116,"firstS":0x116,"finalS":0x116,"exit":1},
    13:{"name":"climbing up the walls","ID":0x45,"firstC":0x121,"firstS":0x121,"finalS":0x121,"exit":1},
    14:{"name":"Alive, and, well,","ID":0x5f,"firstC":0x13b,"firstS":0x13b,"finalS":0x13b,"exit":2},
    15:{"name":"american justice","ID":0x08,"firstC":0x08,"firstS":0x08,"finalS":0x35,"exit":1},
    16:{"name":"Jeff Bezos Climate Pledge palace","ID":0x0a,"firstC":0x0a,"firstS":0x0a,"finalS":0x44,"moonS":0x44,"exit":1},
    17:{"name":"world 2 secret","ID":0x32,"firstC":0x10e,"firstS":0x10e,"finalS":0x10e,"exit":2},
    18:{"name":"i keep crawlin back","ID":0x2a,"firstC":0x106,"firstS":0x106,"finalS":0x13c,"moonS":0x13c,"exit":2},
    19:{"name":"shitty forest","ID":0x05,"firstC":0x05,"firstS":0x05,"finalS":0x05,"exit":1},
    20:{"name":"the overton window","ID":0x02,"firstC":0x02,"firstS":0x02,"finalS":0x02,"exit":1},
    21:{"name":"born and raised","ID":0x43,"firstC":0x11f,"firstS":0x11f,"finalS":0x1c8,"exit":1},
    22:{"name":"the world's richest man","ID":0x39,"firstC":0x115,"firstS":0x115,"finalS":0x115,"exit":1},
    23:{"name":"orpheo looks back","ID":0x36,"firstC":0x112,"firstS":0x112,"finalS":0x112,"exit":1},
    24:{"name":"a lonely shell in repose","ID":0x17,"firstC":0x17,"firstS":0x17,"finalS":0x17,"exit":1},
    25:{"name":"tony hawkemoto's pro kaizo 3","ID":0x37,"firstC":0x113,"firstS":0x113,"finalS":0x114,"exit":1},
    26:{"name":"bicurious palace","ID":0x0c,"firstC":0x0c,"firstS":0x0c,"finalS":0x54,"moonS":0x54,"exit":1},
    27:{"name":"Monster Energy Drink™ ocean spire","ID":0x1a,"firstC":0x1a,"firstS":0x1a,"finalS":0x1a,"moonS":0x1a,"exit":1},
    28:{"name":"world 3 secret","ID":0x33,"firstC":0x10f,"firstS":0x10f,"finalS":0x10f,"exit":2},
    29:{"name":"i keep crawlin back","ID":0x2a,"firstC":0x106,"firstS":0x106,"finalS":0x13c,"moonS":0x13c,"exit":3},
    30:{"name":"fish bish","ID":0x27,"firstC":0x103,"firstS":0x103,"finalS":0x103,"exit":1},
    31:{"name":"thinly veiled threat","ID":0x03,"firstC":0x03,"firstS":0x03,"finalS":0x03,"exit":1},
    32:{"name":"the left hand of darkness","ID":0x3b,"firstC":0x117,"firstS":0x117,"finalS":0x117,"exit":1},
    33:{"name":"microdosing","ID":0x2f,"firstC":0x10b,"firstS":0x10b,"finalS":0x10b,"exit":1},
    34:{"name":"sigma star","ID":0x26,"firstC":0x102,"firstS":0x102,"finalS":0x102,"exit":1},
    35:{"name":"this level crashes the game","ID":0x1e,"firstC":0x1e,"firstS":0x1e,"finalS":0x1e,"exit":1},
    36:{"name":"ovulation station","ID":0x0e,"firstC":0x0e,"firstS":0x0e,"finalS":0x37,"exit":1},
    37:{"name":"palace of the dead friends","ID":0x0f,"firstC":0x0f,"firstS":0x0f,"finalS":0x64,"moonS":0x64,"exit":1},
    38:{"name":"world 4 secret","ID":0x34,"firstC":0x110,"firstS":0x110,"finalS":0x110,"exit":2},
    39:{"name":"i keep crawlin back","ID":0x2a,"firstC":0x106,"firstS":0x106,"finalS":0x13c,"moonS":0x13c,"exit":4},
    40:{"name":"i should call her","ID":0x11,"firstC":0x11,"firstS":0x11,"finalS":0x11,"moonS":0x11,"exit":1},
    41:{"name":"thrice GOATed","ID":0x10,"firstC":0x10,"firstS":0x10,"finalS":0x10,"exit":1},
    42:{"name":"ABR (Always Be Reaping)","ID":0x13,"firstC":0x13,"firstS":0x13,"finalS":0x13,"moonS":0x13,"exit":1},
    43:{"name":"dream catcher","ID":0x12,"firstC":0x12,"firstS":0x12,"finalS":0x12,"exit":1},
    44:{"name":"return to daddy's castle","ID":0x18,"firstC":0x18,"firstS":0x18,"finalS":0x7a,"moonS":0x79,"exit":1},
    45:{"name":"live and learn","ID":0x0d,"firstC":0x0d,"firstS":0x0d,"finalS":0xc2,"exit":1},
    46:{"name":"incantation","ID":0x19,"firstC":0x19,"firstS":0x19,"finalS":0xd3,"exit":1},
    47:{"name":"A/B testing","ID":0x46,"firstC":0x122,"firstS":0x122,"finalS":0x122,"exit":1},
    48:{"name":"enter haimari","ID":0x48,"firstC":0x124,"firstS":0x124,"finalS":0x67,"exit":1},
    49:{"name":"bedlam","ID":0x4c,"firstC":0x128,"firstS":0x128,"finalS":0x128,"exit":1},
    50:{"name":"poetry in motion","ID":0x4d,"firstC":0x129,"firstS":0x129,"finalS":0x68,"moonS":0x129,"exit":1},
    51:{"name":"milk crisis","ID":0x4f,"firstC":0x12b,"firstS":0x12b,"finalS":0x6a,"exit":1},
    52:{"name":"proxy war","ID":0x47,"firstC":0x123,"firstS":0x123,"finalS":0x123,"exit":1},
    53:{"name":"malicious appliance","ID":0x4a,"firstC":0x126,"firstS":0x126,"finalS":0x126,"exit":1},
    54:{"name":"Boss Bass World Championship '86","ID":0x50,"firstC":0x12c,"firstS":0x12c,"finalS":0x6b,"exit":1},
    55:{"name":"suckin a dick","ID":0x4b,"firstC":0x127,"firstS":0x127,"finalS":0x127,"exit":1},
    56:{"name":"KOOPA KEEP - ABERI","ID":0x4e,"firstC":0x12a,"firstS":0x12a,"finalS":0x69,"moonS":0x12a,"exit":1},
    57:{"name":"house, flipping","ID":0x54,"firstC":0x130,"firstS":0x130,"finalS":0x65,"exit":1},
    58:{"name":"hath thou soup?","ID":0x51,"firstC":0x12d,"firstS":0x12d,"finalS":0x12d,"exit":1},
    59:{"name":"all your friends","ID":0x14,"firstC":0x14,"firstS":0x14,"finalS":0x4e,"moonS":0x4e,"exit":1},
    60:{"name":"indulge me","ID":0x5d,"firstC":0x139,"firstS":0x139,"finalS":0xc1,"moonS":0xc1,"exit":1},
    61:{"name":"god's final message to her creation","ID":0x5b,"firstC":0x137,"firstS":0x137,"finalS":0x137,"exit":1},
    62:{"name":"inner critic","ID":0x5c,"firstC":0x138,"firstS":0x138,"finalS":0xd4,"moonS":0xd4,"exit":1},
    63:{"name":"masterpiece","ID":0x5e,"firstC":0x13a,"firstS":0x13a,"finalS":0x13a,"moonS":0x13a,"exit":1},
}



//Functions and such

function NormalClear(stage) {
        achievement(
                title=StageData[stage]["clearT"],points=StageData[stage]["clearP"],
                description="Complete " + StageData[stage]["Name"] + ". " + AchData[stage]["clearFlav"],
                trigger=StageID == StageData[stage]["ID"] && prev(StageExit) == 0 && StageExit == StageData[stage]["exit"]
    )
}

function OneScreenNormalLB(stage) {
        leaderboard(
                title=StageData[stage]["Name"],
                description="Complete " + StageData[stage]["Name"] + " as fast as you can.",
                start= StageID == StageData[stage]["ID"] && LevelStart && Checkpoint == StageData[stage]["firstC"],
                cancel= Overworld,
                submit= StageID == StageData[stage]["ID"] && ScreenID == StageData[stage]["finalS"] && NormalComplete,
                value= measured(always_true()), format="FRAMES",lower_is_better=true
        )
}

function OneScreenKeyLB(stage) {
        leaderboard(
                title=StageData[stage]["Name"],
                description="Complete " + StageData[stage]["Name"] + " as fast as you can.",
                start= StageID == StageData[stage]["ID"] && LevelStart && Checkpoint == StageData[stage]["firstC"],
                cancel= Overworld,
                submit= StageID == StageData[stage]["ID"] && ScreenID == StageData[stage]["finalS"] && KeyComplete,
                value= measured(always_true()), format="FRAMES",lower_is_better=true
        )
}

function LongNormalLB(stage) {
        leaderboard(
                title=StageData[stage]["Name"],
                description="Complete " + StageData[stage]["Name"] + " as fast as you can.",
                start= StageID == StageData[stage]["ID"] && LevelStart && Checkpoint == StageData[stage]["firstC"],
                cancel= Overworld,
                submit= StageID == StageData[stage]["ID"] && ScreenID == StageData[stage]["finalS"] && NormalComplete,
                value= measured(always_true()), format="FRAMES",lower_is_better=true
        )
}


















achievement( //todo get the values for the boxes
    title="Knowledge is Power",points=1,
    description="Read all of the boxes in Information Kiosk. There is more information to be found on the RA forum of this game to make challenges more accessible--please check it out!",
    trigger= StageID == 0x51 && InLevel && measured(tally(10,
            once(MessageBox == 2 && StageID == 0x23), once(MessageBox == 1 && StageID == 0x2a),
            once(MessageBox == 1 && StageID == 0x27), once(MessageBox == 2 && StageID == 0x27),
            once(MessageBox == 1 && StageID == 0x25), once(MessageBox == 2 && StageID == 0x26),
            once(MessageBox == 2 && StageID == 0x24), once(MessageBox == 2 && StageID == 0x25),
            once(MessageBox == 1 && StageID == 0x28), once(MessageBox == 1 && StageID == 0x23))) && 
            never(Overworld)
)










