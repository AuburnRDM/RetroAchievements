// Kururin Squash!
// #ID = 25493

// $19D40C: [32-bit BE] Time in current session; frames
// $19D41F: [8-bit] Game state
//          0x00 - Booting
//          0x02 - Main Menu
//          0x03 - Options
//          0x04 - File/Mode select
//          0x05 - Adventure overworld/cutscenes
//          0x06 - Shop
//          0x07 - Inventory
//          0x08 - Inside house (from adventure overworld)
//          0x09 - Stage intro (adventure/slippery)
//          0x0a - In adventure/slippery stage
//          0x0b - Adventure/slippery stage complete
//          0x0c - Story cutscene/credits
//          0x0d - Challenge stage select
//          0x0e - In challenge stage
//          0x0f - Challenge stage complete
//          0x10 - Multiplayer menu
//          0x11 - In multiplayer match
//          0x12 - Watching video guide
//          0x13 - Spin Advance
State = byte(0x19D41F)
    MainMenu = 2
    Option = 3
    FileSelect = 4
    AdventureOverworld = 5
    Shop = 6
    Inventory = 7
    House = 8
    AdventureIntro = 9
    AdventurePlaying = 0xa
    AdventureComplete = 0xb
    Cutscene = 0xc
    ChallengeSelect = 0xd
    ChallengePlaying = 0xe
    ChallengeComplete = 0xf
    MultiSelect = 0x10
    MultiPlaying = 0x11
    VideoGuide = 0x12
    GBA = 0x13
    
// $19EAD0: [32-bit BE] Time spent in current level; changing this does not reflect in-game. consider using the pointer from 0x0019ebe0 for the most accurate address
// $19EAD7: [8-bit] Most recently selected mode
//          0x00 - Adventure (default) / None
//          0x01 - Challenge
//          0x02 - Slippery
//          0x03 - Race (multiplayer)
//          0x04 - Battle (multiplayer)
Mode = byte(0x19EAD7)
    Adventure = 0
    Challenge = 1
    Slippery = 2
    Race = 3
    Battle = 4
// $19EAD8: [32-bit BE] Current world selected
//          0x00 - Sweet Shores
//          0x01 - Coastal Canopy
//          0x02 - Snowscape
//          0x03 - CyberCity
//          0x04 - WonderVerse
//          0x05 - Challenge mode
World = dword_be(0x19EAD8)
    SweetShores = 0
    CoastalCanopy = 1
    Snowscape = 2
    CyberCity = 3
    WonderVerse = 4
    ChallengeWorld = 5
    
// $19EADC: [32-bit BE] Current level in that particular world
//          0xffffffff - Shop
//          0x00 - Stage 1
//          0x01 - Stage 2
//          ~
//          0x07 - Stage 8 (Boss)
Stage = dword_be(0x19EADC) + 1
// $19EAE0: [32-bit BE] Current level in the story mode; continues to count up through the worlds
//          0xffffffff - Shop / Random selected (in challenge mode); changes after stage initiated
//          0x00 - Sweet Shores 1
//          0x01 - Sweet Shores 2
//          ~
//          0x07 - Sweet Shores 8 (Boss)
//          0x08 - Coastal Canopy 1
//          ~
//          0x28 - Challenge 1
//          ~
//          0x4f - Sword challenge 8
// $19EAE8: [8-bit] Current number of players
LevelID = dword_be(0x19EAE0)
Players = byte(0x19EAE8)
// $19EAE9: [8-bit] Current save file; starts from 0x00
//          -- Offset for each safe file block is 0x300 (768 decimal)
SaveSlot = byte(0x19EAE9)
SaveCheck = prev(byte(0x19EAE9)) == byte(0x19EAE9)
CurrentSave = byte(0x19EAE9) * 0x300
// $19EAF1: [8-bit] Pause status ~ this is more than just pause
//          Bit0 - Pause starting
//          Bit1 - Pause menu
//          Bit2 - Map open
// $19eaf7: [8-bit] Various game status
//          Bit3 - Post-boss state
//          Bit4 - Boss timer stopped (after win) and coin phase starts; use for level timing
BossComplete = prev(bit4(0x19eaf7)) == 0 && bit4(0x19eaf7) == 1
// $19EB08: [32-bit BE] Time for recently completed stage; frames
// $19EB0C: [32-bit BE] Best time of most recently completed stage; frames
// $19EB10: [32-bit BE] Coins collected for recently completed stage
// $19EBE0: [32-bit BE] Pointer; briefly flips to 0x00 when starting a new stage
PointerProtection = dword_be(0x19EBE0) != 0
//          +0x800002f4 | [8-bit] Helirin rotation direction
//          Bit7 on = clockwise
//          Bit7 off = counter-clockwise
Rotation = bit7(dword_be(0x19EBE0) + 0x800002f4)
    Clockwise = 1
    CounterClockwise = 0
//          +0x800002fc | [8-bit] Powerups
//          Bit0 - Laser gun activated
//          Bit1 - Flamethrower/Propeller activated
//          Bit2 - Punch activated
//          +0x800002ff | [8-bit] Level status
//          Bit1 - Level started; timer engaged
//          Bit3 - Level fishined
LevelComplete = prev(bit3(dword_be(0x19EBE0) + 0x800002ff)) == 0 && bit3(dword_be(0x19EBE0) + 0x800002ff) == 1
//          Bit7 - Starting area; timer not engaged
BossChallenge = once(prev(bit1(dword_be(0x19EBE0) + 0x800002ff)) == 0 && bit1(dword_be(0x19EBE0) + 0x800002ff) == 1) &&
                never(prev(bit7(dword_be(0x19EBE0) + 0x800002ff) == 1)) && never(State <= AdventureOverworld)
//          +0x8000030b | [8-bit] Current HP
CurrentHP = byte(dword_be(0x19EBE0) + 0x8000030b)
//          +0x8000030f | [8-bit] Max HP
MaxHP = byte(dword_be(0x19EBE0) + 0x8000030f)
//          +0x80000320 | [32-bit BE] Active timer in level
StageTimer = dword_be(dword_be(0x19EBE0) + 0x80000320)
//          +0x80000324 | [32-bit BE] Score in current level
StageScore = dword_be(dword_be(0x19EBE0) + 0x80000324)
//          +0x80000328 | [16-bit BE] Number of times damaged in current level
StageDamage = word_be(dword_be(0x19EBE0) + 0x80000324)
//          +0x8000033f | [8-bit] Powerup status
//          0x2d - Shortest dive
//          0x56 - Max fan

// $1A0399: [8-bit] Equipped items [Save 1]
//          Bit2 - Extra Course
//          Bit3 - Heart-Up
ExtraCourse = bit2(0x1a0399 + CurrentSave) == 1
HeartUp = bit3(0x1a0399 + CurrentSave) == 1
// $1A039A: [8-bit] Various cutscenes
//          Bit0 - Rabbit cutscene
//          Bit1 - All coins cutscene
// $1A039B: [8-bit] Various event flags and helirin type [Save 1]; block Bit0
//          Bit0 - Compact helirin
//          Bit1 - Standard helirin
StandardHelirin = bit0(0x1a039b + CurrentSave) == 0 && bit1(0x1a039b + CurrentSave) == 1
CompactHelirin = bit0(0x1a039b + CurrentSave) == 1 && bit1(0x1a039b + CurrentSave) == 0
HelirinCheck = bit0(0x1a039b + CurrentSave) == 0 && prev(bit1(0x1a039b + CurrentSave)) == 0 && bit1(0x1a039b + CurrentSave) == 1
HelirinRP = {
    0:"Compact Helirin",
    1:"Full-sized Helirin"
}
//          Bit2 - Dialogue triggered in Sweet Shores 1
//          Bit3 - Helibash dialogue triggered in Sweet Shores 4
//          Bit4 - Helibubble dialogue triggered in Coastal Canopy 3
//          Bit5 - Heliblaze dialogue triggered in Snowscape 3
//          Bit6 - Helibow dialogue triggered in CyberCity 2
//          Bit7 - Helibeam dialogue triggered in WonderVerse 2
// $1A039C: [32-bit BE] Total coins [Save 1]
TotalCoins = dword_be(0x1a039c + CurrentSave)
// $1A03A0: [32-bit BE] Adventure - Sweet Shores 1 best time; frames [Save 1]
// $1A03A4: [32-bit BE] Adventure - Sweet Shores 2 best time; frames [Save 1]
// $1A03A8: [32-bit BE] Adventure - Sweet Shores 3 best time; frames [Save 1]
// $1A03AC: [32-bit BE] Adventure - Sweet Shores 4 best time; frames [Save 1]
// $1A03B0: [32-bit BE] Adventure - Sweet Shores 5 best time; frames [Save 1]
// $1A03B4: [32-bit BE] Adventure - Sweet Shores 6 best time; frames [Save 1]
// $1A03B8: [32-bit BE] Adventure - Sweet Shores 7 best time; frames [Save 1]
// $1A03BC: [32-bit BE] Adventure - Sweet Shores 8 best time; frames [Save 1]
// $1A03C0: [32-bit BE] Adventure - Coastal Canopy 1 best time; frames [Save 1]
// $1A03C4: [32-bit BE] Adventure - Coastal Canopy 2 best time; frames [Save 1]
// $1A03C8: [32-bit BE] Adventure - Coastal Canopy 3 best time; frames [Save 1]
// $1A03CC: [32-bit BE] Adventure - Coastal Canopy 4 best time; frames [Save 1]
// $1A03D0: [32-bit BE] Adventure - Coastal Canopy 5 best time; frames [Save 1]
// $1A03D4: [32-bit BE] Adventure - Coastal Canopy 6 best time; frames [Save 1]
// $1A03D8: [32-bit BE] Adventure - Coastal Canopy 7 best time; frames [Save 1]
// $1A03DC: [32-bit BE] Adventure - Coastal Canopy 8 best time; frames [Save 1]
// $1A03E0: [32-bit BE] Adventure - Snowscape 1 best time; frames [Save 1]
// $1A03E4: [32-bit BE] Adventure - Snowscape 2 best time; frames [Save 1]
// $1A03E8: [32-bit BE] Adventure - Snowscape 3 best time; frames [Save 1]
// $1A03EC: [32-bit BE] Adventure - Snowscape 4 best time; frames [Save 1]
// $1A03F0: [32-bit BE] Adventure - Snowscape 5 best time; frames [Save 1]
// $1A03F4: [32-bit BE] Adventure - Snowscape 6 best time; frames [Save 1]
// $1A03F8: [32-bit BE] Adventure - Snowscape 7 best time; frames [Save 1]
// $1A03FC: [32-bit BE] Adventure - Snowscape 8 best time; frames [Save 1]
// $1A0400: [32-bit BE] Adventure - CyberCity 1 best time; frames [Save 1]
// $1A0404: [32-bit BE] Adventure - CyberCity 2 best time; frames [Save 1]
// $1A0408: [32-bit BE] Adventure - CyberCity 3 best time; frames [Save 1]
// $1A040C: [32-bit BE] Adventure - CyberCity 4 best time; frames [Save 1]
// $1A0410: [32-bit BE] Adventure - CyberCity 5 best time; frames [Save 1]
// $1A0414: [32-bit BE] Adventure - CyberCity 6 best time; frames [Save 1]
// $1A0418: [32-bit BE] Adventure - CyberCity 7 best time; frames [Save 1]
// $1A041C: [32-bit BE] Adventure - CyberCity 8 best time; frames [Save 1]
// $1A0420: [32-bit BE] Adventure - Wonderverse 1 best time; frames [Save 1]
// $1A0424: [32-bit BE] Adventure - Wonderverse 2 best time; frames [Save 1]
// $1A0428: [32-bit BE] Adventure - Wonderverse 3 best time; frames [Save 1]
// $1A042C: [32-bit BE] Adventure - Wonderverse 4 best time; frames [Save 1]
// $1A0430: [32-bit BE] Adventure - Wonderverse 5 best time; frames [Save 1]
// $1A0434: [32-bit BE] Adventure - Wonderverse 6 best time; frames [Save 1]
// $1A0438: [32-bit BE] Adventure - Wonderverse 7 best time; frames [Save 1]
// $1A043C: [32-bit BE] Adventure - Wonderverse 8 best time; frames [Save 1]
// $1A0440: [32-bit BE] Challenge - Classic 1 best time; frames [Save 1]
// $1A0444: [32-bit BE] Challenge - Classic 2 best time; frames [Save 1]
// $1A0448: [32-bit BE] Challenge - Classic 3 best time; frames [Save 1]
// $1A044C: [32-bit BE] Challenge - Classic 4 best time; frames [Save 1]
// $1A0450: [32-bit BE] Challenge - Classic 5 best time; frames [Save 1]
// $1A0454: [32-bit BE] Challenge - Classic 6 best time; frames [Save 1]
// $1A0458: [32-bit BE] Challenge - Classic 7 best time; frames [Save 1]
// $1A045C: [32-bit BE] Challenge - Classic 8 best time; frames [Save 1]
// $1A0460: [32-bit BE] Challenge - Piston Panic 1 best time; frames [Save 1]
// $1A0464: [32-bit BE] Challenge - Piston Panic 2 best time; frames [Save 1]
// $1A0468: [32-bit BE] Challenge - Piston Panic 3 best time; frames [Save 1]
// $1A046C: [32-bit BE] Challenge - Piston Panic 4 best time; frames [Save 1]
// $1A0470: [32-bit BE] Challenge - Piston Panic 5 best time; frames [Save 1]
// $1A0474: [32-bit BE] Challenge - Piston Panic 6 best time; frames [Save 1]
// $1A0478: [32-bit BE] Challenge - Piston Panic 7 best time; frames [Save 1]
// $1A047C: [32-bit BE] Challenge - Piston Panic 8 best time; frames [Save 1]
// $1A0480: [32-bit BE] Challenge - Bowling 1 best time; frames [Save 1]
// $1A0484: [32-bit BE] Challenge - Bowling 2 best time; frames [Save 1]
// $1A0488: [32-bit BE] Challenge - Bowling 3 best time; frames [Save 1]
// $1A048C: [32-bit BE] Challenge - Bowling 4 best time; frames [Save 1]
// $1A0490: [32-bit BE] Challenge - Bowling 5 best time; frames [Save 1]
// $1A0494: [32-bit BE] Challenge - Bowling 6 best time; frames [Save 1]
// $1A0498: [32-bit BE] Challenge - Bowling 7 best time; frames [Save 1]
// $1A049C: [32-bit BE] Challenge - Bowling 8 best time; frames [Save 1]
// $1A04A0: [32-bit BE] Challenge - Labyrinth 1 best time; frames [Save 1]
// $1A04A4: [32-bit BE] Challenge - Labyrinth 2 best time; frames [Save 1]
// $1A04A8: [32-bit BE] Challenge - Labyrinth 3 best time; frames [Save 1]
// $1A04AC: [32-bit BE] Challenge - Labyrinth 4 best time; frames [Save 1]
// $1A04B0: [32-bit BE] Challenge - Labyrinth 5 best time; frames [Save 1]
// $1A04B4: [32-bit BE] Challenge - Labyrinth 6 best time; frames [Save 1]
// $1A04B8: [32-bit BE] Challenge - Labyrinth 7 best time; frames [Save 1]
// $1A04BC: [32-bit BE] Challenge - Labyrinth 8 best time; frames [Save 1]
// $1A04C0: [32-bit BE] Challenge - Swordplay 1 best time; frames [Save 1]
// $1A04C4: [32-bit BE] Challenge - Swordplay 2 best time; frames [Save 1]
// $1A04C8: [32-bit BE] Challenge - Swordplay 3 best time; frames [Save 1]
// $1A04CC: [32-bit BE] Challenge - Swordplay 4 best time; frames [Save 1]
// $1A04D0: [32-bit BE] Challenge - Swordplay 5 best time; frames [Save 1]
// $1A04D4: [32-bit BE] Challenge - Swordplay 6 best time; frames [Save 1]
// $1A04D8: [32-bit BE] Challenge - Swordplay 7 best time; frames [Save 1]
// $1A04DC: [32-bit BE] Challenge - Swordplay 8 best time; frames [Save 1]
// $1A04E0: Slippery stages are considered cleared when their time != 0x34bc0; this does not seem to be stored anywhere else in the save file block. Unlocked levels mirror those cleared in the Adventure mode
//          ----------
//          [32-bit BE] Slippery - Sweet Shores 1 best time; frames [Save 1]
// $1A04E4: [32-bit BE] Slippery - Sweet Shores 2 best time; frames [Save 1]
// $1A04E8: [32-bit BE] Slippery - Sweet Shores 3 best time; frames [Save 1]
// $1A04EC: [32-bit BE] Slippery - Sweet Shores 4 best time; frames [Save 1]
// $1A04F0: [32-bit BE] Slippery - Sweet Shores 5 best time; frames [Save 1]
// $1A04F4: [32-bit BE] Slippery - Sweet Shores 6 best time; frames [Save 1]
// $1A04F8: [32-bit BE] Slippery - Sweet Shores 7 best time; frames [Save 1]
// $1A0500: [32-bit BE] Slippery - Coastal Canopy 1 best time; frames [Save 1]
// $1A0504: [32-bit BE] Slippery - Coastal Canopy 2 best time; frames [Save 1]
// $1A0508: [32-bit BE] Slippery - Coastal Canopy 3 best time; frames [Save 1]
// $1A050C: [32-bit BE] Slippery - Coastal Canopy 4 best time; frames [Save 1]
// $1A0510: [32-bit BE] Slippery - Coastal Canopy 5 best time; frames [Save 1]
// $1A0514: [32-bit BE] Slippery - Coastal Canopy 6 best time; frames [Save 1]
// $1A0518: [32-bit BE] Slippery - Coastal Canopy 7 best time; frames [Save 1]
// $1A0520: [32-bit BE] Slippery - Snowscape 1 best time; frames [Save 1]
// $1A0524: [32-bit BE] Slippery - Snowscape 2 best time; frames [Save 1]
// $1A0528: [32-bit BE] Slippery - Snowscape 3 best time; frames [Save 1]
// $1A052C: [32-bit BE] Slippery - Snowscape 4 best time; frames [Save 1]
// $1A0530: [32-bit BE] Slippery - Snowscape 5 best time; frames [Save 1]
// $1A0534: [32-bit BE] Slippery - Snowscape 6 best time; frames [Save 1]
// $1A0538: [32-bit BE] Slippery - Snowscape 7 best time; frames [Save 1]
// $1A0540: [32-bit BE] Slippery - CyberCity 1 best time; frames [Save 1]
// $1A0544: [32-bit BE] Slippery - CyberCity 2 best time; frames [Save 1]
// $1A0548: [32-bit BE] Slippery - CyberCity 3 best time; frames [Save 1]
// $1A054C: [32-bit BE] Slippery - CyberCity 4 best time; frames [Save 1]
// $1A0550: [32-bit BE] Slippery - CyberCity 5 best time; frames [Save 1]
// $1A0554: [32-bit BE] Slippery - CyberCity 6 best time; frames [Save 1]
// $1A0558: [32-bit BE] Slippery - CyberCity 7 best time; frames [Save 1]
// $1A0560: [32-bit BE] Slippery - Wonderverse 1 best time; frames [Save 1]
// $1A0564: [32-bit BE] Slippery - Wonderverse 2 best time; frames [Save 1]
// $1A0568: [32-bit BE] Slippery - Wonderverse 3 best time; frames [Save 1]
// $1A056C: [32-bit BE] Slippery - Wonderverse 4 best time; frames [Save 1]
// $1A0570: [32-bit BE] Slippery - Wonderverse 5 best time; frames [Save 1]
// $1A0574: [32-bit BE] Slippery - Wonderverse 6 best time; frames [Save 1]
// $1A0578: [32-bit BE] Slippery - Wonderverse 7 best time; frames [Save 1]
// $1A0580: [8-bit] Adventure - Sweet Shores 1 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
FreshAdventureFile = byte(0x1A0580 + CurrentSave) == 1
// $1A0581: [8-bit] Adventure - Sweet Shores 2 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0582: [8-bit] Adventure - Sweet Shores 3 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0583: [8-bit] Adventure - Sweet Shores 4 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0584: [8-bit] Adventure - Sweet Shores 5 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0585: [8-bit] Adventure - Sweet Shores 6 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0586: [8-bit] Adventure - Sweet Shores 7 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0587: [8-bit] Adventure - Sweet Shores 8 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0588: [8-bit] Adventure - Coastal Canopy 1 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0589: [8-bit] Adventure - Coastal Canopy 2 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A058A: [8-bit] Adventure - Coastal Canopy 3 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A058B: [8-bit] Adventure - Coastal Canopy 4 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A058C: [8-bit] Adventure - Coastal Canopy 5 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A058D: [8-bit] Adventure - Coastal Canopy 6 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A058E: [8-bit] Adventure - Coastal Canopy 7 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A058F: [8-bit] Adventure - Coastal Canopy 8 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0590: [8-bit] Adventure - Snowscape 1 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0591: [8-bit] Adventure - Snowscape 2 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0592: [8-bit] Adventure - Snowscape 3 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0593: [8-bit] Adventure - Snowscape 4 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0594: [8-bit] Adventure - Snowscape 5 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0595: [8-bit] Adventure - Snowscape 6 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0596: [8-bit] Adventure - Snowscape 7 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0597: [8-bit] Adventure - Snowscape 8 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0598: [8-bit] Adventure - CyberCity 1 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A0599: [8-bit] Adventure - CyberCity 2 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A059A: [8-bit] Adventure - CyberCity 3 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A059B: [8-bit] Adventure - CyberCity 4 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A059C: [8-bit] Adventure - CyberCity 5 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A059D: [8-bit] Adventure - CyberCity 6 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A059E: [8-bit] Adventure - CyberCity 7 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A059F: [8-bit] Adventure - CyberCity 8 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A0: [8-bit] Adventure - Wonderverse 1 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A1: [8-bit] Adventure - Wonderverse 2 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A2: [8-bit] Adventure - Wonderverse 3 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A3: [8-bit] Adventure - Wonderverse 4 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A4: [8-bit] Adventure - Wonderverse 5 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A5: [8-bit] Adventure - Wonderverse 6 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A6: [8-bit] Adventure - Wonderverse 7 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A7: [8-bit] Adventure - Wonderverse 8 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
// $1A05A8: [8-bit] Challenge - Classic 1 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05A9: [8-bit] Challenge - Classic 2 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05AA: [8-bit] Challenge - Classic 3 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05AB: [8-bit] Challenge - Classic 4 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05AC: [8-bit] Challenge - Classic 5 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05AD: [8-bit] Challenge - Classic 6 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05AE: [8-bit] Challenge - Classic 7 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05AF: [8-bit] Challenge - Classic 8 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B0: [8-bit] Challenge - Piston Panic 1 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B1: [8-bit] Challenge - Piston Panic 2 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B2: [8-bit] Challenge - Piston Panic 3 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B3: [8-bit] Challenge - Piston Panic 4 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B4: [8-bit] Challenge - Piston Panic 5 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B5: [8-bit] Challenge - Piston Panic 6 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B6: [8-bit] Challenge - Piston Panic 7 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B7: [8-bit] Challenge - Piston Panic 8 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B8: [8-bit] Challenge - Bowling 1 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05B9: [8-bit] Challenge - Bowling 2 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05BA: [8-bit] Challenge - Bowling 3 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05BB: [8-bit] Challenge - Bowling 4 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05BC: [8-bit] Challenge - Bowling 5 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05BD: [8-bit] Challenge - Bowling 6 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05BE: [8-bit] Challenge - Bowling 7 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05BF: [8-bit] Challenge - Bowling 8 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C0: [8-bit] Challenge - Labyrinth 1 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C1: [8-bit] Challenge - Labyrinth 2 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C2: [8-bit] Challenge - Labyrinth 3 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C3: [8-bit] Challenge - Labyrinth 4 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C4: [8-bit] Challenge - Labyrinth 5 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C5: [8-bit] Challenge - Labyrinth 6 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C6: [8-bit] Challenge - Labyrinth 7 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C7: [8-bit] Challenge - Labyrinth 8 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C8: [8-bit] Challenge - Swordplay 1 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05C9: [8-bit] Challenge - Swordplay 2 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05CA: [8-bit] Challenge - Swordplay 3 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05CB: [8-bit] Challenge - Swordplay 4 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05CC: [8-bit] Challenge - Swordplay 5 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05CD: [8-bit] Challenge - Swordplay 6 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05CE: [8-bit] Challenge - Swordplay 7 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05CF: [8-bit] Challenge - Swordplay 8 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
// $1A05D0: [8-bit] HEART-UP [Save 1]; consumable that raises your max HP to 5 for a stage
//          Bit0 - Obtained
// $1A05D5: [8-bit] Amazing Heart [Save 1]; consumable that lets you respawn if you die
//          Bit0 - Obtained
// $1A05D7: [8-bit] Classic Helirin [Save 1]
//          Bit0 - Unlocked (Default)
World1Shop =bit0(0x1a05d8 + CurrentSave) + bit0(0x1a05d9 + CurrentSave) + bit0(0x1a05da + CurrentSave) + bit0(0x1a05db + CurrentSave) + 
            bit0(0x1a05dc + CurrentSave) + bit0(0x1a05dd + CurrentSave) + bit0(0x1a05eb + CurrentSave) + bit0(0x1a05ec + CurrentSave) + 
            bit0(0x1a05ef + CurrentSave) + bit0(0x1a05f6 + CurrentSave) + bit0(0x1a060e + CurrentSave) + bit0(0x1a060f + CurrentSave) + 
            bit0(0x1a0614 + CurrentSave) + bit0(0x1a0615 + CurrentSave) + bit0(0x1a066f + CurrentSave)
World2Shop =bit0(0x1a05e4 + CurrentSave) + bit0(0x1a05e5 + CurrentSave) + bit0(0x1a05ea + CurrentSave) + bit0(0x1a05f8 + CurrentSave) + 
            bit0(0x1a05f9 + CurrentSave) + bit0(0x1a05fa + CurrentSave) + bit0(0x1a05fb + CurrentSave) + bit0(0x1a05fc + CurrentSave) + 
            bit0(0x1a05fd + CurrentSave) + bit0(0x1a0603 + CurrentSave) + bit0(0x1a060b + CurrentSave) + bit0(0x1a0610 + CurrentSave) + 
            bit0(0x1a0612 + CurrentSave) + bit0(0x1a061b + CurrentSave) + bit0(0x1a0670 + CurrentSave)
World3Shop =bit0(0x1a05de + CurrentSave) + bit0(0x1a05e0 + CurrentSave) + bit0(0x1a05e1 + CurrentSave) + bit0(0x1a05e2 + CurrentSave) + 
            bit0(0x1a05e3 + CurrentSave) + bit0(0x1a05e9 + CurrentSave) + bit0(0x1a05ed + CurrentSave) + bit0(0x1a05f2 + CurrentSave) + 
            bit0(0x1a05f3 + CurrentSave) + bit0(0x1a05ff + CurrentSave) + bit0(0x1a0611 + CurrentSave) + bit0(0x1a0616 + CurrentSave) + 
            bit0(0x1a0617 + CurrentSave) + bit0(0x1a061a + CurrentSave) + bit0(0x1a0671 + CurrentSave)
World4Shop =bit0(0x1a05df + CurrentSave) + bit0(0x1a05e6 + CurrentSave) + bit0(0x1a05e8 + CurrentSave) + bit0(0x1a05ee + CurrentSave) + 
            bit0(0x1a05f0 + CurrentSave) + bit0(0x1a05fe + CurrentSave) + bit0(0x1a0600 + CurrentSave) + bit0(0x1a0601 + CurrentSave) + 
            bit0(0x1a0602 + CurrentSave) + bit0(0x1a0613 + CurrentSave) + bit0(0x1a0619 + CurrentSave) + bit0(0x1a061c + CurrentSave) + 
            bit0(0x1a0672 + CurrentSave) 
World5Shop =bit0(0x1a05e7 + CurrentSave) + bit0(0x1a05f1 + CurrentSave) + bit0(0x1a05f4 + CurrentSave) + bit0(0x1a05f5 + CurrentSave) + 
            bit0(0x1a05f7 + CurrentSave) + bit0(0x1a0604 + CurrentSave) + bit0(0x1a0605 + CurrentSave) + bit0(0x1a0606 + CurrentSave) + 
            bit0(0x1a060c + CurrentSave) + bit0(0x1a060d + CurrentSave) + bit0(0x1a0618 + CurrentSave) + bit0(0x1a0673 + CurrentSave)
// $1A05D8: [8-bit] Colorful Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05D9: [8-bit] Blue Gradient Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05DA: [8-bit] Orange Gradient Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05DB: [8-bit] Green Gradient Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05DC: [8-bit] Block Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05DD: [8-bit] Chocolate Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05DE: [8-bit] Snowman Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05DF: [8-bit] Tank Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A05E0: [8-bit] Hot Chocolate Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05E1: [8-bit] Rainbow Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05E2: [8-bit] Sakura Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05E3: [8-bit] Matcha Sakura Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05E4: [8-bit] Wave Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05E5: [8-bit] Mushroom Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05E6: [8-bit] Sky Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A05E7: [8-bit] Planet Helirin [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A05E8: [8-bit] Black Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A05E9: [8-bit] Aqua Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05EA: [8-bit] Camo Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05EB: [8-bit] Cookie Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05EC: [8-bit] Strawberry Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05ED: [8-bit] British Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05EE: [8-bit] Onestar Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A05EF: [8-bit] Watermelon Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05F0: [8-bit] Bee Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A05F1: [8-bit] Paisley Helirin [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A05F2: [8-bit] Aroma Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05F3: [8-bit] Nintendo Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A05F4: [8-bit] Slicer Helirin [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A05F5: [8-bit] Tie-Dye Helirin [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A05F6: [8-bit] Candy Helirin [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A05F7: [8-bit] Kamasley Helirin [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A05F8: [8-bit] Snake Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05F9: [8-bit] Leopard Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05FA: [8-bit] Zebra Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05FB: [8-bit] Tiger Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05FC: [8-bit] Holstein Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05FD: [8-bit] Wood Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A05FE: [8-bit] Junk Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A05FF: [8-bit] Ketchup Helirin [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A0600: [8-bit] Pinstripe Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A0601: [8-bit] Fire Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A0602: [8-bit] Skull Helirin [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A0603: [8-bit] Spider Helirin [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A0604: [8-bit] Heart Helirin [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A0605: [8-bit] Coumarin Helirin [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A0606: [8-bit] Star Helirin [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A0607: [8-bit] Hero Helirin [Save 1]
//          Bit0 - Unlocked (complete all challenge stages)
// $1A0608: [8-bit] Gold Helirin [Save 1]
//          Bit0 - Unlocked (coins on all stages)
GoldHelirin = bit0(0x1A0608 + CurrentSave)
// $1A0609: [8-bit] Platinum Helirin [Save 1]
//          Bit0 - Unlocked (perfect on all stages)
PlatinumHelirin = bit0(0x1A0609 + CurrentSave)
// $1A060A: [8-bit] Normal Gauge [Save 1]
//          Bit0 - Unlocked (Default)
// $1A060B: [8-bit] Sickness Gauge [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A060C: [8-bit] Psi Gauge [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A060D: [8-bit] Notebook Gauge [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A060E: [8-bit] Techno Gauge [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A060F: [8-bit] Ramen Gauge [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A0610: [8-bit] Fish Gauge [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A0611: [8-bit] Danger Gauge [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A0612: [8-bit] Bird Gauge [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A0613: [8-bit] Kururin Family Gauge [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A0614: [8-bit] Flower Gauge [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A0615: [8-bit] Rainbow Gauge [Save 1]
//          Bit0 - Unlocked (Sweet Shores shop)
// $1A0616: [8-bit] Magician Gauge [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A0617: [8-bit] Fantasy Gauge [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A0618: [8-bit] Igogashima Gauge [Save 1]
//          Bit0 - Unlocked (WonderVerse shop)
// $1A0619: [8-bit] Junk Gauge [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A061A: [8-bit] Ghost House Gauge [Save 1]
//          Bit0 - Unlocked (Snowscape shop)
// $1A061B: [8-bit] Kingyo Sukui Gauge [Save 1]
//          Bit0 - Unlocked (Coastal Canopy shop)
// $1A061C: [8-bit] Summer Gauge [Save 1]
//          Bit0 - Unlocked (CyberCity shop)
// $1A061D: [8-bit] Witch Gauge [Save 1]
//          Bit0 - Unlocked (complete all challenges)
// $1A061E: [8-bit] UNUSED; seemingly unlocks an invisible gauge that can be equipped when selecting an empty spot; does not seem to be intended
// $1A061F: [8-bit] Sweet Shores 1 Guide [Save 1]
//          Bit0 - Unlocked

function BrotherGuide() =>
    sum_of(range(0x1A061F,0x1A0646,step=1),addr => bit0(addr + CurrentSave))
//sample code
//function BrotherGuide(world) =>
//    sum_of(range(0x1a061f + ((world-1) * 8),0x1a0626 + ((world-1) * 8),step=1), addr => bit1(addr + CurrentSave))
//    

// $1A0620: [8-bit] Sweet Shores 2 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0621: [8-bit] Sweet Shores 3 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0622: [8-bit] Sweet Shores 4 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0623: [8-bit] Sweet Shores 5 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0624: [8-bit] Sweet Shores 6 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0625: [8-bit] Sweet Shores 7 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0626: [8-bit] Sweet Shores 8 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0627: [8-bit] Coastal Canopy 1 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0628: [8-bit] Coastal Canopy 2 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0629: [8-bit] Coastal Canopy 3 Guide [Save 1]
//          Bit0 - Unlocked
// $1A062A: [8-bit] Coastal Canopy 4 Guide [Save 1]
//          Bit0 - Unlocked
// $1A062B: [8-bit] Coastal Canopy 5 Guide [Save 1]
//          Bit0 - Unlocked
// $1A062C: [8-bit] Coastal Canopy 6 Guide [Save 1]
//          Bit0 - Unlocked
// $1A062D: [8-bit] Coastal Canopy 7 Guide [Save 1]
//          Bit0 - Unlocked
// $1A062E: [8-bit] Coastal Canopy 8 Guide [Save 1]
//          Bit0 - Unlocked
// $1A062F: [8-bit] Snowscape 1 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0630: [8-bit] Snowscape 2 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0631: [8-bit] Snowscape 3 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0632: [8-bit] Snowscape 4 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0633: [8-bit] Snowscape 5 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0634: [8-bit] Snowscape 6 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0635: [8-bit] Snowscape 7 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0636: [8-bit] Snowscape 8 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0637: [8-bit] CyberCity 1 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0638: [8-bit] CyberCity 2 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0639: [8-bit] CyberCity 3 Guide [Save 1]
//          Bit0 - Unlocked
// $1A063A: [8-bit] CyberCity 4 Guide [Save 1]
//          Bit0 - Unlocked
// $1A063B: [8-bit] CyberCity 5 Guide [Save 1]
//          Bit0 - Unlocked
// $1A063C: [8-bit] CyberCity 6 Guide [Save 1]
//          Bit0 - Unlocked
// $1A063D: [8-bit] CyberCity 7 Guide [Save 1]
//          Bit0 - Unlocked
// $1A063E: [8-bit] CyberCity 8 Guide [Save 1]
//          Bit0 - Unlocked
// $1A063F: [8-bit] Wonderverse 1 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0640: [8-bit] Wonderverse 2 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0641: [8-bit] Wonderverse 3 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0642: [8-bit] Wonderverse 4 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0643: [8-bit] Wonderverse 5 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0644: [8-bit] Wonderverse 6 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0645: [8-bit] Wonderverse 7 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0646: [8-bit] Wonderverse 8 Guide [Save 1]
//          Bit0 - Unlocked
// $1A0647: [8-bit] Sweet Shores 1 Super Guide [Save 1]
//          Bit0 - Unlocked
function SuperGuide() =>
    sum_of(range(0x1A0647,0x1A066E,step=1),addr => bit0(addr + CurrentSave))
// $1A0648: [8-bit] Sweet Shores 2 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0649: [8-bit] Sweet Shores 3 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A064A: [8-bit] Sweet Shores 4 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A064B: [8-bit] Sweet Shores 5 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A064C: [8-bit] Sweet Shores 6 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A064D: [8-bit] Sweet Shores 7 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A064E: [8-bit] Sweet Shores 8 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A064F: [8-bit] Coastal Canopy 1 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0650: [8-bit] Coastal Canopy 2 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0651: [8-bit] Coastal Canopy 3 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0652: [8-bit] Coastal Canopy 4 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0653: [8-bit] Coastal Canopy 5 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0654: [8-bit] Coastal Canopy 6 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0655: [8-bit] Coastal Canopy 7 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0656: [8-bit] Coastal Canopy 8 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0657: [8-bit] Snowscape 1 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0658: [8-bit] Snowscape 2 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0659: [8-bit] Snowscape 3 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A065A: [8-bit] Snowscape 4 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A065B: [8-bit] Snowscape 5 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A065C: [8-bit] Snowscape 6 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A065D: [8-bit] Snowscape 7 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A065E: [8-bit] Snowscape 8 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A065F: [8-bit] CyberCity 1 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0660: [8-bit] CyberCity 2 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0661: [8-bit] CyberCity 3 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0662: [8-bit] CyberCity 4 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0663: [8-bit] CyberCity 5 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0664: [8-bit] CyberCity 6 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0665: [8-bit] CyberCity 7 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0666: [8-bit] CyberCity 8 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0667: [8-bit] Wonderverse 1 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0668: [8-bit] Wonderverse 2 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A0669: [8-bit] Wonderverse 3 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A066A: [8-bit] Wonderverse 4 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A066B: [8-bit] Wonderverse 5 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A066C: [8-bit] Wonderverse 6 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A066D: [8-bit] Wonderverse 7 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A066E: [8-bit] WonderVerse 8 Super Guide [Save 1]
//          Bit0 - Unlocked
// $1A066F: [8-bit] Sweet Shores Map [Save 1]
//          Bit0 - Unlocked
// $1A0670: [8-bit] Coastal Canopy Map [Save 1]
//          Bit0 - Unlocked
// $1A0671: [8-bit] Snowscape Map [Save 1]
//          Bit0 - Unlocked
// $1A0672: [8-bit] CyberCity Map [Save 1]
//          Bit0 - Unlocked
// $1A0673: [8-bit] WonderVerse Map [Save 1]
//          Bit0 - Unlocked
// $1A0674: [8-bit] Spin Advance [Save 1]; quiz minigame
//          Bit0 - Unlocked (any shop)
SpinAdvance = byte(0x1A0674 + CurrentSave)
// $1A0675: [8-bit] Tsururin (Slippery mode) [Save 1]
//          Bit0 - Unlocked; beat Adventure mode
// $1A0676: [8-bit] Extra Course [Save 1]; toggle to turn courses 45 degrees
//          Bit0 - Unlocked; beat Slippery mode
ExtraUnlock = byte(0x1A0676 + CurrentSave)
// $1A0677: [8-bit] Sensei (rabbit) trophy [Save 1]
//          Bit0 - Unlocked; beat all rabbit times in Adventure
RabbitTrophy = byte(0x1A0677 + CurrentSave)
// $1A0678: [8-bit] Professor trophy [Save 1]
//          Bit0 - Unlocked; beat all Professor times in Adventure
ProfTrophy = byte(0x1A0678 + CurrentSave)
// $1A0679: [8-bit] Dad trophy [Save 1]
//          Bit0 - Unlocked; beat all Dad times in Adventure
DadTrophy = byte(0x1A0679 + CurrentSave)
// $1A067B: [8-bit] Current gauge equipped [Save 1]
// $1A067D: [8-bit] Current helirin equipped [Save 1]
// $1A067F: [8-bit] Most recent Adventure stage entered [Save 1]
// $3F1BA3: changes from 0x02 to 0x04 in 1-1 when getting all coins
// $4E7213: right strawberry hp
//          0x80 when turns to cookie
// $4EEC13: bottm right strawberry hp
//          0x80 when turns to cookie
// $4F6613: top left strawberry hp
//          0x80 when turns to cookie
// $4FE013: left strawberry
// $505A13: bottm left strawberry hp
//          0x80 when turns to cookie
// $50D413: top right strawberry hp
//          0x80 when turns to cookie
//Data
StageData = {
    0:{"Stage":"Sweet Shores 1","Rabbit":0x52A,"Prof":0x35E,"Dad":0x2AA,"Coins":500,"SlipTarget":615,"SlipTime":"0'10''25"},
    1:{"Stage":"Sweet Shores 2","Rabbit":0xA04,"Prof":0x4AB,"Dad":0x3F8,"Coins":600,"SlipTarget":795,"SlipTime":"0'13''25"},
    2:{"Stage":"Sweet Shores 3","Rabbit":0xBE6,"Prof":0x592,"Dad":0x450,"Coins":700,"SlipTarget":915,"SlipTime":"0'15''25"},
    3:{"Stage":"Sweet Shores 4","Rabbit":0x1370,"Prof":0x7F9,"Dad":0x5AD,"Coins":800,"SlipTarget":1065,"SlipTime":"0'17''75"},
    4:{"Stage":"Sweet Shores 5","Rabbit":0x97E,"Prof":0x4FC,"Dad":0x3F4,"Coins":800,"SlipTarget":780,"SlipTime":"0'13''00"},
    5:{"Stage":"Sweet Shores 6","Rabbit":0x195C,"Prof":0xA81,"Dad":0x6EA,"Coins":1000,"SlipTarget":1140,"SlipTime":"0'19''00"},
    6:{"Stage":"Sweet Shores 7","Rabbit":0x1C28,"Prof":0xE0B,"Dad":0x763,"Coins":1400,"SlipTarget":1185,"SlipTime":"0'19''75"},
    7:{"Stage":"Sweet Shores 8","Rabbit":0x118B,"Prof":0x86C,"Dad":0x55A,"Coins":1500},
    8:{"Stage":"Coastal Canopy 1","Rabbit":0xE2C,"Prof":0x60f,"Dad":0x3de,"Coins":1000,"SlipTarget":750,"SlipTime":"0'12''50"},
    9:{"Stage":"Coastal Canopy 2","Rabbit":0xcbd,"Prof":0x522,"Dad":0x310,"Coins":1100,"SlipTarget":630,"SlipTime":"0'10''50"},
    10:{"Stage":"Coastal Canopy 3","Rabbit":0x11CB,"Prof":0x9B8,"Dad":0x7EB,"Coins":1200,"SlipTarget":1260,"SlipTime":"0'21''00"},
    11:{"Stage":"Coastal Canopy 4","Rabbit":0xd95,"Prof":0x899,"Dad":0x5da,"Coins":1200,"SlipTarget":1140,"SlipTime":"0'19''00"},
    12:{"Stage":"Coastal Canopy 5","Rabbit":0xF06,"Prof":0xbf1,"Dad":0x897,"Coins":1300,"SlipTarget":1410,"SlipTime":"0'23''50"},
    13:{"Stage":"Coastal Canopy 6","Rabbit":0x10a2,"Prof":0xA2E,"Dad":0x6A4,"Coins":1300,"SlipTarget":1290,"SlipTime":"0'21''50"},
    14:{"Stage":"Coastal Canopy 7","Rabbit":0x1B01,"Prof":0xc93,"Dad":0x8CB,"Coins":1600,"SlipTarget":1080,"SlipTime":"0'18''00"},
    15:{"Stage":"Coastal Canopy 8","Rabbit":0x2135,"Prof":0x14AB,"Dad":0x11A8,"Coins":2500},
    16:{"Stage":"Snowscape 1","Rabbit":0xF0E,"Prof":0x73C,"Dad":0x55e,"Coins":1500,"SlipTarget":1035,"SlipTime":"0'17''25"},
    17:{"Stage":"Snowscape 2","Rabbit":0x159D,"Prof":0xA03,"Dad":0x6f0,"Coins":1600,"SlipTarget":1350,"SlipTime":"0'22''50"},
    18:{"Stage":"Snowscape 3","Rabbit":0x13C9,"Prof":0x1112,"Dad":0xD84,"Coins":1700,"SlipTarget":3405,"SlipTime":"0'56''75"},
    19:{"Stage":"Snowscape 4","Rabbit":0x1ce3,"Prof":0xc63,"Dad":0x93c,"Coins":1700,"SlipTarget":1950,"SlipTime":"0'32''50"},
    20:{"Stage":"Snowscape 5","Rabbit":0x16d7,"Prof":0x12D7,"Dad":0xFB9,"Coins":2400,"SlipTarget":3930,"SlipTime":"1'05''50"},
    21:{"Stage":"Snowscape 6","Rabbit":0x20d3,"Prof":0x6e4,"Dad":0x24D,"Coins":2000,"SlipTarget":345,"SlipTime":"0'5''75"},
    22:{"Stage":"Snowscape 7","Rabbit":0x1C72,"Prof":0x13E7,"Dad":0x1105,"Coins":3200,"SlipTarget":4275,"SlipTime":"1'11''25"},
    23:{"Stage":"Snowscape 8","Rabbit":0x26E3,"Prof":0x15A0,"Dad":0x1339,"Coins":3000},
    24:{"Stage":"CyberCity 1","Rabbit":0x1526,"Prof":0x99a,"Dad":0x621,"Coins":2500,"SlipTarget":1185,"SlipTime":"0'19''75"},
    25:{"Stage":"CyberCity 2","Rabbit":0x1B65,"Prof":0xfef,"Dad":0xaa1,"Coins":2600,"SlipTarget":2055,"SlipTime":"0'34''25"},
    26:{"Stage":"CyberCity 3","Rabbit":0x1F60,"Prof":0xc33,"Dad":0x803,"Coins":2600,"SlipTarget":1665,"SlipTime":"0'27''75"},
    27:{"Stage":"CyberCity 4","Rabbit":0x24B5,"Prof":0x1807,"Dad":0xF4C,"Coins":2700,"SlipTarget":2805,"SlipTime":"0'46''75"},
    28:{"Stage":"CyberCity 5","Rabbit":0x20fa,"Prof":0x7b6,"Dad":0x5A2,"Coins":2700,"SlipTarget":1080,"SlipTime":"0'18''00"},
    29:{"Stage":"CyberCity 6","Rabbit":0x29C6,"Prof":0x1B70,"Dad":0x1207,"Coins":2800,"SlipTarget":2610,"SlipTime":"0'43''50"},
    30:{"Stage":"CyberCity 7","Rabbit":0x22bc,"Prof":0xDD5,"Dad":0xa12,"Coins":3000,"SlipTarget":1530,"SlipTime":"0'25''50"},
    31:{"Stage":"CyberCity 8","Rabbit":0x23AA,"Prof":0x141f,"Dad":0xEBD,"Coins":4500},
    32:{"Stage":"WonderVerse 1","Rabbit":0x22BA,"Prof":0xfa8,"Dad":0xA9A,"Coins":3500,"SlipTarget":1815,"SlipTime":"0'30''25"},
    33:{"Stage":"WonderVerse 2","Rabbit":0x1EAD,"Prof":0xfcc,"Dad":0xAC9,"Coins":2250,"SlipTarget":1710,"SlipTime":"0'28''50"},
    34:{"Stage":"WonderVerse 3","Rabbit":0x1a6a,"Prof":0xac5,"Dad":0x88b,"Coins":4000,"SlipTarget":1350,"SlipTime":"0'22''50"},
    35:{"Stage":"WonderVerse 4","Rabbit":0x20E0,"Prof":0x17A2,"Dad":0x1256,"Coins":3000,"SlipTarget":2685,"SlipTime":"0'44''75"},
    36:{"Stage":"WonderVerse 5","Rabbit":0x26F5,"Prof":0x1007,"Dad":0xA1E,"Coins":4500,"SlipTarget":1665,"SlipTime":"0'27''75"},
    37:{"Stage":"WonderVerse 6","Rabbit":0x2D7D,"Prof":0x1F09,"Dad":0x17bb,"Coins":9990,"SlipTarget":3600,"SlipTime":"1'00''00"},
    38:{"Stage":"WonderVerse 7","Rabbit":0x3672,"Prof":0x2551,"Dad":0x1cad,"Coins":5000,"SlipTarget":4200,"SlipTime":"1'10''00"},
    39:{"Stage":"WonderVerse 8","Rabbit":0x2825,"Prof":0x1f11,"Dad":0x127b,"Coins":6000},
    40:{"Stage":"Classic 1","ChallengeTarget":855,"ChallengeTime":"0'14''25"},
    41:{"Stage":"Classic 2","ChallengeTarget":990,"ChallengeTime":"0'16''50"},
    42:{"Stage":"Classic 3","ChallengeTarget":1095,"ChallengeTime":"0'18''25"},
    43:{"Stage":"Classic 4","ChallengeTarget":1440,"ChallengeTime":"0'24''00"},
    44:{"Stage":"Classic 5","ChallengeTarget":1530,"ChallengeTime":"0'25''50"},
    45:{"Stage":"Classic 6","ChallengeTarget":1950,"ChallengeTime":"0'32''50"},
    46:{"Stage":"Classic 7","ChallengeTarget":2040,"ChallengeTime":"0'34''00"},
    47:{"Stage":"Classic 8","ChallengeTarget":2400,"ChallengeTime":"0'40''00"},
    48:{"Stage":"Piston Panic 1","ChallengeTarget":735,"ChallengeTime":"0'12''25"},
    49:{"Stage":"Piston Panic 2","ChallengeTarget":705,"ChallengeTime":"0'11''75"},
    50:{"Stage":"Piston Panic 3","ChallengeTarget":705,"ChallengeTime":"0'11''75"},
    51:{"Stage":"Piston Panic 4","ChallengeTarget":1590,"ChallengeTime":"0'26''50"},
    52:{"Stage":"Piston Panic 5","ChallengeTarget":1605,"ChallengeTime":"0'26''75"},
    53:{"Stage":"Piston Panic 6","ChallengeTarget":1800,"ChallengeTime":"0'30''00"},
    54:{"Stage":"Piston Panic 7","ChallengeTarget":2820,"ChallengeTime":"0'47''00"},
    55:{"Stage":"Piston Panic 8","ChallengeTarget":2940,"ChallengeTime":"0'49''00"},
    56:{"Stage":"Bowling 1","ChallengeTarget":855,"ChallengeTime":"0'14''25"},
    57:{"Stage":"Bowling 2","ChallengeTarget":945,"ChallengeTime":"0'15''75"},
    58:{"Stage":"Bowling 3","ChallengeTarget":915,"ChallengeTime":"0'15''25"},
    59:{"Stage":"Bowling 4","ChallengeTarget":1170,"ChallengeTime":"0'19''50"},
    60:{"Stage":"Bowling 5","ChallengeTarget":1710,"ChallengeTime":"0'28''50"},
    61:{"Stage":"Bowling 6","ChallengeTarget":1710,"ChallengeTime":"0'28''50"},
    62:{"Stage":"Bowling 7","ChallengeTarget":1845,"ChallengeTime":"0'30''75"},
    63:{"Stage":"Bowling 8","ChallengeTarget":2595,"ChallengeTime":"0'43''25"},
    64:{"Stage":"Labyrinth 1","ChallengeTarget":1005,"ChallengeTime":"0'16''75"},
    65:{"Stage":"Labyrinth 2","ChallengeTarget":1155,"ChallengeTime":"0'19''25"},
    66:{"Stage":"Labyrinth 3","ChallengeTarget":1305,"ChallengeTime":"0'21''75"},
    67:{"Stage":"Labyrinth 4","ChallengeTarget":1005,"ChallengeTime":"0'16''75"},
    68:{"Stage":"Labyrinth 5","ChallengeTarget":1650,"ChallengeTime":"0'27''50"},
    69:{"Stage":"Labyrinth 6","ChallengeTarget":1800,"ChallengeTime":"0'30''00"},
    70:{"Stage":"Labyrinth 7","ChallengeTarget":1455,"ChallengeTime":"0'24''25"},
    71:{"Stage":"Labyrinth 8","ChallengeTarget":1725,"ChallengeTime":"0'28''75"},
    72:{"Stage":"Swordplay 1","ChallengeTarget":870,"ChallengeTime":"0'14''50"},
    73:{"Stage":"Swordplay 2","ChallengeTarget":1260,"ChallengeTime":"0'21''00"},
    74:{"Stage":"Swordplay 3","ChallengeTarget":1080,"ChallengeTime":"0'18''00"},
    75:{"Stage":"Swordplay 4","ChallengeTarget":1455,"ChallengeTime":"0'24''25"},
    76:{"Stage":"Swordplay 5","ChallengeTarget":1740,"ChallengeTime":"0'29''00"},
    77:{"Stage":"Swordplay 6","ChallengeTarget":2085,"ChallengeTime":"0'34''75"},
    78:{"Stage":"Swordplay 7","ChallengeTarget":2640,"ChallengeTime":"0'44''00"},
    79:{"Stage":"Swordplay 8","ChallengeTarget":3075,"ChallengeTime":"0'51''25"}
}
AchievementData = {
    0:{"World":"Sweet Shores","beatT":"Sweet Tooth","beatP":5,"coinT":"Edible Gold Flakes","coinP":5,"perfT":"Baked Alaska","perfP":10,"rabT":"White Belt","rabP":5,"profT":"Fast Freshman","profP":5,"dadT":"Sugar Rush","dadP":10,"slipT":"Slip 'n Sliding","slipP":10},
    8:{"World":"Coastal Canopy","beatT":"Beat the Heat","beatP":5,"coinT":"Luxury Cruise","coinP":5,"perfT":"The Perfect Wave","perfP":10,"rabT":"Blue Belt","rabP":5,"profT":"Speedy Sophmore","profP":5,"dadT":"Tsunami Sprinter","dadP":10,"slipT":"Out of Control","slipP":10},
    16:{"World":"Snowscape","beatT":"Snow Problem","beatP":5,"coinT":"Cold Cash","coinP":5,"perfT":"Pure Powder","perfP":10,"rabT":"Purple Belt","rabP":5,"profT":"Jubilant Junior","profP":10,"dadT":"Blizzard Blitz","dadP":10,"slipT":"Bridge May Be Icy","slipP":10},
    24:{"World":"CyberCity","beatT":"Crossing City Limits","beatP":10,"coinT":"Still Short on Rent","coinP":10,"perfT":"Clean Driving Record","perfP":25,"rabT":"Brown Belt","rabP":5,"profT":"Senior Year","profP":10,"dadT":"Highrise Hustle","dadP":10,"slipT":"Full Steam Ahead","slipP":10},
    32:{"World":"WonderVerse","beatT":"Family Reunion","beatP":25,"coinT":"Cave of Wonders","coinP":10,"perfT":"Simply Wunderbar","perfP":25,"rabT":"Black Belt","rabP":5,"profT":"College Graduate","profP":10,"dadT":"Stellar Sprint","dadP":25,"slipT":"Smooth Moves","slipP":25},
    40:{"World":"Classic","beatT":"Classic Rock","beatP":3,"parT":"Classical Movement","parP":5,"speedT":"Classic Sports Car","speedP":25},
    48:{"World":"Piston Panic","beatT":"In a Pinch","beatP":3,"parT":"Mechanical Menace","parP":5,"speedT":"Crushing Victory","speedP":25},
    56:{"World":"Bowling","beatT":"Split Decisions","beatP":3,"parT":"Time to Spare","parP":5,"speedT":"Precision Strike","speedP":25},
    64:{"World":"Labyrinth","beatT":"Lost in a Library","beatP":3,"parT":"Haunted Corn Maze","parP":5,"speedT":"Pan's Labyrinth","speedP":25},
    72:{"World":"Swordplay","beatT":"Toy Lightsaber","beatP":3,"parT":"Fine Fencer","parP":5,"speedT":"Master of the Blade","speedP":25}
}
LevelLookup = {
    0:"Sweet Shores 1",1:"Sweet Shores 2",2:"Sweet Shores 3",3:"Sweet Shores 4",4:"Sweet Shores 5",5:"Sweet Shores 6",6:"Sweet Shores 7",7:"Sweet Shores 8",
    8:"Castal Canopy 1",9:"Coastal Canopy 2",10:"Coastal Canopy 3",11:"Coastal Canopy 4",12:"Coastal Canopy 5",13:"Coastal Canopy 6",14:"Coastal Canopy 7",15:"Coastal Canopy 8",
    16:"Snowscape 1",17:"Snowscape 2",18:"Snowscape 3",19:"Snowscape 4",20:"Snowscape 5",21:"Snowscape 6",22:"Snowscape 7",23:"Snowscape 8",
    24:"CyberCity 1",25:"CyberCity 2",26:"CyberCity 3",27:"CyberCity 4",28:"CyberCity 5",29:"CyberCity 6",30:"CyberCity 7",31:"CyberCity 8",
    32:"WonderVerse 1",33:"WonderVerse 2",34:"WonderVerse 3",35:"WonderVerse 4",36:"WonderVerse 5",37:"WonderVerse 6",38:"WonderVerse 7",39:"WonderVerse 8",
    40:"Classic 1",41:"Classic 2",42:"Classic 3",43:"Classic 4",44:"Classic 5",45:"Classic 6",46:"Classic 7",47:"Classic 8",
    48:"Piston Panic 1",49:"Piston Panic 2",50:"Piston Panic 3",51:"Piston Panic 4",52:"Piston Panic 5",53:"Piston Panic 6",54:"Piston Panic 7",55:"Piston Panic 8",
    56:"Bowling 1",57:"Bowling 2",58:"Bowling 3",59:"Bowling 4",60:"Bowling 5",61:"Bowling 6",62:"Bowling 7",63:"Bowling 8",
    64:"Labyrinth 1",65:"Labyrinth 2",66:"Labyrinth 3",67:"Labyrinth 4",68:"Labyrinth 5",69:"Labyrinth 6",70:"Labyrinth 7",71:"Labyrinth 8",
    72:"Swordplay 1",73:"Swordplay 2",74:"Swordplay 3",75:"Swordplay 4",76:"Swordplay 5",77:"Swordplay 6",78:"Swordplay 7",79:"Swordplay 8",
    0xffffffff:"the Shop"
}

AdventureArray = [0,8,16,24,32]
AdventureArrayNoBoss =[0,1,2,3,4,5,6,8,9,10,11,12,13,14,16,17,18,19,20,21,22,24,25,26,27,28,29,30,32,33,34,35,36,37,38]
BossArray = [7,15,23,31,39]
ChallengeArray = [40,48,56,64,72]

//achievements
//Warning
achievement(
    title="Ready to Spin",points=0,
    description="Start a new game using the full-sized Helirin. This will be required to activate most achievements and all leaderboards. Progression may be earned with any size Helirin.",
    trigger=State == FileSelect && HelirinCheck && SaveCheck
)

//for RP and LB
function AdventureBeatFull(target) =>
    tally_of(range(0x1A0580,0x1a05a7,step=1),target, addr => once(byte(addr + CurrentSave) >= 3))
function PrevAdventureBeatFull(target) =>
    tally_of(range(0x1A0580,0x1a05a7,step=1),target, addr => once(prev(byte(addr + CurrentSave) >= 3)))
function AdventureCoinFull(target) =>
    tally_of(range(0x1A0580,0x1a05a7,step=1),target, addr => once(byte(addr + CurrentSave) >= 4))
function PrevAdventureCoinFull(target) =>
    tally_of(range(0x1A0580,0x1a05a7,step=1),target, addr => once(prev(byte(addr + CurrentSave) >= 4)))
function AdventurePerfectFull(target) =>
    tally_of(range(0x1A0580,0x1a05a7,step=1),target, addr => once(byte(addr + CurrentSave) == 5))
function ChallengeBeatFull(target) =>
    tally_of(range(0x1A05A8,0x1a05cf,step=1),target, addr => once(byte(addr + CurrentSave) >= 2))
function PrevChallengeBeatFull(target) =>
    tally_of(range(0x1A05A8,0x1a05cf,step=1),target, addr => once(prev(byte(addr + CurrentSave) >= 2)))
function ChallengeParFull(target) =>
    tally_of(range(0x1A05A8,0x1a05cf,step=1),target, addr => once(byte(addr + CurrentSave) == 3))
function FreshChallengeFile() =>
    sum_of(range(0x1A05A8,0x1a05cf,step=1), addr => byte(addr + CurrentSave))


// $1A0580: [8-bit] Adventure - Sweet Shores 1 status [Save 1]
//          0x00 - Locked | 0x01 - Unlocked | 0x02 - Entered | 0x03 - Cleared | 0x04 - All coins | 0x05 - Perfect
function AdventureBeat(ID,target) =>
    tally_of(range(0x1A0580 + ID,0x1A0587 + ID,step=1),target, addr => once(byte(addr + CurrentSave) >= 3))
function PrevAdventureBeat(ID,target) =>
    tally_of(range(0x1A0580 + ID,0x1A0587 + ID,step=1),target, addr => once(prev(byte(addr + CurrentSave) >= 3)))   
function AdventureBeatAchievement(ID) {
    achievement(
        title=AchievementData[ID]["beatT"],points=AchievementData[ID]["beatP"],type="Progression",
        description="Complete every stage in " + AchievementData[ID]["World"]+" on Adventure mode.",
        trigger=PrevAdventureBeat(ID,7) && 
                measured(AdventureBeat(ID,8), State >= AdventureOverworld && Mode == Adventure) &&
                never(PrevAdventureBeat(ID,8)) && never(State < AdventureOverworld)
    )
}
for i in [0,8,16,24]
    AdventureBeatAchievement(i)
achievement(
        title="Family Reunion",points=25,type="Progression",
        description="Complete every stage in " + AchievementData[32]["World"]+" on Adventure mode and unlock Slippery mode.",
        trigger=PrevAdventureBeat(32,7) && 
                measured(AdventureBeat(32,8), State >= AdventureOverworld && Mode == Adventure) &&
                never(PrevAdventureBeat(32,8)) && never(State < AdventureOverworld)
    )    
function AdventureCoins(ID,target) =>
    tally_of(range(0x1A0580 + ID,0x1A0587 + ID,step=1),target, addr => once(byte(addr + CurrentSave) >= 4))
function PrevAdventureCoins(ID,target) =>
    tally_of(range(0x1A0580 + ID,0x1A0587 + ID,step=1),target, addr => once(prev(byte(addr + CurrentSave) >= 4)))   
function AdventureCoinsAchievement(ID) {
    achievement(
        title=AchievementData[ID]["coinT"],points=AchievementData[ID]["coinP"],
        description="Collect every coin in "+AchievementData[ID]["World"]+" on Adventure mode.",
        trigger=StandardHelirin &&
                PrevAdventureCoins(ID,7) && 
                measured(AdventureCoins(ID,8), State >= AdventureOverworld && Mode == Adventure && StandardHelirin) &&
                never(PrevAdventureCoins(ID,8)) && never(State < AdventureOverworld)
    )
}
for i in AdventureArray
    AdventureCoinsAchievement(i)
    
function AdventurePerfect(ID,target) =>
    tally_of(range(0x1A0580 + ID,0x1A0587 + ID,step=1),target, addr => once(byte(addr + CurrentSave) == 5))
function PrevAdventurePerfect(ID,target) =>
    tally_of(range(0x1A0580 + ID,0x1A0587 + ID,step=1),target, addr => once(prev(byte(addr + CurrentSave) == 5)))   
function AdventurePerfectAchievement(ID) {
    achievement(
        title=AchievementData[ID]["perfT"],points=AchievementData[ID]["perfP"],
        description="Earn a perfect on every stage in "+AchievementData[ID]["World"]+" on Adventure mode.",
        trigger=StandardHelirin &&
                PrevAdventurePerfect(ID,7) && 
                measured(AdventurePerfect(ID,8), State >= AdventureOverworld && Mode == Adventure && StandardHelirin) &&
                never(PrevAdventurePerfect(ID,8)) && never(State < AdventureOverworld)
    )
}
for i in AdventureArray
    AdventurePerfectAchievement(i)
// $1A03A0: [32-bit BE] Adventure - Sweet Shores 1 best time; frames [Save 1]
function AdventureTimeCheck(ID) =>
    dword_be(0x1A03A0 + (ID*4) + CurrentSave)

function RabbitSpeed(ID) {
        achievement(
            title=AchievementData[ID]["rabT"],points = AchievementData[ID]["rabP"],
            description="Beat all of the Rabbit times in "+AchievementData[ID]["World"]+" on Adventure mode.",
                    trigger= tally(7,
                        once(prev(AdventureTimeCheck(ID)) < StageData[ID]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+1)) < StageData[ID+1]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+2)) < StageData[ID+2]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+3)) < StageData[ID+3]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+4)) < StageData[ID+4]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+5)) < StageData[ID+5]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+6)) < StageData[ID+6]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+7)) < StageData[ID+7]["Rabbit"])) &&
                    measured(tally(8,
                        once(AdventureTimeCheck(ID) < StageData[ID]["Rabbit"]),
                        once(AdventureTimeCheck(ID+1) < StageData[ID+1]["Rabbit"]),
                        once(AdventureTimeCheck(ID+2) < StageData[ID+2]["Rabbit"]),
                        once(AdventureTimeCheck(ID+3) < StageData[ID+3]["Rabbit"]),
                        once(AdventureTimeCheck(ID+4) < StageData[ID+4]["Rabbit"]),
                        once(AdventureTimeCheck(ID+5) < StageData[ID+5]["Rabbit"]),
                        once(AdventureTimeCheck(ID+6) < StageData[ID+6]["Rabbit"]),
                        once(AdventureTimeCheck(ID+7) < StageData[ID+7]["Rabbit"])), Mode == Adventure && StandardHelirin) &&
                    never(tally(8,
                        once(prev(AdventureTimeCheck(ID)) < StageData[ID]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+1)) < StageData[ID+1]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+2)) < StageData[ID+2]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+3)) < StageData[ID+3]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+4)) < StageData[ID+4]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+5)) < StageData[ID+5]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+6)) < StageData[ID+6]["Rabbit"]),
                        once(prev(AdventureTimeCheck(ID+7)) < StageData[ID+7]["Rabbit"]))) &&
                        never(State < AdventureOverworld)
    )
}

for i in AdventureArray
    RabbitSpeed(i)
    
function ProfSpeed(ID) {
        achievement(
            title=AchievementData[ID]["profT"],points = AchievementData[ID]["profP"],
            description="Beat all of the Professor times in "+AchievementData[ID]["World"]+" on Adventure mode.",
                    trigger= tally(7,
                        once(prev(AdventureTimeCheck(ID)) < StageData[ID]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+1)) < StageData[ID+1]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+2)) < StageData[ID+2]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+3)) < StageData[ID+3]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+4)) < StageData[ID+4]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+5)) < StageData[ID+5]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+6)) < StageData[ID+6]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+7)) < StageData[ID+7]["Prof"])) &&
                    measured(tally(8,
                        once(AdventureTimeCheck(ID) < StageData[ID]["Prof"]),
                        once(AdventureTimeCheck(ID+1) < StageData[ID+1]["Prof"]),
                        once(AdventureTimeCheck(ID+2) < StageData[ID+2]["Prof"]),
                        once(AdventureTimeCheck(ID+3) < StageData[ID+3]["Prof"]),
                        once(AdventureTimeCheck(ID+4) < StageData[ID+4]["Prof"]),
                        once(AdventureTimeCheck(ID+5) < StageData[ID+5]["Prof"]),
                        once(AdventureTimeCheck(ID+6) < StageData[ID+6]["Prof"]),
                        once(AdventureTimeCheck(ID+7) < StageData[ID+7]["Prof"])), Mode == Adventure && StandardHelirin) &&
                    never(tally(8,
                        once(prev(AdventureTimeCheck(ID)) < StageData[ID]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+1)) < StageData[ID+1]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+2)) < StageData[ID+2]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+3)) < StageData[ID+3]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+4)) < StageData[ID+4]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+5)) < StageData[ID+5]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+6)) < StageData[ID+6]["Prof"]),
                        once(prev(AdventureTimeCheck(ID+7)) < StageData[ID+7]["Prof"]))) &&
                        never(State < AdventureOverworld)
    )
}

for i in AdventureArray
    ProfSpeed(i)
    
function DadSpeed(ID) {
        achievement(
            title=AchievementData[ID]["dadT"],points = AchievementData[ID]["dadP"],
            description="Beat all of the Dad times in "+AchievementData[ID]["World"]+" on Adventure mode.",
                    trigger= tally(7,
                        once(prev(AdventureTimeCheck(ID)) < StageData[ID]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+1)) < StageData[ID+1]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+2)) < StageData[ID+2]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+3)) < StageData[ID+3]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+4)) < StageData[ID+4]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+5)) < StageData[ID+5]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+6)) < StageData[ID+6]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+7)) < StageData[ID+7]["Dad"])) &&
                    measured(tally(8,
                        once(AdventureTimeCheck(ID) < StageData[ID]["Dad"]),
                        once(AdventureTimeCheck(ID+1) < StageData[ID+1]["Dad"]),
                        once(AdventureTimeCheck(ID+2) < StageData[ID+2]["Dad"]),
                        once(AdventureTimeCheck(ID+3) < StageData[ID+3]["Dad"]),
                        once(AdventureTimeCheck(ID+4) < StageData[ID+4]["Dad"]),
                        once(AdventureTimeCheck(ID+5) < StageData[ID+5]["Dad"]),
                        once(AdventureTimeCheck(ID+6) < StageData[ID+6]["Dad"]),
                        once(AdventureTimeCheck(ID+7) < StageData[ID+7]["Dad"])), Mode == Adventure && StandardHelirin) &&
                    never(tally(8,
                        once(prev(AdventureTimeCheck(ID)) < StageData[ID]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+1)) < StageData[ID+1]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+2)) < StageData[ID+2]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+3)) < StageData[ID+3]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+4)) < StageData[ID+4]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+5)) < StageData[ID+5]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+6)) < StageData[ID+6]["Dad"]),
                        once(prev(AdventureTimeCheck(ID+7)) < StageData[ID+7]["Dad"]))) &&
                        never(State < AdventureOverworld)
    )
}
for i in AdventureArray
    DadSpeed(i)
    
//shop achievements
achievement(
    title="Sweets Collector",points=5,
    description="Purchase every Helirin, every gauge, and the map from the shop in Sweet Shores.",
    trigger= prev(World1Shop) == 14 && measured(World1Shop == 15, (Mode == Adventure || Mode == Slippery) && State >= AdventureOverworld)
)
achievement(
    title="Coastal Collector",points=5,
    description="Purchase every Helirin, every gauge, and the map from the shop in Coastal Canopy.",
    trigger= prev(World2Shop) == 14 && measured(World2Shop == 15, (Mode == Adventure || Mode == Slippery) && State >= AdventureOverworld)
)
achievement(
    title="Chilly Collector",points=5,
    description="Purchase every Helirin, every gauge, and the map from the shop in Snowscape.",
    trigger= prev(World3Shop) == 14 && measured(World3Shop == 15, (Mode == Adventure || Mode == Slippery) && State >= AdventureOverworld)
)
achievement(
    title="Cyber Collector",points=5,
    description="Purchase every Helirin, every gauge, and the map from the shop in CyberCity.",
    trigger= prev(World4Shop) == 12 && measured(World4Shop == 13, (Mode == Adventure || Mode == Slippery) && State >= AdventureOverworld)
)
achievement(
    title="Wonder Collector",points=5,
    description="Purchase every Helirin, every gauge, and the map from the shop in WonderVerse.",
    trigger= prev(World5Shop) == 11 && measured(World5Shop == 12, (Mode == Adventure || Mode == Slippery) && State >= AdventureOverworld)
)
//special items
achievement(
    title="Gone Gold",points=10,
    description="Complete all of the coin challenges on Adventure mode and unlock the gold Helirin.",
    trigger= Mode == Adventure && State >= AdventureOverworld && prev(GoldHelirin) == 0 && GoldHelirin == 1 && StandardHelirin
)
achievement(
    title="Certified Platinum",points=25,
    description="Complete all of the perfect challenges on Adventure mode and unlock the platinum Helirin.",
    trigger= Mode == Adventure && State >= AdventureOverworld && prev(PlatinumHelirin) == 0 && PlatinumHelirin == 1 && StandardHelirin
)
achievement(
    title="Surpassing Sensei",points=10,
    description="Beat all of the Rabbit times on Adventure mode and earn a trophy.",
    trigger= Mode == Adventure && State >= AdventureOverworld && prev(RabbitTrophy) == 0 && RabbitTrophy == 1 && StandardHelirin
)
achievement(
    title="Teacher's Pet",points=10,
    description="Beat all of the Professor times on Adventure mode and earn a trophy.",
    trigger= Mode == Adventure && State >= AdventureOverworld && prev(ProfTrophy) == 0 && ProfTrophy == 1 && StandardHelirin
)
achievement(
    title="Proud Father",points=25,
    description="Beat all of the Dad times on Adventure mode and earn a trophy.",
    trigger= Mode == Adventure && State >= AdventureOverworld && prev(DadTrophy) == 0 && DadTrophy == 1 && StandardHelirin
)
// $1A04E0: Slippery stages are considered cleared when their time != 0x34bc0; this does not seem to be stored anywhere else in the save file block. Unlocked levels mirror those cleared in the Adventure mode
//          ----------
//          [32-bit BE] Slippery - Sweet Shores 1 best time; frames [Save 1]
function SlipperyTimeCheck(ID) =>
    dword_be(0x1A04E0 + (ID*4) + CurrentSave)
function SlipperyBeat(target) =>
    tally_of(range(0x1A04E0,0x1A0578,step=4),target, addr => once(dword_be(addr + CurrentSave) != 0x34bc0))
function PrevSlipperyBeat(target) =>
    tally_of(range(0x1A04E0,0x1A0578,step=4),target, addr => once(prev(dword_be(addr + CurrentSave) != 0x34bc0)))
//--- Decided to have a single achievement for all of slippery instead due to the easier difficulty
//function SlipperyBeat(ID,target) =>
//    tally_of(range(0x1A04E0 + (ID * 4),0x1A04F8 + (ID * 4),step=4),target, addr => once(dword_be(addr + CurrentSave) != 0x34bc0))
//function PrevSlipperyBeat(ID,target) =>
//    tally_of(range(0x1A04E0 + (ID * 4),0x1A04F8 + (ID * 4),step=4),target, addr => once(prev(dword_be(addr + CurrentSave) != 0x34bc0)))
//function SlipperyBeatAchievement(ID) {
//    achievement(
//        title="Slippery " ,points=5,type="Progression",
//        description="Complete every stage in "+AchievementData[ID]["World"]+" on Slippery mode.",
//        trigger=PrevSlipperyBeat(ID,6) && 
//                measured(SlipperyBeat(ID,7), State >= AdventureOverworld && Mode == Slippery) &&
//                never(PrevSlipperyBeat(ID,7)) && never(State < AdventureOverworld)
//    )
//}
//for i in AdventureArray
//    SlipperyBeatAchievement(i)


function SlipperySpeed(ID) {
        achievement(
            title=AchievementData[ID]["slipT"],points = AchievementData[ID]["slipP"],
            description="Beat the following " + AchievementData[ID]["World"] +" times on Slippery mode: [1]"+StageData[ID]["SlipTime"]+" • [2]"+StageData[ID+1]["SlipTime"]+" • [3]"+StageData[ID+2]["SlipTime"]+" • [4]"+StageData[ID+3]["SlipTime"]+" • [5]"+StageData[ID+4]["SlipTime"]+" • [6]"+StageData[ID+5]["SlipTime"]+" • [7]"+StageData[ID+6]["SlipTime"],
                    trigger= tally(6,
                        once(prev(SlipperyTimeCheck(ID)) < StageData[ID]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+1)) < StageData[ID+1]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+2)) < StageData[ID+2]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+3)) < StageData[ID+3]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+4)) < StageData[ID+4]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+5)) < StageData[ID+5]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+6)) < StageData[ID+6]["SlipTarget"])) &&
                    measured(tally(7,
                        once(SlipperyTimeCheck(ID) < StageData[ID]["SlipTarget"]),
                        once(SlipperyTimeCheck(ID+1) < StageData[ID+1]["SlipTarget"]),
                        once(SlipperyTimeCheck(ID+2) < StageData[ID+2]["SlipTarget"]),
                        once(SlipperyTimeCheck(ID+3) < StageData[ID+3]["SlipTarget"]),
                        once(SlipperyTimeCheck(ID+4) < StageData[ID+4]["SlipTarget"]),
                        once(SlipperyTimeCheck(ID+5) < StageData[ID+5]["SlipTarget"]),
                        once(SlipperyTimeCheck(ID+6) < StageData[ID+6]["SlipTarget"])), Mode == Slippery) &&
                    never(tally(7,
                        once(prev(SlipperyTimeCheck(ID)) < StageData[ID]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+1)) < StageData[ID+1]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+2)) < StageData[ID+2]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+3)) < StageData[ID+3]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+4)) < StageData[ID+4]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+5)) < StageData[ID+5]["SlipTarget"]),
                        once(prev(SlipperyTimeCheck(ID+6)) < StageData[ID+6]["SlipTarget"]))) &&
                        never(State < AdventureOverworld) 
    )
}

for i in AdventureArray
    SlipperySpeed(i)

achievement(
        title="Tsuru, Tsuru, Tsururin!",points=25,
        description="Complete every stage on Slippery mode and unlock Extra mode.",
        trigger=PrevSlipperyBeat(34) && 
                measured(SlipperyBeat(35), State >= AdventureOverworld && Mode == Slippery) &&
                never(PrevSlipperyBeat(35)) && never(State < AdventureOverworld)
    )
achievement(
    title="Extra, Extra",points=2,
    description="Complete any stage with Extra mode equipped.",
    trigger = State >= AdventurePlaying && __ornext(Mode == Adventure || Mode == Slippery) && ExtraCourse && 
            trigger_when((LevelComplete && PointerProtection) || BossComplete)
)
achievement(
    title="Help Me, Rabbit Sensei!",points=5,
    description="Purchase every completion guide from the shops.",
    trigger = prev(BrotherGuide()) == 39 && measured(BrotherGuide() == 40, State >= AdventureOverworld && (Mode == Adventure || Mode == Slippery))
)
achievement(
    title="Super Player in the Making",points=10,
    description="Purchase every super guide from the shops.",
    trigger = prev(SuperGuide()) == 39 && measured(SuperGuide() == 40, State >= AdventureOverworld && (Mode == Adventure || Mode == Slippery)) 
)
achievement(
    title="Limited Connectivity",points=5,
    description="Purchase the Spin Advance GBA link from the shop.",
    trigger = prev(SpinAdvance) == 0 && SpinAdvance == 1 && State >= AdventureOverworld && __ornext(Mode == Adventure || Mode == Slippery)
)
// $1A05A8: [8-bit] Challenge - Classic 1 status [Save 1]
//          0x00 - Not finished | 0x02 - Finished over target time | 0x03 - Finished under target time
function ChallengeBeat(ID,target) =>
    tally_of(range(0x1A05A8 + (ID-40),0x1A05AF + (ID-40),step=1),target, addr => once(byte(addr + CurrentSave) >= 2))
function PrevChallengeBeat(ID,target) =>
    tally_of(range(0x1A05A8 + (ID-40),0x1A05AF + (ID-40),step=1),target, addr => once(prev(byte(addr + CurrentSave) >= 2)))   
function ChallengeBeatAchievement(ID) {
    achievement(
        title=AchievementData[ID]["beatT"],points=AchievementData[ID]["beatP"],
        description="Complete every stage in " + AchievementData[ID]["World"] + " on Challenge mode.",
        trigger=PrevChallengeBeat(ID,7) && 
                measured(ChallengeBeat(ID,8), State >= ChallengeSelect && Mode == Challenge) &&
                never(PrevChallengeBeat(ID,8)) && never(State < ChallengeSelect)
    )
}
for i in ChallengeArray
    ChallengeBeatAchievement(i)
    
function ChallengePar(ID,target) =>
    tally_of(range(0x1A05A8 + (ID-40),0x1A05AF + (ID-40),step=1),target, addr => once(byte(addr + CurrentSave) >= 3))
function PrevChallengePar(ID,target) =>
    tally_of(range(0x1A05A8 + (ID-40),0x1A05AF + (ID-40),step=1),target, addr => once(prev(byte(addr + CurrentSave) >= 3)))   
function ChallengeParAchievement(ID) {
    achievement(
        title=AchievementData[ID]["parT"],points=AchievementData[ID]["parP"],
        description="Complete every stage of " + AchievementData[ID]["World"]+" in under the target time on Challenge mode.",
        trigger=PrevChallengePar(ID,7) && 
                measured(ChallengePar(ID,8), State >= ChallengeSelect && Mode == Challenge && StandardHelirin) &&
                never(PrevChallengePar(ID,8)) && never(State < ChallengeSelect)
    )
}
for i in ChallengeArray
    ChallengeParAchievement(i)
// $1A0440: [32-bit BE] Challenge - Classic 1 best time; frames [Save 1]
function ChallengeTimeCheck(ID) =>
    dword_be(0x1A0440 + ((ID-40)*4) + CurrentSave)

function ChallengeSpeed(ID) {
        achievement(
            title=AchievementData[ID]["speedT"],points = AchievementData[ID]["speedP"],
            description="Beat the following " + AchievementData[ID]["World"] +" times on Challenge mode: [1]"+StageData[ID]["ChallengeTime"]+" • [2]"+StageData[ID+1]["ChallengeTime"]+" • [3]"+StageData[ID+2]["ChallengeTime"]+" • [4]"+StageData[ID+3]["ChallengeTime"]+" • [5]"+StageData[ID+4]["ChallengeTime"]+" • [6]"+StageData[ID+5]["ChallengeTime"]+" • [7]"+StageData[ID+6]["ChallengeTime"]+" • [8]"+StageData[ID+7]["ChallengeTime"],
                    trigger= tally(7,
                        once(prev(ChallengeTimeCheck(ID)) < StageData[ID]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+1)) < StageData[ID+1]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+2)) < StageData[ID+2]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+3)) < StageData[ID+3]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+4)) < StageData[ID+4]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+5)) < StageData[ID+5]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+6)) < StageData[ID+6]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+7)) < StageData[ID+7]["ChallengeTarget"])) &&
                    measured(tally(8,
                        once(ChallengeTimeCheck(ID) < StageData[ID]["ChallengeTarget"]),
                        once(ChallengeTimeCheck(ID+1) < StageData[ID+1]["ChallengeTarget"]),
                        once(ChallengeTimeCheck(ID+2) < StageData[ID+2]["ChallengeTarget"]),
                        once(ChallengeTimeCheck(ID+3) < StageData[ID+3]["ChallengeTarget"]),
                        once(ChallengeTimeCheck(ID+4) < StageData[ID+4]["ChallengeTarget"]),
                        once(ChallengeTimeCheck(ID+5) < StageData[ID+5]["ChallengeTarget"]),
                        once(ChallengeTimeCheck(ID+6) < StageData[ID+6]["ChallengeTarget"]),
                        once(ChallengeTimeCheck(ID+7) < StageData[ID+7]["ChallengeTarget"])), Mode == Challenge && StandardHelirin) &&
                    never(tally(8,
                        once(prev(ChallengeTimeCheck(ID)) < StageData[ID]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+1)) < StageData[ID+1]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+2)) < StageData[ID+2]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+3)) < StageData[ID+3]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+4)) < StageData[ID+4]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+5)) < StageData[ID+5]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+6)) < StageData[ID+6]["ChallengeTarget"]),
                        once(prev(ChallengeTimeCheck(ID+7)) < StageData[ID+7]["ChallengeTarget"]))) &&
                        never(State < ChallengeSelect)
    )
}

for i in ChallengeArray
    ChallengeSpeed(i)
    
//Leaderboards
function AdventureTimeLeaderboard(ID) {
        leaderboard(
            title=StageData[ID]["Stage"],
            description="Complete " + StageData[ID]["Stage"] + " on Adventure mode as fast as you can using the full-sized Helirin.",
            start=StandardHelirin && Mode == Adventure && LevelID == ID && State == AdventurePlaying && PointerProtection && LevelComplete,
            cancel=always_false(),
            submit=always_true(),
            value=StageTimer,
            format="FRAMES",
            lower_is_better=true
        )
}
for i in AdventureArrayNoBoss
    AdventureTimeLeaderboard(i)
function AdventureBossTimeLeaderboard(ID) {
        leaderboard(
            title=StageData[ID]["Stage"],
            description="Complete " + StageData[ID]["Stage"] + " on Adventure mode as fast as you can using the full-sized Helirin.",
            start=StandardHelirin && Mode == Adventure && LevelID == ID && BossComplete && State == AdventurePlaying,
            cancel=always_false(),
            submit=always_true(),
            value=StageTimer,
            format="FRAMES",
            lower_is_better=true
        )
}
for i in BossArray
    AdventureBossTimeLeaderboard(i)

function AdventureCoinLeaderboard(ID) {
        leaderboard(
            title=StageData[ID]["Stage"]+" - Coins",
            description="Complete " + StageData[ID]["Stage"] + " on Adventure mode with every coin as fast as you can using the full-sized Helirin.",
            start=StandardHelirin && Mode == Adventure && LevelID == ID && State == AdventurePlaying && PointerProtection && LevelComplete && 
                  StageScore == StageData[ID]["Coins"],
            cancel=always_false(),
            submit=always_true(),
            value=StageTimer,
            format="FRAMES",
            lower_is_better=true
        )
}
for i in AdventureArrayNoBoss
    AdventureCoinLeaderboard(i)
function AdventureCoinLeaderboardTest(ID) {
        leaderboard(
            title=StageData[ID]["Stage"]+" - Coins Test",
            description="Complete " + StageData[ID]["Stage"] + " on Adventure mode with every coin as fast as you can using the full-sized Helirin.",
            start=StandardHelirin && Mode == Adventure && LevelID == ID && prev(State) == AdventurePlaying && State == AdventureComplete && PointerProtection && 
                  prev(StageScore) == StageData[ID]["Coins"],
            cancel=always_false(),
            submit=always_true(),
            value=StageTimer,
            format="FRAMES",
            lower_is_better=true
        )
}
for i in AdventureArrayNoBoss
    AdventureCoinLeaderboardTest(i)
function SlipperyTimeLeaderboard(ID) {
        leaderboard(
            title=StageData[ID]["Stage"]+" - Slippery",
            description="Complete " + StageData[ID]["Stage"] + " on Slippery mode as fast as you can.",
            start=Mode == Slippery && LevelID == ID && State == AdventurePlaying && PointerProtection && LevelComplete,
            cancel=always_false(),
            submit=always_true(),
            value=StageTimer,
            format="FRAMES",
            lower_is_better=true
        )
}
for i in AdventureArrayNoBoss
    SlipperyTimeLeaderboard(i)
    
function ChallengeLeaderboard(ID) {
        leaderboard(
            title=StageData[ID]["Stage"],
            description="Complete " + StageData[ID]["Stage"] + " on Challenge mode as fast as you can using the full-sized Helirin.",
            start=StandardHelirin && Mode == Challenge && LevelID == ID && State == ChallengePlaying && PointerProtection && LevelComplete,
            cancel=always_false(),
            submit=always_true(),
            value=StageTimer,
            format="FRAMES",
            lower_is_better=true
        )
}
for i in range(40,79)
    ChallengeLeaderboard(i)
    
//RTA Leaderboards
leaderboard(
    title="Adventure Any% (RTA) - Standard",
    description="[Files 2~4] From a fresh file, complete Adventure mode using the full-sized Helirin as fast as you can in a single session.",
    start=StandardHelirin && Mode == Adventure && SaveSlot >= 1 && prev(State) == FileSelect && State == AdventureOverworld &&
          FreshAdventureFile,
    cancel= __ornext(prev(SaveSlot) != SaveSlot || State == MainMenu),
    submit= StandardHelirin && Mode == Adventure && never(State < AdventureOverworld) && PrevAdventureBeatFull(39) && AdventureBeatFull(40) && never(PrevAdventureBeatFull(40)),
    value=always_true(),
    format="FRAMES",
    lower_is_better=true
)    
leaderboard(
    title="Adventure All Coins (RTA) - Standard",
    description="[Files 2~4] From a fresh file, collect every coin and complete Adventure mode using the full-sized Helirin as fast as you can in a single session.",
    start=StandardHelirin && Mode == Adventure && SaveSlot >= 1 && prev(State) == FileSelect && State == AdventureOverworld &&
          FreshAdventureFile,
    cancel= __ornext(prev(SaveSlot) != SaveSlot || State == MainMenu),
    submit= StandardHelirin && Mode == Adventure && never(State < AdventureOverworld) && PrevAdventureCoinFull(39) && AdventureCoinFull(40) && never(PrevAdventureCoinFull(40)),
    value=always_true(),
    format="FRAMES",
    lower_is_better=true
)
leaderboard(
    title="Challenge Any% (RTA) - Standard",
    description="[Files 2~4] From a fresh file, complete every stage on Challenge mode using the full-sized Helirin as fast as you can in a single session.",
    start=StandardHelirin && Mode == Challenge && SaveSlot >= 1 && prev(State) == FileSelect && State == ChallengeSelect &&
          FreshChallengeFile() == 0,
    cancel= __ornext(prev(SaveSlot) != SaveSlot || State == MainMenu),
    submit= StandardHelirin && Mode == Challenge && never(State < ChallengeSelect) && PrevChallengeBeatFull(39) && ChallengeBeatFull(40) && never(PrevChallengeBeatFull(40)),
    value=always_true(),
    format="FRAMES",
    lower_is_better=true
)
leaderboard(
    title="Adventure Any% (RTA) - Compact",
    description="[Files 2~4] From a fresh file, complete Adventure mode using the compact Helirin as fast as you can in a single session.",
    start=CompactHelirin && Mode == Adventure && SaveSlot >= 1 && prev(State) == FileSelect && State == AdventureOverworld &&
          FreshAdventureFile,
    cancel= __ornext(prev(SaveSlot) != SaveSlot || State == MainMenu),
    submit= CompactHelirin && Mode == Adventure && never(State < AdventureOverworld) && PrevAdventureBeatFull(39) && AdventureBeatFull(40) && never(PrevAdventureBeatFull(40)),
    value=always_true(),
    format="FRAMES",
    lower_is_better=true
)
leaderboard(
    title="Adventure All Coins (RTA) - Compact",
    description="[Files 2~4] From a fresh file, collect every coin and complete Adventure mode using the compact Helirin as fast as you can in a single session.",
    start=CompactHelirin && Mode == Adventure && SaveSlot >= 1 && prev(State) == FileSelect && State == AdventureOverworld &&
          FreshAdventureFile,
    cancel= __ornext(prev(SaveSlot) != SaveSlot || State == MainMenu),
    submit= CompactHelirin && Mode == Adventure && never(State < AdventureOverworld) && PrevAdventureCoinFull(39) && AdventureCoinFull(40) && never(PrevAdventureCoinFull(40)),
    value=always_true(),
    format="FRAMES",
    lower_is_better=true
)
leaderboard(
    title="Challenge Any% (RTA) - Compact",
    description="[Files 2~4] From a fresh file, complete every stage on Challenge mode using the compact Helirin as fast as you can in a single session.",
    start=CompactHelirin && Mode == Challenge && SaveSlot >= 1 && prev(State) == FileSelect && State == ChallengeSelect &&
          FreshChallengeFile() == 0,
    cancel= __ornext(prev(SaveSlot) != SaveSlot || State == MainMenu),
    submit= CompactHelirin && Mode == Challenge && never(State < ChallengeSelect) && PrevChallengeBeatFull(39) && ChallengeBeatFull(40) && never(PrevChallengeBeatFull(40)),
    value=always_true(),
    format="FRAMES",
    lower_is_better=true
)  
//Rich Presence
rich_presence_conditional_display(State >= AdventureOverworld && State <=Cutscene && Mode == Adventure, 
        "Kururin is in {0} on Adventure mode • Complete: {1}/40 • All Coins: {2}/40 • Perfect: {3}/40 • {4}",
                rich_presence_lookup("Level",LevelID,LevelLookup),
                rich_presence_value("Digit",AdventureBeatFull(40)&&never(State < AdventureOverworld),format="VALUE"),
                rich_presence_value("Digit",AdventureCoinFull(40)&&never(State < AdventureOverworld),format="VALUE"),
                rich_presence_value("Digit",AdventurePerfectFull(40)&&never(State < AdventureOverworld),format="VALUE"),
                rich_presence_lookup("Helirin",bit1(0x1a039b + CurrentSave),HelirinRP)
)
rich_presence_conditional_display(State >= AdventureOverworld && State <=Cutscene && Mode == Slippery, 
        "Kururin is in {0} on Slippery mode • Complete: {1}/35",
                rich_presence_lookup("Level",LevelID,LevelLookup),
                rich_presence_value("Digit",SlipperyBeat(35)&&never(State < AdventureOverworld),format="VALUE")
)
rich_presence_conditional_display(State >= ChallengeSelect && State <= ChallengeComplete && Mode == Challenge,
        "Kururin is being challenged in {0} • Complete: {1}/40 • Target: {2}/40 • {3}",
                rich_presence_lookup("Level",LevelID,LevelLookup),
                rich_presence_value("Digit",ChallengeBeatFull(40)&&never(State < ChallengeSelect),format="VALUE"),
                rich_presence_value("Digit",ChallengeParFull(40)&&never(State < ChallengeSelect),format="VALUE"),
                rich_presence_lookup("Helirin",bit1(0x1a039b + CurrentSave),HelirinRP)
)               
rich_presence_conditional_display(State == VideoGuide, "Kururin is taking notes and watching a video guide")
rich_presence_conditional_display(State == MultiSelect || State == MultiPlaying && Mode >= 3,"Kururin is playing multiplayer with their friends and/or family")
rich_presence_conditional_display(State >= GBA, "Kururin is playing Spin Advance for some reason")
rich_presence_display("Kururin is on the menus")

