// Patchwork Heroes
// #ID = 3938

// $B74267: 1 in menus 0 in game/main menu?
// $BC0538: [8-bit] Pause status
//          Bit0 - Paused
// $BC0562: [8-bit] Difficulty; changes when a difficulty is selected for a level
//          0x00 - Easy
//          0x01 - Normal / Time Attack
//          0x02 - Hard
//          0x03 - Pro
LoadProtection = byte(0x102F154) != 6
Difficulty = byte(0xBC0562)
    Easy = 0
    Normal = 1
    Hard = 2
    Pro = 3
DifficultyLookup = {
    0:"Easy",
    1:"Normal",
    2:"Hard",
    3:"Pro"
}
// $BC0563: [8-bit] Time Attack status
//          Bit0 - Active
TimeAttackActive = bit0(0xBC0563) == 1
// $BC056C: [32-bit] Playtime (frames, 30fps); seems to move a little faster in menu, but keeps proper time during stages
Playtime = dword(0xBC056C) / 1800
// $BC0574: [8-bit] Records - Rank
//          0x00 - Trainee (default)
//          0x01 - Temp Staff (unlocks Resident Card); 50 bolts
//          0x02 - Full Timer (unlocks Graveyard); 150 bolts
//          0x03 - New Captain (unlocks Hard difficulty); 300 bolts
//          0x04 - Feelgood Captain (unlocks Theme Song); 600 bolts
//          0x05 - Captain Gung-ho (unlocks So dark, so scary); 1,200 bolts
//          0x06 - Steadfast Captain (unlocks Pro difficulty); 2,400 bolts
//          0x07 - Captain Charisma (unlocks Challenges 41-50); 4,800 bolts
//          0x08 - King of Captains (unlocks Gallery); 7,500 bolts
//          0x09 - Captain Legend (unlocks Thank You); 10,000 bolts
Rank = byte(0xBC0574)
RankLookup = {
    0: "Trainee",
    1: "Temp Staff",
    2: "Full Timer",
    3: "New Captain",
    4: "Feelgood Captain",
    5: "Captain Gung-ho",
    6: "Steadfast Captain",
    7: "Captain Charisma",
    8: "King of Captains",
    9: "Captain Legend"
}
RankData = {
    0: {"title":"Trainee","points":0},
    1: {"title":"Temp Staff","points":3,"unlock":"the Resident Card in Records"},
    2: {"title":"Full Timer","points":3,"unlock":"the Graveyard in Records"},
    3: {"title":"New Captain","points":3,"unlock":"Hard difficulty"},
    4: {"title":"Feelgood Captain","points":3,"unlock":"the Theme Song in Records"},
    5: {"title":"Captain Gung-ho","points":5,"unlock":"So dark, so scary in Records"},
    6: {"title":"Steadfast Captain","points":5,"unlock":"Pro difficulty"},
    7: {"title":"Captain Charisma","points":5,"unlock":"Challenges 41-50"},
    8: {"title":"King of Captains","points":5,"unlock":"the Gallery in Records"},
    9: {"title":"Captain Legend","points":10,"unlock":"a Thank You in Records"}
}
// $BC0578: [32-bit] Total screws
Screws = dword(0xBC0578)
// $BC057C: [32-bit] Story 1 - Easy - Best Score 1 (5-star: 30,000 points)
// $BC0580: [32-bit] Story 1 - Easy - Best Score 2
// $BC0584: [32-bit] Story 1 - Easy - Best Score 3
// $BC0588: [32-bit] Story 1 - Normal - Best Score 1 (5-star: 60,000 points)
// $BC058C: [32-bit] Story 1 - Normal - Best Score 2
// $BC0590: [32-bit] Story 1 - Normal - Best Score 3
// $BC0594: [32-bit] Story 1 - Hard - Best Score 1 (5-star: 75,000 points)
// $BC0598: [32-bit] Story 1 - Hard - Best Score 2
// $BC059C: [32-bit] Story 1 - Hard - Best Score 3
// $BC05A0: [32-bit] Story 1 - Pro - Best Score 1 (5-star: 100,000 points)
// $BC05A4: [32-bit] Story 1 - Pro - Best Score 2
// $BC05A8: [32-bit] Story 1 - Pro - Best Score 3
// $BC05AC: [32-bit] Story 1 - Time Attack - Best Time 1 (frames; 30fps)
// $BC05B0: [32-bit] Story 1 - Time Attack - Best Time 2 (frames; 30fps)
// $BC05B4: [32-bit] Story 1 - Time Attack - Best Time 3 (frames; 30fps)
// $BC05B8: Story/Tutorial/Challenge clears change to 0x01 when complete; offset is 0x44 between each level for that particular difficulty
//          ---------------------------------------
//          [8-bit] Story 1 - Easy clear
// $BC05B9: [8-bit] Story 1 - Normal clear
// $BC05BA: [8-bit] Story 1 - Hard clear
// $BC05BB: [8-bit] Story 1 - Pro clear
// $BC05BC: [8-bit] Story 1 unlocked
// $BC05C0: [32-bit] Story 2 - Easy - Best Score 1 (5-star: 28,000 points)
// $BC05C4: [32-bit] Story 2 - Easy - Best Score 2
// $BC05C8: [32-bit] Story 2 - Easy - Best Score 3
// $BC05CC: [32-bit] Story 2 - Normal - Best Score 1 (5-star: 45,000 points)
// $BC05D0: [32-bit] Story 2 - Normal - Best Score 2
// $BC05D4: [32-bit] Story 2 - Normal - Best Score 3
// $BC05D8: [32-bit] Story 2 - Hard - Best Score 1 (5-star: 80,000 points)
// $BC05DC: [32-bit] Story 2 - Hard - Best Score 2
// $BC05E0: [32-bit] Story 2 - Hard - Best Score 3
// $BC05E4: [32-bit] Story 2 - Pro - Best Score 1 (5-star: 110,000 points)
// $BC05E8: [32-bit] Story 2 - Pro - Best Score 2
// $BC05EC: [32-bit] Story 2 - Pro - Best Score 3
// $BC05F0: [32-bit] Story 2 - Time Attack - Best Time 1 (frames; 30fps)
// $BC05F4: [32-bit] Story 2 - Time Attack - Best Time 2 (frames; 30fps)
// $BC05F8: [32-bit] Story 2 - Time Attack - Best Time 3 (frames; 30fps)
// $BC05FC: [8-bit] Story 2 - Easy clear
// $BC05FD: [8-bit] Story 2 - Normal clear
// $BC05FE: [8-bit] Story 2 - Hard clear
// $BC05FF: [8-bit] Story 2 - Pro clear
// $BC0604: [32-bit] Story 3 - Easy - Best Score 1 (5-star: 20,000 points)
// $BC0608: [32-bit] Story 3 - Easy - Best Score 2
// $BC060C: [32-bit] Story 3 - Easy - Best Score 3
// $BC0610: [32-bit] Story 3 - Normal - Best Score 1 (5-star: 35,000 points)
// $BC0614: [32-bit] Story 3 - Normal - Best Score 2
// $BC0618: [32-bit] Story 3 - Normal - Best Score 3
// $BC061C: [32-bit] Story 3 - Hard - Best Score 1 (5-star: 55,000 points)
// $BC0620: [32-bit] Story 3 - Hard - Best Score 2
// $BC0624: [32-bit] Story 3 - Hard - Best Score 3
// $BC0628: [32-bit] Story 3 - Pro - Best Score 1 (5-star: 85,000 points)
// $BC062C: [32-bit] Story 3 - Pro - Best Score 2
// $BC0630: [32-bit] Story 3 - Pro - Best Score 3
// $BC0634: [32-bit] Story 3 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0638: [32-bit] Story 3 - Time Attack - Best Time 2 (frames; 30fps)
// $BC063C: [32-bit] Story 3 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0640: [8-bit] Story 3 - Easy clear
// $BC0641: [8-bit] Story 3 - Normal clear
// $BC0642: [8-bit] Story 3 - Hard clear
// $BC0643: [8-bit] Story 3 - Pro clear
// $BC0648: [32-bit] Story 4 - Easy - Best Score 1 (5-star: 26,000 points)
// $BC064C: [32-bit] Story 4 - Easy - Best Score 2
// $BC0650: [32-bit] Story 4 - Easy - Best Score 3
// $BC0654: [32-bit] Story 4 - Normal - Best Score 1 (5-star: 60,000 points)
// $BC0658: [32-bit] Story 4 - Normal - Best Score 2
// $BC065C: [32-bit] Story 4 - Normal - Best Score 3
// $BC0660: [32-bit] Story 4 - Hard - Best Score 1 (5-star: 100,000 points)
// $BC0664: [32-bit] Story 4 - Hard - Best Score 2
// $BC0668: [32-bit] Story 4 - Hard - Best Score 3
// $BC066C: [32-bit] Story 4 - Pro - Best Score 1 (5-star: 150,000 points)
// $BC0670: [32-bit] Story 4 - Pro - Best Score 2
// $BC0674: [32-bit] Story 4 - Pro - Best Score 3
// $BC0678: [32-bit] Story 4 - Time Attack - Best Time 1 (frames; 30fps)
// $BC067C: [32-bit] Story 4 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0680: [32-bit] Story 4 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0684: [8-bit] Story 4 - Easy clear
// $BC0685: [8-bit] Story 4 - Normal clear
// $BC0686: [8-bit] Story 4 - Hard clear
// $BC0687: [8-bit] Story 4 - Pro clear
// $BC068C: [32-bit] Story 5 - Easy - Best Score 1 (5-star: 50,000 points)
// $BC0690: [32-bit] Story 5 - Easy - Best Score 2
// $BC0694: [32-bit] Story 5 - Easy - Best Score 3
// $BC0698: [32-bit] Story 5 - Normal - Best Score 1 (5-star: 110,000 points)
// $BC069C: [32-bit] Story 5 - Normal - Best Score 2
// $BC06A0: [32-bit] Story 5 - Normal - Best Score 3
// $BC06A4: [32-bit] Story 5 - Hard - Best Score 1 (5-star: 200,000 points)
// $BC06A8: [32-bit] Story 5 - Hard - Best Score 2
// $BC06AC: [32-bit] Story 5 - Hard - Best Score 3
// $BC06B0: [32-bit] Story 5 - Pro - Best Score 1 (5-star: 220,000 points)
// $BC06B4: [32-bit] Story 5 - Pro - Best Score 2
// $BC06B8: [32-bit] Story 5 - Pro - Best Score 3
// $BC06BC: [32-bit] Story 5 - Time Attack - Best Time 1 (frames; 30fps)
// $BC06C0: [32-bit] Story 5 - Time Attack - Best Time 2 (frames; 30fps)
// $BC06C4: [32-bit] Story 5 - Time Attack - Best Time 3 (frames; 30fps)
// $BC06C8: [8-bit] Story 5 - Easy clear
// $BC06C9: [8-bit] Story 5 - Normal clear
// $BC06CA: [8-bit] Story 5 - Hard clear
// $BC06CB: [8-bit] Story 5 - Pro clear
// $BC06D0: [32-bit] Story 6 - Easy - Best Score 1 (5-star: 60,000 points)
// $BC06D4: [32-bit] Story 6 - Easy - Best Score 2
// $BC06D8: [32-bit] Story 6 - Easy - Best Score 3
// $BC06DC: [32-bit] Story 6 - Normal - Best Score 1 (5-star: 130,000 points)
// $BC06E0: [32-bit] Story 6 - Normal - Best Score 2
// $BC06E4: [32-bit] Story 6 - Normal - Best Score 3
// $BC06E8: [32-bit] Story 6 - Hard - Best Score 1 (5-star: 200,000 points)
// $BC06EC: [32-bit] Story 6 - Hard - Best Score 2
// $BC06F0: [32-bit] Story 6 - Hard - Best Score 3
// $BC06F4: [32-bit] Story 6 - Pro - Best Score 1 (5-star: 270,000 points)
// $BC06F8: [32-bit] Story 6 - Pro - Best Score 2
// $BC06FC: [32-bit] Story 6 - Pro - Best Score 3
// $BC0700: [32-bit] Story 6 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0704: [32-bit] Story 6 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0708: [32-bit] Story 6 - Time Attack - Best Time 3 (frames; 30fps)
// $BC070C: [8-bit] Story 6 - Easy clear
// $BC070D: [8-bit] Story 6 - Normal clear
// $BC070E: [8-bit] Story 6 - Hard clear
// $BC070F: [8-bit] Story 6 - Pro clear
// $BC0714: [32-bit] Story 7 - Easy - Best Score 1 (5-star: 85,000 points)
// $BC0718: [32-bit] Story 7 - Easy - Best Score 2
// $BC071C: [32-bit] Story 7 - Easy - Best Score 3
// $BC0720: [32-bit] Story 7 - Normal - Best Score 1 (5-star: 180,000 points)
// $BC0724: [32-bit] Story 7 - Normal - Best Score 2
// $BC0728: [32-bit] Story 7 - Normal - Best Score 3
// $BC072C: [32-bit] Story 7 - Hard - Best Score 1 (5-star: 270,000 points)
// $BC0730: [32-bit] Story 7 - Hard - Best Score 2
// $BC0734: [32-bit] Story 7 - Hard - Best Score 3
// $BC0738: [32-bit] Story 7 - Pro - Best Score 1 (5-star: 370,000 points)
// $BC073C: [32-bit] Story 7 - Pro - Best Score 2
// $BC0740: [32-bit] Story 7 - Pro - Best Score 3
// $BC0744: [32-bit] Story 7 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0748: [32-bit] Story 7 - Time Attack - Best Time 2 (frames; 30fps)
// $BC074C: [32-bit] Story 7 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0750: [8-bit] Story 7 - Easy clear
// $BC0751: [8-bit] Story 7 - Normal clear
// $BC0752: [8-bit] Story 7 - Hard clear
// $BC0753: [8-bit] Story 7 - Pro clear
// $BC0758: [32-bit] Story 8 - Easy - Best Score 1 (5-star: 70,000 points)
// $BC075C: [32-bit] Story 8 - Easy - Best Score 2
// $BC0760: [32-bit] Story 8 - Easy - Best Score 3
// $BC0764: [32-bit] Story 8 - Normal - Best Score 1 (5-star: 160,000 points)
// $BC0768: [32-bit] Story 8 - Normal - Best Score 2
// $BC076C: [32-bit] Story 8 - Normal - Best Score 3
// $BC0770: [32-bit] Story 8 - Hard - Best Score 1 (5-star: 240,000 points)
// $BC0774: [32-bit] Story 8 - Hard - Best Score 2
// $BC0778: [32-bit] Story 8 - Hard - Best Score 3
// $BC077C: [32-bit] Story 8 - Pro - Best Score 1 (5-star: 380,000 points)
// $BC0780: [32-bit] Story 8 - Pro - Best Score 2
// $BC0784: [32-bit] Story 8 - Pro - Best Score 3
// $BC0788: [32-bit] Story 8 - Time Attack - Best Time 1 (frames; 30fps)
// $BC078C: [32-bit] Story 8 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0790: [32-bit] Story 8 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0794: [8-bit] Story 8 - Easy clear
// $BC0795: [8-bit] Story 8 - Normal clear
// $BC0796: [8-bit] Story 8 - Hard clear
// $BC0797: [8-bit] Story 8 - Pro clear
// $BC079C: [32-bit] Story 9 - Easy - Best Score 1 (5-star: 70,000 points)
// $BC07A0: [32-bit] Story 9 - Easy - Best Score 2
// $BC07A4: [32-bit] Story 9 - Easy - Best Score 3
// $BC07A8: [32-bit] Story 9 - Normal - Best Score 1 (5-star: 170,000 points)
// $BC07AC: [32-bit] Story 9 - Normal - Best Score 2
// $BC07B0: [32-bit] Story 9 - Normal - Best Score 3
// $BC07B4: [32-bit] Story 9 - Hard - Best Score 1 (5-star: 250,000 points)
// $BC07B8: [32-bit] Story 9 - Hard - Best Score 2
// $BC07BC: [32-bit] Story 9 - Hard - Best Score 3
// $BC07C0: [32-bit] Story 9 - Pro - Best Score 1 (5-star: 380,000 points)
// $BC07C4: [32-bit] Story 9 - Pro - Best Score 2
// $BC07C8: [32-bit] Story 9 - Pro - Best Score 3
// $BC07CC: [32-bit] Story 9 - Time Attack - Best Time 1 (frames; 30fps)
// $BC07D0: [32-bit] Story 9 - Time Attack - Best Time 2 (frames; 30fps)
// $BC07D4: [32-bit] Story 9 - Time Attack - Best Time 3 (frames; 30fps)
// $BC07D8: [8-bit] Story 9 - Easy clear
// $BC07D9: [8-bit] Story 9 - Normal clear
// $BC07DA: [8-bit] Story 9 - Hard clear
// $BC07DB: [8-bit] Story 9 - Pro clear
// $BC07E0: [32-bit] Story 10 - Easy - Best Score 1 (5-star: 60,000 points)
// $BC07E4: [32-bit] Story 10 - Easy - Best Score 2
// $BC07E8: [32-bit] Story 10 - Easy - Best Score 3
// $BC07EC: [32-bit] Story 10 - Normal - Best Score 1 (5-star: 150,000 points)
// $BC07F0: [32-bit] Story 10 - Normal - Best Score 2
// $BC07F4: [32-bit] Story 10 - Normal - Best Score 3
// $BC07F8: [32-bit] Story 10 - Hard - Best Score 1 (5-star: 230,000 points)
// $BC07FC: [32-bit] Story 10 - Hard - Best Score 2
// $BC0800: [32-bit] Story 10 - Hard - Best Score 3
// $BC0804: [32-bit] Story 10 - Pro - Best Score 1 (5-star: 340,000 points)
// $BC0808: [32-bit] Story 10 - Pro - Best Score 2
// $BC080C: [32-bit] Story 10 - Pro - Best Score 3
// $BC0810: [32-bit] Story 10 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0814: [32-bit] Story 10 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0818: [32-bit] Story 10 - Time Attack - Best Time 3 (frames; 30fps)
// $BC081C: [8-bit] Story 10 - Easy clear
// $BC081D: [8-bit] Story 10 - Normal clear
// $BC081E: [8-bit] Story 10 - Hard clear
// $BC081F: [8-bit] Story 10 - Pro clear
// $BC0824: [32-bit] Story 11 - Easy - Best Score 1 (5-star: 110,000 points)
// $BC0828: [32-bit] Story 11 - Easy - Best Score 2
// $BC082C: [32-bit] Story 11 - Easy - Best Score 3
// $BC0830: [32-bit] Story 11 - Normal - Best Score 1 (5-star: 250,000 points)
// $BC0834: [32-bit] Story 11 - Normal - Best Score 2
// $BC0838: [32-bit] Story 11 - Normal - Best Score 3
// $BC083C: [32-bit] Story 11 - Hard - Best Score 1 (5-star: 380,000 points)
// $BC0840: [32-bit] Story 11 - Hard - Best Score 2
// $BC0844: [32-bit] Story 11 - Hard - Best Score 3
// $BC0848: [32-bit] Story 11 - Pro - Best Score 1 (5-star: 550,000 points)
// $BC084C: [32-bit] Story 11 - Pro - Best Score 2
// $BC0850: [32-bit] Story 11 - Pro - Best Score 3
// $BC0854: [32-bit] Story 11 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0858: [32-bit] Story 11 - Time Attack - Best Time 2 (frames; 30fps)
// $BC085C: [32-bit] Story 11 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0860: [8-bit] Story 11 - Easy clear
// $BC0861: [8-bit] Story 11 - Normal clear
// $BC0862: [8-bit] Story 11 - Hard clear
// $BC0863: [8-bit] Story 11 - Pro clear
// $BC0868: [32-bit] Story 12 - Easy - Best Score 1 (5-star: 110,000 points)
// $BC086C: [32-bit] Story 12 - Easy - Best Score 2
// $BC0870: [32-bit] Story 12 - Easy - Best Score 3
// $BC0874: [32-bit] Story 12 - Normal - Best Score 1 (5-star: 240,000 points)
// $BC0878: [32-bit] Story 12 - Normal - Best Score 2
// $BC087C: [32-bit] Story 12 - Normal - Best Score 3
// $BC0880: [32-bit] Story 12 - Hard - Best Score 1 (5-star: 350,000 points)
// $BC0884: [32-bit] Story 12 - Hard - Best Score 2
// $BC0888: [32-bit] Story 12 - Hard - Best Score 3
// $BC088C: [32-bit] Story 12 - Pro - Best Score 1 (5-star: 550,000 points)
// $BC0890: [32-bit] Story 12 - Pro - Best Score 2
// $BC0894: [32-bit] Story 12 - Pro - Best Score 3
// $BC0898: [32-bit] Story 12 - Time Attack - Best Time 1 (frames; 30fps)
// $BC089C: [32-bit] Story 12 - Time Attack - Best Time 2 (frames; 30fps)
// $BC08A0: [32-bit] Story 12 - Time Attack - Best Time 3 (frames; 30fps)
// $BC08A4: [8-bit] Story 12 - Easy clear
// $BC08A5: [8-bit] Story 12 - Normal clear
// $BC08A6: [8-bit] Story 12 - Hard clear
// $BC08A7: [8-bit] Story 12 - Pro clear
// $BC08AC: [32-bit] Story 13 - Easy - Best Score 1 (5-star: 60,000 points)
// $BC08B0: [32-bit] Story 13 - Easy - Best Score 2
// $BC08B4: [32-bit] Story 13 - Easy - Best Score 3
// $BC08B8: [32-bit] Story 13 - Normal - Best Score 1 (5-star: 120,000 points)
// $BC08BC: [32-bit] Story 13 - Normal - Best Score 2
// $BC08C0: [32-bit] Story 13 - Normal - Best Score 3
// $BC08C4: [32-bit] Story 13 - Hard - Best Score 1 (5-star: 160,000 points)
// $BC08C8: [32-bit] Story 13 - Hard - Best Score 2
// $BC08CC: [32-bit] Story 13 - Hard - Best Score 3
// $BC08D0: [32-bit] Story 13 - Pro - Best Score 1 (5-star: 260,000 points)
// $BC08D4: [32-bit] Story 13 - Pro - Best Score 2
// $BC08D8: [32-bit] Story 13 - Pro - Best Score 3
// $BC08DC: [32-bit] Story 13 - Time Attack - Best Time 1 (frames; 30fps)
// $BC08E0: [32-bit] Story 13 - Time Attack - Best Time 2 (frames; 30fps)
// $BC08E4: [32-bit] Story 13 - Time Attack - Best Time 3 (frames; 30fps)
// $BC08E8: [8-bit] Story 13 - Easy clear
// $BC08E9: [8-bit] Story 13 - Normal clear
// $BC08EA: [8-bit] Story 13 - Hard clear
// $BC08EB: [8-bit] Story 13 - Pro clear
// $BC08F0: [32-bit] Story 14 - Easy - Best Score 1 (5-star: 190,000 points)
// $BC08F4: [32-bit] Story 14 - Easy - Best Score 2
// $BC08F8: [32-bit] Story 14 - Easy - Best Score 3
// $BC08FC: [32-bit] Story 14 - Normal - Best Score 1 (5-star: 400,000 points)
// $BC0900: [32-bit] Story 14 - Normal - Best Score 2
// $BC0904: [32-bit] Story 14 - Normal - Best Score 3
// $BC0908: [32-bit] Story 14 - Hard - Best Score 1 (5-star: 600,000 points)
// $BC090C: [32-bit] Story 14 - Hard - Best Score 2
// $BC0910: [32-bit] Story 14 - Hard - Best Score 3
// $BC0914: [32-bit] Story 14 - Pro - Best Score 1 (5-star: 800,000 points)
// $BC0918: [32-bit] Story 14 - Pro - Best Score 2
// $BC091C: [32-bit] Story 14 - Pro - Best Score 3
// $BC0920: [32-bit] Story 14 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0924: [32-bit] Story 14 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0928: [32-bit] Story 14 - Time Attack - Best Time 3 (frames; 30fps)
// $BC092C: [8-bit] Story 14 - Easy clear
// $BC092D: [8-bit] Story 14 - Normal clear
// $BC092E: [8-bit] Story 14 - Hard clear
// $BC092F: [8-bit] Story 14 - Pro clear
// $BC0934: [32-bit] Story 15 - Easy - Best Score 1 (5-star: 90,000 points)
// $BC0938: [32-bit] Story 15 - Easy - Best Score 2
// $BC093C: [32-bit] Story 15 - Easy - Best Score 3
// $BC0940: [32-bit] Story 15 - Normal - Best Score 1 (5-star: 240,000 points)
// $BC0944: [32-bit] Story 15 - Normal - Best Score 2
// $BC0948: [32-bit] Story 15 - Normal - Best Score 3
// $BC094C: [32-bit] Story 15 - Hard - Best Score 1 (5-star: 310,000 points)
// $BC0950: [32-bit] Story 15 - Hard - Best Score 2
// $BC0954: [32-bit] Story 15 - Hard - Best Score 3
// $BC0958: [32-bit] Story 15 - Pro - Best Score 1 (5-star: 600,000 points)
// $BC095C: [32-bit] Story 15 - Pro - Best Score 2
// $BC0960: [32-bit] Story 15 - Pro - Best Score 3
// $BC0964: [32-bit] Story 15 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0968: [32-bit] Story 15 - Time Attack - Best Time 2 (frames; 30fps)
// $BC096C: [32-bit] Story 15 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0970: [8-bit] Story 15 - Easy clear
// $BC0971: [8-bit] Story 15 - Normal clear
// $BC0972: [8-bit] Story 15 - Hard clear
// $BC0973: [8-bit] Story 15 - Pro clear
// $BC0978: [32-bit] Story 16 - Easy - Best Score 1 (5-star: 95,000 points)
// $BC097C: [32-bit] Story 16 - Easy - Best Score 2
// $BC0980: [32-bit] Story 16 - Easy - Best Score 3
// $BC0984: [32-bit] Story 16 - Normal - Best Score 1 (5-star: 250,000 points)
// $BC0988: [32-bit] Story 16 - Normal - Best Score 2
// $BC098C: [32-bit] Story 16 - Normal - Best Score 3
// $BC0990: [32-bit] Story 16 - Hard - Best Score 1 (5-star: 330,000 points)
// $BC0994: [32-bit] Story 16 - Hard - Best Score 2
// $BC0998: [32-bit] Story 16 - Hard - Best Score 3
// $BC099C: [32-bit] Story 16 - Pro - Best Score 1 (5-star: 550,000 points)
// $BC09A0: [32-bit] Story 16 - Pro - Best Score 2
// $BC09A4: [32-bit] Story 16 - Pro - Best Score 3
// $BC09A8: [32-bit] Story 16 - Time Attack - Best Time 1 (frames; 30fps)
// $BC09AC: [32-bit] Story 16 - Time Attack - Best Time 2 (frames; 30fps)
// $BC09B0: [32-bit] Story 16 - Time Attack - Best Time 3 (frames; 30fps)
// $BC09B4: [8-bit] Story 16 - Easy clear
// $BC09B5: [8-bit] Story 16 - Normal clear
// $BC09B6: [8-bit] Story 16 - Hard clear
// $BC09B7: [8-bit] Story 16 - Pro clear
// $BC09BC: [32-bit] Story 17 - Easy - Best Score 1 (5-star: 250,000 points)
// $BC09C0: [32-bit] Story 17 - Easy - Best Score 2
// $BC09C4: [32-bit] Story 17 - Easy - Best Score 3
// $BC09C8: [32-bit] Story 17 - Normal - Best Score 1 (5-star: 500,000 points)
// $BC09CC: [32-bit] Story 17 - Normal - Best Score 2
// $BC09D0: [32-bit] Story 17 - Normal - Best Score 3
// $BC09D4: [32-bit] Story 17 - Hard - Best Score 1 (5-star: 800,000 points)
// $BC09D8: [32-bit] Story 17 - Hard - Best Score 2
// $BC09DC: [32-bit] Story 17 - Hard - Best Score 3
// $BC09E0: [32-bit] Story 17 - Pro - Best Score 1 (5-star: 1,000,000 points)
// $BC09E4: [32-bit] Story 17 - Pro - Best Score 2
// $BC09E8: [32-bit] Story 17 - Pro - Best Score 3
// $BC09EC: [32-bit] Story 17 - Time Attack - Best Time 1 (frames; 30fps)
// $BC09F0: [32-bit] Story 17 - Time Attack - Best Time 2 (frames; 30fps)
// $BC09F4: [32-bit] Story 17 - Time Attack - Best Time 3 (frames; 30fps)
// $BC09F8: [8-bit] Story 17 - Easy clear
// $BC09F9: [8-bit] Story 17 - Normal clear
// $BC09FA: [8-bit] Story 17 - Hard clear
// $BC09FB: [8-bit] Story 17 - Pro clear
// $BC0A00: [32-bit] Story 18 - Easy - Best Score 1 (5-star: 200,000 points)
// $BC0A04: [32-bit] Story 18 - Easy - Best Score 2
// $BC0A08: [32-bit] Story 18 - Easy - Best Score 3
// $BC0A0C: [32-bit] Story 18 - Normal - Best Score 1 (5-star: 450,000 points)
// $BC0A10: [32-bit] Story 18 - Normal - Best Score 2
// $BC0A14: [32-bit] Story 18 - Normal - Best Score 3
// $BC0A18: [32-bit] Story 18 - Hard - Best Score 1 (5-star: 700,000 points)
// $BC0A1C: [32-bit] Story 18 - Hard - Best Score 2
// $BC0A20: [32-bit] Story 18 - Hard - Best Score 3
// $BC0A24: [32-bit] Story 18 - Pro - Best Score 1 (5-star: 1,100,000 points)
// $BC0A28: [32-bit] Story 18 - Pro - Best Score 2
// $BC0A2C: [32-bit] Story 18 - Pro - Best Score 3
// $BC0A30: [32-bit] Story 18 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0A34: [32-bit] Story 18 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0A38: [32-bit] Story 18 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0A3C: [8-bit] Story 18 - Easy clear
// $BC0A3D: [8-bit] Story 18 - Normal clear
// $BC0A3E: [8-bit] Story 18 - Hard clear
// $BC0A3F: [8-bit] Story 18 - Pro clear
// $BC0A44: [32-bit] Story 19 - Easy - Best Score 1 (5-star: 210,000 points)
// $BC0A48: [32-bit] Story 19 - Easy - Best Score 2
// $BC0A4C: [32-bit] Story 19 - Easy - Best Score 3
// $BC0A50: [32-bit] Story 19 - Normal - Best Score 1 (5-star: 550,000 points)
// $BC0A54: [32-bit] Story 19 - Normal - Best Score 2
// $BC0A58: [32-bit] Story 19 - Normal - Best Score 3
// $BC0A5C: [32-bit] Story 19 - Hard - Best Score 1 (5-star: 700,000 points)
// $BC0A60: [32-bit] Story 19 - Hard - Best Score 2
// $BC0A64: [32-bit] Story 19 - Hard - Best Score 3
// $BC0A68: [32-bit] Story 19 - Pro - Best Score 1 (5-star: 950,000 points)
// $BC0A6C: [32-bit] Story 19 - Pro - Best Score 2
// $BC0A70: [32-bit] Story 19 - Pro - Best Score 3
// $BC0A74: [32-bit] Story 19 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0A78: [32-bit] Story 19 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0A7C: [32-bit] Story 19 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0A80: [8-bit] Story 19 - Easy clear
// $BC0A81: [8-bit] Story 19 - Normal clear
// $BC0A82: [8-bit] Story 19 - Hard clear
// $BC0A83: [8-bit] Story 19 - Pro clear
// $BC0A88: [32-bit] Story 20 - Easy - Best Score 1 (5-star: 220,000 points)
// $BC0A8C: [32-bit] Story 20 - Easy - Best Score 2
// $BC0A90: [32-bit] Story 20 - Easy - Best Score 3
// $BC0A94: [32-bit] Story 20 - Normal - Best Score 1 (5-star: 450,000 points)
// $BC0A98: [32-bit] Story 20 - Normal - Best Score 2
// $BC0A9C: [32-bit] Story 20 - Normal - Best Score 3
// $BC0AA0: [32-bit] Story 20 - Hard - Best Score 1 (5-star: 700,000 points)
// $BC0AA4: [32-bit] Story 20 - Hard - Best Score 2
// $BC0AA8: [32-bit] Story 20 - Hard - Best Score 3
// $BC0AAC: [32-bit] Story 20 - Pro - Best Score 1 (5-star: 940,000 points)
// $BC0AB0: [32-bit] Story 20 - Pro - Best Score 2
// $BC0AB4: [32-bit] Story 20 - Pro - Best Score 3
// $BC0AB8: [32-bit] Story 20 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0ABC: [32-bit] Story 20 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0AC0: [32-bit] Story 20 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0AC4: [8-bit] Story 20 - Easy clear
// $BC0AC5: [8-bit] Story 20 - Normal clear
// $BC0AC6: [8-bit] Story 20 - Hard clear
// $BC0AC7: [8-bit] Story 20 - Pro clear
// $BC0ACC: [32-bit] Story 21 - Easy - Best Score 1 (5-star: 170,000 points)
// $BC0AD0: [32-bit] Story 21 - Easy - Best Score 2
// $BC0AD4: [32-bit] Story 21 - Easy - Best Score 3
// $BC0AD8: [32-bit] Story 21 - Normal - Best Score 1 (5-star: 300,000 points)
// $BC0ADC: [32-bit] Story 21 - Normal - Best Score 2
// $BC0AE0: [32-bit] Story 21 - Normal - Best Score 3
// $BC0AE4: [32-bit] Story 21 - Hard - Best Score 1 (5-star: 500,000 points)
// $BC0AE8: [32-bit] Story 21 - Hard - Best Score 2
// $BC0AEC: [32-bit] Story 21 - Hard - Best Score 3
// $BC0AF0: [32-bit] Story 21 - Pro - Best Score 1 (5-star: 700,000 points)
// $BC0AF4: [32-bit] Story 21 - Pro - Best Score 2
// $BC0AF8: [32-bit] Story 21 - Pro - Best Score 3
// $BC0AFC: [32-bit] Story 21 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0B00: [32-bit] Story 21 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0B04: [32-bit] Story 21 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0B08: [8-bit] Story 21 - Easy clear
// $BC0B09: [8-bit] Story 21 - Normal clear
// $BC0B0A: [8-bit] Story 21 - Hard clear
// $BC0B0B: [8-bit] Story 21 - Pro clear
// $BC0B10: [32-bit] Story 22 - Easy - Best Score 1 (5-star: 480,000 points)
// $BC0B14: [32-bit] Story 22 - Easy - Best Score 2
// $BC0B18: [32-bit] Story 22 - Easy - Best Score 3
// $BC0B1C: [32-bit] Story 22 - Normal - Best Score 1 (5-star: 650,000 points)
// $BC0B20: [32-bit] Story 22 - Normal - Best Score 2
// $BC0B24: [32-bit] Story 22 - Normal - Best Score 3
// $BC0B28: [32-bit] Story 22 - Hard - Best Score 1 (5-star: 850,000 points)
// $BC0B2C: [32-bit] Story 22 - Hard - Best Score 2
// $BC0B30: [32-bit] Story 22 - Hard - Best Score 3
// $BC0B34: [32-bit] Story 22 - Pro - Best Score 1 (5-star: 950,000 points)
// $BC0B38: [32-bit] Story 22 - Pro - Best Score 2
// $BC0B3C: [32-bit] Story 22 - Pro - Best Score 3
// $BC0B40: [32-bit] Story 22 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0B44: [32-bit] Story 22 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0B48: [32-bit] Story 22 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0B4C: [8-bit] Story 22 - Easy clear
// $BC0B4D: [8-bit] Story 22 - Normal clear
// $BC0B4E: [8-bit] Story 22 - Hard clear
// $BC0B4F: [8-bit] Story 22 - Pro clear
// $BC0B54: [32-bit] Story 23 - Easy - Best Score 1 (5-star: 160,000 points)
// $BC0B58: [32-bit] Story 23 - Easy - Best Score 2
// $BC0B5C: [32-bit] Story 23 - Easy - Best Score 3
// $BC0B60: [32-bit] Story 23 - Normal - Best Score 1 (5-star: 400,000 points)
// $BC0B64: [32-bit] Story 23 - Normal - Best Score 2
// $BC0B68: [32-bit] Story 23 - Normal - Best Score 3
// $BC0B6C: [32-bit] Story 23 - Hard - Best Score 1 (5-star: 600,000 points)
// $BC0B70: [32-bit] Story 23 - Hard - Best Score 2
// $BC0B74: [32-bit] Story 23 - Hard - Best Score 3
// $BC0B78: [32-bit] Story 23 - Pro - Best Score 1 (5-star: 850,000 points)
// $BC0B7C: [32-bit] Story 23 - Pro - Best Score 2
// $BC0B80: [32-bit] Story 23 - Pro - Best Score 3
// $BC0B84: [32-bit] Story 23 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0B88: [32-bit] Story 23 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0B8C: [32-bit] Story 23 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0B90: [8-bit] Story 23 - Easy clear
// $BC0B91: [8-bit] Story 23 - Normal clear
// $BC0B92: [8-bit] Story 23 - Hard clear
// $BC0B93: [8-bit] Story 23 - Pro clear
// $BC0B98: [32-bit] Story 24 - Easy - Best Score 1 (5-star: 550,000 points)
// $BC0B9C: [32-bit] Story 24 - Easy - Best Score 2
// $BC0BA0: [32-bit] Story 24 - Easy - Best Score 3
// $BC0BA4: [32-bit] Story 24 - Normal - Best Score 1 (5-star: 1,100,000 points)
// $BC0BA8: [32-bit] Story 24 - Normal - Best Score 2
// $BC0BAC: [32-bit] Story 24 - Normal - Best Score 3
// $BC0BB0: [32-bit] Story 24 - Hard - Best Score 1 (5-star: 1,400,000 points)
// $BC0BB4: [32-bit] Story 24 - Hard - Best Score 2
// $BC0BB8: [32-bit] Story 24 - Hard - Best Score 3
// $BC0BBC: [32-bit] Story 24 - Pro - Best Score 1 (5-star: 2,300,000 points)
// $BC0BC0: [32-bit] Story 24 - Pro - Best Score 2
// $BC0BC4: [32-bit] Story 24 - Pro - Best Score 3
// $BC0BC8: [32-bit] Story 24 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0BCC: [32-bit] Story 24 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0BD0: [32-bit] Story 24 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0BD4: [8-bit] Story 24 - Easy clear
// $BC0BD5: [8-bit] Story 24 - Normal clear
// $BC0BD6: [8-bit] Story 24 - Hard clear
// $BC0BD7: [8-bit] Story 24 - Pro clear
// $BC0BDC: [32-bit] Story 25 - Easy - Best Score 1 (5-star: 180,000 points)
// $BC0BE0: [32-bit] Story 25 - Easy - Best Score 2
// $BC0BE4: [32-bit] Story 25 - Easy - Best Score 3
// $BC0BE8: [32-bit] Story 25 - Normal - Best Score 1 (5-star: 400,000 points)
// $BC0BEC: [32-bit] Story 25 - Normal - Best Score 2
// $BC0BF0: [32-bit] Story 25 - Normal - Best Score 3
// $BC0BF4: [32-bit] Story 25 - Hard - Best Score 1 (5-star: 650,000 points)
// $BC0BF8: [32-bit] Story 25 - Hard - Best Score 2
// $BC0BFC: [32-bit] Story 25 - Hard - Best Score 3
// $BC0C00: [32-bit] Story 25 - Pro - Best Score 1 (5-star: 800,000 points)
// $BC0C04: [32-bit] Story 25 - Pro - Best Score 2
// $BC0C08: [32-bit] Story 25 - Pro - Best Score 3
// $BC0C0C: [32-bit] Story 25 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0C10: [32-bit] Story 25 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0C14: [32-bit] Story 25 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0C18: [8-bit] Story 25 - Easy clear
// $BC0C19: [8-bit] Story 25 - Normal clear
// $BC0C1A: [8-bit] Story 25 - Hard clear
// $BC0C1B: [8-bit] Story 25 - Pro clear
// $BC0C20: [32-bit] Story 26 - Easy - Best Score 1 (5-star: 300,000 points)
// $BC0C24: [32-bit] Story 26 - Easy - Best Score 2
// $BC0C28: [32-bit] Story 26 - Easy - Best Score 3
// $BC0C2C: [32-bit] Story 26 - Normal - Best Score 1 (5-star: 750,000 points)
// $BC0C30: [32-bit] Story 26 - Normal - Best Score 2
// $BC0C34: [32-bit] Story 26 - Normal - Best Score 3
// $BC0C38: [32-bit] Story 26 - Hard - Best Score 1 (5-star: 900,000 points)
// $BC0C3C: [32-bit] Story 26 - Hard - Best Score 2
// $BC0C40: [32-bit] Story 26 - Hard - Best Score 3
// $BC0C44: [32-bit] Story 26 - Pro - Best Score 1 (5-star: 1,200,000 points)
// $BC0C48: [32-bit] Story 26 - Pro - Best Score 2
// $BC0C4C: [32-bit] Story 26 - Pro - Best Score 3
// $BC0C50: [32-bit] Story 26 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0C54: [32-bit] Story 26 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0C58: [32-bit] Story 26 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0C5C: [8-bit] Story 26 - Easy clear
// $BC0C5D: [8-bit] Story 26 - Normal clear
// $BC0C5E: [8-bit] Story 26 - Hard clear
// $BC0C5F: [8-bit] Story 26 - Pro clear
// $BC0C64: [32-bit] Story 27 - Easy - Best Score 1 (5-star: 550,000 points)
// $BC0C68: [32-bit] Story 27 - Easy - Best Score 2
// $BC0C6C: [32-bit] Story 27 - Easy - Best Score 3
// $BC0C70: [32-bit] Story 27 - Normal - Best Score 1 (5-star: 900,000 points)
// $BC0C74: [32-bit] Story 27 - Normal - Best Score 2
// $BC0C78: [32-bit] Story 27 - Normal - Best Score 3
// $BC0C7C: [32-bit] Story 27 - Hard - Best Score 1 (5-star: 110,000* points); *this is a game typo and a much lower goal than likely intended
// $BC0C80: [32-bit] Story 27 - Hard - Best Score 2
// $BC0C84: [32-bit] Story 27 - Hard - Best Score 3
// $BC0C88: [32-bit] Story 27 - Pro - Best Score 1 (5-star: 1,200,000 points)
// $BC0C8C: [32-bit] Story 27 - Pro - Best Score 2
// $BC0C90: [32-bit] Story 27 - Pro - Best Score 3
// $BC0C94: [32-bit] Story 27 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0C98: [32-bit] Story 27 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0C9C: [32-bit] Story 27 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0CA0: [8-bit] Story 27 - Easy clear
// $BC0CA1: [8-bit] Story 27 - Normal clear
// $BC0CA2: [8-bit] Story 27 - Hard clear
// $BC0CA3: [8-bit] Story 27 - Pro clear
// $BC0CA8: [32-bit] Story 28 - Easy - Best Score 1 (5-star: 80,000 points)
// $BC0CAC: [32-bit] Story 28 - Easy - Best Score 2
// $BC0CB0: [32-bit] Story 28 - Easy - Best Score 3
// $BC0CB4: [32-bit] Story 28 - Normal - Best Score 1 (5-star: 350,000 points)
// $BC0CB8: [32-bit] Story 28 - Normal - Best Score 2
// $BC0CBC: [32-bit] Story 28 - Normal - Best Score 3
// $BC0CC0: [32-bit] Story 28 - Hard - Best Score 1 (5-star: 450,000 points)
// $BC0CC4: [32-bit] Story 28 - Hard - Best Score 2
// $BC0CC8: [32-bit] Story 28 - Hard - Best Score 3
// $BC0CCC: [32-bit] Story 28 - Pro - Best Score 1 (5-star: 700,000 points)
// $BC0CD0: [32-bit] Story 28 - Pro - Best Score 2
// $BC0CD4: [32-bit] Story 28 - Pro - Best Score 3
// $BC0CD8: [32-bit] Story 28 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0CDC: [32-bit] Story 28 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0CE0: [32-bit] Story 28 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0CE4: [8-bit] Story 28 - Easy clear
// $BC0CE5: [8-bit] Story 28 - Normal clear
// $BC0CE6: [8-bit] Story 28 - Hard clear
// $BC0CE7: [8-bit] Story 28 - Pro clear
// $BC0CEC: [32-bit] Story 29 - Easy - Best Score 1 (5-star: 470,000 points)
// $BC0CF0: [32-bit] Story 29 - Easy - Best Score 2
// $BC0CF4: [32-bit] Story 29 - Easy - Best Score 3
// $BC0CF8: [32-bit] Story 29 - Normal - Best Score 1 (5-star: 900,000 points)
// $BC0CFC: [32-bit] Story 29 - Normal - Best Score 2
// $BC0D00: [32-bit] Story 29 - Normal - Best Score 3
// $BC0D04: [32-bit] Story 29 - Hard - Best Score 1 (5-star: 1,100,000 points)
// $BC0D08: [32-bit] Story 29 - Hard - Best Score 2
// $BC0D0C: [32-bit] Story 29 - Hard - Best Score 3
// $BC0D10: [32-bit] Story 29 - Pro - Best Score 1 (5-star: 1,800,000 points)
// $BC0D14: [32-bit] Story 29 - Pro - Best Score 2
// $BC0D18: [32-bit] Story 29 - Pro - Best Score 3
// $BC0D1C: [32-bit] Story 29 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0D20: [32-bit] Story 29 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0D24: [32-bit] Story 29 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0D28: [8-bit] Story 29 - Easy clear
// $BC0D29: [8-bit] Story 29 - Normal clear
// $BC0D2A: [8-bit] Story 29 - Hard clear
// $BC0D2B: [8-bit] Story 29 - Pro clear
// $BC0D30: [32-bit] Story 30 - Easy - Best Score 1 (5-star: 500,000 points)
// $BC0D34: [32-bit] Story 30 - Easy - Best Score 2
// $BC0D38: [32-bit] Story 30 - Easy - Best Score 3
// $BC0D3C: [32-bit] Story 30 - Normal - Best Score 1 (5-star: 1,000,000 points)
// $BC0D40: [32-bit] Story 30 - Normal - Best Score 2
// $BC0D44: [32-bit] Story 30 - Normal - Best Score 3
// $BC0D48: [32-bit] Story 30 - Hard - Best Score 1 (5-star: 1,800,000 points)
// $BC0D4C: [32-bit] Story 30 - Hard - Best Score 2
// $BC0D50: [32-bit] Story 30 - Hard - Best Score 3
// $BC0D54: [32-bit] Story 30 - Pro - Best Score 1 (5-star: 2,500,000 points)
// $BC0D58: [32-bit] Story 30 - Pro - Best Score 2
// $BC0D5C: [32-bit] Story 30 - Pro - Best Score 3
// $BC0D60: [32-bit] Story 30 - Time Attack - Best Time 1 (frames; 30fps)
// $BC0D64: [32-bit] Story 30 - Time Attack - Best Time 2 (frames; 30fps)
// $BC0D68: [32-bit] Story 30 - Time Attack - Best Time 3 (frames; 30fps)
// $BC0D6C: [8-bit] Story 30 - Easy clear
// $BC0D6D: [8-bit] Story 30 - Normal clear
// $BC0D6E: [8-bit] Story 30 - Hard clear
// $BC0D6F: [8-bit] Story 30 - Pro clear
function AnyStory() =>
    sum_of(range(0xBC05B8,0xBC0D6C,step=0x44), addr => dword(addr)/dword(addr))
function ProStory() =>
    sum_of(range(0xBC05BB,0xBC0D6F,step=0x44), addr => byte(addr))

// This is for all of the achievement naming/points/data. use the spreadsheet to update this information
StoryData = {
    1:{"easyTitle":"Relaxed Storytelling I","easyPoints":3,"normalTitle":"Average Storytelling I","normalPoints":5,"hardTitle":"Serious Storytelling I","hardPoints":5,"proTitle":"Professional Storytelling I","proPoints":5,"normalrankTitle":"Making the Grade I","normalrankPoints":10,"prorankTitle":"Dawn of the High Score","prorankPoints":3},
    2:{"prorankTitle":"Score, the Daily Grind","prorankPoints":3},
    3:{"prorankTitle":"The Score Bots","prorankPoints":3},
    4:{"prorankTitle":"Asli and Scoring","prorankPoints":3},
    5:{"prorankTitle":"Tons of Score","prorankPoints":3},
    6:{"easyTitle":"Relaxed Storytelling II","easyPoints":5,"normalTitle":"Average Storytelling II","normalPoints":5,"hardTitle":"Serious Storytelling II","hardPoints":10,"proTitle":"Professional Storytelling II","proPoints":10,"normalrankTitle":"Making the Grade II","normalrankPoints":10,"prorankTitle":"Friend or Score?","prorankPoints":5},
    7:{"prorankTitle":"10,000m High Scores","prorankPoints":5},
    8:{"prorankTitle":"Score Scraps","prorankPoints":5},
    9:{"prorankTitle":"Score Antics!","prorankPoints":5},
    10:{"prorankTitle":"Asli's High Score","prorankPoints":5},
    11:{"easyTitle":"Relaxed Storytelling III","easyPoints":5,"normalTitle":"Average Storytelling III","normalPoints":5,"hardTitle":"Serious Storytelling III","hardPoints":10,"proTitle":"Professional Storytelling III","proPoints":10,"normalrankTitle":"Making the Grade III","normalrankPoints":10,"prorankTitle":"Scoring Giants","prorankPoints":5},
    12:{"prorankTitle":"Score from Long Ago","prorankPoints":5},
    13:{"prorankTitle":"Sunny Day Scores","prorankPoints":5},
    14:{"prorankTitle":"More Scores","prorankPoints":5},
    15:{"prorankTitle":"What Did They Score?","prorankPoints":5},
    16:{"easyTitle":"Relaxed Storytelling IV","easyPoints":5,"normalTitle":"Average Storytelling IV","normalPoints":5,"hardTitle":"Serious Storytelling IV","hardPoints":10,"proTitle":"Prison Break","proPoints":5,"normalrankTitle":"Making the Grade IV","normalrankPoints":10,"prorankTitle":"Score Time","prorankPoints":10},
    17:{"proTitle":"Asli's Request","proPoints":5,"prorankTitle":"Asli's Second High Score","prorankPoints":10},
    18:{"proTitle":"Fights in Tight Spaces","proPoints":5,"prorankTitle":"Moonlight Score","prorankPoints":10},
    19:{"proTitle":"Strategic Slicing","proPoints":5,"prorankTitle":"World to be Scored","prorankPoints":10},
    20:{"proTitle":"Part Plunderer","proPoints":5,"prorankTitle":"Asli's Third High Score","prorankPoints":10},
    21:{"easyTitle":"Relaxed Storytelling V","easyPoints":5,"normalTitle":"Average Storytelling V","normalPoints":10,"hardTitle":"Serious Storytelling V","hardPoints":10,"proTitle":"Rockbreaker","proPoints":10,"normalrankTitle":"Making the Grade V","normalrankPoints":10,"prorankTitle":"Solid as a High Score!","prorankPoints":10},
    22:{"proTitle":"Break Time","proPoints":10,"prorankTitle":"Scoring Diaries","prorankPoints":10},
    23:{"proTitle":"Blitz Attack","proPoints":10,"prorankTitle":"Score and Delight","prorankPoints":10},
    24:{"proTitle":"Gargantuan Goula","proPoints":10,"prorankTitle":"Score Out of Control","prorankPoints":10},
    25:{"proTitle":"Maze Madness","proPoints":10,"prorankTitle":"Labyrinthine Scores","prorankPoints":10},
    26:{"easyTitle":"Relaxed Storytelling VI","easyPoints":10,"normalTitle":"Average Storytelling VI","normalPoints":10,"hardTitle":"Serious Storytelling VI","hardPoints":25,"proTitle":"Reinforced Beams","proPoints":10,"normalrankTitle":"Making the Grade VI","normalrankPoints":25,"prorankTitle":"Scoring Forecast","prorankPoints":10},
    27:{"proTitle":"Planning Ahead","proPoints":10,"prorankTitle":"Score in the Sky","prorankPoints":10},
    28:{"proTitle":"Avoid Eye Contact","proPoints":10,"prorankTitle":"The Perilous Score!","prorankPoints":10},
    29:{"proTitle":"Penultimate Finale","proPoints":10,"prorankTitle":"Score of Scores?","prorankPoints":25},
    30:{"proTitle":"Bring It Home","proPoints":25,"prorankTitle":"Adieu, Great Score","prorankPoints":25},
}
ChallengeData = {
    1:{"easyTitle":"Relaxed Challenger I","easyPoints":3,"normalTitle":"Average Challenger I","normalPoints":5,"hardTitle":"Serious Challenger I","hardPoints":5,"proTitle":"Professional Challenger I","proPoints":10},
    6:{"easyTitle":"Relaxed Challenger II","easyPoints":3,"normalTitle":"Average Challenger II","normalPoints":5,"hardTitle":"Serious Challenger II","hardPoints":5,"proTitle":"Professional Challenger II","proPoints":10},
    11:{"easyTitle":"Relaxed Challenger III","easyPoints":3,"normalTitle":"Average Challenger III","normalPoints":5,"hardTitle":"Serious Challenger III","hardPoints":5,"proTitle":"Professional Challenger III","proPoints":10},
    16:{"easyTitle":"Relaxed Challenger IV","easyPoints":5,"normalTitle":"Average Challenger IV","normalPoints":5,"hardTitle":"Serious Challenger IV","hardPoints":10,"proTitle":"Professional Challenger IV","proPoints":10},
    21:{"easyTitle":"Relaxed Challenger V","easyPoints":5,"normalTitle":"Average Challenger V","normalPoints":5,"hardTitle":"Serious Challenger V","hardPoints":10,"proTitle":"Professional Challenger V","proPoints":10},
    26:{"easyTitle":"Relaxed Challenger VI","easyPoints":5,"normalTitle":"Average Challenger VI","normalPoints":10,"hardTitle":"Serious Challenger VI","hardPoints":10,"proTitle":"Warhip Destroyer","proPoints":5},
    27:{"proTitle":"Keen Eye","proPoints":5},
    28:{"proTitle":"Don't Look Back","proPoints":5},
    29:{"proTitle":"Warship Demolitionist","proPoints":5},
    30:{"proTitle":"Leave No Witnesses","proPoints":5},
    31:{"easyTitle":"Relaxed Challenger VII","easyPoints":5,"normalTitle":"Average Challenger VII","normalPoints":10,"hardTitle":"Serious Challenger VII","hardPoints":10,"proTitle":"Crawfitsch Cookout","proPoints":5},
    32:{"proTitle":"Measure Twice","proPoints":5},
    33:{"proTitle":"Protective Duty","proPoints":5},
    34:{"proTitle":"Flowarky Fields","proPoints":5},
    35:{"proTitle":"Rescue Mission","proPoints":5},
    36:{"easyTitle":"Relaxed Challenger VIII","easyPoints":5,"normalTitle":"Average Challenger VIII","normalPoints":10,"hardTitle":"Serious Challenger VIII","hardPoints":10,"proTitle":"Keep Moving","proPoints":5},
    37:{"proTitle":"Warship Deleter","proPoints":5},
    38:{"proTitle":"Out of Time","proPoints":5},
    39:{"proTitle":"Half n' Half","proPoints":5},
    40:{"proTitle":"Warship Annihilator","proPoints":5},
    41:{"easyTitle":"Relaxed Challenger IX","easyPoints":10,"normalTitle":"Average Challenger IX","normalPoints":10,"hardTitle":"Serious Challenger IX","hardPoints":10,"proTitle":"Spider's Nest","proPoints":10},
    42:{"proTitle":"Perilous Packing","proPoints":10},
    43:{"proTitle":"Safety Specialist","proPoints":10},
    44:{"proTitle":"Stay on Target","proPoints":10},
    45:{"proTitle":"Down to the Wire","proPoints":10},
    46:{"easyTitle":"Relaxed Challenger X","easyPoints":10,"normalTitle":"Average Challenger X","normalPoints":10,"hardTitle":"Serious Challenger X","hardPoints":25,"proTitle":"Total Annihilation","proPoints":10},
    47:{"proTitle":"Fancy Footwork","proPoints":10},
    48:{"proTitle":"Patchwork Panic","proPoints":10},
    49:{"proTitle":"Diamond in the Rough","proPoints":10},
    50:{"proTitle":"Captain of Captains","proPoints":25}
}
// This is all of the 5-star rank requirements for each story stage on each difficulty
StarData = {
    1:{"easy5star":30000,"normal5star":60000,"hard5star":75000,"pro5star":100000,"desc":"100,000"},
    2:{"easy5star":28000,"normal5star":45000,"hard5star":80000,"pro5star":110000,"desc":"110,000"},
    3:{"easy5star":20000,"normal5star":35000,"hard5star":55000,"pro5star":85000,"desc":"85,000"},
    4:{"easy5star":26000,"normal5star":60000,"hard5star":100000,"pro5star":150000,"desc":"150,000"},
    5:{"easy5star":50000,"normal5star":110000,"hard5star":200000,"pro5star":220000,"desc":"220,000"},
    6:{"easy5star":60000,"normal5star":130000,"hard5star":200000,"pro5star":270000,"desc":"270,000"},
    7:{"easy5star":85000,"normal5star":180000,"hard5star":270000,"pro5star":370000,"desc":"370,000"},
    8:{"easy5star":70000,"normal5star":160000,"hard5star":240000,"pro5star":380000,"desc":"380,000"},
    9:{"easy5star":70000,"normal5star":170000,"hard5star":250000,"pro5star":380000,"desc":"380,000"},
    10:{"easy5star":60000,"normal5star":150000,"hard5star":230000,"pro5star":340000,"desc":"340,000"},
    11:{"easy5star":110000,"normal5star":250000,"hard5star":380000,"pro5star":550000,"desc":"550,000"},
    12:{"easy5star":110000,"normal5star":240000,"hard5star":350000,"pro5star":550000,"desc":"550,000"},
    13:{"easy5star":60000,"normal5star":120000,"hard5star":160000,"pro5star":260000,"desc":"260,000"},
    14:{"easy5star":190000,"normal5star":400000,"hard5star":600000,"pro5star":800000,"desc":"800,000"},
    15:{"easy5star":90000,"normal5star":240000,"hard5star":310000,"pro5star":600000,"desc":"600,000"},
    16:{"easy5star":95000,"normal5star":250000,"hard5star":330000,"pro5star":550000,"desc":"550,000"},
    17:{"easy5star":250000,"normal5star":500000,"hard5star":800000,"pro5star":1000000,"desc":"1,000,000"},
    18:{"easy5star":200000,"normal5star":450000,"hard5star":700000,"pro5star":1100000,"desc":"1,100,000"},
    19:{"easy5star":210000,"normal5star":550000,"hard5star":700000,"pro5star":950000,"desc":"950,000"},
    20:{"easy5star":220000,"normal5star":450000,"hard5star":700000,"pro5star":940000,"desc":"940,000"},
    21:{"easy5star":170000,"normal5star":300000,"hard5star":500000,"pro5star":700000,"desc":"700,000"},
    22:{"easy5star":480000,"normal5star":650000,"hard5star":850000,"pro5star":950000,"desc":"950,000"},
    23:{"easy5star":160000,"normal5star":400000,"hard5star":600000,"pro5star":850000,"desc":"850,000"},
    24:{"easy5star":550000,"normal5star":1100000,"hard5star":1400000,"pro5star":2300000,"desc":"2,300,000"},
    25:{"easy5star":180000,"normal5star":400000,"hard5star":650000,"pro5star":800000,"desc":"800,000"},
    26:{"easy5star":300000,"normal5star":750000,"hard5star":900000,"pro5star":1200000,"desc":"1,200,000"},
    27:{"easy5star":550000,"normal5star":900000,"hard5star":110000,"pro5star":1200000,"desc":"1,200,000"},
    28:{"easy5star":80000,"normal5star":350000,"hard5star":450000,"pro5star":700000,"desc":"700,000"},
    29:{"easy5star":470000,"normal5star":900000,"hard5star":1100000,"pro5star":1800000,"desc":"1,800,000"},
    30:{"easy5star":500000,"normal5star":1000000,"hard5star":1800000,"pro5star":2500000,"desc":"2,500,000"}
}

StoryArray = [1,6,11,16,21,26]
ChallengeArray = [1,6,11,16,21,26,31,36,41,46]

function EasyStoryCheck(stage) =>
    byte(0xBC05B8 + ((stage -1)*0x44))

function EasyStoryAchievement(stage) {
    achievement(
        title=StoryData[stage]["easyTitle"], points=StoryData[stage]["easyPoints"],
        description= "Clear Story stages " + stage + "-" + (stage+4) + " on Easy difficulty.",
        trigger= LoadProtection && 
            prev(EasyStoryCheck(stage)) + 
            prev(EasyStoryCheck(stage + 1)) + 
            prev(EasyStoryCheck(stage + 2)) +
            prev(EasyStoryCheck(stage + 3)) +
            prev(EasyStoryCheck(stage + 4)) == 4 &&
            measured(EasyStoryCheck(stage) +
            EasyStoryCheck(stage + 1) +
            EasyStoryCheck(stage + 2) +
            EasyStoryCheck(stage + 3) +
            EasyStoryCheck(stage + 4) == 5)
    )
}

function NormalStoryCheck(stage) =>
    byte(0xBC05B9 + ((stage -1)*0x44))

function NormalStoryAchievement(stage) {
    achievement(
        title=StoryData[stage]["normalTitle"], points=StoryData[stage]["normalPoints"],
        description= "Clear Story stages " + stage + "-" + (stage+4) + " on Normal difficulty.",
        trigger= LoadProtection && 
            prev(NormalStoryCheck(stage)) + 
            prev(NormalStoryCheck(stage + 1)) + 
            prev(NormalStoryCheck(stage + 2)) +
            prev(NormalStoryCheck(stage + 3)) +
            prev(NormalStoryCheck(stage + 4)) == 4 &&
            measured(NormalStoryCheck(stage) +
            NormalStoryCheck(stage + 1) +
            NormalStoryCheck(stage + 2) +
            NormalStoryCheck(stage + 3) +
            NormalStoryCheck(stage + 4) == 5)
    )
}

function HardStoryCheck(stage) =>
    byte(0xBC05BA + ((stage -1)*0x44))

function HardStoryAchievement(stage) {
    achievement(
        title=StoryData[stage]["hardTitle"], points=StoryData[stage]["hardPoints"],
        description= "Clear Story stages " + stage + "-" + (stage+4) + " on Hard difficulty.",
        trigger= LoadProtection && 
            prev(HardStoryCheck(stage)) + 
            prev(HardStoryCheck(stage + 1)) + 
            prev(HardStoryCheck(stage + 2)) +
            prev(HardStoryCheck(stage + 3)) +
            prev(HardStoryCheck(stage + 4)) == 4 &&
            measured(HardStoryCheck(stage) +
            HardStoryCheck(stage + 1) +
            HardStoryCheck(stage + 2) +
            HardStoryCheck(stage + 3) +
            HardStoryCheck(stage + 4) == 5)
    )
}

function ProStoryCheck(stage) =>
    byte(0xBC05BB + ((stage -1)*0x44))

function ProStoryAchievementGroup(stage) {
    achievement(
        title=StoryData[stage]["proTitle"], points=StoryData[stage]["proPoints"],
        description= "Clear Story stages " + stage + "-" + (stage+4) + " on Pro difficulty.",
        trigger= LoadProtection && 
            prev(ProStoryCheck(stage)) + 
            prev(ProStoryCheck(stage + 1)) + 
            prev(ProStoryCheck(stage + 2)) +
            prev(ProStoryCheck(stage + 3)) +
            prev(ProStoryCheck(stage + 4)) == 4 &&
            measured(ProStoryCheck(stage) +
            ProStoryCheck(stage + 1) +
            ProStoryCheck(stage + 2) +
            ProStoryCheck(stage + 3) +
            ProStoryCheck(stage + 4) == 5)
    )
}
function ProStoryAchievement(stage) {
    achievement(
        title=StoryData[stage]["proTitle"], points=StoryData[stage]["proPoints"],
        description="Clear Story " + stage + " on Pro difficulty.",
        trigger = LoadProtection && Difficulty == Pro && StoryStage == stage && prev(GameState) == InStage && GameState == Results
    )
}

function EasyChallengeCheck(stage) =>
    byte(0xBC0F8C + ((stage -1)*0x44))

function EasyChallengeAchievement(stage) {
    achievement(
        title=ChallengeData[stage]["easyTitle"], points=ChallengeData[stage]["easyPoints"],
        description= "Clear Challenge stages " + stage + "-" + (stage+4) + " on Easy difficulty.",
        trigger= LoadProtection && 
            prev(EasyChallengeCheck(stage)) + 
            prev(EasyChallengeCheck(stage + 1)) + 
            prev(EasyChallengeCheck(stage + 2)) +
            prev(EasyChallengeCheck(stage + 3)) +
            prev(EasyChallengeCheck(stage + 4)) == 4 &&
            measured(EasyChallengeCheck(stage) +
            EasyChallengeCheck(stage + 1) +
            EasyChallengeCheck(stage + 2) +
            EasyChallengeCheck(stage + 3) +
            EasyChallengeCheck(stage + 4) == 5)
    )
}

function NormalChallengeCheck(stage) =>
    byte(0xBC0F8D + ((stage -1)*0x44))

function NormalChallengeAchievement(stage) {
    achievement(
        title=ChallengeData[stage]["normalTitle"], points=ChallengeData[stage]["normalPoints"],
        description= "Clear Challenge stages " + stage + "-" + (stage+4) + " on Normal difficulty.",
        trigger= LoadProtection && 
            prev(NormalChallengeCheck(stage)) + 
            prev(NormalChallengeCheck(stage + 1)) + 
            prev(NormalChallengeCheck(stage + 2)) +
            prev(NormalChallengeCheck(stage + 3)) +
            prev(NormalChallengeCheck(stage + 4)) == 4 &&
            measured(NormalChallengeCheck(stage) +
            NormalChallengeCheck(stage + 1) +
            NormalChallengeCheck(stage + 2) +
            NormalChallengeCheck(stage + 3) +
            NormalChallengeCheck(stage + 4) == 5)
    )
}

function HardChallengeCheck(stage) =>
    byte(0xBC0F8E + ((stage -1)*0x44))

function HardChallengeAchievement(stage) {
    achievement(
        title=ChallengeData[stage]["hardTitle"], points=ChallengeData[stage]["hardPoints"],
        description= "Clear Challenge stages " + stage + "-" + (stage+4) + " on Hard difficulty.",
        trigger= LoadProtection && 
            prev(HardChallengeCheck(stage)) + 
            prev(HardChallengeCheck(stage + 1)) + 
            prev(HardChallengeCheck(stage + 2)) +
            prev(HardChallengeCheck(stage + 3)) +
            prev(HardChallengeCheck(stage + 4)) == 4 &&
            measured(HardChallengeCheck(stage) +
            HardChallengeCheck(stage + 1) +
            HardChallengeCheck(stage + 2) +
            HardChallengeCheck(stage + 3) +
            HardChallengeCheck(stage + 4) == 5)
    )
}
//might not use these group pro functions. writing them in case i decide to group stages together
function ProChallengeCheck(stage) =>
    byte(0xBC0F8F + ((stage -1)*0x44))

function ProChallengeAchievementGroup(stage) {
    achievement(
        title=ChallengeData[stage]["proTitle"], points=ChallengeData[stage]["proPoints"],
        description= "Clear Challenge stages " + stage + "-" + (stage+4) + " on Pro difficulty.",
        trigger= LoadProtection && 
            prev(ProChallengeCheck(stage)) + 
            prev(ProChallengeCheck(stage + 1)) + 
            prev(ProChallengeCheck(stage + 2)) +
            prev(ProChallengeCheck(stage + 3)) +
            prev(ProChallengeCheck(stage + 4)) == 4 &&
            measured(ProChallengeCheck(stage) +
            ProChallengeCheck(stage + 1) +
            ProChallengeCheck(stage + 2) +
            ProChallengeCheck(stage + 3) +
            ProChallengeCheck(stage + 4) == 5)
    )
}

function ProChallengeAchievement(stage) {
    achievement(
        title=ChallengeData[stage]["proTitle"], points=ChallengeData[stage]["proPoints"],
        description="Clear Challenge " + stage + " on Pro difficulty.",
        trigger = LoadProtection && Difficulty == Pro && ChallengeStage == stage && prev(GameState) == InStage && GameState == Results
    )
}

function StarCheck(stage) => // normal -> hard -> pro. use 0xBC057C if we need easy
    __ornext(dword(0xBC0588 + ((stage -1)*0x44)) >= StarData[stage]["normal5star"] ||
            dword(0xBC0594 + ((stage -1)*0x44)) >= StarData[stage]["hard5star"] ||
            dword(0xBC05A0 + ((stage -1)*0x44)) >= StarData[stage]["pro5star"])

function prevStarCheck(stage) => // normal -> hard -> pro
    __ornext(prev(dword(0xBC0588 + ((stage -1)*0x44))) >= StarData[stage]["normal5star"] ||
            prev(dword(0xBC0594 + ((stage -1)*0x44))) >= StarData[stage]["hard5star"] ||
            prev(dword(0xBC05A0 + ((stage -1)*0x44))) >= StarData[stage]["pro5star"])

function StarAchievement(stage) {
    achievement(
        title=StoryData[stage]["normalrankTitle"], points= StoryData[stage]["normalrankPoints"],
        description="Earn a 5-star rank for stages " + stage + "-" + (stage+4) + " on Normal difficulty or higher.",
        trigger= LoadProtection && 
            tally(4,once(prevStarCheck(stage)),
            once(prevStarCheck(stage+1)),
            once(prevStarCheck(stage+2)),
            once(prevStarCheck(stage+3)),
            once(prevStarCheck(stage+4))) &&
            measured(tally(5,once(StarCheck(stage)),
            once(StarCheck(stage+1)),
            once(StarCheck(stage+2)),
            once(StarCheck(stage+3)),
            once(StarCheck(stage+4)))) &&
            never(tally(5,once(prevStarCheck(stage)),
            once(prevStarCheck(stage+1)),
            once(prevStarCheck(stage+2)),
            once(prevStarCheck(stage+3)),
            once(prevStarCheck(stage+4)))) &&
            never(!LoadProtection)
    )
}

function ProStarAchievement(stage) {
    achievement(
        title=StoryData[stage]["prorankTitle"], points=StoryData[stage]["prorankPoints"],
        description="Earn a 5-star rank in Story " + stage + " on Pro difficulty by scoring " + StarData[stage]["desc"] + " or more points.",
        trigger = LoadProtection && GameState == Results && Difficulty == Pro && StoryStage == stage && 
                prev(Score) != Score && Score >= StarData[stage]["pro5star"]
        
    )
}

// $BC0DB0: [8-bit] Tutorial 1 - Easy clear
// $BC0DF4: [8-bit] Tutorial 2 - Easy clear
// $BC0E38: [8-bit] Tutorial 3 - Easy clear
// $BC0E7C: [8-bit] Tutorial 4 - Easy clear
// $BC0EC0: [8-bit] Tutorial 5 - Easy clear
// $BC0F04: [8-bit] Tutorial 6 - Easy clear
// $BC0F48: [8-bit] Tutorial 7 - Easy clear
function Tutorial() =>
    sum_of(range(0xBC0DB0,0xBC0F48,step=0x44), addr => byte(addr))
// $BC0F8C: [8-bit] Challenge 1 - Easy clear
// $BC0F8D: [8-bit] Challenge 1 - Normal clear
// $BC0F8E: [8-bit] Challenge 1 - Hard clear
// $BC0F8F: [8-bit] Challenge 1 - Pro clear
// $BC0F90: [8-bit] Challenge 1 - Available to play
// $BC0FD0: [8-bit] Challenge 2 - Easy clear
// $BC0FD1: [8-bit] Challenge 2 - Normal clear
// $BC0FD2: [8-bit] Challenge 2 - Hard clear
// $BC0FD3: [8-bit] Challenge 2 - Pro clear
// $BC0FD4: [8-bit] Challenge 2 - Available to play
// $BC1014: [8-bit] Challenge 3 - Easy clear
// $BC1015: [8-bit] Challenge 3 - Normal clear
// $BC1016: [8-bit] Challenge 3 - Hard clear
// $BC1017: [8-bit] Challenge 3 - Pro clear
// $BC1018: [8-bit] Challenge 3 - Available to play
// $BC1058: [8-bit] Challenge 4 - Easy clear
// $BC1059: [8-bit] Challenge 4 - Normal clear
// $BC105A: [8-bit] Challenge 4 - Hard clear
// $BC105B: [8-bit] Challenge 4 - Pro clear
// $BC105C: [8-bit] Challenge 4 - Available to play
// $BC109C: [8-bit] Challenge 5 - Easy clear
// $BC109D: [8-bit] Challenge 5 - Normal clear
// $BC109E: [8-bit] Challenge 5 - Hard clear
// $BC109F: [8-bit] Challenge 5 - Pro clear
// $BC10A0: [8-bit] Challenge 5 - Available to play
// $BC10E0: [8-bit] Challenge 6 - Easy clear
// $BC10E1: [8-bit] Challenge 6 - Normal clear
// $BC10E2: [8-bit] Challenge 6 - Hard clear
// $BC10E3: [8-bit] Challenge 6 - Pro clear
// $BC10E4: [8-bit] Challenge 6 - Available to play
// $BC1124: [8-bit] Challenge 7 - Easy clear
// $BC1125: [8-bit] Challenge 7 - Normal clear
// $BC1126: [8-bit] Challenge 7 - Hard clear
// $BC1127: [8-bit] Challenge 7 - Pro clear
// $BC1128: [8-bit] Challenge 7 - Available to play
// $BC1168: [8-bit] Challenge 8 - Easy clear
// $BC1169: [8-bit] Challenge 8 - Normal clear
// $BC116A: [8-bit] Challenge 8 - Hard clear
// $BC116B: [8-bit] Challenge 8 - Pro clear
// $BC116C: [8-bit] Challenge 8 - Available to play
// $BC11AC: [8-bit] Challenge 9 - Easy clear
// $BC11AD: [8-bit] Challenge 9 - Normal clear
// $BC11AE: [8-bit] Challenge 9 - Hard clear
// $BC11AF: [8-bit] Challenge 9 - Pro clear
// $BC11B0: [8-bit] Challenge 9 - Available to play
// $BC11F0: [8-bit] Challenge 10 - Easy clear
// $BC11F1: [8-bit] Challenge 10 - Normal clear
// $BC11F2: [8-bit] Challenge 10 - Hard clear
// $BC11F3: [8-bit] Challenge 10 - Pro clear
// $BC11F4: [8-bit] Challenge 10 - Available to play
// $BC1234: [8-bit] Challenge 11 - Easy clear
// $BC1235: [8-bit] Challenge 11 - Normal clear
// $BC1236: [8-bit] Challenge 11 - Hard clear
// $BC1237: [8-bit] Challenge 11 - Pro clear
// $BC1238: [8-bit] Challenge 11 - Available to play
// $BC1278: [8-bit] Challenge 12 - Easy clear
// $BC1279: [8-bit] Challenge 12 - Normal clear
// $BC127A: [8-bit] Challenge 12 - Hard clear
// $BC127B: [8-bit] Challenge 12 - Pro clear
// $BC127C: [8-bit] Challenge 12 - Available to play
// $BC12BC: [8-bit] Challenge 13 - Easy clear
// $BC12BD: [8-bit] Challenge 13 - Normal clear
// $BC12BE: [8-bit] Challenge 13 - Hard clear
// $BC12BF: [8-bit] Challenge 13 - Pro clear
// $BC12C0: [8-bit] Challenge 13 - Available to play
// $BC1300: [8-bit] Challenge 14 - Easy clear
// $BC1301: [8-bit] Challenge 14 - Normal clear
// $BC1302: [8-bit] Challenge 14 - Hard clear
// $BC1303: [8-bit] Challenge 14 - Pro clear
// $BC1304: [8-bit] Challenge 14 - Available to play
// $BC1344: [8-bit] Challenge 15 - Easy clear
// $BC1345: [8-bit] Challenge 15 - Normal clear
// $BC1346: [8-bit] Challenge 15 - Hard clear
// $BC1347: [8-bit] Challenge 15 - Pro clear
// $BC1348: [8-bit] Challenge 15 - Available to play
// $BC1388: [8-bit] Challenge 16 - Easy clear
// $BC1389: [8-bit] Challenge 16 - Normal clear
// $BC138A: [8-bit] Challenge 16 - Hard clear
// $BC138B: [8-bit] Challenge 16 - Pro clear
// $BC138C: [8-bit] Challenge 16 - Available to play
// $BC13CC: [8-bit] Challenge 17 - Easy clear
// $BC13CD: [8-bit] Challenge 17 - Normal clear
// $BC13CE: [8-bit] Challenge 17 - Hard clear
// $BC13CF: [8-bit] Challenge 17 - Pro clear
// $BC13D0: [8-bit] Challenge 17 - Available to play
// $BC1410: [8-bit] Challenge 18 - Easy clear
// $BC1411: [8-bit] Challenge 18 - Normal clear
// $BC1412: [8-bit] Challenge 18 - Hard clear
// $BC1413: [8-bit] Challenge 18 - Pro clear
// $BC1414: [8-bit] Challenge 18 - Available to play
// $BC1454: [8-bit] Challenge 19 - Easy clear
// $BC1455: [8-bit] Challenge 19 - Normal clear
// $BC1456: [8-bit] Challenge 19 - Hard clear
// $BC1457: [8-bit] Challenge 19 - Pro clear
// $BC1458: [8-bit] Challenge 19 - Available to play
// $BC1498: [8-bit] Challenge 20 - Easy clear
// $BC1499: [8-bit] Challenge 20 - Normal clear
// $BC149A: [8-bit] Challenge 20 - Hard clear
// $BC149B: [8-bit] Challenge 20 - Pro clear
// $BC149C: [8-bit] Challenge 20 - Available to play
// $BC14DC: [8-bit] Challenge 21 - Easy clear
// $BC14DD: [8-bit] Challenge 21 - Normal clear
// $BC14DE: [8-bit] Challenge 21 - Hard clear
// $BC14DF: [8-bit] Challenge 21 - Pro clear
// $BC14E0: [8-bit] Challenge 21 - Available to play
// $BC1520: [8-bit] Challenge 22 - Easy clear
// $BC1521: [8-bit] Challenge 22 - Normal clear
// $BC1522: [8-bit] Challenge 22 - Hard clear
// $BC1523: [8-bit] Challenge 22 - Pro clear
// $BC1524: [8-bit] Challenge 22 - Available to play
// $BC1564: [8-bit] Challenge 23 - Easy clear
// $BC1565: [8-bit] Challenge 23 - Normal clear
// $BC1566: [8-bit] Challenge 23 - Hard clear
// $BC1567: [8-bit] Challenge 23 - Pro clear
// $BC1568: [8-bit] Challenge 23 - Available to play
// $BC15A8: [8-bit] Challenge 24 - Easy clear
// $BC15A9: [8-bit] Challenge 24 - Normal clear
// $BC15AA: [8-bit] Challenge 24 - Hard clear
// $BC15AB: [8-bit] Challenge 24 - Pro clear
// $BC15AC: [8-bit] Challenge 24 - Available to play
// $BC15EC: [8-bit] Challenge 25 - Easy clear
// $BC15ED: [8-bit] Challenge 25 - Normal clear
// $BC15EE: [8-bit] Challenge 25 - Hard clear
// $BC15EF: [8-bit] Challenge 25 - Pro clear
// $BC15F0: [8-bit] Challenge 25 - Available to play
// $BC1630: [8-bit] Challenge 26 - Easy clear
// $BC1631: [8-bit] Challenge 26 - Normal clear
// $BC1632: [8-bit] Challenge 26 - Hard clear
// $BC1633: [8-bit] Challenge 26 - Pro clear
// $BC1634: [8-bit] Challenge 26 - Available to play
// $BC1674: [8-bit] Challenge 27 - Easy clear
// $BC1675: [8-bit] Challenge 27 - Normal clear
// $BC1676: [8-bit] Challenge 27 - Hard clear
// $BC1677: [8-bit] Challenge 27 - Pro clear
// $BC1678: [8-bit] Challenge 27 - Available to play
// $BC16B8: [8-bit] Challenge 28 - Easy clear
// $BC16B9: [8-bit] Challenge 28 - Normal clear
// $BC16BA: [8-bit] Challenge 28 - Hard clear
// $BC16BB: [8-bit] Challenge 28 - Pro clear
// $BC16BC: [8-bit] Challenge 28 - Available to play
// $BC16FC: [8-bit] Challenge 29 - Easy clear
// $BC16FD: [8-bit] Challenge 29 - Normal clear
// $BC16FE: [8-bit] Challenge 29 - Hard clear
// $BC16FF: [8-bit] Challenge 29 - Pro clear
// $BC1700: [8-bit] Challenge 29 - Available to play
// $BC1740: [8-bit] Challenge 30 - Easy clear
// $BC1741: [8-bit] Challenge 30 - Normal clear
// $BC1742: [8-bit] Challenge 30 - Hard clear
// $BC1743: [8-bit] Challenge 30 - Pro clear
// $BC1744: [8-bit] Challenge 30 - Available to play
// $BC1784: [8-bit] Challenge 31 - Easy clear
// $BC1785: [8-bit] Challenge 31 - Normal clear
// $BC1786: [8-bit] Challenge 31 - Hard clear
// $BC1787: [8-bit] Challenge 31 - Pro clear
// $BC1788: [8-bit] Challenge 31 - Available to play
// $BC17C8: [8-bit] Challenge 32 - Easy clear
// $BC17C9: [8-bit] Challenge 32 - Normal clear
// $BC17CA: [8-bit] Challenge 32 - Hard clear
// $BC17CB: [8-bit] Challenge 32 - Pro clear
// $BC17CC: [8-bit] Challenge 32 - Available to play
// $BC180C: [8-bit] Challenge 33 - Easy clear
// $BC180D: [8-bit] Challenge 33 - Normal clear
// $BC180E: [8-bit] Challenge 33 - Hard clear
// $BC180F: [8-bit] Challenge 33 - Pro clear
// $BC1810: [8-bit] Challenge 33 - Available to play
// $BC1850: [8-bit] Challenge 34 - Easy clear
// $BC1851: [8-bit] Challenge 34 - Normal clear
// $BC1852: [8-bit] Challenge 34 - Hard clear
// $BC1853: [8-bit] Challenge 34 - Pro clear
// $BC1854: [8-bit] Challenge 34 - Available to play
// $BC1894: [8-bit] Challenge 35 - Easy clear
// $BC1895: [8-bit] Challenge 35 - Normal clear
// $BC1896: [8-bit] Challenge 35 - Hard clear
// $BC1897: [8-bit] Challenge 35 - Pro clear
// $BC1898: [8-bit] Challenge 35 - Available to play
// $BC18D8: [8-bit] Challenge 36 - Easy clear
// $BC18D9: [8-bit] Challenge 36 - Normal clear
// $BC18DA: [8-bit] Challenge 36 - Hard clear
// $BC18DB: [8-bit] Challenge 36 - Pro clear
// $BC18DC: [8-bit] Challenge 36 - Available to play
// $BC191C: [8-bit] Challenge 37 - Easy clear
// $BC191D: [8-bit] Challenge 37 - Normal clear
// $BC191E: [8-bit] Challenge 37 - Hard clear
// $BC191F: [8-bit] Challenge 37 - Pro clear
// $BC1920: [8-bit] Challenge 37 - Available to play
// $BC1960: [8-bit] Challenge 38 - Easy clear
// $BC1961: [8-bit] Challenge 38 - Normal clear
// $BC1962: [8-bit] Challenge 38 - Hard clear
// $BC1963: [8-bit] Challenge 38 - Pro clear
// $BC1964: [8-bit] Challenge 38 - Available to play
// $BC19A4: [8-bit] Challenge 39 - Easy clear
// $BC19A5: [8-bit] Challenge 39 - Normal clear
// $BC19A6: [8-bit] Challenge 39 - Hard clear
// $BC19A7: [8-bit] Challenge 39 - Pro clear
// $BC19A8: [8-bit] Challenge 39 - Available to play
// $BC19E8: [8-bit] Challenge 40 - Easy clear
// $BC19E9: [8-bit] Challenge 40 - Normal clear
// $BC19EA: [8-bit] Challenge 40 - Hard clear
// $BC19EB: [8-bit] Challenge 40 - Pro clear
// $BC19EC: [8-bit] Challenge 40 - Available to play
// $BC1A2C: [8-bit] Challenge 41 - Easy clear
// $BC1A2D: [8-bit] Challenge 41 - Normal clear
// $BC1A2E: [8-bit] Challenge 41 - Hard clear
// $BC1A2F: [8-bit] Challenge 41 - Pro clear
// $BC1A30: [8-bit] Challenge 41 - Available to play
// $BC1A70: [8-bit] Challenge 42 - Easy clear
// $BC1A71: [8-bit] Challenge 42 - Normal clear
// $BC1A72: [8-bit] Challenge 42 - Hard clear
// $BC1A73: [8-bit] Challenge 42 - Pro clear
// $BC1A74: [8-bit] Challenge 42 - Available to play
// $BC1AB4: [8-bit] Challenge 43 - Easy clear
// $BC1AB5: [8-bit] Challenge 43 - Normal clear
// $BC1AB6: [8-bit] Challenge 43 - Hard clear
// $BC1AB7: [8-bit] Challenge 43 - Pro clear
// $BC1AB8: [8-bit] Challenge 43 - Available to play
// $BC1AF8: [8-bit] Challenge 44 - Easy clear
// $BC1AF9: [8-bit] Challenge 44 - Normal clear
// $BC1AFA: [8-bit] Challenge 44 - Hard clear
// $BC1AFB: [8-bit] Challenge 44 - Pro clear
// $BC1AFC: [8-bit] Challenge 44 - Available to play
// $BC1B3C: [8-bit] Challenge 45 - Easy clear
// $BC1B3D: [8-bit] Challenge 45 - Normal clear
// $BC1B3E: [8-bit] Challenge 45 - Hard clear
// $BC1B3F: [8-bit] Challenge 45 - Pro clear
// $BC1B40: [8-bit] Challenge 45 - Available to play
// $BC1B80: [8-bit] Challenge 46 - Easy clear
// $BC1B81: [8-bit] Challenge 46 - Normal clear
// $BC1B82: [8-bit] Challenge 46 - Hard clear
// $BC1B83: [8-bit] Challenge 46 - Pro clear
// $BC1B84: [8-bit] Challenge 46 - Available to play
// $BC1BC4: [8-bit] Challenge 47 - Easy clear
// $BC1BC5: [8-bit] Challenge 47 - Normal clear
// $BC1BC6: [8-bit] Challenge 47 - Hard clear
// $BC1BC7: [8-bit] Challenge 47 - Pro clear
// $BC1BC8: [8-bit] Challenge 47 - Available to play
// $BC1C08: [8-bit] Challenge 48 - Easy clear
// $BC1C09: [8-bit] Challenge 48 - Normal clear
// $BC1C0A: [8-bit] Challenge 48 - Hard clear
// $BC1C0B: [8-bit] Challenge 48 - Pro clear
// $BC1C0C: [8-bit] Challenge 48 - Available to play
// $BC1C4C: [8-bit] Challenge 49 - Easy clear
// $BC1C4D: [8-bit] Challenge 49 - Normal clear
// $BC1C4E: [8-bit] Challenge 49 - Hard clear
// $BC1C4F: [8-bit] Challenge 49 - Pro clear
// $BC1C50: [8-bit] Challenge 49 - Available to play
// $BC1C90: [8-bit] Challenge 50 - Easy clear
// $BC1C91: [8-bit] Challenge 50 - Normal clear
// $BC1C92: [8-bit] Challenge 50 - Hard clear
// $BC1C93: [8-bit] Challenge 50 - Pro clear
// $BC1C94: [8-bit] Challenge 50 - Available to play
function AnyChallenge() =>
    sum_of(range(0xBC0F8C,0xBC1C90,step=0x44), addr => dword(addr)/dword(addr))
function ProChallenge() =>
    sum_of(range(0xBC0F8F,0xBC1C93,step=0x44), addr => byte(addr))
    
ChallengeClearData = {
    1:{"title":"Rising Saboteur","desc":" and unlock the next set.","points":10},
    11:{"title":"Steel Slicer","desc":" and unlock the next set.","points":10},
    21:{"title":"Warship Dissector","desc":" and unlock the next set.","points":10},
    31:{"title":"Master of the Skies","desc":" and unlock the final set. You may need a promotion to access them!","points":10},
    41:{"title":"Patchwork Hero","desc":". Now try them on a harder difficulty!","points":25},
}

function ChallengeClears(stage) =>
    sum_of(range(0xBC0F8C + ((stage-1)*0x44),0xBC0F8C + ((stage+8)*0x44),step=0x44), addr => dword(addr)/dword(addr))
    
function ChallengeClearsAchievement(stage) {
    achievement(
        title=ChallengeClearData[stage]["title"], points=ChallengeClearData[stage]["points"],
        description="Clear Challenge stages " + stage + "-" + (stage+9) + ChallengeClearData[stage]["desc"],
        trigger= LoadProtection && prev(ChallengeClears(stage)) == 9 && measured(ChallengeClears(stage) == 10)
    )
}
// $BC1CE0: Graveyard/Resident Card change to 0x01 when unlocked; offset is 0x04 between each graveyard entry and 0x01 between Resident Cards
//          ---------------------------------------
//          [8-bit] Graveyard 018 - Jirikon unlocked
// $BC1CE2: [16-bit] Graveyard 018 - Jirikon death count
// $BC1CE4: [8-bit] Graveyard 019 - Gasula unlocked
// $BC1CE6: [16-bit] Graveyard 019 - Gasula death count
// $BC1CE8: [8-bit] Graveyard 020 - Egarumi unlocked
// $BC1CEA: [16-bit] Graveyard 020 - Egarumi death count
// $BC1CEC: [8-bit] Graveyard 021 - Higanae unlocked
// $BC1CEE: [16-bit] Graveyard 021 - Higanae death count
// $BC1CF0: [8-bit] Graveyard 022 - Sasaesa unlocked
// $BC1CF2: [16-bit] Graveyard 022 - Sasaesa death count
// $BC1CF4: [8-bit] Graveyard 023 - Keiro unlocked
// $BC1CF6: [16-bit] Graveyard 023 - Keiro death count
// $BC1CF8: [8-bit] Graveyard 024 - Oileo unlocked
// $BC1CFA: [16-bit] Graveyard 024 - Oileo death count
// $BC1CFC: [8-bit] Graveyard 025 - Kelasoh unlocked
// $BC1CFE: [16-bit] Graveyard 025 - Kelasoh death count
// $BC1D00: [8-bit] Graveyard 026 - Hajimeri unlocked
// $BC1D02: [16-bit] Graveyard 026 - Hajimeri death count
// $BC1D04: [8-bit] Graveyard 027 - Focolio unlocked
// $BC1D06: [16-bit] Graveyard 027 - Focolio death count
// $BC1D08: [8-bit] Graveyard 028 - Chana unlocked
// $BC1D0A: [16-bit] Graveyard 028 - Chana death count
// $BC1D0C: [8-bit] Graveyard 029 - Kioto unlocked
// $BC1D0E: [16-bit] Graveyard 029 - Kioto death count
// $BC1D10: [8-bit] Graveyard 030 - Choi unlocked
// $BC1D12: [16-bit] Graveyard 030 - Choi death count
// $BC1D14: [8-bit] Graveyard 031 - Sawa unlocked
// $BC1D16: [16-bit] Graveyard 031 - Sawa death count
// $BC1D18: [8-bit] Graveyard 032 - Jikasa unlocked
// $BC1D1A: [16-bit] Graveyard 032 - Jikasa death count
// $BC1D1C: [8-bit] Graveyard 033 - Neil unlocked (can't be sent to graveyard; rescue mission)
// $BC1D1E: [16-bit] Graveyard 033 - Neil death count
// $BC1D20: [8-bit] Graveyard 034 - Seegers unlocked (can't be sent to graveyard; rescue mission)
// $BC1D22: [16-bit] Graveyard 034 - Seegers death count
// $BC1D24: [8-bit] Graveyard 035 - Susunaru unlocked (can't be sent to graveyard; rescue mission)
// $BC1D26: [16-bit] Graveyard 035 - Susunaru death count
// $BC1D28: [8-bit] Graveyard 036 - Sewarei unlocked (can't be sent to graveyard; rescue mission)
// $BC1D2A: [16-bit] Graveyard 036 - Sewarei death count
// $BC1D2C: [8-bit] Graveyard 037 - Soero unlocked (can't be sent to graveyard; rescue mission)
// $BC1D2E: [16-bit] Graveyard 037 - Soero death count
// $BC1D30: [8-bit] Graveyard 038 - Raulo unlocked
// $BC1D32: [16-bit] Graveyard 038 - Raulo death count
// $BC1D34: [8-bit] Graveyard 039 - Ponomi unlocked
// $BC1D36: [16-bit] Graveyard 039 - Ponomi death count
// $BC1D38: [8-bit] Graveyard 040 - Stelas unlocked
// $BC1D3A: [16-bit] Graveyard 040 - Stelas death count
// $BC1D3C: [8-bit] Graveyard 041 - Nochi unlocked
// $BC1D3E: [16-bit] Graveyard 041 - Nochi death count
// $BC1D40: [8-bit] Graveyard 042 - Zayed unlocked
// $BC1D42: [16-bit] Graveyard 042 - Zayed death count
// $BC1D44: [8-bit] Graveyard 043 - Kikoi unlocked
// $BC1D46: [16-bit] Graveyard 043 - Kikoi death count
// $BC1D48: [8-bit] Graveyard 044 - Chokhi unlocked
// $BC1D4A: [16-bit] Graveyard 044 - Chokhi death count
// $BC1D4C: [8-bit] Graveyard 045 - Stag unlocked
// $BC1D4E: [16-bit] Graveyard 045 - Stag death count
// $BC1D50: [8-bit] Graveyard 046 - Horiki unlocked
// $BC1D52: [16-bit] Graveyard 046 - Horiki death count
// $BC1D54: [8-bit] Graveyard 047 - Fie unlocked
// $BC1D56: [16-bit] Graveyard 047 - Fie death count
// $BC1D58: [8-bit] Graveyard 048 - Reno unlocked
// $BC1D5A: [16-bit] Graveyard 048 - Reno death count
// $BC1D5C: [8-bit] Graveyard 049 - Kisabio unlocked
// $BC1D5E: [16-bit] Graveyard 049 - Kisabio death count
// $BC1D60: [8-bit] Graveyard 050 - Asapo unlocked
// $BC1D62: [16-bit] Graveyard 050 - Asapo death count
// $BC1D64: [8-bit] Graveyard 051 - Kisan unlocked
// $BC1D66: [16-bit] Graveyard 051 - Kisan death count
// $BC1D68: [8-bit] Graveyard 052 - Chuchu unlocked
// $BC1D6A: [16-bit] Graveyard 052 - Chuchu death count
// $BC1D6C: [8-bit] Graveyard 053 - Zoilo unlocked
// $BC1D6E: [16-bit] Graveyard 053 - Zoilo death count
// $BC1D70: [8-bit] Graveyard 054 - Cobb unlocked
// $BC1D72: [16-bit] Graveyard 054 - Cobb death count
// $BC1D74: [8-bit] Graveyard 055 - Conoy unlocked
// $BC1D76: [16-bit] Graveyard 055 - Conoy death count
// $BC1D78: [8-bit] Graveyard 056 - Iona unlocked
// $BC1D7A: [16-bit] Graveyard 056 - Iona death count
// $BC1D7C: [8-bit] Graveyard 057 - Eshin unlocked
// $BC1D7E: [16-bit] Graveyard 057 - Eshin death count
// $BC1D80: [8-bit] Graveyard 058 - Carla unlocked
// $BC1D82: [16-bit] Graveyard 058 - Carla death count
// $BC1D84: [8-bit] Graveyard 059 - Homei unlocked
// $BC1D86: [16-bit] Graveyard 059 - Homei death count
// $BC1D88: [8-bit] Graveyard 060 - Keik unlocked
// $BC1D8A: [16-bit] Graveyard 060 - Keik death count
// $BC1D8C: [8-bit] Graveyard 061 - Jijiro unlocked
// $BC1D8E: [16-bit] Graveyard 061 - Jijiro death count
// $BC1D90: [8-bit] Graveyard 062 - Hess unlocked
// $BC1D92: [16-bit] Graveyard 062 - Hess death count
// $BC1D94: [8-bit] Graveyard 063 - Bibim unlocked
// $BC1D96: [16-bit] Graveyard 063 - Bibim death count
// $BC1D98: [8-bit] Graveyard 064 - Romin unlocked
// $BC1D9A: [16-bit] Graveyard 064 - Romin death count
// $BC1D9C: [8-bit] Graveyard 065 - Shii unlocked
// $BC1D9E: [16-bit] Graveyard 065 - Shii death count
// $BC1DA0: [8-bit] Graveyard 066 - Mei unlocked
// $BC1DA2: [16-bit] Graveyard 066 - Mei death count
// $BC1DA4: [8-bit] Graveyard 067 - Raoiso unlocked
// $BC1DA6: [16-bit] Graveyard 067 - Raoiso death count
// $BC1DA8: [8-bit] Graveyard 068 - Broglie unlocked
// $BC1DAA: [16-bit] Graveyard 068 - Broglie death count
// $BC1DAC: [8-bit] Graveyard 069 - Oarse unlocked
// $BC1DAE: [16-bit] Graveyard 069 - Oarse death count
// $BC1DB0: [8-bit] Graveyard 070 - Popo unlocked
// $BC1DB2: [16-bit] Graveyard 070 - Popo death count
// $BC1DB4: [8-bit] Graveyard 071 - Masa unlocked
// $BC1DB6: [16-bit] Graveyard 071 - Masa death count
// $BC1DB8: [8-bit] Graveyard 072 - Gillain unlocked
// $BC1DBA: [16-bit] Graveyard 072 - Gillain death count
// $BC1DBC: [8-bit] Graveyard 073 - Winart unlocked
// $BC1DBE: [16-bit] Graveyard 073 - Winart death count
// $BC1DC0: [8-bit] Graveyard 074 - Sojima unlocked
// $BC1DC2: [16-bit] Graveyard 074 - Sojima death count
// $BC1DC4: [8-bit] Graveyard 075 - Chatta unlocked
// $BC1DC6: [16-bit] Graveyard 075 - Chatta death count
// $BC1DC8: [8-bit] Graveyard 076 - Sadau unlocked
// $BC1DCA: [16-bit] Graveyard 076 - Sadau death count
// $BC1DCC: [8-bit] Graveyard 077 - Kozik unlocked
// $BC1DCE: [16-bit] Graveyard 077 - Kozik death count
// $BC1DD0: [8-bit] Graveyard 078 - Epon unlocked
// $BC1DD2: [16-bit] Graveyard 078 - Epon death count
// $BC1DD4: [8-bit] Graveyard 079 - Korinana unlocked
// $BC1DD6: [16-bit] Graveyard 079 - Korinana death count
// $BC1DD8: [8-bit] Graveyard 080 - Tsukao unlocked
// $BC1DDA: [16-bit] Graveyard 080 - Tsukao death count
// $BC1DDC: [8-bit] Graveyard 081 - Kasana unlocked
// $BC1DDE: [16-bit] Graveyard 081 - Kasana death count
// $BC1DE0: [8-bit] Graveyard 082 - Watawata unlocked
// $BC1DE2: [16-bit] Graveyard 082 - Watawata death count
// $BC1DE4: [8-bit] Graveyard 083 - Pochita unlocked
// $BC1DE6: [16-bit] Graveyard 083 - Pochita death count
// $BC1DE8: [8-bit] Graveyard 084 - Yasaki unlocked
// $BC1DEA: [16-bit] Graveyard 084 - Yasaki death count
// $BC1DEC: [8-bit] Graveyard 085 - Laga unlocked
// $BC1DEE: [16-bit] Graveyard 085 - Laga death count
// $BC1DF0: [8-bit] Graveyard 086 - Jojak unlocked
// $BC1DF2: [16-bit] Graveyard 086 - Jojak death count
// $BC1DF4: [8-bit] Graveyard 087 - Uwei unlocked
// $BC1DF6: [16-bit] Graveyard 087 - Uwei death count
// $BC1DF8: [8-bit] Graveyard 088 - Flo unlocked
// $BC1DFA: [16-bit] Graveyard 088 - Flo death count
// $BC1DFC: [8-bit] Graveyard 089 - Katako unlocked
// $BC1DFE: [16-bit] Graveyard 089 - Katako death count
// $BC1E00: [8-bit] Graveyard 090 - Laban unlocked
// $BC1E02: [16-bit] Graveyard 090 - Laban death count
// $BC1E04: [8-bit] Graveyard 091 - Kooey unlocked
// $BC1E06: [16-bit] Graveyard 091 - Kooey death count
// $BC1E08: [8-bit] Graveyard 092 - Tomanin unlocked
// $BC1E0A: [16-bit] Graveyard 092 - Tomanin death count
// $BC1E0C: [8-bit] Graveyard 093 - Gatas unlocked
// $BC1E0E: [16-bit] Graveyard 093 - Gatas death count
// $BC1E10: [8-bit] Graveyard 094 - Akini unlocked
// $BC1E12: [16-bit] Graveyard 094 - Akini death count
// $BC1E14: [8-bit] Graveyard 095 - Seanon unlocked
// $BC1E16: [16-bit] Graveyard 095 - Seanon death count
// $BC1E18: [8-bit] Graveyard 096 - Papanei unlocked
// $BC1E1A: [16-bit] Graveyard 096 - Papanei death count
// $BC1E1C: [8-bit] Graveyard 097 - Susunaru unlocked
// $BC1E1E: [16-bit] Graveyard 097 - Susunaru death count
// $BC1E20: [8-bit] Graveyard 098 - Magnon unlocked
// $BC1E22: [16-bit] Graveyard 098 - Magnon death count
// $BC1E24: [8-bit] Graveyard 099 - Pipioli unlocked
// $BC1E26: [16-bit] Graveyard 099 - Pipioli death count
// $BC1E28: [8-bit] Graveyard 100 - Mimiso unlocked
// $BC1E2A: [16-bit] Graveyard 100 - Mimiso death count
// $BC1E2C: [8-bit] Graveyard 101 - Randama unlocked
// $BC1E2E: [16-bit] Graveyard 101 - Randama death count
// $BC1E30: [8-bit] Graveyard 102 - Kalyan unlocked
// $BC1E32: [16-bit] Graveyard 102 - Kalyan death count
// $BC1E34: [8-bit] Graveyard 103 - Iwi unlocked
// $BC1E36: [16-bit] Graveyard 103 - Iwi death count
// $BC1E38: [8-bit] Graveyard 104 - Martin unlocked
// $BC1E3A: [16-bit] Graveyard 104 - Martin death count
// $BC1E3C: [8-bit] Graveyard 105 - Gyanja unlocked
// $BC1E3E: [16-bit] Graveyard 105 - Gyanja death count
// $BC1E40: [8-bit] Graveyard 106 - Corono unlocked
// $BC1E42: [16-bit] Graveyard 106 - Corono death count
// $BC1E44: [8-bit] Graveyard 107 - Nastro unlocked
// $BC1E46: [16-bit] Graveyard 107 - Nastro death count
// $BC1E48: [8-bit] Graveyard 108 - Nazca unlocked
// $BC1E4A: [16-bit] Graveyard 108 - Nazca death count
// $BC1E4C: [8-bit] Graveyard 109 - Machica unlocked
// $BC1E4E: [16-bit] Graveyard 109 - Machica death count
// $BC1E50: [8-bit] Graveyard 110 - Malqart unlocked
// $BC1E52: [16-bit] Graveyard 110 - Malqart death count
// $BC1E54: [8-bit] Graveyard 111 - Mahaseer unlocked
// $BC1E56: [16-bit] Graveyard 111 - Mahaseer death count
// $BC1E58: [8-bit] Graveyard 112 - Memeca unlocked
// $BC1E5A: [16-bit] Graveyard 112 - Memeca death count
// $BC1E5C: [8-bit] Graveyard 113 - Gibble unlocked
// $BC1E5E: [16-bit] Graveyard 113 - Gibble death count
// $BC1E60: [8-bit] Graveyard 114 - Thuuga unlocked
// $BC1E62: [16-bit] Graveyard 114 - Thuuga death count
// $BC1E64: [8-bit] Graveyard 115 - Sagahma unlocked
// $BC1E66: [16-bit] Graveyard 115 - Sagahma death count
// $BC1E68: [8-bit] Graveyard 116 - Bonita unlocked
// $BC1E6A: [16-bit] Graveyard 116 - Bonita death count
// $BC1E6C: [8-bit] Graveyard 117 - Bettany unlocked
// $BC1E6E: [16-bit] Graveyard 117 - Bettany death count
// $BC1E70: [8-bit] Graveyard 118 - Fujimi unlocked
// $BC1E72: [16-bit] Graveyard 118 - Fujimi death count
// $BC1E74: [8-bit] Graveyard 119 - Kat unlocked
// $BC1E76: [16-bit] Graveyard 119 - Kat death count
// $BC1E78: [8-bit] Graveyard 120 - Askof unlocked
// $BC1E7A: [16-bit] Graveyard 120 - Askof death count
// $BC1E7C: [8-bit] Graveyard 121 - Kishirato unlocked
// $BC1E7E: [16-bit] Graveyard 121 - Kishirato death count
// $BC1E80: [8-bit] Graveyard 122 - Gabarashu unlocked
// $BC1E82: [16-bit] Graveyard 122 - Gabarashu death count
// $BC1E84: [8-bit] Graveyard 123 - Glassa unlocked
// $BC1E86: [16-bit] Graveyard 123 - Glassa death count
// $BC1E88: [8-bit] Graveyard 124 - Amana unlocked
// $BC1E8A: [16-bit] Graveyard 124 - Amana death count
// $BC1E8C: [8-bit] Graveyard 125 - Gamana unlocked
// $BC1E8E: [16-bit] Graveyard 125 - Gamana death count
// $BC1E90: [8-bit] Graveyard 126 - Locola unlocked
// $BC1E92: [16-bit] Graveyard 126 - Locola death count
// $BC1E94: [8-bit] Graveyard 127 - Meej unlocked
// $BC1E96: [16-bit] Graveyard 127 - Meej death count
// $BC1E98: [8-bit] Graveyard 128 - Gagashka unlocked
// $BC1E9A: [16-bit] Graveyard 128 - Gagashka death count
// $BC1E9C: [8-bit] Graveyard 129 - Komego unlocked
// $BC1E9E: [16-bit] Graveyard 129 - Komego death count
// $BC1EA0: [8-bit] Graveyard 130 - Gorojiko unlocked
// $BC1EA2: [16-bit] Graveyard 130 - Gorojiko death count
// $BC1EA4: [8-bit] Graveyard 131 - Joanna unlocked
// $BC1EA6: [16-bit] Graveyard 131 - Joanna death count
// $BC1EA8: [8-bit] Graveyard 132 - Keno unlocked
// $BC1EAA: [16-bit] Graveyard 132 - Keno death count
// $BC1EAC: [8-bit] Graveyard 133 - Itchy unlocked
// $BC1EAE: [16-bit] Graveyard 133 - Itchy death count
// $BC1EB0: [8-bit] Graveyard 134 - Matzu unlocked
// $BC1EB2: [16-bit] Graveyard 134 - Matzu death count
// $BC1EB4: [8-bit] Graveyard 135 - Loydlai unlocked
// $BC1EB6: [16-bit] Graveyard 135 - Loydlai death count
// $BC1EB8: [8-bit] Graveyard 136 - Pucino unlocked
// $BC1EBA: [16-bit] Graveyard 136 - Pucino death count
// $BC1EBC: [8-bit] Graveyard 137 - Chucky unlocked
// $BC1EBE: [16-bit] Graveyard 137 - Chucky death count
// $BC1EC0: [8-bit] Graveyard 138 - Hameena unlocked
// $BC1EC2: [16-bit] Graveyard 138 - Hameena death count
// $BC1EC4: [8-bit] Graveyard 139 - Nombleux unlocked
// $BC1EC6: [16-bit] Graveyard 139 - Nombleux death count
// $BC1EC8: [8-bit] Graveyard 140 - Princy unlocked
// $BC1ECA: [16-bit] Graveyard 140 - Princy death count
// $BC1ECC: [8-bit] Graveyard 141 - Goirle unlocked
// $BC1ECE: [16-bit] Graveyard 141 - Goirle death count
// $BC1ED0: [8-bit] Graveyard 142 - Filldam unlocked
// $BC1ED2: [16-bit] Graveyard 142 - Filldam death count
// $BC1ED4: [8-bit] Graveyard 143 - Flagger unlocked
// $BC1ED6: [16-bit] Graveyard 143 - Flagger death count
// $BC1ED8: [8-bit] Graveyard 144 - Moskaw unlocked
// $BC1EDA: [16-bit] Graveyard 144 - Moskaw death count
// $BC1EDC: [8-bit] Graveyard 145 - Risa unlocked
// $BC1EDE: [16-bit] Graveyard 145 - Risa death count
// $BC1EE0: [8-bit] Graveyard 146 - Pyong unlocked
// $BC1EE2: [16-bit] Graveyard 146 - Pyong death count
// $BC1EE4: [8-bit] Graveyard 147 - Seligman unlocked
// $BC1EE6: [16-bit] Graveyard 147 - Seligman death count
// $BC1EE8: [8-bit] Graveyard 148 - Stein unlocked
// $BC1EEA: [16-bit] Graveyard 148 - Stein death count
// $BC1EEC: [8-bit] Graveyard 149 - Gampo unlocked
// $BC1EEE: [16-bit] Graveyard 149 - Gampo death count
// $BC1EF0: [8-bit] Graveyard 150 - Kikushan unlocked
// $BC1EF2: [16-bit] Graveyard 150 - Kikushan death count
// $BC1EF4: [8-bit] Graveyard 151 - Rinker unlocked
// $BC1EF6: [16-bit] Graveyard 151 - Rinker death count
// $BC1EF8: [8-bit] Graveyard 152 - Gatsugen unlocked
// $BC1EFA: [16-bit] Graveyard 152 - Gatsugen death count
// $BC1EFC: [8-bit] Graveyard 153 - Shakif unlocked
// $BC1EFE: [16-bit] Graveyard 153 - Shakif death count
// $BC1F00: [8-bit] Graveyard 154 - Simon unlocked
// $BC1F02: [16-bit] Graveyard 154 - Simon death count
// $BC1F04: [8-bit] Graveyard 155 - Noja unlocked
// $BC1F06: [16-bit] Graveyard 155 - Noja death count
// $BC1F08: [8-bit] Graveyard 156 - Beshata unlocked
// $BC1F0A: [16-bit] Graveyard 156 - Beshata death count
// $BC1F0C: [8-bit] Graveyard 157 - Hagal unlocked
// $BC1F0E: [16-bit] Graveyard 157 - Hagal death count
// $BC1F10: [8-bit] Graveyard 158 - Arsono unlocked
// $BC1F12: [16-bit] Graveyard 158 - Arsono death count
// $BC1F14: [8-bit] Graveyard 159 - Gambano unlocked
// $BC1F16: [16-bit] Graveyard 159 - Gambano death count
// $BC1F18: [8-bit] Graveyard 160 - Mubani unlocked
// $BC1F1A: [16-bit] Graveyard 160 - Mubani death count
// $BC1F1C: [8-bit] Graveyard 161 - Marci unlocked
// $BC1F1E: [16-bit] Graveyard 161 - Marci death count
// $BC1F20: [8-bit] Graveyard 162 - Killam unlocked
// $BC1F22: [16-bit] Graveyard 162 - Killam death count
// $BC1F24: [8-bit] Graveyard 163 - Mender unlocked
// $BC1F26: [16-bit] Graveyard 163 - Mender death count
// $BC1F28: [8-bit] Graveyard 164 - Asmo unlocked
// $BC1F2A: [16-bit] Graveyard 164 - Asmo death count
// $BC1F2C: [8-bit] Graveyard 165 - Czechle unlocked
// $BC1F2E: [16-bit] Graveyard 165 - Czechle death count
// $BC1F30: [8-bit] Graveyard 166 - Nambe unlocked
// $BC1F32: [16-bit] Graveyard 166 - Nambe death count
// $BC1F34: [8-bit] Graveyard 167 - Laveria unlocked
// $BC1F36: [16-bit] Graveyard 167 - Laveria death count
// $BC1F38: [8-bit] Graveyard 168 - Persson unlocked
// $BC1F3A: [16-bit] Graveyard 168 - Persson death count
// $BC1F3C: [8-bit] Graveyard 169 - Punt unlocked
// $BC1F3E: [16-bit] Graveyard 169 - Punt death count
// $BC1F40: [8-bit] Graveyard 170 - Chalak unlocked
// $BC1F42: [16-bit] Graveyard 170 - Chalak death count
// $BC1F44: [8-bit] Graveyard 171 - Spechico unlocked
// $BC1F46: [16-bit] Graveyard 171 - Spechico death count
// $BC1F48: [8-bit] Graveyard 172 - Ahorn unlocked
// $BC1F4A: [16-bit] Graveyard 172 - Ahorn death count
// $BC1F4C: [8-bit] Graveyard 173 - Felicia unlocked
// $BC1F4E: [16-bit] Graveyard 173 - Felicia death count
// $BC1F50: [8-bit] Graveyard 174 - Balencino unlocked
// $BC1F52: [16-bit] Graveyard 174 - Balencino death count
// $BC1F54: [8-bit] Graveyard 175 - Akapamaji unlocked
// $BC1F56: [16-bit] Graveyard 175 - Akapamaji death count
// $BC1F58: [8-bit] Graveyard 176 - Ocoromo unlocked
// $BC1F5A: [16-bit] Graveyard 176 - Ocoromo death count
// $BC1F5C: [8-bit] Graveyard 177 - Choi Kin unlocked
// $BC1F5E: [16-bit] Graveyard 177 - Choi Kin death count
// $BC1F60: [8-bit] Graveyard 178 - Sumatra unlocked
// $BC1F62: [16-bit] Graveyard 178 - Sumatra death count
// $BC1F64: [8-bit] Graveyard 179 - Nejil unlocked
// $BC1F66: [16-bit] Graveyard 179 - Nejil death count
// $BC1F68: [8-bit] Graveyard 180 - Nejima unlocked
// $BC1F6A: [16-bit] Graveyard 180 - Nejima death count
// $BC1F6C: [8-bit] Graveyard 181 - Epllie unlocked
// $BC1F6E: [16-bit] Graveyard 181 - Epllie death count
// $BC1F70: [8-bit] Graveyard 182 - Spires unlocked
// $BC1F72: [16-bit] Graveyard 182 - Spires death count
// $BC1F74: [8-bit] Graveyard 183 - Walili unlocked
// $BC1F76: [16-bit] Graveyard 183 - Walili death count
// $BC1F78: [8-bit] Graveyard 184 - Melnose unlocked
// $BC1F7A: [16-bit] Graveyard 184 - Melnose death count
// $BC1F7C: [8-bit] Graveyard 185 - Holdein unlocked
// $BC1F7E: [16-bit] Graveyard 185 - Holdein death count
// $BC1F80: [8-bit] Graveyard 186 - Doppela unlocked
// $BC1F82: [16-bit] Graveyard 186 - Doppela death count
// $BC1F84: [8-bit] Graveyard 187 - Gahgella unlocked
// $BC1F86: [16-bit] Graveyard 187 - Gahgella death count
// $BC1F88: [8-bit] Graveyard 188 - Lukin unlocked
// $BC1F8A: [16-bit] Graveyard 188 - Lukin death count
// $BC1F8C: [8-bit] Graveyard 189 - Peikku unlocked
// $BC1F8E: [16-bit] Graveyard 189 - Peikku death count
// $BC1F90: [8-bit] Graveyard 190 - Metapatch unlocked
// $BC1F92: [16-bit] Graveyard 190 - Metapatch death count
function Graveyard() =>
    sum_of(range(0xBC1CE0,0xBC1F90,step=4), addr => byte(addr))
// $BC202C: [8-bit] Resident Card 000 - Titori
// $BC202D: [8-bit] Resident Card 001 - Asli
// $BC202E: [8-bit] Resident Card 002 - Koja
// $BC202F: [8-bit] Resident Card 003 - Announcer
// $BC2030: [8-bit] Resident Card 004 - Junger
// $BC2031: [8-bit] Resident Card 005 - Chantha
// $BC2032: [8-bit] Resident Card 006 - Gatum
// $BC2033: [8-bit] Resident Card 007 - Totonel
// $BC2034: [8-bit] Resident Card 008 - Musset
// $BC2035: [8-bit] Resident Card 009 - Vipi
// $BC2036: [8-bit] Resident Card 010 - Polk
// $BC2037: [8-bit] Resident Card 011 - Suchi
// $BC2038: [8-bit] Resident Card 012 - Yakun
// $BC2039: [8-bit] Resident Card 013 - Wigo
// $BC203A: [8-bit] Resident Card 014 - Elano
// $BC203B: [8-bit] Resident Card 015 - Sorin
// $BC203C: [8-bit] Resident Card 016 - Tongsa
// $BC203D: [8-bit] Resident Card 017 - Corkus
// $BC203E: [8-bit] Resident Card 018 - Jirikon
// $BC203F: [8-bit] Resident Card 019 - Gasula
// $BC2040: [8-bit] Resident Card 020 - Egarumi
// $BC2041: [8-bit] Resident Card 021 - Higanae
// $BC2042: [8-bit] Resident Card 022 - Sasaesa
// $BC2043: [8-bit] Resident Card 023 - Keiro
// $BC2044: [8-bit] Resident Card 024 - Oileo
// $BC2045: [8-bit] Resident Card 025 - Kelasoh
// $BC2046: [8-bit] Resident Card 026 - Hajimeri
// $BC2047: [8-bit] Resident Card 027 - Focolio
// $BC2048: [8-bit] Resident Card 028 - Chana
// $BC2049: [8-bit] Resident Card 029 - Kioto
// $BC204A: [8-bit] Resident Card 030 - Choi
// $BC204B: [8-bit] Resident Card 031 - Sawa
// $BC204C: [8-bit] Resident Card 032 - Jikasa
// $BC204D: [8-bit] Resident Card 033 - Neil
// $BC204E: [8-bit] Resident Card 034 - Seegers
// $BC204F: [8-bit] Resident Card 035 - Susunaru
// $BC2050: [8-bit] Resident Card 036 - Sewarei
// $BC2051: [8-bit] Resident Card 037 - Soero
// $BC2052: [8-bit] Resident Card 038 - Raulo
// $BC2053: [8-bit] Resident Card 039 - Ponomi
// $BC2054: [8-bit] Resident Card 040 - Stelas
// $BC2055: [8-bit] Resident Card 041 - Nochi
// $BC2056: [8-bit] Resident Card 042 - Zayed
// $BC2057: [8-bit] Resident Card 043 - Kikoi
// $BC2058: [8-bit] Resident Card 044 - Chokhi
// $BC2059: [8-bit] Resident Card 045 - Stag
// $BC205A: [8-bit] Resident Card 046 - Horiki
// $BC205B: [8-bit] Resident Card 047 - Fie
// $BC205C: [8-bit] Resident Card 048 - Reno
// $BC205D: [8-bit] Resident Card 049 - Kisabio
// $BC205E: [8-bit] Resident Card 050 - Asapo
// $BC205F: [8-bit] Resident Card 051 - Kisan
// $BC2060: [8-bit] Resident Card 052 - Chuchu
// $BC2061: [8-bit] Resident Card 053 - Zoilo
// $BC2062: [8-bit] Resident Card 054 - Cobb
// $BC2063: [8-bit] Resident Card 055 - Conoy
// $BC2064: [8-bit] Resident Card 056 - Iona
// $BC2065: [8-bit] Resident Card 057 - Eshin
// $BC2066: [8-bit] Resident Card 058 - Carla
// $BC2067: [8-bit] Resident Card 059 - Homei
// $BC2068: [8-bit] Resident Card 060 - Keik
// $BC2069: [8-bit] Resident Card 061 - Jijiro
// $BC206A: [8-bit] Resident Card 062 - Hess
// $BC206B: [8-bit] Resident Card 063 - Bibim
// $BC206C: [8-bit] Resident Card 064 - Romin
// $BC206D: [8-bit] Resident Card 065 - Shii
// $BC206E: [8-bit] Resident Card 066 - Mei
// $BC206F: [8-bit] Resident Card 067 - Raoiso
// $BC2070: [8-bit] Resident Card 068 - Broglie
// $BC2071: [8-bit] Resident Card 069 - Oarse
// $BC2072: [8-bit] Resident Card 070 - Popo
// $BC2073: [8-bit] Resident Card 071 - Masa
// $BC2074: [8-bit] Resident Card 072 - Gillain
// $BC2075: [8-bit] Resident Card 073 - Winart
// $BC2076: [8-bit] Resident Card 074 - Sojima
// $BC2077: [8-bit] Resident Card 075 - Chatta
// $BC2078: [8-bit] Resident Card 076 - Sadau
// $BC2079: [8-bit] Resident Card 077 - Kozik
// $BC207A: [8-bit] Resident Card 078 - Epon
// $BC207B: [8-bit] Resident Card 079 - Korinana
// $BC207C: [8-bit] Resident Card 080 - Tsukao
// $BC207D: [8-bit] Resident Card 081 - Kasana
// $BC207E: [8-bit] Resident Card 082 - Watawata
// $BC207F: [8-bit] Resident Card 083 - Pochita
// $BC2080: [8-bit] Resident Card 084 - Yasaki
// $BC2081: [8-bit] Resident Card 085 - Laga
// $BC2082: [8-bit] Resident Card 086 - Jojak
// $BC2083: [8-bit] Resident Card 087 - Uwei
// $BC2084: [8-bit] Resident Card 088 - Flo
// $BC2085: [8-bit] Resident Card 089 - Katako
// $BC2086: [8-bit] Resident Card 090 - Laban
// $BC2087: [8-bit] Resident Card 091 - Kooey
// $BC2088: [8-bit] Resident Card 092 - Tomanin
// $BC2089: [8-bit] Resident Card 093 - Gatas
// $BC208A: [8-bit] Resident Card 094 - Akini
// $BC208B: [8-bit] Resident Card 095 - Seanon
// $BC208C: [8-bit] Resident Card 096 - Papanei
// $BC208D: [8-bit] Resident Card 097 - Susunaru
// $BC208E: [8-bit] Resident Card 098 - Magnon
// $BC208F: [8-bit] Resident Card 099 - Pipioli
// $BC2090: [8-bit] Resident Card 100 - Mimiso
// $BC2091: [8-bit] Resident Card 101 - Randama
// $BC2092: [8-bit] Resident Card 102 - Kalyan
// $BC2093: [8-bit] Resident Card 103 - Iwi
// $BC2094: [8-bit] Resident Card 104 - Martin
// $BC2095: [8-bit] Resident Card 105 - Gyanja
// $BC2096: [8-bit] Resident Card 106 - Corono
// $BC2097: [8-bit] Resident Card 107 - Nastro
// $BC2098: [8-bit] Resident Card 108 - Nazca
// $BC2099: [8-bit] Resident Card 109 - Machica
// $BC209A: [8-bit] Resident Card 110 - Malqart
// $BC209B: [8-bit] Resident Card 111 - Mahaseer
// $BC209C: [8-bit] Resident Card 112 - Memeca
// $BC209D: [8-bit] Resident Card 113 - Gibble
// $BC209E: [8-bit] Resident Card 114 - Thuuga
// $BC209F: [8-bit] Resident Card 115 - Sagahma
// $BC20A0: [8-bit] Resident Card 116 - Bonita
// $BC20A1: [8-bit] Resident Card 117 - Bettany
// $BC20A2: [8-bit] Resident Card 118 - Fujimi
// $BC20A3: [8-bit] Resident Card 119 - Kat
// $BC20A4: [8-bit] Resident Card 120 - Askof
// $BC20A5: [8-bit] Resident Card 121 - Kishirato
// $BC20A6: [8-bit] Resident Card 122 - Gabarashu
// $BC20A7: [8-bit] Resident Card 123 - Glassa
// $BC20A8: [8-bit] Resident Card 124 - Amana
// $BC20A9: [8-bit] Resident Card 125 - Gamana
// $BC20AA: [8-bit] Resident Card 126 - Locola
// $BC20AB: [8-bit] Resident Card 127 - Meej
// $BC20AC: [8-bit] Resident Card 128 - Gagashka
// $BC20AD: [8-bit] Resident Card 129 - Komego
// $BC20AE: [8-bit] Resident Card 130 - Gorojiko
// $BC20AF: [8-bit] Resident Card 131 - Joanna
// $BC20B0: [8-bit] Resident Card 132 - Keno
// $BC20B1: [8-bit] Resident Card 133 - Itchy
// $BC20B2: [8-bit] Resident Card 134 - Matzu
// $BC20B3: [8-bit] Resident Card 135 - Loydlai
// $BC20B4: [8-bit] Resident Card 136 - Pucino
// $BC20B5: [8-bit] Resident Card 137 - Chucky
// $BC20B6: [8-bit] Resident Card 138 - Hameena
// $BC20B7: [8-bit] Resident Card 139 - Nombleux
// $BC20B8: [8-bit] Resident Card 140 - Princy
// $BC20B9: [8-bit] Resident Card 141 - Goirle
// $BC20BA: [8-bit] Resident Card 142 - Filldam
// $BC20BB: [8-bit] Resident Card 143 - Flagger
// $BC20BC: [8-bit] Resident Card 144 - Moskaw
// $BC20BD: [8-bit] Resident Card 145 - Risa
// $BC20BE: [8-bit] Resident Card 146 - Pyong
// $BC20BF: [8-bit] Resident Card 147 - Seligman
// $BC20C0: [8-bit] Resident Card 148 - Stein
// $BC20C1: [8-bit] Resident Card 149 - Gampo
// $BC20C2: [8-bit] Resident Card 150 - Kikushan
// $BC20C3: [8-bit] Resident Card 151 - Rinker
// $BC20C4: [8-bit] Resident Card 152 - Gatsugen
// $BC20C5: [8-bit] Resident Card 153 - Shakif
// $BC20C6: [8-bit] Resident Card 154 - Simon
// $BC20C7: [8-bit] Resident Card 155 - Noja
// $BC20C8: [8-bit] Resident Card 156 - Beshata
// $BC20C9: [8-bit] Resident Card 157 - Hagal
// $BC20CA: [8-bit] Resident Card 158 - Arsono
// $BC20CB: [8-bit] Resident Card 159 - Gambano
// $BC20CC: [8-bit] Resident Card 160 - Mubani
// $BC20CD: [8-bit] Resident Card 161 - Marci
// $BC20CE: [8-bit] Resident Card 162 - Killam
// $BC20CF: [8-bit] Resident Card 163 - Mender
// $BC20D0: [8-bit] Resident Card 164 - Asmo
// $BC20D1: [8-bit] Resident Card 165 - Czechle
// $BC20D2: [8-bit] Resident Card 166 - Nambe
// $BC20D3: [8-bit] Resident Card 167 - Laveria
// $BC20D4: [8-bit] Resident Card 168 - Persson
// $BC20D5: [8-bit] Resident Card 169 - Punt
// $BC20D6: [8-bit] Resident Card 170 - Chalak
// $BC20D7: [8-bit] Resident Card 171 - Spechico
// $BC20D8: [8-bit] Resident Card 172 - Ahorn
// $BC20D9: [8-bit] Resident Card 173 - Felicia
// $BC20DA: [8-bit] Resident Card 174 - Balencino
// $BC20DB: [8-bit] Resident Card 175 - Akapamaji
// $BC20DC: [8-bit] Resident Card 176 - Ocoromo
// $BC20DD: [8-bit] Resident Card 177 - Choi Kin
// $BC20DE: [8-bit] Resident Card 178 - Sumatra
// $BC20DF: [8-bit] Resident Card 179 - Nejil
// $BC20E0: [8-bit] Resident Card 180 - Nejima
// $BC20E1: [8-bit] Resident Card 181 - Epllie
// $BC20E2: [8-bit] Resident Card 182 - Spires
// $BC20E3: [8-bit] Resident Card 183 - Walili
// $BC20E4: [8-bit] Resident Card 184 - Melnose
// $BC20E5: [8-bit] Resident Card 185 - Holdein
// $BC20E6: [8-bit] Resident Card 186 - Doppela
// $BC20E7: [8-bit] Resident Card 187 - Gahgella
// $BC20E8: [8-bit] Resident Card 188 - Lukin
// $BC20E9: [8-bit] Resident Card 189 - Peikku
// $BC20EA: [8-bit] Resident Card 190 - Metapatch
// $BC20EB: [8-bit] Resident Card 191 - Yumor
// $BC20EC: [8-bit] Resident Card 192 - Ryron
// $BC20ED: [8-bit] Resident Card 193 - Gothica
// $BC20EE: [8-bit] Resident Card 194 - Itres
// $BC20EF: [8-bit] Resident Card 195 - Darkly
// $BC20F0: [8-bit] Resident Card 196 - Irbid
// $BC20F1: [8-bit] Resident Card 197 - Noyzof
// $BC20F2: [8-bit] Resident Card 198 - Gracz
// $BC20F3: [8-bit] Resident Card 199 - Bragolin
// $BC20F4: [8-bit] Resident Card 200 - Csilla
// $BC20F5: [8-bit] Resident Card 201 - Herman
// $BC20F6: [8-bit] Resident Card 202 - Liebe
// $BC20F7: [8-bit] Resident Card 203 - Gary
// $BC20F8: [8-bit] Resident Card 204 - Chaney
// $BC20F9: [8-bit] Resident Card 205 - Lucia
// $BC20FA: [8-bit] Resident Card 206 - Schuppan
// $BC20FB: [8-bit] Resident Card 207 - Isno
// $BC20FC: [8-bit] Resident Card 208 - River
// $BC20FD: [8-bit] Resident Card 209 - Marge
// $BC20FE: [8-bit] Resident Card 210 - Dongoo
// $BC20FF: [8-bit] Resident Card 211 - Tigger
// $BC2100: [8-bit] Resident Card 212 - Teras
// $BC2101: [8-bit] Resident Card 213 - Gidel
// $BC2102: [8-bit] Resident Card 214 - Arch
// $BC2103: [8-bit] Resident Card 215 - Theo
// $BC2104: [8-bit] Resident Card 216 - Pokio
// $BC2105: [8-bit] Resident Card 217 - Komaji
// $BC2106: [8-bit] Resident Card 218 - Terioki
// $BC2107: [8-bit] Resident Card 219 - Kitamani
// $BC2108: [8-bit] Resident Card 220 - Ohmor
// $BC2109: [8-bit] Resident Card 221 - Meagle
// $BC210A: [8-bit] Resident Card 222 - Sadelus
// $BC210B: [8-bit] Resident Card 223 - Grande
// $BC210C: [8-bit] Resident Card 224 - Zeeji
// $BC210D: [8-bit] Resident Card 225 - Gish
// $BC210E: [8-bit] Resident Card 226 - Pipig
// $BC210F: [8-bit] Resident Card 227 - Zima
// $BC2110: [8-bit] Resident Card 228 - Moles
function ResidentCard() =>
    sum_of(range(0xBC202C,0xBC2110,step=1), addr => byte(addr))
// $BC2111: [8-bit] Number of records options unlocked; this includes options noted at all previous values
//          0x01 - Scores (default)
//          0x02 - Resident Card (rank 2)
//          0x03 - Graveyard (rank 3)
//          0x04 - Theme song (rank 5)
//          0x05 - So dark, so scary (rank 6)
//          0x06 - Gallery (rank 9)
//          0x07 - Thank you. (rank 10)
// $BC2112: [8-bit] Challenge stages unlocked; most are unlocked by completing the previous 10 with the exception of the final batch
//          Bit0 - Challenges 1-10
//          Bit1 - Challenges 11-20
//          Bit2 - Challenges 21-30
//          Bit3 - Challenges 31-40
//          Bit4 - Challenges 41-50; flips when rank requirement is met, but not playable until Challenges 1-40 are completed on any difficulty
// $BC2116: [8-bit] Resident Card unlocked message flagged
// $BC2118: [8-bit] Graveyard unlocked message flagged
// $BC211A: [8-bit] Theme song unlocked message flagged
// $BC211C: [8-bit] So dark, so scary unlocked message flagged
// $BC211E: [8-bit] Gallery unlocked message flagged
// $BC2120: [8-bit] Thank you. unlocked message flagged
// $BC2122: [8-bit] Hard difficulty unlocked message flagged
// $BC2124: [8-bit] Pro difficulty unlocked message flagged
// $BC2126: [8-bit] Challenge 41-50 unlocked message flagged (still needs 1-40 cleared to be able to play them)
// $BC2128: [8-bit] Records - 100% game completion message
// $BC2129: [8-bit] Records - Resident Card completion message
// $BC212A: [8-bit] Records - Graveyard completion message
// $BC212B: [8-bit] Records - Easy Story completion message
// $BC212C: [8-bit] Records - Normal Story completion message
// $BC212D: [8-bit] Records - Hard Story completion message
// $BC212E: [8-bit] Records - Pro Story completion message
// $BC212F: [8-bit] Records - Easy Challenge completion message
// $BC2130: [8-bit] Records - Normal Challenge completion message
// $BC2131: [8-bit] Records - Hard Challenge completion message
// $BC2132: [8-bit] Records - Pro Challenge completion message
// $BC2135: [8-bit] Most recent level set menu entered
//          0x00 - Story / None
//          0x01 - Challenge
//          0x02 - Training
LevelSet = byte(0xbc2135)
    Story = 0
    Challenge = 1
    Training = 2
// $BC2138: [32-bit] Time remaining in a level (frames; 30fps)
// $BC213C: [32-bit] Starting time in a level (frames; 30fps)
// $BC2140: [32-bit] Time Attack playtime (frames; 30fps); disappears when playing other difficulties
TimeAttack = dword(0xBC2140) * 2
// $BC2146: [8-bit] Mojo meter (max: 0x64)
// $BC2154: [32-bit] Size of most recent mass cut from level
CutSize = dword(0xBC2154)
// $BC2158: [32-bit] Scores - Remaining time
// $BC215C: [32-bit] Scores - Destruction mass
// $BC2160: [32-bit] Scores - Fallen enemies; counts the amount of enemies killed during the level and then converts it to score after the level is clear
// $BC2164: [32-bit] Scores - Rescued comrades
Score = dword(0xBC2158) + dword(0xBC215C) + dword(0xBC2160) + dword(0xBC2164)
// $BC2171: [8-bit] Auto-saving / Level loading status
//          0x01 - Auto-saving game or loading a level
// $E5527C: [8-bit] Catastrophe menu position; stays 0x01 on the level select until a level is entered again
//          0x00 - One more time!
//          0x01 - Enough of this...
// $E571B0: [32-bit] Current challenge stage; starts at 0x00
//          - 0xffffffff when not in a challenge stage
// $E571F0: [32-bit] Current challenge stage; starts at 0x00
//          - 0xffffffff when not in a challenge stage
//          this seems to be a pointer
// $E87620: [8-bit] Shield status
//          0x01 - Active
// $102F154: [8-bit] Handles saving
//           0x00 - Not saving
//           0x02 - Preparing to save/load
//           0x05 - Save menu via XMB
//           0x06 - Load menu via XMB
//           0x07 - Autosave
// $103119c: [8-bit] Game State (thanks WanderingHeiho)
//           0x01 - Main Menu
//           0x02 - Menus
//           0x04 - In stage
//           0x05 - Results screen
//           0x06 - Opening movie
GameState = byte(0x103119c)
    Booting = 0
    MainMenu = 1
    Menus = 2
    InStage = 4
    Results = 5
    Movie = 6
// $1031598: [8-bit] Most recently loaded stage; matches 0x1043e88 -- check StageLookup for values
// $1043E88: [8-bit] Menu selection - Stage; matches with 0x1031598 (use this one for RP)
//           0x00~0x1d - Story 1~30
//           0x1e~0x24 - Training 1~7
//           0x25~0x56 - Challenge 1~50
CurrentStage = byte(0x1031598)
StoryStage = CurrentStage + 1 //this is for ease of writing
ChallengeStage = CurrentStage - 36 //this is for ease of writing
StageRP = byte(0x1043E88)

StageLookup = {
    0x00:"Story 1: Dawn of the Warship",
    0x01:"Story 2: War, the Daily Grind",
    0x02:"Story 3: The Repair Bots",
    0x03:"Story 4: Asli and Titori",
    0x04:"Story 5: Tons of Trouble",
    0x05:"Story 6: Friend or Foe?",
    0x06:"Story 7: 10,000m High Allies",
    0x07:"Story 8: Sky Scraps",
    0x08:"Story 9: Airborne Antics!",
    0x09:"Story 10: Asli's Entreaty",
    0x0A:"Story 11: Sleeping Giants",
    0x0B:"Story 12: Town from Long Ago",
    0x0C:"Story 13: Sunny Day Repairs",
    0x0D:"Story 14: More Repairs",
    0x0E:"Story 15: What Did They Find?",
    0x0F:"Story 16: Prison Time",
    0x10:"Story 17: Asli's Entreaty II",
    0x11:"Story 18: Moonlight Surprise",
    0x12:"Story 19: World to be Sliced",
    0x13:"Story 20: Asli's Entreaty III",
    0x14:"Story 21: Solid as a Rock!",
    0x15:"Story 22: Restoration Diaries",
    0x16:"Story 23: Surprise and Delight",
    0x17:"Story 24: War Out of Control",
    0x18:"Story 25: Labyrinthine Labours",
    0x19:"Story 26: Cloudy Forecast",
    0x1A:"Story 27: Chaos in the Sky",
    0x1B:"Story 28: The Perilous Beam!",
    0x1C:"Story 29: Finale of Finales?",
    0x1D:"Story 30: Adieu, Great Warship",
    0x1E:"Tutorial 1: Captain Training 1",
    0x1F:"Tutorial 2: Captain Training 2",
    0x20:"Tutorial 3: Captain Training 3",
    0x21:"Tutorial 4: Captain Training 4",
    0x22:"Tutorial 5: Captain Training 5",
    0x23:"Tutorial 6: Captain Training 6",
    0x24:"Tutorial 7: Final Training",
    0x25:"Challenge 1: Collect Parts!",
    0x26:"Challenge 2: 5 Seconds Left!",
    0x27:"Challenge 3: Antillas All Over!",
    0x28:"Challenge 4: Saw Off Enemies!",
    0x29:"Challenge 5: Protect Transport!",
    0x2A:"Challenge 6: Ladybirds All Over!",
    0x2B:"Challenge 7: Run For Your Life!",
    0x2C:"Challenge 8: Exactly One-half!",
    0x2D:"Challenge 9: Destroy Warship!",
    0x2E:"Challenge 10: Rescue Comrades!",
    0x2F:"Challenge 11: Scarabs All Over!",
    0x30:"Challenge 12: Protect Transport! 2",
    0x31:"Challenge 13: Run For Your Life! 2",
    0x32:"Challenge 14: 5 Seconds Left! 2",
    0x33:"Challenge 15: Spiderkas All Over!",
    0x34:"Challenge 16: Saw Off Enemies! 2",
    0x35:"Challenge 17: Cannons All Over!",
    0x36:"Challenge 18: Exactly One-half! 2",
    0x37:"Challenge 19: Destroy Warship! 2",
    0x38:"Challenge 20: 5 Seconds Left! 3",
    0x39:"Challenge 21: Pupoids All Over!",
    0x3A:"Challenge 22: Saw Off Enemies! 3",
    0x3B:"Challenge 23: Protect Transport! 3",
    0x3C:"Challenge 24: Millibeams All Over!",
    0x3D:"Challenge 25: Collect Parts! 2",
    0x3E:"Challenge 26: Destroy Warship! 3",
    0x3F:"Challenge 27: Exactly One-half! 3",
    0x40:"Challenge 28: Run For Your Life! 3",
    0x41:"Challenge 29: Destroy Warship! 4",
    0x42:"Challenge 30: Saw Off Enemies! 4",
    0x43:"Challenge 31: Crawfitsch All Over!",
    0x44:"Challenge 32: Exactly One-half! 4",
    0x45:"Challenge 33: Protect Transport! 4",
    0x46:"Challenge 34: Flowarky All Over!",
    0x47:"Challenge 35: Rescue Comrades! 2",
    0x48:"Challenge 36: Run For Your Life! 4",
    0x49:"Challenge 37: Destroy Warship! 5",
    0x4A:"Challenge 38: 5 Seconds Left! 4",
    0x4B:"Challenge 39: Exactly One-half! 5",
    0x4C:"Challenge 40: Destroy Warship! 6",
    0x4D:"Challenge 41: Tarantulas All Over!",
    0x4E:"Challenge 42: Collect Parts! 3",
    0x4F:"Challenge 43: Protect Transport! 5",
    0x50:"Challenge 44: Homing Cannons!",
    0x51:"Challenge 45: 5 Seconds Left! 5",
    0x52:"Challenge 46: Saw Off Enemies! 5",
    0x53:"Challenge 47: Run For Your Life! 5",
    0x54:"Challenge 48: Major Repairs!",
    0x55:"Challenge 49: Solid as a Diamond!",
    0x56:"Challenge 50: Final Challenge!"
}
ResidentData = {
    40:{"title":"Aerial Aid","points":5},
    80:{"title":"Skyward Steward","points":5},
    120:{"title":"High-flying Hope","points":5},
    160:{"title":"Ascendant Angel","points":5},
    200:{"title":"Soaring Savior","points":10},
    229:{"title":"Windborne Hero","points":10},
}
ResidentArray = [40,80,120,160,200,229]
GraveyardData = {
    30:{"title":"Accidents Happen","points":3},
    60:{"title":"Troublesome Trend","points":3},
    90:{"title":"Menace to Society","points":3},
    120:{"title":"25 to Life","points":5},
    150:{"title":"Please, Stop","points":5},
    168:{"title":"Mass Murderer","points":10},
}
GraveyardArray = [30,60,90,120,150,168]


function RankAchievement(rank) {
    achievement(
        title=RankData[rank]["title"], points= RankData[rank]["points"],
        description= "Reach the rank of " + RankData[rank]["title"] + " and unlock " + RankData[rank]["unlock"] + ".",
        trigger = LoadProtection && prev(Rank) == rank - 1 && Rank == rank // && GameState == Results <-- maybe add this for protection if valid
    )
}
function ResidentAchievement(resident) {
    achievement(
        title=ResidentData[resident]["title"], points=ResidentData[resident]["points"],
        description= "Bring " + resident + " unique residents to their safety.",
        trigger= LoadProtection && prev(ResidentCard()) < resident && measured(ResidentCard() >= resident,
            GameState != Booting && GameState != MainMenu && GameState != Movie)// && ResidentCard() <= resident + 30
    )
}
function GraveyardAchievement(grave) {
    achievement(
        title=GraveyardData[grave]["title"], points=GraveyardData[grave]["points"],
        description= "Send " + grave + " unique residents to their demise.",
        trigger= LoadProtection && prev(Graveyard()) < grave && measured(Graveyard() >= grave,
            GameState != Booting && GameState != MainMenu && GameState != Movie)// && Graveyard() <= grave + 7
    )
}
// $103159C: 0x01 in stage
// $103731F: [48-bit ASCII] Completion %
// $1698DBC: maybe also results related
// $1740908: maybe also results related
//           0x00 - not results
//           0x01 - changing between results screens
//           0x04 - scores and stars
//           0x0a - pay breakdown
//           0x07 - comrades
achievement(
        title="Training Day", points=2,
        description="Complete all of the tutorial stages.",
        trigger= LoadProtection && prev(Tutorial()) == 6 && Tutorial() == 7
)
achievement(
        title="Dawn of the Warship", points=2,
        description="Complete Story 1 on any difficulty.",
        trigger= LoadProtection && StoryStage == 1 && prev(GameState) == InStage && GameState == Results
)
achievement(
        title="Tons of Trouble", points=5,
        description="Complete Story 5 on any difficulty.",
        trigger= LoadProtection && StoryStage == 5 && prev(GameState) == InStage && GameState == Results
)
achievement(
        title="Asli's Entreaty", points=5,
        description="Complete Story 10 on any difficulty.",
        trigger= LoadProtection && StoryStage == 10 && prev(GameState) == InStage && GameState == Results
)
achievement(
        title="What Did They Find?", points=5,
        description="Complete Story 15 on any difficulty.",
        trigger= LoadProtection && StoryStage == 15 && prev(GameState) == InStage && GameState == Results
)
achievement(
        title="Asli's Appeal", points=10,
        description="Complete Story 20 on any difficulty.",
        trigger= LoadProtection && StoryStage == 20 && prev(GameState) == InStage && GameState == Results
)
achievement(
        title="Labyrinthine Labours", points=10,
        description="Complete Story 25 on any difficulty.",
        trigger= LoadProtection && StoryStage == 25 && prev(GameState) == InStage && GameState == Results
)
achievement(
        title="Adieu, Great Warship", points=25,
        description="Complete Story 30 on any difficulty.",
        trigger= LoadProtection && StoryStage == 30 && prev(GameState) == InStage && GameState == Results
)

//Challenge completion achievement -- might break up Pro to individual
for i in [1,11,21,31,41]
    ChallengeClearsAchievement(i)
//rank achievements
for i in range(1,9)
    RankAchievement(i)
//all resident card achievements
for i in ResidentArray
    ResidentAchievement(i)
//all graveyard achievements
for i in GraveyardArray
    GraveyardAchievement(i)
//Story completion achievements
for i in StoryArray
    EasyStoryAchievement(i)
for i in StoryArray
    NormalStoryAchievement(i)
for i in StoryArray
    HardStoryAchievement(i)
//edited these pro story achievements for blocks
for i in [1,6,11]
    ProStoryAchievementGroup(i)
for i in range(16,30)
    ProStoryAchievement(i)
for i in ChallengeArray
    EasyChallengeAchievement(i)
for i in ChallengeArray
    NormalChallengeAchievement(i)
for i in ChallengeArray
    HardChallengeAchievement(i)
//pro challenges
for i in [1,6,11,16,21]
    ProChallengeAchievementGroup(i)
for i in range(26,50)//ChallengeArray
    ProChallengeAchievement(i) //use ProChallengeAchievementGroup(i) to batch
//blocks of 5 star on normal or higher achievements
for i in StoryArray
    StarAchievement(i)
//5 star pro achievements
for i in range(1,30)
    ProStarAchievement(i)

    
//leaderboards
function EasyLeaderboard(stage) {
            leaderboard(
                title="Story " + stage + " - Easy",
                description="Score as many points you can in Story " + stage + " on Easy difficulty.",
                start= GameState == Results && Difficulty == Easy && StoryStage == stage && prev(Score) != Score,
                cancel= always_false(),
                submit= always_true(),
                value= Score,
                format="VALUE",
                lower_is_better=false
            )         
}
for i in range(1,30)
EasyLeaderboard(i)

function NormalLeaderboard(stage) {
            leaderboard(
                title="Story " + stage + " - Normal",
                description="Score as many points you can in Story " + stage + " on Normal difficulty.",
                start= GameState == Results && Difficulty == Normal && StoryStage == stage && prev(Score) != Score && TimeAttack == 0,
                cancel= always_false(),
                submit= always_true(),
                value= Score,
                format="VALUE",
                lower_is_better=false
            )         
}
for i in range(1,30)
NormalLeaderboard(i)

function HardLeaderboard(stage) {
            leaderboard(
                title="Story " + stage + " - Hard",
                description="Score as many points you can in Story " + stage + " on Hard difficulty.",
                start= GameState == Results && Difficulty == Hard && StoryStage == stage && prev(Score) != Score,
                cancel= always_false(),
                submit= always_true(),
                value= Score,
                format="VALUE",
                lower_is_better=false
            )         
}
for i in range(1,30)
HardLeaderboard(i)

function ProLeaderboard(stage) {
            leaderboard(
                title="Story " + stage + " - Pro",
                description="Score as many points you can in Story " + stage + " on Pro difficulty.",
                start= GameState == Results && Difficulty == Pro && StoryStage == stage && prev(Score) != Score,
                cancel= always_false(),
                submit= always_true(),
                value= Score,
                format="VALUE",
                lower_is_better=false
            )         
}
for i in range(1,30)
ProLeaderboard(i)

function TimeAttackLeaderboard(stage) {
            leaderboard(
                title="Story " + stage + " - Time Attack",
                description="Complete Story " + stage + " in Time Attack mode as fast as you can.",
                start= prev(GameState) == InStage && GameState == Results && Difficulty == Normal && TimeAttackActive && StoryStage == stage,
                cancel= always_false(),
                submit= always_true(),
                value= TimeAttack,
                format="FRAMES",
                lower_is_better=true
            )         
}
for i in range(1,30)
TimeAttackLeaderboard(i)

//Rich Presence
rich_presence_conditional_display(GameState == Movie || GameState == Booting,"Watching the opening movie")
rich_presence_conditional_display(GameState == MainMenu,"On the main menu")
rich_presence_conditional_display(GameState == Menus || GameState == Results,"On the menus • Rank: {1} • Total pay: {2} • Story: {3}/30 • Pro Story: {4}/30 • Challenge: {5}/50 • Pro Challenge: {6}/50 • Resident Card: {7}/229 • Graveyard: {8}/168 • Playtime: {9}m",
        rich_presence_lookup("Stage", StageRP, StageLookup),
        rich_presence_lookup("Rank", Rank, RankLookup),
        rich_presence_value("Digit", Screws, format="VALUE"),
        rich_presence_value("Digit", AnyStory(), format="VALUE"),
        rich_presence_value("Digit", ProStory(), format="VALUE"),
        rich_presence_value("Digit", AnyChallenge(), format="VALUE"),
        rich_presence_value("Digit", ProChallenge(), format="VALUE"),
        rich_presence_value("Digit", ResidentCard(), format="VALUE"),
        rich_presence_value("Digit", Graveyard(), format="VALUE"),
        rich_presence_value("Playtime", Playtime, format="MINUTES")
)
rich_presence_conditional_display(TimeAttackActive, "{0} ~ Time Attack • Rank: {1} • Total pay: {2} • Story: {3}/30 • Pro Story: {4}/30 • Challenge: {5}/50 • Pro Challenge: {6}/50 • Resident Card: {7}/229 • Graveyard: {8}/168 • Playtime: {9}m",
        rich_presence_lookup("Stage", StageRP, StageLookup),
        rich_presence_lookup("Rank", Rank, RankLookup),
        rich_presence_value("Digit", Screws, format="VALUE"),
        rich_presence_value("Digit", AnyStory(), format="VALUE"),
        rich_presence_value("Digit", ProStory(), format="VALUE"),
        rich_presence_value("Digit", AnyChallenge(), format="VALUE"),
        rich_presence_value("Digit", ProChallenge(), format="VALUE"),
        rich_presence_value("Digit", ResidentCard(), format="VALUE"),
        rich_presence_value("Digit", Graveyard(), format="VALUE"),
        rich_presence_value("Playtime", Playtime, format="MINUTES")
)
rich_presence_display("{0} ~ {10} • Rank: {1} • Total pay: {2} • Story: {3}/30 • Pro Story: {4}/30 • Challenge: {5}/50 • Pro Challenge: {6}/50 • Resident Card: {7}/229 • Graveyard: {8}/168 • Playtime: {9}m",
        rich_presence_lookup("Stage", StageRP, StageLookup),
        rich_presence_lookup("Rank", Rank, RankLookup),
        rich_presence_value("Digit", Screws, format="VALUE"),
        rich_presence_value("Digit", AnyStory(), format="VALUE"),
        rich_presence_value("Digit", ProStory(), format="VALUE"),
        rich_presence_value("Digit", AnyChallenge(), format="VALUE"),
        rich_presence_value("Digit", ProChallenge(), format="VALUE"),
        rich_presence_value("Digit", ResidentCard(), format="VALUE"),
        rich_presence_value("Digit", Graveyard(), format="VALUE"),
        rich_presence_value("Playtime", Playtime, format="MINUTES"),
        rich_presence_lookup("Difficulty", Difficulty, DifficultyLookup)
)