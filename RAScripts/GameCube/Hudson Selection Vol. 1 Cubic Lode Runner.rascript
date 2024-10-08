// Hudson Selection Vol. 1: Cubic Lode Runner
// #ID = 28366

// $0DE781: menu open
// $14019B: [8-bit] Menu/ Loading
// $14019F: [8-bit] Level start = 01
// $14027D: [8-bit] Lives; default 0x03 when starting a stage (game over when dying at 0x00). extra life awarded for every successive stage completed without going back to the menu
// $140293: [8-bit] Levels completed?
// $140297: bit 7 level 40
// $14029F: [8-bit] Stages complete pt. 1
//          bit0 - Stage 1
//          bit1 - Stage 2
// $1402AB: time medals
// $1402B7: fruit medal
// $1402C0: [32-bit BE] Stage 1 - High score record - Score
// $1402C4: [32-bit BE] Stage 1 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1402C8: [32-bit BE] Stage 1 - Fastest record - Score
// $1402CC: [32-bit BE] Stage 1 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1402D0: [32-bit BE] Stage 2 - High score record - Score
// $1402D4: [32-bit BE] Stage 2 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1402D8: [32-bit BE] Stage 2 - Fastest record - Score
// $1402DC: [32-bit BE] Stage 2 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1402E0: [32-bit BE] Stage 3 - High score record - Score
// $1402E4: [32-bit BE] Stage 3 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1402E8: [32-bit BE] Stage 3 - Fastest record - Score
// $1402EC: [32-bit BE] Stage 3 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1402F0: [32-bit BE] Stage 4 - High score record - Score
// $1402F4: [32-bit BE] Stage 4 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1402F8: [32-bit BE] Stage 4 - Fastest record - Score
// $1402FC: [32-bit BE] Stage 4 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140300: [32-bit BE] Stage 5 - High score record - Score
// $140304: [32-bit BE] Stage 5 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140308: [32-bit BE] Stage 5 - Fastest record - Score
// $14030C: [32-bit BE] Stage 5 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140310: [32-bit BE] Stage 6 - High score record - Score
// $140314: [32-bit BE] Stage 6 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140318: [32-bit BE] Stage 6 - Fastest record - Score
// $14031C: [32-bit BE] Stage 6 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140320: [32-bit BE] Stage 7 - High score record - Score
// $140324: [32-bit BE] Stage 7 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140328: [32-bit BE] Stage 7 - Fastest record - Score
// $14032C: [32-bit BE] Stage 7 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140330: [32-bit BE] Stage 8 - High score record - Score
// $140334: [32-bit BE] Stage 8 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140338: [32-bit BE] Stage 8 - Fastest record - Score
// $14033C: [32-bit BE] Stage 8 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140340: [32-bit BE] Stage 9 - High score record - Score
// $140344: [32-bit BE] Stage 9 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140348: [32-bit BE] Stage 9 - Fastest record - Score
// $14034C: [32-bit BE] Stage 9 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140350: [32-bit BE] Stage 10 - High score record - Score
// $140354: [32-bit BE] Stage 10 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140358: [32-bit BE] Stage 10 - Fastest record - Score
// $14035C: [32-bit BE] Stage 10 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140360: [32-bit BE] Stage 11 - High score record - Score
// $140364: [32-bit BE] Stage 11 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140368: [32-bit BE] Stage 11 - Fastest record - Score
// $14036C: [32-bit BE] Stage 11 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140370: [32-bit BE] Stage 12 - High score record - Score
// $140374: [32-bit BE] Stage 12 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140378: [32-bit BE] Stage 12 - Fastest record - Score
// $14037C: [32-bit BE] Stage 12 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140380: [32-bit BE] Stage 13 - High score record - Score
// $140384: [32-bit BE] Stage 13 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140388: [32-bit BE] Stage 13 - Fastest record - Score
// $14038C: [32-bit BE] Stage 13 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140390: [32-bit BE] Stage 14 - High score record - Score
// $140394: [32-bit BE] Stage 14 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140398: [32-bit BE] Stage 14 - Fastest record - Score
// $14039C: [32-bit BE] Stage 14 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403A0: [32-bit BE] Stage 15 - High score record - Score
// $1403A4: [32-bit BE] Stage 15 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403A8: [32-bit BE] Stage 15 - Fastest record - Score
// $1403AC: [32-bit BE] Stage 15 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403B0: [32-bit BE] Stage 16 - High score record - Score
// $1403B4: [32-bit BE] Stage 16 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403B8: [32-bit BE] Stage 16 - Fastest record - Score
// $1403BC: [32-bit BE] Stage 16 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403C0: [32-bit BE] Stage 17 - High score record - Score
// $1403C4: [32-bit BE] Stage 17 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403C8: [32-bit BE] Stage 17 - Fastest record - Score
// $1403CC: [32-bit BE] Stage 17 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403D0: [32-bit BE] Stage 18 - High score record - Score
// $1403D4: [32-bit BE] Stage 18 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403D8: [32-bit BE] Stage 18 - Fastest record - Score
// $1403DC: [32-bit BE] Stage 18 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403E0: [32-bit BE] Stage 19 - High score record - Score
// $1403E4: [32-bit BE] Stage 19 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403E8: [32-bit BE] Stage 19 - Fastest record - Score
// $1403EC: [32-bit BE] Stage 19 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403F0: [32-bit BE] Stage 20 - High score record - Score
// $1403F4: [32-bit BE] Stage 20 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1403F8: [32-bit BE] Stage 20 - Fastest record - Score
// $1403FC: [32-bit BE] Stage 20 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140400: [32-bit BE] Stage 21 - High score record - Score
// $140404: [32-bit BE] Stage 21 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140408: [32-bit BE] Stage 21 - Fastest record - Score
// $14040C: [32-bit BE] Stage 21 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140410: [32-bit BE] Stage 22 - High score record - Score
// $140414: [32-bit BE] Stage 22 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140418: [32-bit BE] Stage 22 - Fastest record - Score
// $14041C: [32-bit BE] Stage 22 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140420: [32-bit BE] Stage 23 - High score record - Score
// $140424: [32-bit BE] Stage 23 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140428: [32-bit BE] Stage 23 - Fastest record - Score
// $14042C: [32-bit BE] Stage 23 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140430: [32-bit BE] Stage 24 - High score record - Score
// $140434: [32-bit BE] Stage 24 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140438: [32-bit BE] Stage 24 - Fastest record - Score
// $14043C: [32-bit BE] Stage 24 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140440: [32-bit BE] Stage 25 - High score record - Score
// $140444: [32-bit BE] Stage 25 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140448: [32-bit BE] Stage 25 - Fastest record - Score
// $14044C: [32-bit BE] Stage 25 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140450: [32-bit BE] Stage 26 - High score record - Score
// $140454: [32-bit BE] Stage 26 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140458: [32-bit BE] Stage 26 - Fastest record - Score
// $14045C: [32-bit BE] Stage 26 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140460: [32-bit BE] Stage 27 - High score record - Score
// $140464: [32-bit BE] Stage 27 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140468: [32-bit BE] Stage 27 - Fastest record - Score
// $14046C: [32-bit BE] Stage 27 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140470: [32-bit BE] Stage 28 - High score record - Score
// $140474: [32-bit BE] Stage 28 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140478: [32-bit BE] Stage 28 - Fastest record - Score
// $14047C: [32-bit BE] Stage 28 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140480: [32-bit BE] Stage 29 - High score record - Score
// $140484: [32-bit BE] Stage 29 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140488: [32-bit BE] Stage 29 - Fastest record - Score
// $14048C: [32-bit BE] Stage 29 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140490: [32-bit BE] Stage 30 - High score record - Score
// $140494: [32-bit BE] Stage 30 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140498: [32-bit BE] Stage 30 - Fastest record - Score
// $14049C: [32-bit BE] Stage 30 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404A0: [32-bit BE] Stage 31 - High score record - Score
// $1404A4: [32-bit BE] Stage 31 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404A8: [32-bit BE] Stage 31 - Fastest record - Score
// $1404AC: [32-bit BE] Stage 31 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404B0: [32-bit BE] Stage 32 - High score record - Score
// $1404B4: [32-bit BE] Stage 32 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404B8: [32-bit BE] Stage 32 - Fastest record - Score
// $1404BC: [32-bit BE] Stage 32 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404C0: [32-bit BE] Stage 33 - High score record - Score
// $1404C4: [32-bit BE] Stage 33 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404C8: [32-bit BE] Stage 33 - Fastest record - Score
// $1404CC: [32-bit BE] Stage 33 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404D0: [32-bit BE] Stage 34 - High score record - Score
// $1404D4: [32-bit BE] Stage 34 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404D8: [32-bit BE] Stage 34 - Fastest record - Score
// $1404DC: [32-bit BE] Stage 34 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404E0: [32-bit BE] Stage 35 - High score record - Score
// $1404E4: [32-bit BE] Stage 35 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404E8: [32-bit BE] Stage 35 - Fastest record - Score
// $1404EC: [32-bit BE] Stage 35 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404F0: [32-bit BE] Stage 36 - High score record - Score
// $1404F4: [32-bit BE] Stage 36 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1404F8: [32-bit BE] Stage 36 - Fastest record - Score
// $1404FC: [32-bit BE] Stage 36 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140500: [32-bit BE] Stage 37 - High score record - Score
// $140504: [32-bit BE] Stage 37 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140508: [32-bit BE] Stage 37 - Fastest record - Score
// $14050C: [32-bit BE] Stage 37 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140510: [32-bit BE] Stage 38 - High score record - Score
// $140514: [32-bit BE] Stage 38 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140518: [32-bit BE] Stage 38 - Fastest record - Score
// $14051C: [32-bit BE] Stage 38 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140520: [32-bit BE] Stage 39 - High score record - Score
// $140524: [32-bit BE] Stage 39 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140528: [32-bit BE] Stage 39 - Fastest record - Score
// $14052C: [32-bit BE] Stage 39 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140530: [32-bit BE] Stage 40 - High score record - Score
// $140534: [32-bit BE] Stage 40 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140538: [32-bit BE] Stage 40 - Fastest record - Score
// $14053C: [32-bit BE] Stage 40 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140540: [32-bit BE] Stage 41 - High score record - Score
// $140544: [32-bit BE] Stage 41 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140548: [32-bit BE] Stage 41 - Fastest record - Score
// $14054C: [32-bit BE] Stage 41 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140550: [32-bit BE] Stage 42 - High score record - Score
// $140554: [32-bit BE] Stage 42 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140558: [32-bit BE] Stage 42 - Fastest record - Score
// $14055C: [32-bit BE] Stage 42 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140560: [32-bit BE] Stage 43 - High score record - Score
// $140564: [32-bit BE] Stage 43 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140568: [32-bit BE] Stage 43 - Fastest record - Score
// $14056C: [32-bit BE] Stage 43 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140570: [32-bit BE] Stage 44 - High score record - Score
// $140574: [32-bit BE] Stage 44 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140578: [32-bit BE] Stage 44 - Fastest record - Score
// $14057C: [32-bit BE] Stage 44 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140580: [32-bit BE] Stage 45 - High score record - Score
// $140584: [32-bit BE] Stage 45 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140588: [32-bit BE] Stage 45 - Fastest record - Score
// $14058C: [32-bit BE] Stage 45 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140590: [32-bit BE] Stage 46 - High score record - Score
// $140594: [32-bit BE] Stage 46 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140598: [32-bit BE] Stage 46 - Fastest record - Score
// $14059C: [32-bit BE] Stage 46 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405A0: [32-bit BE] Stage 47 - High score record - Score
// $1405A4: [32-bit BE] Stage 47 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405A8: [32-bit BE] Stage 47 - Fastest record - Score
// $1405AC: [32-bit BE] Stage 47 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405B0: [32-bit BE] Stage 48 - High score record - Score
// $1405B4: [32-bit BE] Stage 48 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405B8: [32-bit BE] Stage 48 - Fastest record - Score
// $1405BC: [32-bit BE] Stage 48 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405C0: [32-bit BE] Stage 49 - High score record - Score
// $1405C4: [32-bit BE] Stage 49 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405C8: [32-bit BE] Stage 49 - Fastest record - Score
// $1405CC: [32-bit BE] Stage 49 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405D0: [32-bit BE] Stage 50 - High score record - Score
// $1405D4: [32-bit BE] Stage 50 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405D8: [32-bit BE] Stage 50 - Fastest record - Score
// $1405DC: [32-bit BE] Stage 50 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405E0: [32-bit BE] Stage 51 - High score record - Score
// $1405E4: [32-bit BE] Stage 51 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405E8: [32-bit BE] Stage 51 - Fastest record - Score
// $1405EC: [32-bit BE] Stage 51 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405F0: [32-bit BE] Stage 52 - High score record - Score
// $1405F4: [32-bit BE] Stage 52 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1405F8: [32-bit BE] Stage 52 - Fastest record - Score
// $1405FC: [32-bit BE] Stage 52 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140600: [32-bit BE] Stage 53 - High score record - Score
// $140604: [32-bit BE] Stage 53 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140608: [32-bit BE] Stage 53 - Fastest record - Score
// $14060C: [32-bit BE] Stage 53 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140610: [32-bit BE] Stage 54 - High score record - Score
// $140614: [32-bit BE] Stage 54 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140618: [32-bit BE] Stage 54 - Fastest record - Score
// $14061C: [32-bit BE] Stage 54 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140620: [32-bit BE] Stage 55 - High score record - Score
// $140624: [32-bit BE] Stage 55 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140628: [32-bit BE] Stage 55 - Fastest record - Score
// $14062C: [32-bit BE] Stage 55 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140630: [32-bit BE] Stage 56 - High score record - Score
// $140634: [32-bit BE] Stage 56 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140638: [32-bit BE] Stage 56 - Fastest record - Score
// $14063C: [32-bit BE] Stage 56 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140640: [32-bit BE] Stage 57 - High score record - Score
// $140644: [32-bit BE] Stage 57 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140648: [32-bit BE] Stage 57 - Fastest record - Score
// $14064C: [32-bit BE] Stage 57 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140650: [32-bit BE] Stage 58 - High score record - Score
// $140654: [32-bit BE] Stage 58 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140658: [32-bit BE] Stage 58 - Fastest record - Score
// $14065C: [32-bit BE] Stage 58 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140660: [32-bit BE] Stage 59 - High score record - Score
// $140664: [32-bit BE] Stage 59 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140668: [32-bit BE] Stage 59 - Fastest record - Score
// $14066C: [32-bit BE] Stage 59 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140670: [32-bit BE] Stage 60 - High score record - Score
// $140674: [32-bit BE] Stage 60 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140678: [32-bit BE] Stage 60 - Fastest record - Score
// $14067C: [32-bit BE] Stage 60 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140680: [32-bit BE] Stage 61 - High score record - Score
// $140684: [32-bit BE] Stage 61 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140688: [32-bit BE] Stage 61 - Fastest record - Score
// $14068C: [32-bit BE] Stage 61 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140690: [32-bit BE] Stage 62 - High score record - Score
// $140694: [32-bit BE] Stage 62 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140698: [32-bit BE] Stage 62 - Fastest record - Score
// $14069C: [32-bit BE] Stage 62 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406A0: [32-bit BE] Stage 63 - High score record - Score
// $1406A4: [32-bit BE] Stage 63 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406A8: [32-bit BE] Stage 63 - Fastest record - Score
// $1406AC: [32-bit BE] Stage 63 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406B0: [32-bit BE] Stage 64 - High score record - Score
// $1406B4: [32-bit BE] Stage 64 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406B8: [32-bit BE] Stage 64 - Fastest record - Score
// $1406BC: [32-bit BE] Stage 64 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406C0: [32-bit BE] Stage 65 - High score record - Score
// $1406C4: [32-bit BE] Stage 65 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406C8: [32-bit BE] Stage 65 - Fastest record - Score
// $1406CC: [32-bit BE] Stage 65 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406D0: [32-bit BE] Stage 66 - High score record - Score
// $1406D4: [32-bit BE] Stage 66 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406D8: [32-bit BE] Stage 66 - Fastest record - Score
// $1406DC: [32-bit BE] Stage 66 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406E0: [32-bit BE] Stage 67 - High score record - Score
// $1406E4: [32-bit BE] Stage 67 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406E8: [32-bit BE] Stage 67 - Fastest record - Score
// $1406EC: [32-bit BE] Stage 67 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406F0: [32-bit BE] Stage 68 - High score record - Score
// $1406F4: [32-bit BE] Stage 68 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1406F8: [32-bit BE] Stage 68 - Fastest record - Score
// $1406FC: [32-bit BE] Stage 68 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140700: [32-bit BE] Stage 69 - High score record - Score
// $140704: [32-bit BE] Stage 69 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140708: [32-bit BE] Stage 69 - Fastest record - Score
// $14070C: [32-bit BE] Stage 69 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140710: [32-bit BE] Stage 70 - High score record - Score
// $140714: [32-bit BE] Stage 70 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140718: [32-bit BE] Stage 70 - Fastest record - Score
// $14071C: [32-bit BE] Stage 70 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140720: [32-bit BE] Stage 71 - High score record - Score
// $140724: [32-bit BE] Stage 71 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140728: [32-bit BE] Stage 71 - Fastest record - Score
// $14072C: [32-bit BE] Stage 71 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140730: [32-bit BE] Stage 72 - High score record - Score
// $140734: [32-bit BE] Stage 72 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140738: [32-bit BE] Stage 72 - Fastest record - Score
// $14073C: [32-bit BE] Stage 72 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140740: [32-bit BE] Stage 73 - High score record - Score
// $140744: [32-bit BE] Stage 73 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140748: [32-bit BE] Stage 73 - Fastest record - Score
// $14074C: [32-bit BE] Stage 73 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140750: [32-bit BE] Stage 74 - High score record - Score
// $140754: [32-bit BE] Stage 74 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140758: [32-bit BE] Stage 74 - Fastest record - Score
// $14075C: [32-bit BE] Stage 74 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140760: [32-bit BE] Stage 75 - High score record - Score
// $140764: [32-bit BE] Stage 75 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140768: [32-bit BE] Stage 75 - Fastest record - Score
// $14076C: [32-bit BE] Stage 75 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140770: [32-bit BE] Stage 76 - High score record - Score
// $140774: [32-bit BE] Stage 76 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140778: [32-bit BE] Stage 76 - Fastest record - Score
// $14077C: [32-bit BE] Stage 76 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140780: [32-bit BE] Stage 77 - High score record - Score
// $140784: [32-bit BE] Stage 77 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140788: [32-bit BE] Stage 77 - Fastest record - Score
// $14078C: [32-bit BE] Stage 77 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $140790: [32-bit BE] Stage 78 - High score record - Score
// $140794: [32-bit BE] Stage 78 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $140798: [32-bit BE] Stage 78 - Fastest record - Score
// $14079C: [32-bit BE] Stage 78 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1407A0: [32-bit BE] Stage 79 - High score record - Score
// $1407A4: [32-bit BE] Stage 79 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1407A8: [32-bit BE] Stage 79 - Fastest record - Score
// $1407AC: [32-bit BE] Stage 79 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1407B0: [32-bit BE] Stage 80 - High score record - Score
// $1407B4: [32-bit BE] Stage 80 - High score record - Time; frames, 60FPS, no clear = 0x57e3f
// $1407B8: [32-bit BE] Stage 80 - Fastest record - Score
// $1407BC: [32-bit BE] Stage 80 - Fastest record - Time; frames, 60FPS, no clear = 0x57e3f
// $1438B7: [8-bit] Cursor position in Yes/No menus
//          0x00 - Left (yes)
//          0x01 - Right (no)
// $14E11A: [16-bit BE] Number of gold left to collect before the goal ladder appears
// $14E11B: [8-bit] Piles of Gold
// $17C8B0: [32-bit BE] Number of blocks deleted in the current stage
// $17C8B4: [32-bit BE] Fruit picked up in current stage
//          0xffffffff - None
//          0x00 - Apple (100 points)
//          0x01 - Orange (200 points)
//          0x02 - Banana (400 points)
//          0x03 - Grape (800 points)
//          0x04 - Watermelon (1200 points)
//          0x05 - Cherry (1500 points)
//          0x06 - Strawberry (2000 points)
//          0x07 - Peach (2500 points)
// $17C8B8: [32-bit BE] Score earned from killing enemies in the current stage
// $17C8BC: [32-bit BE] Score earned from coins in the current stage
// $17C8C0: [32-bit BE] Score earned from all sources in the current stage; use this for overall score submission and RP
// $17C8C4: [32-bit BE] Time spent in current stage; frames, 60FPS
// $17C8EC: [32-bit BE] Current stage; starts at 0x00
// $17CA52: [8-bit] Current save file selected; default 0x00 in file select menu and slot 1
// $3C6528: [32-bit BE] pointer
//          0x8000008f | [8-bit] Pause status; 0x01 - gameplay paused
//          0x8000011b | [8-bit] Total number of enemies killed in current round
//          0x8000018b | [8-bit] Player X-position; starts at 0x00 on the left layer
//          0x8000018d | [8-bit] Player Z-position; starts at 0x00 on the bottom layer
//          0x8000018d | [8-bit] Player Y-position; starts at 0x00 on the back layer
// $3C65EF: pause in edit
// $3E90EF: pause state 1
// $3E915B: speed
// $3E917B: [8-bit] Count of enemies killed
// $3E91EB: [8-bit] Hero's X-coordinate
// $3E91ED: [8-bit] Hero's Z-coordinate
// $3E91EF: [8-bit] Hero's Y-coordinate
