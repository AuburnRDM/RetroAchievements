// Kururin Squash! [Subset - Super Player]
// #ID = 30167

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
    SpinAdvance = 0x13
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
// $19EAE0: [32-bit BE] Current level in the story mode; continues to count up through the worlds
//          0xffffffff - Shop / Random selected (in challenge mode); changes after stage initiated
//          0x00 - Sweet Shores 1
//          0x01 - Sweet Shores 2
//          ~
//          0x07 - Sweet Shores 8 (Boss)
//          0x08 - Coastal Canopy 1
//          ~
//          0x27 - WonderVerse 8
//          0x28 - Challenge 1
//          ~
//          0x4f - Sword challenge 8
LevelID = dword_be(0x19EAE0)
// $19EAE9: [8-bit] Current save file; starts from 0x00
//          -- Offset for each safe file block is 0x300 (768 decimal)
// $19eaf7: [8-bit] Various game status
//          Bit3 - Post-boss state
//          Bit4 - Boss timer stopped (after win) and coin phase starts; use for level timing
BossComplete = prev(bit4(0x19eaf7)) == 0 && bit4(0x19eaf7) == 1
CurrentSave = byte(0x19EAE9) * 0x300
// $19EBE0: [32-bit BE] Pointer; briefly flips to 0x00 when starting a new stage
PointerProtection = dword_be(0x19EBE0) != 0
//          +0x800002f4 | [8-bit] Helirin rotation direction
//          Bit7 on = clockwise
//          Bit7 off = counter-clockwise
//          +0x800002fc | [8-bit] Powerups
//          Bit0 - Laser gun activated
//          Bit1 - Flamethrower/Propeller activated
//          Bit2 - Punch activated
//          +0x800002ff | [8-bit] Level status
//          Bit1 - Level started; timer engaged
//          Bit3 - Level finished
LevelComplete = prev(bit3(dword_be(0x19EBE0) + 0x800002ff)) == 0 && bit3(dword_be(0x19EBE0) + 0x800002ff) == 1
//          Bit7 - Starting area; timer not engaged
//          +0x8000030b | [8-bit] Current HP
//          +0x8000030f | [8-bit] Max HP
//          +0x80000320 | [32-bit BE] Active timer in level
StageTimer = dword_be(dword_be(0x19EBE0) + 0x80000320)
//          +0x80000324 | [32-bit BE] Score in current level
//          +0x80000328 | [16-bit BE] Number of times damaged in current level
//          +0x8000033f | [8-bit] Powerup status
//          0x2d - Shortest dive
//          0x56 - Max fan
// $1A039B: [8-bit] Various event flags and helirin type [Save 1]; block Bit0
//          Bit0 - Compact helirin
//          Bit1 - Standard helirin
StandardHelirin = bit0(0x1a039b + CurrentSave) == 0 && bit1(0x1a039b + CurrentSave) == 1

//SUBSET - break off later
//Data
DevData = {
    0:{"Stage":"Sweet Shores 1","Dev":0x26E,"Title":"Wall Hugger","Points":5,"Time":"0'10''36","Extra":"under "},
    1:{"Stage":"Sweet Shores 2","Dev":0x340,"Title":"Springs Optional","Points":5,"Time":"0'13''86","Extra":"under "},
    2:{"Stage":"Sweet Shores 3","Dev":0x3DB,"Title":"Bouncing Back","Points":10,"Time":"0'16''45","Extra":"under "},
    3:{"Stage":"Sweet Shores 4","Dev":0x46F,"Title":"Speed Boxing","Points":10,"Time":"0'18''91","Extra":"under "},
    4:{"Stage":"Sweet Shores 5","Dev":0x336,"Title":"Short and Sweet","Points":10,"Time":"0'13''70","Extra":"under "},
    5:{"Stage":"Sweet Shores 6","Dev":0x48B,"Title":"Self Defense","Points":10,"Time":"0'19''38","Extra":"under "},
    6:{"Stage":"Sweet Shores 7","Dev":0x51F,"Title":"Punched into Next Week","Points":10,"Time":"0'21''85","Extra":"under "},
    7:{"Stage":"Sweet Shores 8","Dev":0x403,"Title":"Sweet Treat","Points":10,"Time":"0'17''11","Extra":"under "},
    8:{"Stage":"Coastal Canopy 1","Dev":0x329,"Title":"Reef Racer","Points":5,"Time":"0'13''48","Extra":"under "},
    9:{"Stage":"Coastal Canopy 2","Dev":0x298,"Title":"Coral Cruise","Points":10,"Time":"0'11''05","Extra":"under "},
    10:{"Stage":"Coastal Canopy 3","Dev":0x65a,"Title":"Olympic Swimmer","Points":25,"Time":"0'27''10","Extra":"under "},
    11:{"Stage":"Coastal Canopy 4","Dev":0x50B,"Title":"Living Legend","Points":10,"Time":"0'21''51","Extra":"under "},
    12:{"Stage":"Coastal Canopy 5","Dev":0x773,"Title":"Current Affairs","Points":10,"Time":"0'31''78","Extra":"under "},
    13:{"Stage":"Coastal Canopy 6","Dev":0x5D7,"Title":"Outer Shell","Points":10,"Time":"0'24''91","Extra":"under "},
    14:{"Stage":"Coastal Canopy 7","Dev":0x634,"Title":"Up the Creek","Points":25,"Time":"0'26''46","Extra":"under "},
    15:{"Stage":"Coastal Canopy 8","Dev":0x1024,"Title":"El Matador","Points":5,"Time":"1'08''86","Extra":"under "},
    16:{"Stage":"Snowscape 1","Dev":0x44d,"Title":"Slippery Slope","Points":10,"Time":"0'18''35","Extra":"under "},
    17:{"Stage":"Snowscape 2","Dev":0x5d6,"Title":"Ice Cavern","Points":10,"Time":"0'24''90","Extra":"under "},
    18:{"Stage":"Snowscape 3","Dev":0xd45,"Title":"Right on Track","Points":2,"Time":"0'56''60","Extra":""},
    19:{"Stage":"Snowscape 4","Dev":0x810,"Title":"Calculated Expedition","Points":10,"Time":"0'34''40","Extra":"under "},
    20:{"Stage":"Snowscape 5","Dev":0xf4e,"Title":"Triple Axel","Points":2,"Time":"1'05''28","Extra":""},
    21:{"Stage":"Snowscape 6","Dev":0x1A0,"Title":"Squeezing Through","Points":5,"Time":"0'6''93","Extra":"under "},
    22:{"Stage":"Snowscape 7","Dev":0x10b1,"Title":"Don't Look Back","Points":2,"Time":"1'11''20","Extra":""},
    23:{"Stage":"Snowscape 8","Dev":0xE96,"Title":"Frosty Nightmare","Points":25,"Time":"1'02''23","Extra":"under "},
    24:{"Stage":"CyberCity 1","Dev":0x4FD,"Title":"Crossing the Street","Points":10,"Time":"0'21''28","Extra":"under "},
    25:{"Stage":"CyberCity 2","Dev":0x85e,"Title":"Precise Pacifist","Points":25,"Time":"0'35''70","Extra":"under "},
    26:{"Stage":"CyberCity 3","Dev":0x6D7,"Title":"Oncoming Traffic","Points":10,"Time":"0'29''18","Extra":"under "},
    27:{"Stage":"CyberCity 4","Dev":0xC86,"Title":"Like the Wind","Points":25,"Time":"0'53''43","Extra":"under "},
    28:{"Stage":"CyberCity 5","Dev":0x49D,"Title":"Metropolitan Maze","Points":10,"Time":"0'19''68","Extra":"under "},
    29:{"Stage":"CyberCity 6","Dev":0xDF6,"Title":"Tornado Warning","Points":25,"Time":"0'59''56","Extra":"under "},
    30:{"Stage":"CyberCity 7","Dev":0x706,"Title":"Traffic Jam","Points":10,"Time":"0'29''97","Extra":"under "},
    31:{"Stage":"CyberCity 8","Dev":0x751,"Title":"Category Five","Points":10,"Time":"0'31''21","Extra":"under "},
    32:{"Stage":"WonderVerse 1","Dev":0x80F,"Title":"Space Sprint","Points":10,"Time":"0'34''38","Extra":"under "},
    33:{"Stage":"WonderVerse 2","Dev":0x8AE,"Title":"Blast Zone","Points":25,"Time":"0'37''03","Extra":"under "},
    34:{"Stage":"WonderVerse 3","Dev":0x6ab,"Title":"Close Shave","Points":10,"Time":"0'28''45","Extra":"under "},
    35:{"Stage":"WonderVerse 4","Dev":0xC11,"Title":"Orbital Rampage","Points":25,"Time":"0'51''48","Extra":"under "},
    36:{"Stage":"WonderVerse 5","Dev":0x7DC,"Title":"Crystalline Crawl","Points":10,"Time":"0'33''53","Extra":"under "},
    37:{"Stage":"WonderVerse 6","Dev":0x14b5,"Title":"The Very Hungry Caterpillars","Points":25,"Time":"1'28''35","Extra":"under "},
    38:{"Stage":"WonderVerse 7","Dev":0x1485,"Title":"Razor's Edge","Points":25,"Time":"1'27''55","Extra":"under "},
    39:{"Stage":"WonderVerse 8","Dev":0xb88,"Title":"In Your Face","Points":25,"Time":"0'49''20","Extra":"under "},
}

AdventureArrayNoBoss =[0,1,2,3,4,5,6,8,9,10,11,12,13,14,16,17,18,19,20,21,22,24,25,26,27,28,29,30,32,33,34,35,36,37,38]
BossArray = [7,15,23,31,39]

//ACHIEVEMENTS
function DevAchievements(ID) {
    achievement(
        title=DevData[ID]["Title"],points=DevData[ID]["Points"],
        description="Complete "+ DevData[ID]["Stage"] + " in " + DevData[ID]["Extra"] + DevData[ID]["Time"] + " on Adventure mode using the full-sized Helirin.",
        trigger= StandardHelirin && Mode == Adventure && LevelID == ID && State == AdventurePlaying && StageTimer < DevData[ID]["Dev"] &&
                 PointerProtection && trigger_when(LevelComplete)
    )
}
for i in AdventureArrayNoBoss
    DevAchievements(i)

function BossDevAchievements(ID) {
    achievement(
        title=DevData[ID]["Title"],points=DevData[ID]["Points"],
        description="Complete "+ DevData[ID]["Stage"] + " in " + DevData[ID]["Extra"] + DevData[ID]["Time"] + " on Adventure mode using the full-sized Helirin.",
        trigger= StandardHelirin && Mode == Adventure && LevelID == ID && State == AdventurePlaying && StageTimer < DevData[ID]["Dev"] &&
                 PointerProtection && trigger_when(BossComplete)
    )
}
for i in BossArray
    BossDevAchievements(i)