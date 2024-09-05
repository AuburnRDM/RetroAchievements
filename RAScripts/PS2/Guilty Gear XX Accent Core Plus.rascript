// Guilty Gear XX Accent Core Plus
// #ID = 20979

// $302B34: [32-bit] Survival - Wins
// $302B7C: [32-bit] Survival - Time played this attempted (Frames)
// $302B88: [16-bit] Survival - Current level

SurvivalLevel = word(0x302B88)

// $302B8C: [8-bit] "Here Comes Daredevil" Popup
//          b0 - Activated
// $302B8E: [8-bit] Survival Daredevil reached?
//          0x32 - Gold Order Sol
// $302B90: [8-bit] Survival Daredevil defeated?
//          0x32 - Gold Order Sol
// $302BA0: [8-bit] Type of survival mode
//          0x00 - Classic; no upgrades
//          0x01 - Modern; upgrades after daredevil'

SurvivalType = byte(0x302BA0)
  ClassicSurvival = 0
  ModernSurvival = 1

// $302BA4: [32-bit] Survival - Attack Level
//          0x00 - Lv. 1 | 0x01 - Lv. 2 | 0x02 - Lv. 3 | ... | 0x0e - MAX (Lv. 15)
// $302BA8: [32-bit] Survival - Defense Level
//          0x00 - Lv. 1 | 0x01 - Lv. 2 | 0x02 - Lv. 3 | ... | 0x0e - MAX (Lv. 15)
// $302BAC: [32-bit] Survival - Speed Level
//          0x00 - Lv. 1 | 0x01 - Lv. 2 | 0x02 - Lv. 3 | ... | 0x0e - MAX (Lv. 15)
// $302BB0: [32-bit] Survival - Tension Rate Level
//          0x00 - Lv. 1 | 0x01 - Lv. 2 | 0x02 - Lv. 3 | ... | 0x0e - MAX (Lv. 15)
// $302BB4: [32-bit] Survival - Tension Start Level
//          0x00 - Lv. 1 | 0x01 - Lv. 2 | 0x02 - Lv. 3 | ... | 0x08 - MAX (Lv. 9)
// $302BB8: [32-bit] Survival - Burst Rate Level
//          0x00 - Lv. 1 | 0x01 - Lv. 2 | 0x02 - Lv. 3 | ... | 0x04 - MAX (Lv. 4)
// $302BBC: [32-bit] Survival - Air Dash Level
//          0x00 - Lv. 1 | 0x01 - Lv. 2 | 0x02 - MAX (Lv. 3)
// $302BC0: [32-bit] Survival - Air Jump Level
//          0x00 - Lv. 1 | 0x01 - Lv. 2 | 0x02 - MAX (Lv. 3)
// $302BC4: [32-bit] Survival - Ability 1
//          0x00 - None
//          0x0a - Life Recovery
//          0x0b - Tension Increase
//          0x0c - Easy FRC
//          0x0d - Bonus Up
//          0x0e - Experience Up
//          0x0f - Thunder Attack
//          0x10 - Flame Attack
//          0x11 - Guard Thunder
//          0x12 - Guard Flame
//          0x13 - Guard Beat
//          0x14 - Limit Break
//          0x15 - Chaos Roman Cancel
//          0x16 - Yellow Roman Cancel
//          0x17 - Hunter Saving
//          0x18 - Berserk Mode
//          0x19 - Soul of Zepp
//          0x1a - Guard Mist Finer
//          0x1b - Time Traveling
//          0x1c - Mays Fist
//          0x1d - Vampire Form
//          0x1e - Sheer Heart Attack
// $302BC8: [32-bit] Survival - Ability 2
//          0x00 - None
//          0x0a - Life Recovery
//          0x0b - Tension Increase
//          0x0c - Easy FRC
//          0x0d - Bonus Up
//          0x0e - Experience Up
//          0x0f - Thunder Attack
//          0x10 - Flame Attack
//          0x11 - Guard Thunder
//          0x12 - Guard Flame
//          0x13 - Guard Beat
//          0x14 - Limit Break
//          0x15 - Chaos Roman Cancel
//          0x16 - Yellow Roman Cancel
//          0x17 - Hunter Saving
//          0x18 - Berserk Mode
//          0x19 - Soul of Zepp
//          0x1a - Guard Mist Finer
//          0x1b - Time Traveling
//          0x1c - Mays Fist
//          0x1d - Vampire Form
//          0x1e - Sheer Heart Attack
// $302BCC: [32-bit] Survival - Ability 3
//          0x00 - None
//          0x0a - Life Recovery
//          0x0b - Tension Increase
//          0x0c - Easy FRC
//          0x0d - Bonus Up
//          0x0e - Experience Up
//          0x0f - Thunder Attack
//          0x10 - Flame Attack
//          0x11 - Guard Thunder
//          0x12 - Guard Flame
//          0x13 - Guard Beat
//          0x14 - Limit Break
//          0x15 - Chaos Roman Cancel
//          0x16 - Yellow Roman Cancel
//          0x17 - Hunter Saving
//          0x18 - Berserk Mode
//          0x19 - Soul of Zepp
//          0x1a - Guard Mist Finer
//          0x1b - Time Traveling
//          0x1c - Mays Fist
//          0x1d - Vampire Form
//          0x1e - Sheer Heart Attack
// $31583D: current stage?
// $34E8B0: [32-bit] Display settings - Position H;
// $34E8B4: [32-bit] Display settings - Position V;
// $34E8BC: [8-bit] Game options - Shortcut option; turning this on will present the main menu as a list instead of a scrolling menu
//          0x00 - Off
//          0x01 - On
// $34E8C0: [8-bit] Game options - Round time limit
//          0x00 - 30 seconds
//          0x01 - 60 seconds
//          0x02 - 99 seconds (Default)
//          0x03 - Infinite

RoundTimer = byte(0x34E8C0)
  Sec30 = 0
  Sec60 = 1
  Sec99 = 2
  SecInfinite = 3

// $34E8C1: [8-bit] Game options - Rounds in a match (best of)
//          0x00 - 1
//          0x01 - 3 (Defaults)
//          0x02 - 5
//          0x03 - 7
//          0x04 - 9

MatchRound = byte(0x34E8C1)
  BestOf1 = 0
  BestOf3 = 1
  BestOf5 = 2
  BestOf7 = 3
  BestOf9 = 4

// $34E8C2: [8-bit] Game options - Current difficulty
//          0x00 - Beginner
//          0x01 - Easy
//          0x02 - Normal (Default)
//          0x03 - Hard
//          0x04 - Very Hard
//          0x05 - Maniac

Difficulty = byte (0x34E8C2)
  Beginner = 0
  Easy = 1
  Normal = 2
  Hard = 3
  VeryHard = 4
  Maniac = 5

// $34E8C7: [8-bit] Display settings - Cockpit font
//          0x00 - Normal
//          0x01 - Original
// $34E8D8: [8-bit] Gold/Darkside unlocked - Sol
//          Bit0 - Unlocked
// $34E8DA: [8-bit] Gold/Darkside unlocked - Ky
//          Bit0 - Unlocked
// $34E8DC: [8-bit] Gold/Darkside unlocked - May
//          Bit0 - Unlocked
// $34E8DE: [8-bit] Gold/Darkside unlocked - Millia
//          Bit0 - Unlocked
// $34E8E0: [8-bit] Gold/Darkside unlocked - Axl
//          Bit0 - Unlocked
// $34E8E2: [8-bit] Gold/Darkside unlocked - Potemkin
//          Bit0 - Unlocked
// $34E8E4: [8-bit] Gold/Darkside unlocked - Chipp
//          Bit0 - Unlocked
// $34E8E6: [8-bit] Gold/Darkside unlocked - Eddie
//          Bit0 - Unlocked
// $34E8E8: [8-bit] Gold/Darkside unlocked - Baiken
//          Bit0 - Unlocked
// $34E8EA: [8-bit] Gold/Darkside unlocked - Faust
//          Bit0 - Unlocked
// $34E8EC: [8-bit] Gold/Darkside unlocked - Testament
//          Bit0 - Unlocked
// $34E8EE: [8-bit] Gold/Darkside unlocked - Jam
//          Bit0 - Unlocked
// $34E8F0: [8-bit] Gold/Darkside unlocked - Anji
//          Bit0 - Unlocked
// $34E8F2: [8-bit] Gold/Darkside unlocked - Johnny
//          Bit0 - Unlocked
// $34E8F4: [8-bit] Gold/Darkside unlocked - Venom
//          Bit0 - Unlocked
// $34E8F6: [8-bit] Gold/Darkside unlocked - Dizzy
//          Bit0 - Unlocked
// $34E8F8: [8-bit] Gold/Darkside unlocked - Slayer
//          Bit0 - Unlocked
// $34E8FA: [8-bit] Gold/Darkside unlocked - I-No
//          Bit0 - Unlocked
// $34E8FC: [8-bit] Gold/Darkside unlocked - Zappa
//          Bit0 - Unlocked
// $34E8FE: [8-bit] Gold/Darkside unlocked - Bridget
//          Bit0 - Unlocked
// $34E900: [8-bit] Gold/Darkside unlocked - Robo-Ky
//          Bit0 - Unlocked
// $34E902: [8-bit] Gold/Darkside unlocked - A.B.A.
//          Bit0 - Unlocked
// $34E904: [8-bit] Gold/Darkside unlocked - Order Sol
//          Bit0 - Unlocked
// $34E906: [8-bit] Gold/Darkside unlocked - Kliff
//          Bit0 - Unlocked
// $34E908: [8-bit] Gold/Darkside unlocked - Justice
//          Bit0 - Unlocked

function TotalDarksideGold() => 
    sum_of(range(0x34E8D8,34E908,step=2), addr => byte(addr) //might need to divide by address

// $34E90B: [8-bit] Kliff Undersn unlock status
//          Bit0 - Character unlocked

KliffUnlocked = prev(byte(0x34E90B)) == 0 && byte(0x34E90B) == 1

// $34E90C: [8-bit] Justice unlock status
//          Bit0 - Character unlocked

JusticeUnlocked = prev(byte(0x34E90C)) == 00 & byte(0x34E90B) == 1

// $34E90E: [8-bit] GG Generation Modes unlocks; different playstyles based on older games
//          Bit0 - GGX Mode unlocked
//          Bit1 - GG Mode unlocked

GGXModeUnlocked = prev(bit0(0x34E90E)) == 0 && bit0(0x34E90E) == 1
GGModeUnlocked = prev(bit1(0x34E90E)) == 0 && bit1(0x34E90E) == 1

// $34E90F: [8-bit] EX Mode unlocked - Sol
//          Bit0 - Unlocked
// $34E910: [8-bit] EX Mode unlocked - Ky
//          Bit0 - Unlocked
// $34E911: [8-bit] EX Mode unlocked - May
//          Bit0 - Unlocked
// $34E912: [8-bit] EX Mode unlocked - Millia
//          Bit0 - Unlocked
// $34E913: [8-bit] EX Mode unlocked - Axl
//          Bit0 - Unlocked
// $34E914: [8-bit] EX Mode unlocked - Potemkin
//          Bit0 - Unlocked
// $34E915: [8-bit] EX Mode unlocked - Chipp
//          Bit0 - Unlocked
// $34E916: [8-bit] EX Mode unlocked - Eddie
//          Bit0 - Unlocked
// $34E917: [8-bit] EX Mode unlocked - Baiken
//          Bit0 - Unlocked
// $34E918: [8-bit] EX Mode unlocked - Faust
//          Bit0 - Unlocked
// $34E919: [8-bit] EX Mode unlocked - Testament
//          Bit0 - Unlocked
// $34E91A: [8-bit] EX Mode unlocked - Jam
//          Bit0 - Unlocked
// $34E91B: [8-bit] EX Mode unlocked - Anji
//          Bit0 - Unlocked
// $34E91C: [8-bit] EX Mode unlocked - Johnny
//          Bit0 - Unlocked
// $34E91D: [8-bit] EX Mode unlocked - Venom
//          Bit0 - Unlocked
// $34E91E: [8-bit] EX Mode unlocked - Dizzy
//          Bit0 - Unlocked
// $34E91F: [8-bit] EX Mode unlocked - Slayer
//          Bit0 - Unlocked
// $34E920: [8-bit] EX Mode unlocked - I-No
//          Bit0 - Unlocked
// $34E921: [8-bit] EX Mode unlocked - Zappa
//          Bit0 - Unlocked
// $34E922: [8-bit] EX Mode unlocked - Bridget
//          Bit0 - Unlocked
// $34E923: [8-bit] EX Mode unlocked - Robo-Ky
//          Bit0 - Unlocked
// $34E924: [8-bit] EX Mode unlocked - A.B.A.
//          Bit0 - Unlocked
// $34E925: [8-bit] EX Mode unlocked - Order Sol
//          Bit0 - Unlocked
// $34E926: [8-bit] EX Mode unlocked - Kliff
//          Bit0 - Unlocked
// $34E927: [8-bit] EX Mode unlocked - Justice
//          Bit0 - Unlocked

function TotalEXUnlock() => 
    sum_of(range(0x34E90F,34E927,step=1), addr => byte(addr) //might need to divide by address

// $34FD73: start of vs ranking data
// $34FFCA: end of vs ranking data
// $34FFCC: start of ranking data
// $350802: [8-bit] Mission 1 - Sol
//          b0 - Complete
// $350803: [8-bit] Mission 1 - Ky
//          b0 - Complete
// $350804: [8-bit] Mission 1 - May
//          b0 - Complete
// $350805: [8-bit] Mission 1 - Millia
//          b0 - Complete
// $350806: [8-bit] Mission 1 - Axl
//          b0 - Complete
// $350807: [8-bit] Mission 1 - Potemkin
//          b0 - Complete
// $350808: [8-bit] Mission 1 - Chipp
//          b0 - Complete
// $350809: [8-bit] Mission 1 - Eddie
//          b0 - Complete
// $35080A: [8-bit] Mission 1 - Baiken
//          b0 - Complete
// $35080B: [8-bit] Mission 1 - Faust
//          b0 - Complete
// $35080C: [8-bit] Mission 1 - Testament
//          b0 - Complete
// $35080D: [8-bit] Mission 1 - Jam
//          b0 - Complete
// $35080E: [8-bit] Mission 1 - Anji
//          b0 - Complete
// $35080F: [8-bit] Mission 1 - Johnny
//          b0 - Complete
// $350810: [8-bit] Mission 1 - Venom
//          b0 - Complete
// $350811: [8-bit] Mission 1 - Dizzy
//          b0 - Complete
// $350812: [8-bit] Mission 1 - Slayer
//          b0 - Complete
// $350813: [8-bit] Mission 1 - I-No
//          b0 - Complete
// $350814: [8-bit] Mission 1 - Zappa
//          b0 - Complete
// $350815: [8-bit] Mission 1 - Bridget
//          b0 - Complete
// $350816: [8-bit] Mission 1 - Robo-Ky
//          b0 - Complete
// $350817: [8-bit] Mission 1 - A.B.A
//          b0 - Complete
// $350818: [8-bit] Mission 1 - Order Sol
//          b0 - Complete
// $350819: [8-bit] Mission 1 - Kliff
//          b0 - Complete
// $35081A: [8-bit] Mission 1 - Justice
//          b0 - Complete
// $35081B: [8-bit] Mission 2 - Sol
//          b0 - Complete
// $35081C: [8-bit] Mission 2 - Ky
//          b0 - Complete
// $35081D: [8-bit] Mission 2 - May
//          b0 - Complete
// $35081E: [8-bit] Mission 2 - Millia
//          b0 - Complete
// $35081F: [8-bit] Mission 2 - Axl
//          b0 - Complete
// $350820: [8-bit] Mission 2 - Potemkin
//          b0 - Complete
// $350821: [8-bit] Mission 2 - Chipp
//          b0 - Complete
// $350822: [8-bit] Mission 2 - Eddie
//          b0 - Complete
// $350823: [8-bit] Mission 2 - Baiken
//          b0 - Complete
// $350824: [8-bit] Mission 2 - Faust
//          b0 - Complete
// $350825: [8-bit] Mission 2 - Testament
//          b0 - Complete
// $350826: [8-bit] Mission 2 - Jam
//          b0 - Complete
// $350827: [8-bit] Mission 2 - Anji
//          b0 - Complete
// $350828: [8-bit] Mission 2 - Johnny
//          b0 - Complete
// $350829: [8-bit] Mission 2 - Venom
//          b0 - Complete
// $35082A: [8-bit] Mission 2 - Dizzy
//          b0 - Complete
// $35082B: [8-bit] Mission 2 - Slayer
//          b0 - Complete
// $35082C: [8-bit] Mission 2 - I-No
//          b0 - Complete
// $35082D: [8-bit] Mission 2 - Zappa
//          b0 - Complete
// $35082E: [8-bit] Mission 2 - Bridget
//          b0 - Complete
// $35082F: [8-bit] Mission 2 - Robo-Ky
//          b0 - Complete
// $350830: [8-bit] Mission 2 - A.B.A
//          b0 - Complete
// $350831: [8-bit] Mission 2 - Order Sol
//          b0 - Complete
// $350832: [8-bit] Mission 2 - Kliff
//          b0 - Complete
// $350833: [8-bit] Mission 2 - Justice
//          b0 - Complete
// $350834: [8-bit] Mission 3 - Sol
//          b0 - Complete
// $350835: [8-bit] Mission 3 - Ky
//          b0 - Complete
// $350836: [8-bit] Mission 3 - May
//          b0 - Complete
// $350837: [8-bit] Mission 3 - Millia
//          b0 - Complete
// $350838: [8-bit] Mission 3 - Axl
//          b0 - Complete
// $350839: [8-bit] Mission 3 - Potemkin
//          b0 - Complete
// $35083A: [8-bit] Mission 3 - Chipp
//          b0 - Complete
// $35083B: [8-bit] Mission 3 - Eddie
//          b0 - Complete
// $35083C: [8-bit] Mission 3 - Baiken
//          b0 - Complete
// $35083D: [8-bit] Mission 3 - Faust
//          b0 - Complete
// $35083E: [8-bit] Mission 3 - Testament
//          b0 - Complete
// $35083F: [8-bit] Mission 3 - Jam
//          b0 - Complete
// $350840: [8-bit] Mission 3 - Anji
//          b0 - Complete
// $350841: [8-bit] Mission 3 - Johnny
//          b0 - Complete
// $350842: [8-bit] Mission 3 - Venom
//          b0 - Complete
// $350843: [8-bit] Mission 3 - Dizzy
//          b0 - Complete
// $350844: [8-bit] Mission 3 - Slayer
//          b0 - Complete
// $350845: [8-bit] Mission 3 - I-No
//          b0 - Complete
// $350846: [8-bit] Mission 3 - Zappa
//          b0 - Complete
// $350847: [8-bit] Mission 3 - Bridget
//          b0 - Complete
// $350848: [8-bit] Mission 3 - Robo-Ky
//          b0 - Complete
// $350849: [8-bit] Mission 3 - A.B.A
//          b0 - Complete
// $35084A: [8-bit] Mission 3 - Order Sol
//          b0 - Complete
// $35084B: [8-bit] Mission 3 - Kliff
//          b0 - Complete
// $35084C: [8-bit] Mission 3 - Justice
//          b0 - Complete
// $35084D: [8-bit] Mission 4 - Sol
//          b0 - Complete
// $35084E: [8-bit] Mission 4 - Ky
//          b0 - Complete
// $35084F: [8-bit] Mission 4 - May
//          b0 - Complete
// $350850: [8-bit] Mission 4 - Millia
//          b0 - Complete
// $350851: [8-bit] Mission 4 - Axl
//          b0 - Complete
// $350852: [8-bit] Mission 4 - Potemkin
//          b0 - Complete
// $350853: [8-bit] Mission 4 - Chipp
//          b0 - Complete
// $350854: [8-bit] Mission 4 - Eddie
//          b0 - Complete
// $350855: [8-bit] Mission 4 - Baiken
//          b0 - Complete
// $350856: [8-bit] Mission 4 - Faust
//          b0 - Complete
// $350857: [8-bit] Mission 4 - Testament
//          b0 - Complete
// $350858: [8-bit] Mission 4 - Jam
//          b0 - Complete
// $350859: [8-bit] Mission 4 - Anji
//          b0 - Complete
// $35085A: [8-bit] Mission 4 - Johnny
//          b0 - Complete
// $35085B: [8-bit] Mission 4 - Venom
//          b0 - Complete
// $35085C: [8-bit] Mission 4 - Dizzy
//          b0 - Complete
// $35085D: [8-bit] Mission 4 - Slayer
//          b0 - Complete
// $35085E: [8-bit] Mission 4 - I-No
//          b0 - Complete
// $35085F: [8-bit] Mission 4 - Zappa
//          b0 - Complete
// $350860: [8-bit] Mission 4 - Bridget
//          b0 - Complete
// $350861: [8-bit] Mission 4 - Robo-Ky
//          b0 - Complete
// $350862: [8-bit] Mission 4 - A.B.A
//          b0 - Complete
// $350863: [8-bit] Mission 4 - Order Sol
//          b0 - Complete
// $350864: [8-bit] Mission 4 - Kliff
//          b0 - Complete
// $350865: [8-bit] Mission 4 - Justice
//          b0 - Complete
// $350866: [8-bit] Mission 5 - Sol
//          b0 - Complete
// $350867: [8-bit] Mission 5 - Ky
//          b0 - Complete
// $350868: [8-bit] Mission 5 - May
//          b0 - Complete
// $350869: [8-bit] Mission 5 - Millia
//          b0 - Complete
// $35086A: [8-bit] Mission 5 - Axl
//          b0 - Complete
// $35086B: [8-bit] Mission 5 - Potemkin
//          b0 - Complete
// $35086C: [8-bit] Mission 5 - Chipp
//          b0 - Complete
// $35086D: [8-bit] Mission 5 - Eddie
//          b0 - Complete
// $35086E: [8-bit] Mission 5 - Baiken
//          b0 - Complete
// $35086F: [8-bit] Mission 5 - Faust
//          b0 - Complete
// $350870: [8-bit] Mission 5 - Testament
//          b0 - Complete
// $350871: [8-bit] Mission 5 - Jam
//          b0 - Complete
// $350872: [8-bit] Mission 5 - Anji
//          b0 - Complete
// $350873: [8-bit] Mission 5 - Johnny
//          b0 - Complete
// $350874: [8-bit] Mission 5 - Venom
//          b0 - Complete
// $350875: [8-bit] Mission 5 - Dizzy
//          b0 - Complete
// $350876: [8-bit] Mission 5 - Slayer
//          b0 - Complete
// $350877: [8-bit] Mission 5 - I-No
//          b0 - Complete
// $350878: [8-bit] Mission 5 - Zappa
//          b0 - Complete
// $350879: [8-bit] Mission 5 - Bridget
//          b0 - Complete
// $35087A: [8-bit] Mission 5 - Robo-Ky
//          b0 - Complete
// $35087B: [8-bit] Mission 5 - A.B.A
//          b0 - Complete
// $35087C: [8-bit] Mission 5 - Order Sol
//          b0 - Complete
// $35087D: [8-bit] Mission 5 - Kliff
//          b0 - Complete
// $35087E: [8-bit] Mission 5 - Justice
//          b0 - Complete
// $35087F: [8-bit] Mission 6 - Sol
//          b0 - Complete
// $350880: [8-bit] Mission 6 - Ky
//          b0 - Complete
// $350881: [8-bit] Mission 6 - May
//          b0 - Complete
// $350882: [8-bit] Mission 6 - Millia
//          b0 - Complete
// $350883: [8-bit] Mission 6 - Axl
//          b0 - Complete
// $350884: [8-bit] Mission 6 - Potemkin
//          b0 - Complete
// $350885: [8-bit] Mission 6 - Chipp
//          b0 - Complete
// $350886: [8-bit] Mission 6 - Eddie
//          b0 - Complete
// $350887: [8-bit] Mission 6 - Baiken
//          b0 - Complete
// $350888: [8-bit] Mission 6 - Faust
//          b0 - Complete
// $350889: [8-bit] Mission 6 - Testament
//          b0 - Complete
// $35088A: [8-bit] Mission 6 - Jam
//          b0 - Complete
// $35088B: [8-bit] Mission 6 - Anji
//          b0 - Complete
// $35088C: [8-bit] Mission 6 - Johnny
//          b0 - Complete
// $35088D: [8-bit] Mission 6 - Venom
//          b0 - Complete
// $35088E: [8-bit] Mission 6 - Dizzy
//          b0 - Complete
// $35088F: [8-bit] Mission 6 - Slayer
//          b0 - Complete
// $350890: [8-bit] Mission 6 - I-No
//          b0 - Complete
// $350891: [8-bit] Mission 6 - Zappa
//          b0 - Complete
// $350892: [8-bit] Mission 6 - Bridget
//          b0 - Complete
// $350893: [8-bit] Mission 6 - Robo-Ky
//          b0 - Complete
// $350894: [8-bit] Mission 6 - A.B.A
//          b0 - Complete
// $350895: [8-bit] Mission 6 - Order Sol
//          b0 - Complete
// $350896: [8-bit] Mission 6 - Kliff
//          b0 - Complete
// $350897: [8-bit] Mission 6 - Justice
//          b0 - Complete
// $350898: [8-bit] Mission 7 - Sol
//          b0 - Complete
// $350899: [8-bit] Mission 7 - Ky
//          b0 - Complete
// $35089A: [8-bit] Mission 7 - May
//          b0 - Complete
// $35089B: [8-bit] Mission 7 - Millia
//          b0 - Complete
// $35089C: [8-bit] Mission 7 - Axl
//          b0 - Complete
// $35089D: [8-bit] Mission 7 - Potemkin
//          b0 - Complete
// $35089E: [8-bit] Mission 7 - Chipp
//          b0 - Complete
// $35089F: [8-bit] Mission 7 - Eddie
//          b0 - Complete
// $3508A0: [8-bit] Mission 7 - Baiken
//          b0 - Complete
// $3508A1: [8-bit] Mission 7 - Faust
//          b0 - Complete
// $3508A2: [8-bit] Mission 7 - Testament
//          b0 - Complete
// $3508A3: [8-bit] Mission 7 - Jam
//          b0 - Complete
// $3508A4: [8-bit] Mission 7 - Anji
//          b0 - Complete
// $3508A5: [8-bit] Mission 7 - Johnny
//          b0 - Complete
// $3508A6: [8-bit] Mission 7 - Venom
//          b0 - Complete
// $3508A7: [8-bit] Mission 7 - Dizzy
//          b0 - Complete
// $3508A8: [8-bit] Mission 7 - Slayer
//          b0 - Complete
// $3508A9: [8-bit] Mission 7 - I-No
//          b0 - Complete
// $3508AA: [8-bit] Mission 7 - Zappa
//          b0 - Complete
// $3508AB: [8-bit] Mission 7 - Bridget
//          b0 - Complete
// $3508AC: [8-bit] Mission 7 - Robo-Ky
//          b0 - Complete
// $3508AD: [8-bit] Mission 7 - A.B.A
//          b0 - Complete
// $3508AE: [8-bit] Mission 7 - Order Sol
//          b0 - Complete
// $3508AF: [8-bit] Mission 7 - Kliff
//          b0 - Complete
// $3508B0: [8-bit] Mission 7 - Justice
//          b0 - Complete
// $3508B1: [8-bit] Mission 8 - Sol
//          b0 - Complete
// $3508B2: [8-bit] Mission 8 - Ky
//          b0 - Complete
// $3508B3: [8-bit] Mission 8 - May
//          b0 - Complete
// $3508B4: [8-bit] Mission 8 - Millia
//          b0 - Complete
// $3508B5: [8-bit] Mission 8 - Axl
//          b0 - Complete
// $3508B6: [8-bit] Mission 8 - Potemkin
//          b0 - Complete
// $3508B7: [8-bit] Mission 8 - Chipp
//          b0 - Complete
// $3508B8: [8-bit] Mission 8 - Eddie
//          b0 - Complete
// $3508B9: [8-bit] Mission 8 - Baiken
//          b0 - Complete
// $3508BA: [8-bit] Mission 8 - Faust
//          b0 - Complete
// $3508BB: [8-bit] Mission 8 - Testament
//          b0 - Complete
// $3508BC: [8-bit] Mission 8 - Jam
//          b0 - Complete
// $3508BD: [8-bit] Mission 8 - Anji
//          b0 - Complete
// $3508BE: [8-bit] Mission 8 - Johnny
//          b0 - Complete
// $3508BF: [8-bit] Mission 8 - Venom
//          b0 - Complete
// $3508C0: [8-bit] Mission 8 - Dizzy
//          b0 - Complete
// $3508C1: [8-bit] Mission 8 - Slayer
//          b0 - Complete
// $3508C2: [8-bit] Mission 8 - I-No
//          b0 - Complete
// $3508C3: [8-bit] Mission 8 - Zappa
//          b0 - Complete
// $3508C4: [8-bit] Mission 8 - Bridget
//          b0 - Complete
// $3508C5: [8-bit] Mission 8 - Robo-Ky
//          b0 - Complete
// $3508C6: [8-bit] Mission 8 - A.B.A
//          b0 - Complete
// $3508C7: [8-bit] Mission 8 - Order Sol
//          b0 - Complete
// $3508C8: [8-bit] Mission 8 - Kliff
//          b0 - Complete
// $3508C9: [8-bit] Mission 8 - Justice
//          b0 - Complete
// $3508CA: [8-bit] Mission 9 - Sol
//          b0 - Complete
// $3508CB: [8-bit] Mission 9 - Ky
//          b0 - Complete
// $3508CC: [8-bit] Mission 9 - May
//          b0 - Complete
// $3508CD: [8-bit] Mission 9 - Millia
//          b0 - Complete
// $3508CE: [8-bit] Mission 9 - Axl
//          b0 - Complete
// $3508CF: [8-bit] Mission 9 - Potemkin
//          b0 - Complete
// $3508D0: [8-bit] Mission 9 - Chipp
//          b0 - Complete
// $3508D1: [8-bit] Mission 9 - Eddie
//          b0 - Complete
// $3508D2: [8-bit] Mission 9 - Baiken
//          b0 - Complete
// $3508D3: [8-bit] Mission 9 - Faust
//          b0 - Complete
// $3508D4: [8-bit] Mission 9 - Testament
//          b0 - Complete
// $3508D5: [8-bit] Mission 9 - Jam
//          b0 - Complete
// $3508D6: [8-bit] Mission 9 - Anji
//          b0 - Complete
// $3508D7: [8-bit] Mission 9 - Johnny
//          b0 - Complete
// $3508D8: [8-bit] Mission 9 - Venom
//          b0 - Complete
// $3508D9: [8-bit] Mission 9 - Dizzy
//          b0 - Complete
// $3508DA: [8-bit] Mission 9 - Slayer
//          b0 - Complete
// $3508DB: [8-bit] Mission 9 - I-No
//          b0 - Complete
// $3508DC: [8-bit] Mission 9 - Zappa
//          b0 - Complete
// $3508DD: [8-bit] Mission 9 - Bridget
//          b0 - Complete
// $3508DE: [8-bit] Mission 9 - Robo-Ky
//          b0 - Complete
// $3508DF: [8-bit] Mission 9 - A.B.A
//          b0 - Complete
// $3508E0: [8-bit] Mission 9 - Order Sol
//          b0 - Complete
// $3508E1: [8-bit] Mission 9 - Kliff
//          b0 - Complete
// $3508E2: [8-bit] Mission 9 - Justice
//          b0 - Complete
// $3508E3: [8-bit] Mission 10 - Sol
//          b0 - Complete
// $3508E4: [8-bit] Mission 10 - Ky
//          b0 - Complete
// $3508E5: [8-bit] Mission 10 - May
//          b0 - Complete
// $3508E6: [8-bit] Mission 10 - Millia
//          b0 - Complete
// $3508E7: [8-bit] Mission 10 - Axl
//          b0 - Complete
// $3508E8: [8-bit] Mission 10 - Potemkin
//          b0 - Complete
// $3508E9: [8-bit] Mission 10 - Chipp
//          b0 - Complete
// $3508EA: [8-bit] Mission 10 - Eddie
//          b0 - Complete
// $3508EB: [8-bit] Mission 10 - Baiken
//          b0 - Complete
// $3508EC: [8-bit] Mission 10 - Faust
//          b0 - Complete
// $3508ED: [8-bit] Mission 10 - Testament
//          b0 - Complete
// $3508EE: [8-bit] Mission 10 - Jam
//          b0 - Complete
// $3508EF: [8-bit] Mission 10 - Anji
//          b0 - Complete
// $3508F0: [8-bit] Mission 10 - Johnny
//          b0 - Complete
// $3508F1: [8-bit] Mission 10 - Venom
//          b0 - Complete
// $3508F2: [8-bit] Mission 10 - Dizzy
//          b0 - Complete
// $3508F3: [8-bit] Mission 10 - Slayer
//          b0 - Complete
// $3508F4: [8-bit] Mission 10 - I-No
//          b0 - Complete
// $3508F5: [8-bit] Mission 10 - Zappa
//          b0 - Complete
// $3508F6: [8-bit] Mission 10 - Bridget
//          b0 - Complete
// $3508F7: [8-bit] Mission 10 - Robo-Ky
//          b0 - Complete
// $3508F8: [8-bit] Mission 10 - A.B.A
//          b0 - Complete
// $3508F9: [8-bit] Mission 10 - Order Sol
//          b0 - Complete
// $3508FA: [8-bit] Mission 10 - Kliff
//          b0 - Complete
// $3508FB: [8-bit] Mission 10 - Justice
//          b0 - Complete
// $3508FC: [8-bit] Mission 11 - Sol
//          b0 - Complete
// $3508FD: [8-bit] Mission 11 - Ky
//          b0 - Complete
// $3508FE: [8-bit] Mission 11 - May
//          b0 - Complete
// $3508FF: [8-bit] Mission 11 - Millia
//          b0 - Complete
// $350900: [8-bit] Mission 11 - Axl
//          b0 - Complete
// $350901: [8-bit] Mission 11 - Potemkin
//          b0 - Complete
// $350902: [8-bit] Mission 11 - Chipp
//          b0 - Complete
// $350903: [8-bit] Mission 11 - Eddie
//          b0 - Complete
// $350904: [8-bit] Mission 11 - Baiken
//          b0 - Complete
// $350905: [8-bit] Mission 11 - Faust
//          b0 - Complete
// $350906: [8-bit] Mission 11 - Testament
//          b0 - Complete
// $350907: [8-bit] Mission 11 - Jam
//          b0 - Complete
// $350908: [8-bit] Mission 11 - Anji
//          b0 - Complete
// $350909: [8-bit] Mission 11 - Johnny
//          b0 - Complete
// $35090A: [8-bit] Mission 11 - Venom
//          b0 - Complete
// $35090B: [8-bit] Mission 11 - Dizzy
//          b0 - Complete
// $35090C: [8-bit] Mission 11 - Slayer
//          b0 - Complete
// $35090D: [8-bit] Mission 11 - I-No
//          b0 - Complete
// $35090E: [8-bit] Mission 11 - Zappa
//          b0 - Complete
// $35090F: [8-bit] Mission 11 - Bridget
//          b0 - Complete
// $350910: [8-bit] Mission 11 - Robo-Ky
//          b0 - Complete
// $350911: [8-bit] Mission 11 - A.B.A
//          b0 - Complete
// $350912: [8-bit] Mission 11 - Order Sol
//          b0 - Complete
// $350913: [8-bit] Mission 11 - Kliff
//          b0 - Complete
// $350914: [8-bit] Mission 11 - Justice
//          b0 - Complete
// $350915: [8-bit] Mission 12 - Sol
//          b0 - Complete
// $350916: [8-bit] Mission 12 - Ky
//          b0 - Complete
// $350917: [8-bit] Mission 12 - May
//          b0 - Complete
// $350918: [8-bit] Mission 12 - Millia
//          b0 - Complete
// $350919: [8-bit] Mission 12 - Axl
//          b0 - Complete
// $35091A: [8-bit] Mission 12 - Potemkin
//          b0 - Complete
// $35091B: [8-bit] Mission 12 - Chipp
//          b0 - Complete
// $35091C: [8-bit] Mission 12 - Eddie
//          b0 - Complete
// $35091D: [8-bit] Mission 12 - Baiken
//          b0 - Complete
// $35091E: [8-bit] Mission 12 - Faust
//          b0 - Complete
// $35091F: [8-bit] Mission 12 - Testament
//          b0 - Complete
// $350920: [8-bit] Mission 12 - Jam
//          b0 - Complete
// $350921: [8-bit] Mission 12 - Anji
//          b0 - Complete
// $350922: [8-bit] Mission 12 - Johnny
//          b0 - Complete
// $350923: [8-bit] Mission 12 - Venom
//          b0 - Complete
// $350924: [8-bit] Mission 12 - Dizzy
//          b0 - Complete
// $350925: [8-bit] Mission 12 - Slayer
//          b0 - Complete
// $350926: [8-bit] Mission 12 - I-No
//          b0 - Complete
// $350927: [8-bit] Mission 12 - Zappa
//          b0 - Complete
// $350928: [8-bit] Mission 12 - Bridget
//          b0 - Complete
// $350929: [8-bit] Mission 12 - Robo-Ky
//          b0 - Complete
// $35092A: [8-bit] Mission 12 - A.B.A
//          b0 - Complete
// $35092B: [8-bit] Mission 12 - Order Sol
//          b0 - Complete
// $35092C: [8-bit] Mission 12 - Kliff
//          b0 - Complete
// $35092D: [8-bit] Mission 12 - Justice
//          b0 - Complete
// $35092E: [8-bit] Mission 13 - Sol
//          b0 - Complete
// $35092F: [8-bit] Mission 13 - Ky
//          b0 - Complete
// $350930: [8-bit] Mission 13 - May
//          b0 - Complete
// $350931: [8-bit] Mission 13 - Millia
//          b0 - Complete
// $350932: [8-bit] Mission 13 - Axl
//          b0 - Complete
// $350933: [8-bit] Mission 13 - Potemkin
//          b0 - Complete
// $350934: [8-bit] Mission 13 - Chipp
//          b0 - Complete
// $350935: [8-bit] Mission 13 - Eddie
//          b0 - Complete
// $350936: [8-bit] Mission 13 - Baiken
//          b0 - Complete
// $350937: [8-bit] Mission 13 - Faust
//          b0 - Complete
// $350938: [8-bit] Mission 13 - Testament
//          b0 - Complete
// $350939: [8-bit] Mission 13 - Jam
//          b0 - Complete
// $35093A: [8-bit] Mission 13 - Anji
//          b0 - Complete
// $35093B: [8-bit] Mission 13 - Johnny
//          b0 - Complete
// $35093C: [8-bit] Mission 13 - Venom
//          b0 - Complete
// $35093D: [8-bit] Mission 13 - Dizzy
//          b0 - Complete
// $35093E: [8-bit] Mission 13 - Slayer
//          b0 - Complete
// $35093F: [8-bit] Mission 13 - I-No
//          b0 - Complete
// $350940: [8-bit] Mission 13 - Zappa
//          b0 - Complete
// $350941: [8-bit] Mission 13 - Bridget
//          b0 - Complete
// $350942: [8-bit] Mission 13 - Robo-Ky
//          b0 - Complete
// $350943: [8-bit] Mission 13 - A.B.A
//          b0 - Complete
// $350944: [8-bit] Mission 13 - Order Sol
//          b0 - Complete
// $350945: [8-bit] Mission 13 - Kliff
//          b0 - Complete
// $350946: [8-bit] Mission 13 - Justice
//          b0 - Complete
// $350947: [8-bit] Mission 14 - Sol
//          b0 - Complete
// $350948: [8-bit] Mission 14 - Ky
//          b0 - Complete
// $350949: [8-bit] Mission 14 - May
//          b0 - Complete
// $35094A: [8-bit] Mission 14 - Millia
//          b0 - Complete
// $35094B: [8-bit] Mission 14 - Axl
//          b0 - Complete
// $35094C: [8-bit] Mission 14 - Potemkin
//          b0 - Complete
// $35094D: [8-bit] Mission 14 - Chipp
//          b0 - Complete
// $35094E: [8-bit] Mission 14 - Eddie
//          b0 - Complete
// $35094F: [8-bit] Mission 14 - Baiken
//          b0 - Complete
// $350950: [8-bit] Mission 14 - Faust
//          b0 - Complete
// $350951: [8-bit] Mission 14 - Testament
//          b0 - Complete
// $350952: [8-bit] Mission 14 - Jam
//          b0 - Complete
// $350953: [8-bit] Mission 14 - Anji
//          b0 - Complete
// $350954: [8-bit] Mission 14 - Johnny
//          b0 - Complete
// $350955: [8-bit] Mission 14 - Venom
//          b0 - Complete
// $350956: [8-bit] Mission 14 - Dizzy
//          b0 - Complete
// $350957: [8-bit] Mission 14 - Slayer
//          b0 - Complete
// $350958: [8-bit] Mission 14 - I-No
//          b0 - Complete
// $350959: [8-bit] Mission 14 - Zappa
//          b0 - Complete
// $35095A: [8-bit] Mission 14 - Bridget
//          b0 - Complete
// $35095B: [8-bit] Mission 14 - Robo-Ky
//          b0 - Complete
// $35095C: [8-bit] Mission 14 - A.B.A
//          b0 - Complete
// $35095D: [8-bit] Mission 14 - Order Sol
//          b0 - Complete
// $35095E: [8-bit] Mission 14 - Kliff
//          b0 - Complete
// $35095F: [8-bit] Mission 14 - Justice
//          b0 - Complete
// $350960: [8-bit] Mission 15 - Sol
//          b0 - Complete
// $350961: [8-bit] Mission 15 - Ky
//          b0 - Complete
// $350962: [8-bit] Mission 15 - May
//          b0 - Complete
// $350963: [8-bit] Mission 15 - Millia
//          b0 - Complete
// $350964: [8-bit] Mission 15 - Axl
//          b0 - Complete
// $350965: [8-bit] Mission 15 - Potemkin
//          b0 - Complete
// $350966: [8-bit] Mission 15 - Chipp
//          b0 - Complete
// $350967: [8-bit] Mission 15 - Eddie
//          b0 - Complete
// $350968: [8-bit] Mission 15 - Baiken
//          b0 - Complete
// $350969: [8-bit] Mission 15 - Faust
//          b0 - Complete
// $35096A: [8-bit] Mission 15 - Testament
//          b0 - Complete
// $35096B: [8-bit] Mission 15 - Jam
//          b0 - Complete
// $35096C: [8-bit] Mission 15 - Anji
//          b0 - Complete
// $35096D: [8-bit] Mission 15 - Johnny
//          b0 - Complete
// $35096E: [8-bit] Mission 15 - Venom
//          b0 - Complete
// $35096F: [8-bit] Mission 15 - Dizzy
//          b0 - Complete
// $350970: [8-bit] Mission 15 - Slayer
//          b0 - Complete
// $350971: [8-bit] Mission 15 - I-No
//          b0 - Complete
// $350972: [8-bit] Mission 15 - Zappa
//          b0 - Complete
// $350973: [8-bit] Mission 15 - Bridget
//          b0 - Complete
// $350974: [8-bit] Mission 15 - Robo-Ky
//          b0 - Complete
// $350975: [8-bit] Mission 15 - A.B.A
//          b0 - Complete
// $350976: [8-bit] Mission 15 - Order Sol
//          b0 - Complete
// $350977: [8-bit] Mission 15 - Kliff
//          b0 - Complete
// $350978: [8-bit] Mission 15 - Justice
//          b0 - Complete
// $350979: [8-bit] Mission 16 - Sol
//          b0 - Complete
// $35097A: [8-bit] Mission 16 - Ky
//          b0 - Complete
// $35097B: [8-bit] Mission 16 - May
//          b0 - Complete
// $35097C: [8-bit] Mission 16 - Millia
//          b0 - Complete
// $35097D: [8-bit] Mission 16 - Axl
//          b0 - Complete
// $35097E: [8-bit] Mission 16 - Potemkin
//          b0 - Complete
// $35097F: [8-bit] Mission 16 - Chipp
//          b0 - Complete
// $350980: [8-bit] Mission 16 - Eddie
//          b0 - Complete
// $350981: [8-bit] Mission 16 - Baiken
//          b0 - Complete
// $350982: [8-bit] Mission 16 - Faust
//          b0 - Complete
// $350983: [8-bit] Mission 16 - Testament
//          b0 - Complete
// $350984: [8-bit] Mission 16 - Jam
//          b0 - Complete
// $350985: [8-bit] Mission 16 - Anji
//          b0 - Complete
// $350986: [8-bit] Mission 16 - Johnny
//          b0 - Complete
// $350987: [8-bit] Mission 16 - Venom
//          b0 - Complete
// $350988: [8-bit] Mission 16 - Dizzy
//          b0 - Complete
// $350989: [8-bit] Mission 16 - Slayer
//          b0 - Complete
// $35098A: [8-bit] Mission 16 - I-No
//          b0 - Complete
// $35098B: [8-bit] Mission 16 - Zappa
//          b0 - Complete
// $35098C: [8-bit] Mission 16 - Bridget
//          b0 - Complete
// $35098D: [8-bit] Mission 16 - Robo-Ky
//          b0 - Complete
// $35098E: [8-bit] Mission 16 - A.B.A
//          b0 - Complete
// $35098F: [8-bit] Mission 16 - Order Sol
//          b0 - Complete
// $350990: [8-bit] Mission 16 - Kliff
//          b0 - Complete
// $350991: [8-bit] Mission 16 - Justice
//          b0 - Complete
// $350992: [8-bit] Mission 17 - Sol
//          b0 - Complete
// $350993: [8-bit] Mission 17 - Ky
//          b0 - Complete
// $350994: [8-bit] Mission 17 - May
//          b0 - Complete
// $350995: [8-bit] Mission 17 - Millia
//          b0 - Complete
// $350996: [8-bit] Mission 17 - Axl
//          b0 - Complete
// $350997: [8-bit] Mission 17 - Potemkin
//          b0 - Complete
// $350998: [8-bit] Mission 17 - Chipp
//          b0 - Complete
// $350999: [8-bit] Mission 17 - Eddie
//          b0 - Complete
// $35099A: [8-bit] Mission 17 - Baiken
//          b0 - Complete
// $35099B: [8-bit] Mission 17 - Faust
//          b0 - Complete
// $35099C: [8-bit] Mission 17 - Testament
//          b0 - Complete
// $35099D: [8-bit] Mission 17 - Jam
//          b0 - Complete
// $35099E: [8-bit] Mission 17 - Anji
//          b0 - Complete
// $35099F: [8-bit] Mission 17 - Johnny
//          b0 - Complete
// $3509A0: [8-bit] Mission 17 - Venom
//          b0 - Complete
// $3509A1: [8-bit] Mission 17 - Dizzy
//          b0 - Complete
// $3509A2: [8-bit] Mission 17 - Slayer
//          b0 - Complete
// $3509A3: [8-bit] Mission 17 - I-No
//          b0 - Complete
// $3509A4: [8-bit] Mission 17 - Zappa
//          b0 - Complete
// $3509A5: [8-bit] Mission 17 - Bridget
//          b0 - Complete
// $3509A6: [8-bit] Mission 17 - Robo-Ky
//          b0 - Complete
// $3509A7: [8-bit] Mission 17 - A.B.A
//          b0 - Complete
// $3509A8: [8-bit] Mission 17 - Order Sol
//          b0 - Complete
// $3509A9: [8-bit] Mission 17 - Kliff
//          b0 - Complete
// $3509AA: [8-bit] Mission 17 - Justice
//          b0 - Complete
// $3509AB: [8-bit] Mission 18 - Sol
//          b0 - Complete
// $3509AC: [8-bit] Mission 18 - Ky
//          b0 - Complete
// $3509AD: [8-bit] Mission 18 - May
//          b0 - Complete
// $3509AE: [8-bit] Mission 18 - Millia
//          b0 - Complete
// $3509AF: [8-bit] Mission 18 - Axl
//          b0 - Complete
// $3509B0: [8-bit] Mission 18 - Potemkin
//          b0 - Complete
// $3509B1: [8-bit] Mission 18 - Chipp
//          b0 - Complete
// $3509B2: [8-bit] Mission 18 - Eddie
//          b0 - Complete
// $3509B3: [8-bit] Mission 18 - Baiken
//          b0 - Complete
// $3509B4: [8-bit] Mission 18 - Faust
//          b0 - Complete
// $3509B5: [8-bit] Mission 18 - Testament
//          b0 - Complete
// $3509B6: [8-bit] Mission 18 - Jam
//          b0 - Complete
// $3509B7: [8-bit] Mission 18 - Anji
//          b0 - Complete
// $3509B8: [8-bit] Mission 18 - Johnny
//          b0 - Complete
// $3509B9: [8-bit] Mission 18 - Venom
//          b0 - Complete
// $3509BA: [8-bit] Mission 18 - Dizzy
//          b0 - Complete
// $3509BB: [8-bit] Mission 18 - Slayer
//          b0 - Complete
// $3509BC: [8-bit] Mission 18 - I-No
//          b0 - Complete
// $3509BD: [8-bit] Mission 18 - Zappa
//          b0 - Complete
// $3509BE: [8-bit] Mission 18 - Bridget
//          b0 - Complete
// $3509BF: [8-bit] Mission 18 - Robo-Ky
//          b0 - Complete
// $3509C0: [8-bit] Mission 18 - A.B.A
//          b0 - Complete
// $3509C1: [8-bit] Mission 18 - Order Sol
//          b0 - Complete
// $3509C2: [8-bit] Mission 18 - Kliff
//          b0 - Complete
// $3509C3: [8-bit] Mission 18 - Justice
//          b0 - Complete
// $3509C4: [8-bit] Mission 19 - Sol
//          b0 - Complete
// $3509C5: [8-bit] Mission 19 - Ky
//          b0 - Complete
// $3509C6: [8-bit] Mission 19 - May
//          b0 - Complete
// $3509C7: [8-bit] Mission 19 - Millia
//          b0 - Complete
// $3509C8: [8-bit] Mission 19 - Axl
//          b0 - Complete
// $3509C9: [8-bit] Mission 19 - Potemkin
//          b0 - Complete
// $3509CA: [8-bit] Mission 19 - Chipp
//          b0 - Complete
// $3509CB: [8-bit] Mission 19 - Eddie
//          b0 - Complete
// $3509CC: [8-bit] Mission 19 - Baiken
//          b0 - Complete
// $3509CD: [8-bit] Mission 19 - Faust
//          b0 - Complete
// $3509CE: [8-bit] Mission 19 - Testament
//          b0 - Complete
// $3509CF: [8-bit] Mission 19 - Jam
//          b0 - Complete
// $3509D0: [8-bit] Mission 19 - Anji
//          b0 - Complete
// $3509D1: [8-bit] Mission 19 - Johnny
//          b0 - Complete
// $3509D2: [8-bit] Mission 19 - Venom
//          b0 - Complete
// $3509D3: [8-bit] Mission 19 - Dizzy
//          b0 - Complete
// $3509D4: [8-bit] Mission 19 - Slayer
//          b0 - Complete
// $3509D5: [8-bit] Mission 19 - I-No
//          b0 - Complete
// $3509D6: [8-bit] Mission 19 - Zappa
//          b0 - Complete
// $3509D7: [8-bit] Mission 19 - Bridget
//          b0 - Complete
// $3509D8: [8-bit] Mission 19 - Robo-Ky
//          b0 - Complete
// $3509D9: [8-bit] Mission 19 - A.B.A
//          b0 - Complete
// $3509DA: [8-bit] Mission 19 - Order Sol
//          b0 - Complete
// $3509DB: [8-bit] Mission 19 - Kliff
//          b0 - Complete
// $3509DC: [8-bit] Mission 19 - Justice
//          b0 - Complete
// $3509DD: [8-bit] Mission 20 - Sol
//          b0 - Complete
// $3509DE: [8-bit] Mission 20 - Ky
//          b0 - Complete
// $3509DF: [8-bit] Mission 20 - May
//          b0 - Complete
// $3509E0: [8-bit] Mission 20 - Millia
//          b0 - Complete
// $3509E1: [8-bit] Mission 20 - Axl
//          b0 - Complete
// $3509E2: [8-bit] Mission 20 - Potemkin
//          b0 - Complete
// $3509E3: [8-bit] Mission 20 - Chipp
//          b0 - Complete
// $3509E4: [8-bit] Mission 20 - Eddie
//          b0 - Complete
// $3509E5: [8-bit] Mission 20 - Baiken
//          b0 - Complete
// $3509E6: [8-bit] Mission 20 - Faust
//          b0 - Complete
// $3509E7: [8-bit] Mission 20 - Testament
//          b0 - Complete
// $3509E8: [8-bit] Mission 20 - Jam
//          b0 - Complete
// $3509E9: [8-bit] Mission 20 - Anji
//          b0 - Complete
// $3509EA: [8-bit] Mission 20 - Johnny
//          b0 - Complete
// $3509EB: [8-bit] Mission 20 - Venom
//          b0 - Complete
// $3509EC: [8-bit] Mission 20 - Dizzy
//          b0 - Complete
// $3509ED: [8-bit] Mission 20 - Slayer
//          b0 - Complete
// $3509EE: [8-bit] Mission 20 - I-No
//          b0 - Complete
// $3509EF: [8-bit] Mission 20 - Zappa
//          b0 - Complete
// $3509F0: [8-bit] Mission 20 - Bridget
//          b0 - Complete
// $3509F1: [8-bit] Mission 20 - Robo-Ky
//          b0 - Complete
// $3509F2: [8-bit] Mission 20 - A.B.A
//          b0 - Complete
// $3509F3: [8-bit] Mission 20 - Order Sol
//          b0 - Complete
// $3509F4: [8-bit] Mission 20 - Kliff
//          b0 - Complete
// $3509F5: [8-bit] Mission 20 - Justice
//          b0 - Complete
// $3509F6: [8-bit] Mission 21 - Sol
//          b0 - Complete
// $3509F7: [8-bit] Mission 21 - Ky
//          b0 - Complete
// $3509F8: [8-bit] Mission 21 - May
//          b0 - Complete
// $3509F9: [8-bit] Mission 21 - Millia
//          b0 - Complete
// $3509FA: [8-bit] Mission 21 - Axl
//          b0 - Complete
// $3509FB: [8-bit] Mission 21 - Potemkin
//          b0 - Complete
// $3509FC: [8-bit] Mission 21 - Chipp
//          b0 - Complete
// $3509FD: [8-bit] Mission 21 - Eddie
//          b0 - Complete
// $3509FE: [8-bit] Mission 21 - Baiken
//          b0 - Complete
// $3509FF: [8-bit] Mission 21 - Faust
//          b0 - Complete
// $350A00: [8-bit] Mission 21 - Testament
//          b0 - Complete
// $350A01: [8-bit] Mission 21 - Jam
//          b0 - Complete
// $350A02: [8-bit] Mission 21 - Anji
//          b0 - Complete
// $350A03: [8-bit] Mission 21 - Johnny
//          b0 - Complete
// $350A04: [8-bit] Mission 21 - Venom
//          b0 - Complete
// $350A05: [8-bit] Mission 21 - Dizzy
//          b0 - Complete
// $350A06: [8-bit] Mission 21 - Slayer
//          b0 - Complete
// $350A07: [8-bit] Mission 21 - I-No
//          b0 - Complete
// $350A08: [8-bit] Mission 21 - Zappa
//          b0 - Complete
// $350A09: [8-bit] Mission 21 - Bridget
//          b0 - Complete
// $350A0A: [8-bit] Mission 21 - Robo-Ky
//          b0 - Complete
// $350A0B: [8-bit] Mission 21 - A.B.A
//          b0 - Complete
// $350A0C: [8-bit] Mission 21 - Order Sol
//          b0 - Complete
// $350A0D: [8-bit] Mission 21 - Kliff
//          b0 - Complete
// $350A0E: [8-bit] Mission 21 - Justice
//          b0 - Complete
// $350A0F: [8-bit] Mission 22 - Sol
//          b0 - Complete
// $350A10: [8-bit] Mission 22 - Ky
//          b0 - Complete
// $350A11: [8-bit] Mission 22 - May
//          b0 - Complete
// $350A12: [8-bit] Mission 22 - Millia
//          b0 - Complete
// $350A13: [8-bit] Mission 22 - Axl
//          b0 - Complete
// $350A14: [8-bit] Mission 22 - Potemkin
//          b0 - Complete
// $350A15: [8-bit] Mission 22 - Chipp
//          b0 - Complete
// $350A16: [8-bit] Mission 22 - Eddie
//          b0 - Complete
// $350A17: [8-bit] Mission 22 - Baiken
//          b0 - Complete
// $350A18: [8-bit] Mission 22 - Faust
//          b0 - Complete
// $350A19: [8-bit] Mission 22 - Testament
//          b0 - Complete
// $350A1A: [8-bit] Mission 22 - Jam
//          b0 - Complete
// $350A1B: [8-bit] Mission 22 - Anji
//          b0 - Complete
// $350A1C: [8-bit] Mission 22 - Johnny
//          b0 - Complete
// $350A1D: [8-bit] Mission 22 - Venom
//          b0 - Complete
// $350A1E: [8-bit] Mission 22 - Dizzy
//          b0 - Complete
// $350A1F: [8-bit] Mission 22 - Slayer
//          b0 - Complete
// $350A20: [8-bit] Mission 22 - I-No
//          b0 - Complete
// $350A21: [8-bit] Mission 22 - Zappa
//          b0 - Complete
// $350A22: [8-bit] Mission 22 - Bridget
//          b0 - Complete
// $350A23: [8-bit] Mission 22 - Robo-Ky
//          b0 - Complete
// $350A24: [8-bit] Mission 22 - A.B.A
//          b0 - Complete
// $350A25: [8-bit] Mission 22 - Order Sol
//          b0 - Complete
// $350A26: [8-bit] Mission 22 - Kliff
//          b0 - Complete
// $350A27: [8-bit] Mission 22 - Justice
//          b0 - Complete
// $350A28: [8-bit] Mission 23 - Sol
//          b0 - Complete
// $350A29: [8-bit] Mission 23 - Ky
//          b0 - Complete
// $350A2A: [8-bit] Mission 23 - May
//          b0 - Complete
// $350A2B: [8-bit] Mission 23 - Millia
//          b0 - Complete
// $350A2C: [8-bit] Mission 23 - Axl
//          b0 - Complete
// $350A2D: [8-bit] Mission 23 - Potemkin
//          b0 - Complete
// $350A2E: [8-bit] Mission 23 - Chipp
//          b0 - Complete
// $350A2F: [8-bit] Mission 23 - Eddie
//          b0 - Complete
// $350A30: [8-bit] Mission 23 - Baiken
//          b0 - Complete
// $350A31: [8-bit] Mission 23 - Faust
//          b0 - Complete
// $350A32: [8-bit] Mission 23 - Testament
//          b0 - Complete
// $350A33: [8-bit] Mission 23 - Jam
//          b0 - Complete
// $350A34: [8-bit] Mission 23 - Anji
//          b0 - Complete
// $350A35: [8-bit] Mission 23 - Johnny
//          b0 - Complete
// $350A36: [8-bit] Mission 23 - Venom
//          b0 - Complete
// $350A37: [8-bit] Mission 23 - Dizzy
//          b0 - Complete
// $350A38: [8-bit] Mission 23 - Slayer
//          b0 - Complete
// $350A39: [8-bit] Mission 23 - I-No
//          b0 - Complete
// $350A3A: [8-bit] Mission 23 - Zappa
//          b0 - Complete
// $350A3B: [8-bit] Mission 23 - Bridget
//          b0 - Complete
// $350A3C: [8-bit] Mission 23 - Robo-Ky
//          b0 - Complete
// $350A3D: [8-bit] Mission 23 - A.B.A
//          b0 - Complete
// $350A3E: [8-bit] Mission 23 - Order Sol
//          b0 - Complete
// $350A3F: [8-bit] Mission 23 - Kliff
//          b0 - Complete
// $350A40: [8-bit] Mission 23 - Justice
//          b0 - Complete
// $350A41: [8-bit] Mission 24 - Sol
//          b0 - Complete
// $350A42: [8-bit] Mission 24 - Ky
//          b0 - Complete
// $350A43: [8-bit] Mission 24 - May
//          b0 - Complete
// $350A44: [8-bit] Mission 24 - Millia
//          b0 - Complete
// $350A45: [8-bit] Mission 24 - Axl
//          b0 - Complete
// $350A46: [8-bit] Mission 24 - Potemkin
//          b0 - Complete
// $350A47: [8-bit] Mission 24 - Chipp
//          b0 - Complete
// $350A48: [8-bit] Mission 24 - Eddie
//          b0 - Complete
// $350A49: [8-bit] Mission 24 - Baiken
//          b0 - Complete
// $350A4A: [8-bit] Mission 24 - Faust
//          b0 - Complete
// $350A4B: [8-bit] Mission 24 - Testament
//          b0 - Complete
// $350A4C: [8-bit] Mission 24 - Jam
//          b0 - Complete
// $350A4D: [8-bit] Mission 24 - Anji
//          b0 - Complete
// $350A4E: [8-bit] Mission 24 - Johnny
//          b0 - Complete
// $350A4F: [8-bit] Mission 24 - Venom
//          b0 - Complete
// $350A50: [8-bit] Mission 24 - Dizzy
//          b0 - Complete
// $350A51: [8-bit] Mission 24 - Slayer
//          b0 - Complete
// $350A52: [8-bit] Mission 24 - I-No
//          b0 - Complete
// $350A53: [8-bit] Mission 24 - Zappa
//          b0 - Complete
// $350A54: [8-bit] Mission 24 - Bridget
//          b0 - Complete
// $350A55: [8-bit] Mission 24 - Robo-Ky
//          b0 - Complete
// $350A56: [8-bit] Mission 24 - A.B.A
//          b0 - Complete
// $350A57: [8-bit] Mission 24 - Order Sol
//          b0 - Complete
// $350A58: [8-bit] Mission 24 - Kliff
//          b0 - Complete
// $350A59: [8-bit] Mission 24 - Justice
//          b0 - Complete
// $350A5A: [8-bit] Mission 25 - Sol
//          b0 - Complete
// $350A5B: [8-bit] Mission 25 - Ky
//          b0 - Complete
// $350A5C: [8-bit] Mission 25 - May
//          b0 - Complete
// $350A5D: [8-bit] Mission 25 - Millia
//          b0 - Complete
// $350A5E: [8-bit] Mission 25 - Axl
//          b0 - Complete
// $350A5F: [8-bit] Mission 25 - Potemkin
//          b0 - Complete
// $350A60: [8-bit] Mission 25 - Chipp
//          b0 - Complete
// $350A61: [8-bit] Mission 25 - Eddie
//          b0 - Complete
// $350A62: [8-bit] Mission 25 - Baiken
//          b0 - Complete
// $350A63: [8-bit] Mission 25 - Faust
//          b0 - Complete
// $350A64: [8-bit] Mission 25 - Testament
//          b0 - Complete
// $350A65: [8-bit] Mission 25 - Jam
//          b0 - Complete
// $350A66: [8-bit] Mission 25 - Anji
//          b0 - Complete
// $350A67: [8-bit] Mission 25 - Johnny
//          b0 - Complete
// $350A68: [8-bit] Mission 25 - Venom
//          b0 - Complete
// $350A69: [8-bit] Mission 25 - Dizzy
//          b0 - Complete
// $350A6A: [8-bit] Mission 25 - Slayer
//          b0 - Complete
// $350A6B: [8-bit] Mission 25 - I-No
//          b0 - Complete
// $350A6C: [8-bit] Mission 25 - Zappa
//          b0 - Complete
// $350A6D: [8-bit] Mission 25 - Bridget
//          b0 - Complete
// $350A6E: [8-bit] Mission 25 - Robo-Ky
//          b0 - Complete
// $350A6F: [8-bit] Mission 25 - A.B.A
//          b0 - Complete
// $350A70: [8-bit] Mission 25 - Order Sol
//          b0 - Complete
// $350A71: [8-bit] Mission 25 - Kliff
//          b0 - Complete
// $350A72: [8-bit] Mission 25 - Justice
//          b0 - Complete
// $350A73: [8-bit] Mission 26 - Sol
//          b0 - Complete
// $350A74: [8-bit] Mission 26 - Ky
//          b0 - Complete
// $350A75: [8-bit] Mission 26 - May
//          b0 - Complete
// $350A76: [8-bit] Mission 26 - Millia
//          b0 - Complete
// $350A77: [8-bit] Mission 26 - Axl
//          b0 - Complete
// $350A78: [8-bit] Mission 26 - Potemkin
//          b0 - Complete
// $350A79: [8-bit] Mission 26 - Chipp
//          b0 - Complete
// $350A7A: [8-bit] Mission 26 - Eddie
//          b0 - Complete
// $350A7B: [8-bit] Mission 26 - Baiken
//          b0 - Complete
// $350A7C: [8-bit] Mission 26 - Faust
//          b0 - Complete
// $350A7D: [8-bit] Mission 26 - Testament
//          b0 - Complete
// $350A7E: [8-bit] Mission 26 - Jam
//          b0 - Complete
// $350A7F: [8-bit] Mission 26 - Anji
//          b0 - Complete
// $350A80: [8-bit] Mission 26 - Johnny
//          b0 - Complete
// $350A81: [8-bit] Mission 26 - Venom
//          b0 - Complete
// $350A82: [8-bit] Mission 26 - Dizzy
//          b0 - Complete
// $350A83: [8-bit] Mission 26 - Slayer
//          b0 - Complete
// $350A84: [8-bit] Mission 26 - I-No
//          b0 - Complete
// $350A85: [8-bit] Mission 26 - Zappa
//          b0 - Complete
// $350A86: [8-bit] Mission 26 - Bridget
//          b0 - Complete
// $350A87: [8-bit] Mission 26 - Robo-Ky
//          b0 - Complete
// $350A88: [8-bit] Mission 26 - A.B.A
//          b0 - Complete
// $350A89: [8-bit] Mission 26 - Order Sol
//          b0 - Complete
// $350A8A: [8-bit] Mission 26 - Kliff
//          b0 - Complete
// $350A8B: [8-bit] Mission 26 - Justice
//          b0 - Complete
// $350A8C: [8-bit] Mission 27 - Sol
//          b0 - Complete
// $350A8D: [8-bit] Mission 27 - Ky
//          b0 - Complete
// $350A8E: [8-bit] Mission 27 - May
//          b0 - Complete
// $350A8F: [8-bit] Mission 27 - Millia
//          b0 - Complete
// $350A90: [8-bit] Mission 27 - Axl
//          b0 - Complete
// $350A91: [8-bit] Mission 27 - Potemkin
//          b0 - Complete
// $350A92: [8-bit] Mission 27 - Chipp
//          b0 - Complete
// $350A93: [8-bit] Mission 27 - Eddie
//          b0 - Complete
// $350A94: [8-bit] Mission 27 - Baiken
//          b0 - Complete
// $350A95: [8-bit] Mission 27 - Faust
//          b0 - Complete
// $350A96: [8-bit] Mission 27 - Testament
//          b0 - Complete
// $350A97: [8-bit] Mission 27 - Jam
//          b0 - Complete
// $350A98: [8-bit] Mission 27 - Anji
//          b0 - Complete
// $350A99: [8-bit] Mission 27 - Johnny
//          b0 - Complete
// $350A9A: [8-bit] Mission 27 - Venom
//          b0 - Complete
// $350A9B: [8-bit] Mission 27 - Dizzy
//          b0 - Complete
// $350A9C: [8-bit] Mission 27 - Slayer
//          b0 - Complete
// $350A9D: [8-bit] Mission 27 - I-No
//          b0 - Complete
// $350A9E: [8-bit] Mission 27 - Zappa
//          b0 - Complete
// $350A9F: [8-bit] Mission 27 - Bridget
//          b0 - Complete
// $350AA0: [8-bit] Mission 27 - Robo-Ky
//          b0 - Complete
// $350AA1: [8-bit] Mission 27 - A.B.A
//          b0 - Complete
// $350AA2: [8-bit] Mission 27 - Order Sol
//          b0 - Complete
// $350AA3: [8-bit] Mission 27 - Kliff
//          b0 - Complete
// $350AA4: [8-bit] Mission 27 - Justice
//          b0 - Complete
// $350AA5: [8-bit] Mission 28 - Sol
//          b0 - Complete
// $350AA6: [8-bit] Mission 28 - Ky
//          b0 - Complete
// $350AA7: [8-bit] Mission 28 - May
//          b0 - Complete
// $350AA8: [8-bit] Mission 28 - Millia
//          b0 - Complete
// $350AA9: [8-bit] Mission 28 - Axl
//          b0 - Complete
// $350AAA: [8-bit] Mission 28 - Potemkin
//          b0 - Complete
// $350AAB: [8-bit] Mission 28 - Chipp
//          b0 - Complete
// $350AAC: [8-bit] Mission 28 - Eddie
//          b0 - Complete
// $350AAD: [8-bit] Mission 28 - Baiken
//          b0 - Complete
// $350AAE: [8-bit] Mission 28 - Faust
//          b0 - Complete
// $350AAF: [8-bit] Mission 28 - Testament
//          b0 - Complete
// $350AB0: [8-bit] Mission 28 - Jam
//          b0 - Complete
// $350AB1: [8-bit] Mission 28 - Anji
//          b0 - Complete
// $350AB2: [8-bit] Mission 28 - Johnny
//          b0 - Complete
// $350AB3: [8-bit] Mission 28 - Venom
//          b0 - Complete
// $350AB4: [8-bit] Mission 28 - Dizzy
//          b0 - Complete
// $350AB5: [8-bit] Mission 28 - Slayer
//          b0 - Complete
// $350AB6: [8-bit] Mission 28 - I-No
//          b0 - Complete
// $350AB7: [8-bit] Mission 28 - Zappa
//          b0 - Complete
// $350AB8: [8-bit] Mission 28 - Bridget
//          b0 - Complete
// $350AB9: [8-bit] Mission 28 - Robo-Ky
//          b0 - Complete
// $350ABA: [8-bit] Mission 28 - A.B.A
//          b0 - Complete
// $350ABB: [8-bit] Mission 28 - Order Sol
//          b0 - Complete
// $350ABC: [8-bit] Mission 28 - Kliff
//          b0 - Complete
// $350ABD: [8-bit] Mission 28 - Justice
//          b0 - Complete
// $350ABE: [8-bit] Mission 29 - Sol
//          b0 - Complete
// $350ABF: [8-bit] Mission 29 - Ky
//          b0 - Complete
// $350AC0: [8-bit] Mission 29 - May
//          b0 - Complete
// $350AC1: [8-bit] Mission 29 - Millia
//          b0 - Complete
// $350AC2: [8-bit] Mission 29 - Axl
//          b0 - Complete
// $350AC3: [8-bit] Mission 29 - Potemkin
//          b0 - Complete
// $350AC4: [8-bit] Mission 29 - Chipp
//          b0 - Complete
// $350AC5: [8-bit] Mission 29 - Eddie
//          b0 - Complete
// $350AC6: [8-bit] Mission 29 - Baiken
//          b0 - Complete
// $350AC7: [8-bit] Mission 29 - Faust
//          b0 - Complete
// $350AC8: [8-bit] Mission 29 - Testament
//          b0 - Complete
// $350AC9: [8-bit] Mission 29 - Jam
//          b0 - Complete
// $350ACA: [8-bit] Mission 29 - Anji
//          b0 - Complete
// $350ACB: [8-bit] Mission 29 - Johnny
//          b0 - Complete
// $350ACC: [8-bit] Mission 29 - Venom
//          b0 - Complete
// $350ACD: [8-bit] Mission 29 - Dizzy
//          b0 - Complete
// $350ACE: [8-bit] Mission 29 - Slayer
//          b0 - Complete
// $350ACF: [8-bit] Mission 29 - I-No
//          b0 - Complete
// $350AD0: [8-bit] Mission 29 - Zappa
//          b0 - Complete
// $350AD1: [8-bit] Mission 29 - Bridget
//          b0 - Complete
// $350AD2: [8-bit] Mission 29 - Robo-Ky
//          b0 - Complete
// $350AD3: [8-bit] Mission 29 - A.B.A
//          b0 - Complete
// $350AD4: [8-bit] Mission 29 - Order Sol
//          b0 - Complete
// $350AD5: [8-bit] Mission 29 - Kliff
//          b0 - Complete
// $350AD6: [8-bit] Mission 29 - Justice
//          b0 - Complete
// $350AD7: [8-bit] Mission 30 - Sol
//          b0 - Complete
// $350AD8: [8-bit] Mission 30 - Ky
//          b0 - Complete
// $350AD9: [8-bit] Mission 30 - May
//          b0 - Complete
// $350ADA: [8-bit] Mission 30 - Millia
//          b0 - Complete
// $350ADB: [8-bit] Mission 30 - Axl
//          b0 - Complete
// $350ADC: [8-bit] Mission 30 - Potemkin
//          b0 - Complete
// $350ADD: [8-bit] Mission 30 - Chipp
//          b0 - Complete
// $350ADE: [8-bit] Mission 30 - Eddie
//          b0 - Complete
// $350ADF: [8-bit] Mission 30 - Baiken
//          b0 - Complete
// $350AE0: [8-bit] Mission 30 - Faust
//          b0 - Complete
// $350AE1: [8-bit] Mission 30 - Testament
//          b0 - Complete
// $350AE2: [8-bit] Mission 30 - Jam
//          b0 - Complete
// $350AE3: [8-bit] Mission 30 - Anji
//          b0 - Complete
// $350AE4: [8-bit] Mission 30 - Johnny
//          b0 - Complete
// $350AE5: [8-bit] Mission 30 - Venom
//          b0 - Complete
// $350AE6: [8-bit] Mission 30 - Dizzy
//          b0 - Complete
// $350AE7: [8-bit] Mission 30 - Slayer
//          b0 - Complete
// $350AE8: [8-bit] Mission 30 - I-No
//          b0 - Complete
// $350AE9: [8-bit] Mission 30 - Zappa
//          b0 - Complete
// $350AEA: [8-bit] Mission 30 - Bridget
//          b0 - Complete
// $350AEB: [8-bit] Mission 30 - Robo-Ky
//          b0 - Complete
// $350AEC: [8-bit] Mission 30 - A.B.A
//          b0 - Complete
// $350AED: [8-bit] Mission 30 - Order Sol
//          b0 - Complete
// $350AEE: [8-bit] Mission 30 - Kliff
//          b0 - Complete
// $350AEF: [8-bit] Mission 30 - Justice
//          b0 - Complete

function CharacterMission(character-1) =>
  sum_of(range(0x350802 + (character*1),0x350AD7 + (character*1),step=25), addr => byte(addr) // might need to divide

// $350AF0: [8-bit] Mission 1 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF1: [8-bit] Mission 2 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF2: [8-bit] Mission 3 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF3: [8-bit] Mission 4 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF4: [8-bit] Mission 5 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF5: [8-bit] Mission 6 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF6: [8-bit] Mission 7 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF7: [8-bit] Mission 8 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF8: [8-bit] Mission 9 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AF9: [8-bit] Mission 10 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AFA: [8-bit] Mission 11 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AFB: [8-bit] Mission 12 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AFC: [8-bit] Mission 13 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AFD: [8-bit] Mission 14 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AFE: [8-bit] Mission 15 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350AFF: [8-bit] Mission 16 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B00: [8-bit] Mission 17 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B01: [8-bit] Mission 18 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B02: [8-bit] Mission 19 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B03: [8-bit] Mission 20 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B04: [8-bit] Mission 21 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B05: [8-bit] Mission 22 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B06: [8-bit] Mission 23 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B07: [8-bit] Mission 24 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B08: [8-bit] Mission 25 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B09: [8-bit] Mission 26 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B0A: [8-bit] Mission 27 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B0B: [8-bit] Mission 28 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B0C: [8-bit] Mission 29 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C
// $350B0D: [8-bit] Mission 30 Rank
//          0x00 - None, 0x01 - GGXX, 0x02 - GGX, 0x03 - GG, 0x04 - S, 0x05 - A, 0x06 - B, 0x07 - C

function MissionProgress() =>
  sum_of(range(0x350AF0,0x350B0D,step=1), addr => byte(addr)/byte(addr)

// $350B2C: [8-bit] Gallery - Special - Special Illustration 1
//          Bit0 - Unlocked
// $350B2D: [8-bit] Gallery - Special - Special Illustration 2
//          Bit0 - Unlocked
// $350B2E: [8-bit] Gallery - Special - Special Illustration 3
//          Bit0 - Unlocked
// $350B2F: [8-bit] Gallery - Special - Special Illustration 4
//          Bit0 - Unlocked
// $350B30: [8-bit] Gallery - Special - Special Illustration 5
//          Bit0 - Unlocked
// $350B31: [8-bit] Gallery - Special - Special Illustration 6
//          Bit0 - Unlocked
// $350B32: [8-bit] Gallery - Special - Special Illustration 7
//          Bit0 - Unlocked
// $350B33: [8-bit] Gallery - Special - Special Illustration 8
//          Bit0 - Unlocked
// $350B34: [8-bit] Gallery - Special - Special Illustration 9
//          Bit0 - Unlocked
// $350B35: [8-bit] Gallery - Special - Special Illustration 10
//          Bit0 - Unlocked
// $350B36: [8-bit] Gallery - Special - Special Illustration 11
//          Bit0 - Unlocked
// $350B37: [8-bit] Gallery - Special - Special Illustration 12
//          Bit0 - Unlocked
// $350B38: [8-bit] Gallery - Special - Special Illustration 13
//          Bit0 - Unlocked
// $350B39: [8-bit] Gallery - Special - Special Illustration 14
//          Bit0 - Unlocked
// $350B3A: [8-bit] Gallery - Special - Special Illustration 15
//          Bit0 - Unlocked
// $350B3B: [8-bit] Gallery - Special - Special Illustration 16
//          Bit0 - Unlocked
// $350B3C: [8-bit] Gallery - Special - Special Illustration 17
//          Bit0 - Unlocked
// $350B3D: [8-bit] Gallery - Special - Special Illustration 18
//          Bit0 - Unlocked
// $350B3E: [8-bit] Gallery - Special - Special Illustration 19
//          Bit0 - Unlocked
function GallerySpecial() =>
  sum_of(range(0x350B2C,0x350B3E,step=1), addr => byte(addr)
// $350B3F: [8-bit] Gallery - Secret - Secret Voice 1
//          Bit0 - Unlocked
// $350B40: [8-bit] Gallery - Secret - Secret Voice 2
//          Bit0 - Unlocked
// $350B41: [8-bit] Gallery - Secret - Secret Voice 3
//          Bit0 - Unlocked
// $350B42: [8-bit] Gallery - Secret - Secret Voice 4
//          Bit0 - Unlocked
// $350B43: [8-bit] Gallery - Secret - Secret Voice 5
//          Bit0 - Unlocked
// $350B44: [8-bit] Gallery - Secret - Secret Voice 6
//          Bit0 - Unlocked
// $350B45: [8-bit] Gallery - Secret - Secret Voice 7
//          Bit0 - Unlocked
function GallerySecret() =>
  sum_of(range(0x350B3F,0x350B45,step=1), addr => byte(addr)
// $350B70: [8-bit] Gallery - Arcade Mode - Sol
//          b0 - Unlocked
// $350B71: [8-bit] Gallery - Arcade Mode - Ky
//          b0 - Unlocked
// $350B72: [8-bit] Gallery - Arcade Mode - May
//          b0 - Unlocked
// $350B73: [8-bit] Gallery - Arcade Mode - Millia
//          b0 - Unlocked
// $350B74: [8-bit] Gallery - Arcade Mode - Axl
//          b0 - Unlocked
// $350B75: [8-bit] Gallery - Arcade Mode - Potemkin
//          b0 - Unlocked
// $350B76: [8-bit] Gallery - Arcade Mode - Chipp
//          b0 - Unlocked
// $350B77: [8-bit] Gallery - Arcade Mode - Eddie
//          b0 - Unlocked
// $350B78: [8-bit] Gallery - Arcade Mode - Baiken
//          b0 - Unlocked
// $350B79: [8-bit] Gallery - Arcade Mode - Faust
//          b0 - Unlocked
// $350B7A: [8-bit] Gallery - Arcade Mode - Testament
//          b0 - Unlocked
// $350B7B: [8-bit] Gallery - Arcade Mode - Jam
//          b0 - Unlocked
// $350B7C: [8-bit] Gallery - Arcade Mode - Anji
//          b0 - Unlocked
// $350B7D: [8-bit] Gallery - Arcade Mode - Johnny
//          b0 - Unlocked
// $350B7E: [8-bit] Gallery - Arcade Mode - Venom
//          b0 - Unlocked
// $350B7F: [8-bit] Gallery - Arcade Mode - Dizzy
//          b0 - Unlocked
// $350B80: [8-bit] Gallery - Arcade Mode - Slayer
//          b0 - Unlocked
// $350B81: [8-bit] Gallery - Arcade Mode - I-No
//          b0 - Unlocked
// $350B82: [8-bit] Gallery - Arcade Mode - Zappa
//          b0 - Unlocked
// $350B83: [8-bit] Gallery - Arcade Mode - Bridget
//          b0 - Unlocked
// $350B84: [8-bit] Gallery - Arcade Mode - Robo-Ky
//          b0 - Unlocked
// $350B85: [8-bit] Gallery - Arcade Mode - A.B.A.
//          b0 - Unlocked
// $350B86: [8-bit] Gallery - Arcade Mode - Order Sol
//          b0 - Unlocked
// $350B87: [8-bit] Gallery - Arcade Mode - Kliff
//          b0 - Unlocked
// $350B88: [8-bit] Gallery - Arcade Mode - Justice
//          b0 - Unlocked
// $350B89: [8-bit] Gallery - EX Character - EX Sol
//          b0 - Unlocked
// $350B8A: [8-bit] Gallery - EX Character - EX Ky
//          b0 - Unlocked
// $350B8B: [8-bit] Gallery - EX Character - EX May
//          b0 - Unlocked
// $350B8C: [8-bit] Gallery - EX Character - EX Millia
//          b0 - Unlocked
// $350B8D: [8-bit] Gallery - EX Character - EX Axl
//          b0 - Unlocked
// $350B8E: [8-bit] Gallery - EX Character - EX Potemkin
//          b0 - Unlocked
// $350B8F: [8-bit] Gallery - EX Character - EX Chipp
//          b0 - Unlocked
// $350B90: [8-bit] Gallery - EX Character - EX Eddie
//          b0 - Unlocked
// $350B91: [8-bit] Gallery - EX Character - EX Baiken
//          b0 - Unlocked
// $350B92: [8-bit] Gallery - EX Character - EX Faust
//          b0 - Unlocked
// $350B93: [8-bit] Gallery - EX Character - EX Testament
//          b0 - Unlocked
// $350B94: [8-bit] Gallery - EX Character - EX Jam
//          b0 - Unlocked
// $350B95: [8-bit] Gallery - EX Character - EX Anji
//          b0 - Unlocked
// $350B96: [8-bit] Gallery - EX Character - EX Johnny
//          b0 - Unlocked
// $350B97: [8-bit] Gallery - EX Character - EX Venom
//          b0 - Unlocked
// $350B98: [8-bit] Gallery - EX Character - EX Dizzy
//          b0 - Unlocked
// $350B99: [8-bit] Gallery - EX Character - EX Slayer
//          b0 - Unlocked
// $350B9A: [8-bit] Gallery - EX Character - EX I-No
//          b0 - Unlocked
// $350B9B: [8-bit] Gallery - EX Character - EX Zappa
//          b0 - Unlocked
// $350B9C: [8-bit] Gallery - EX Character - EX Bridget
//          b0 - Unlocked
// $350B9D: [8-bit] Gallery - EX Character - EX Robo-Ky
//          b0 - Unlocked
// $350B9E: [8-bit] Gallery - EX Character - EX A.B.A.
//          b0 - Unlocked
// $350B9F: [8-bit] Gallery - EX Character - EX Order Sol
//          b0 - Unlocked

function GalleryArcade() =>
  sum_of(range(0x350B70,350B9F,step=1), addr => byte(addr)

// $350BA2: [8-bit] Gallery - Story Mode - Sol
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BA3: [8-bit] Gallery - Story Mode - Ky
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BA4: [8-bit] Gallery - Story Mode - May
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BA5: [8-bit] Gallery - Story Mode - Millia
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BA6: [8-bit] Gallery - Story Mode - Axl
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BA7: [8-bit] Gallery - Story Mode - Potemkin
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BA8: [8-bit] Gallery - Story Mode - Chipp
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BA9: [8-bit] Gallery - Story Mode - Eddie
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BAA: [8-bit] Gallery - Story Mode - Baiken
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BAB: [8-bit] Gallery - Story Mode - Faust
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BAC: [8-bit] Gallery - Story Mode - Testament
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BAD: [8-bit] Gallery - Story Mode - Jam
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BAE: [8-bit] Gallery - Story Mode - Anji
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BAF: [8-bit] Gallery - Story Mode - Johnny
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB0: [8-bit] Gallery - Story Mode - Venom
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB1: [8-bit] Gallery - Story Mode - Dizzy
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB2: [8-bit] Gallery - Story Mode - Slayer
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB3: [8-bit] Gallery - Story Mode - I-No
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB4: [8-bit] Gallery - Story Mode - Zappa
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB5: [8-bit] Gallery - Story Mode - Bridget
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB6: [8-bit] Gallery - Story Mode - Robo-Ky
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB7: [8-bit] Gallery - Story Mode - A.B.A.
//          Bit0 - Ending 1 unlocked
//          Bit1 - Ending 2 unlocked
// $350BB8: [8-bit] Gallery - Story Mode - Order Sol
//          Bit0 - Ending 1 unlocked
// $350BB9: [8-bit] Gallery - Story Mode - Kliff
//          Bit0 - Ending 1 unlocked
// $350BBA: [8-bit] Gallery - Story Mode - Justice
//          Bit0 - Ending 1 unlocked

function GalleryStory() => 
  sum_of(range(0x350BA2,350BBA,step=1), addr => bitcount(addr)

// $350BBB: [8-bit] Display settings - Anti alias
//          0x00 - Off
//          0x01 - On
// $350BBC: [8-bit] Game options - Victory BGM
//          0x00 - Mute (Default)
//          0x01 - Fade
//          0x02 - Intact
// $350BBD: [8-bit] Display settings - Position gauges
//          0x00 - Normal
//          0x01 - Original
// $350BBE: [8-bit] Game settings - Sol voice
//          0x00 - Ishiwatari
//          0x01 - George
// $350BBF: [8-bit] Game settings - Order Sol voice
//          0x00 - Ishiwatari
//          0x01 - George
// $3C6A18: [8-bit] Player 1 Character
//          0x00 - None
//          0x01 - Sol
//          0x02 - Ky
//          0x03 - May
//          0x04 - Millia
//          0x05 - Axl
//          0x06 - Potemkin
//          0x07 - Chipp
//          0x08 - Eddie
//          0x09 - Baiken
//          0x0a - Faust
//          0x0b - Testament
//          0x0c - Jam
//          0x0d - Anji
//          0x0e - Johnny
//          0x0f - Venom
//          0x10 - Dizzy
//          0x11 - Slayer
//          0x12 - I-No
//          0x13 - Zappa
//          0x14 - Bridget
//          0x15 - Robo-Ky
//          0x16 - A.B.A.
//          0x17 - Order Sol
//          0x18 - Kliff
//          0x19 - Justice

Character1P = byte(0x3C6A18)

// $3C6A1A: [8-bit] Player 2/CPU Character
//          0x00 - None
//          0x01 - Sol
//          0x02 - Ky
//          0x03 - May
//          0x04 - Millia
//          0x05 - Axl
//          0x06 - Potemkin
//          0x07 - Chipp
//          0x08 - Eddie
//          0x09 - Baiken
//          0x0a - Faust
//          0x0b - Testament
//          0x0c - Jam
//          0x0d - Anji
//          0x0e - Johnny
//          0x0f - Venom
//          0x10 - Dizzy
//          0x11 - Slayer
//          0x12 - I-No
//          0x13 - Zappa
//          0x14 - Bridget
//          0x15 - Robo-Ky
//          0x16 - A.B.A.
//          0x17 - Order Sol
//          0x18 - Kliff
//          0x19 - Justice

Character2P = byte(0x3C6A1A)

// $3C6A9C: [8-bit] Player 1 color
//          0x0e - Gold
//          0x13 - Shadow
// $3C6A9E: [8-bit] Player 2 color
//          0x0e - Gold
//          0x13 - Shadow
// $3C6AD0: [32-bit] Player 1 Score - Arcade/M.O.M./Survival
// $3C6B14: amount of rounds played
// $3C6B20: [8-bit] Arcade/M.O.M. status; use if 0x3C6B55 == 0 and 0x3C6b54 > 0
//          0x00 - Arcade mode
//          0x01 - M.O.M. mode
// $3C6B54: [8-bit] Active players
//          0x00 - None; no active mode. this changes immediately upon choosing a mode
//          bit0 - Player 1 active
//          bit1 - Player 2 active

OnePlayer = bit0(0x3C6B54) + bit1(0x3C6B54) == 1
TwoPlayer = bit0(0x3C6B54) + bit1(0x3C6B54) == 2

// $3C6B55: [bitflags] Current mode
//          0x00 - Arcade/M.O.M.; see 0x3C6B55
//          bit0 - Training (0x01)
//          bit1 - Survival (0x02)
//          bit3 - VS. 2P / Team VS. 2P(0x08); see 0x3C6B56
//          bit5 - VS. CPU / Team VS. CPU (0x20); see 0x3C6B56
//          bit6 - Story (0x40)
//          bit7 - Mission (0x80)

ArcadeMode = byte(0x3C6B55) == 0 && byte(0x3C6B20) == 0
TrainingMode = bit0(0x3C6B55) == 1
SurvivalMode = bit1(0x3C6B55) == 1
VS2P = bit3(0x3C6B55) == 1 && bit2(0x3C6B56) == 0
VS2PTeam = bit3(0x3C6B55) == 1 && bit2(0x3C6B56) == 1
VSCPU = bit5(0x3C6B55) == 1 && bit2(0x3C6B56) == 0
VSCPUTeam = bit5(0x3C6B55) == 1 && bit2(0x3C6B56) == 1
StoryMode = bit6(0x3C6B55) == 1
MissionMode = bit7(0x3C6B55) == 1

// $3C6B56: [8-bit] Team VS status; each side selects 3 characters
//          bit2 - Active
// $3C6B70: [8-bit] Arcade/M.O.M modifier - Gold; this affects all opponents
//          b0 - Gold opponents activated
// $3C6B74: [8-bit] Arcade/M.O.M modifier - EX; this affects all opponents
//          b0 - EX opponents activated
// $3C6B78: [8-bit] Player 1 special mode
//          0x00 - Normal
//          0x01 - Gold
//          0x02 - Darkside
// $3C6B7C: [8-bit] Player 2/CPU special mode
//          0x00 - Normal
//          0x01 - Gold
//          0x02 - Darkside
// $3C6B80: [8-bit] Player 1 movelist
//          0x00 - Normal
//          0x01 - EX
// $3C6B84: [8-bit] Player 2/CPU movelist
//          0x00 - Normal
//          0x01 - EX
// $3C6B88: [8-bit] Player 1 character mode
//          0x00 - Normal
//          0x01 - GG
//          0x02 - GGX
// $3C6B8C: [8-bit] Player 2/CPU character mode
//          0x00 - Normal
//          0x01 - GG
//          0x02 - GGX
// $3C6BA4: [32-bit] potential game file timer?
// $3C6C10: [16-bit] Tension - Player 1
//          0x2710 - Max Tension
// $3C6C2A: [16-bit] Player 1 Guard meter
//          0x0000 - Neutral
//          0x0080 - Full
//          0xff80 - Empty
// $3C6C44: [8-bit] turns 0x01 when using burst
// $3C6D08: [32-bit] Player 1 Burst meter
//          0x1138a - Empty meter
//          0x13a98 - Full meter; ready to use burst
// $3C6D58: [16-bit] Tension - Player 2/CPU
//          0x2710 - Max Tension
// $3C6E56: [8-bit] Current combo count; resets to 0x00 when combo window is over
// $3C6E58: [8-bit] Most recent combo total
// $3C9000: [8-bit] Most recent Main Menu option selected
//          0x00 - Arcade
//          0x01 - M.O.M.
//          0x02 - VS 2P
//          0x03 - VS CPU
//          0x04 - Team VS 2P
//          0x05 - Team VS CPU
//          0x06 - Training
//          0x07 - Survival
//          0x08 - Mission
//          0x09 - Story
//          0x0a - Gallery
//          0x0b - Sound
//          0x0d - Exit
// $3D4A10: [8-bit] VS CPU - Stage selected
// $3D4A14: [8-bit] VS CPU - BGM selected
// $3D4A18: select mode
// $3D4A19: p2 select mode
// $3D4A20: select ex
// $3D4A21: p2 select ex
// $3D4A68: color set p1
// $3D4A6C: color set p2
// $3E99B8: [32-bit] Round Timer (Frames); counts down every frame and converts to decimal for display as an integer on the clock
//          --- 0xffffffc4 - Infinite timer; does not count down
// $3E99CC: [8-bit] Painting shown in London stage
//          0x00 - Bridge
//          0x01 - Alien

LondonPainting = byte(0x3E99CC)

// $3F4370: [32-bit] Training? Total damage of current combo
// $3F4374: [32-bit] Training - Damage of most recent attack; only
// $3F4378: [32-bit] Training - Damage of most recent combo
// $3F437C: [32-bit] Training - Max damage from training session
// $3F4380: [32-bit] Training - Max combo hits from training session
// $3F4394: [8-bit] Training - Player 1 HP (Max 0x80)
// $3F4396: [8-bit] Training - Player 2 / CPU HP (Max 0x80)
// $455B94: [8-bit] Inputs - 1P Select
//          Bit0 - Pressed
// $455B97: [8-bit] Inputs - 1P Start
//          Bit0 - Pressed
// $455B98: [8-bit] Inputs - 1P D-Pad Up
//          Bit0 - Pressed
// $455B99: [8-bit] Inputs - 1P D-Pad Right
//          Bit0 - Pressed
// $455B9A: [8-bit] Inputs - 1P D-Pad Down
//          Bit0 - Pressed
// $455B9B: [8-bit] Inputs - 1P D-Pad Left
//          Bit0 - Pressed
// $455B9C: [8-bit] Inputs - 1P L2
//          Bit0 - Pressed
// $455B9D: [8-bit] Inputs - 1P R2
//          Bit0 - Pressed
// $455B9E: [8-bit] Inputs - 1P L1
//          Bit0 - Pressed
// $455B9F: [8-bit] Inputs - 1P R1
//          Bit0 - Pressed
// $455BA0: [8-bit] Inputs - 1P Triangle
//          Bit0 - Pressed
// $455BA1: [8-bit] Inputs - 1P Circle
//          Bit0 - Pressed
// $455BA2: [8-bit] Inputs - 1P Cross
//          Bit0 - Pressed
// $455BA3: [8-bit] Inputs - 1P Square
//          Bit0 - Pressed
// $461610: [8-bit] Gallery - Total owned display; only updates when going into gallery
// $4A225A: X position cursor in menu
// $4A225E: Y position cursor in menu
// $4A227C: Selected Character 1P?
//          0x00 - Sol
//          0x01 - Ky
//          0x02 - May
//          0x03 - Millia
//          0x04 - Axl
//          0x05 - Potemkin
//          0x06 - Chipp
//          0x07 - Eddie
//          0x08 - Baiken
//          0x09 - Faust
//          0x0a - Testament
//          0x0b - Jam
//          0x0c - Anji
//          0x0d - Johnny
//          0x0e - Venom
//          0x0f - Dizzy
//          0x10 - Slayer
//          0x11 - I-No
//          0x12 - Zappa
//          0x13 - Bridget
//          0x14 - Robo-Ky
//          0x15 - A.B.A.
//          0x16 - Order Sol
//          0x17 - Kliff ??
//          0x18 - Justice ??
// $4A232C: Selected Character 2P/CPU?
// $1E5B01E: [16-bit] HP - Player 1
//           0x01a4 - Max HP
// $1E5B0F4: [16-bit] 1P Animation
// $1E5B142: [16-bit] HP - Player 2/CPU
//           0x01a4 - Max HP

//Data

AllCharacters = range(1,19)
//Functions
function FullGallery() = GallerySpecial() + GallerySecret() + GalleryArcade() + GalleryStory()
//Achievements

//Leaderboards

//RP
