// ~Hack~ Masterpiece
// #ID = 33726

// $000019: [8-bit] Power-up
//          0x00 - None
//          0x01 - Mushroom
//          0x02 - Cape
//          0x03 - Fire
// $000094: [16-bit] Player's X-position (Left of map is 0x0000)
// $000096: [16-bit] Player's Y-position (Top of map is 0x0000)
// $000100: [8-bit] Game Status
//          0x01 - Dedication
//          0x07 - Title Screen
//          0x0a - Main Menu
//          0x0e - Overworld
//          0x0f - Respawn/In pipe
//          0x14 - In a level (fully loaded)
// $00010B: [16-bit] Most recent screen ID loaded (Does not change when entering the overworld until a new level is selected)
//          0x0078 - daddy's castle challenge clear (no moon)
//          0x0079 - daddy's castle challenge clear (moon)
//          0x007a - daddy's castle boss
//          
//          0x46 - all your friends; after first boss
//          0x47 - all your friends; 2nd boss
//          0x48 - all your friends; after 2nd boss
//          0x49 - all your friends; 3rd boss
//          0x4a - all your friends; after 3rd boss
//          0x4b - all your friends; 4th boss
//          0x4c - all your friends; after 4th boss
//          0x4d - all your friends; last boss
//          0x4e - all your friends; exit
// $000DBE: [8-bit] Lives (during 99 Lives mode)
//          0xff - Game Over
// $000DC0: [8-bit] Amount of rings left to collect before the star block produces a 1-up
// $000DD5: [8-bit] Method stage is exited
//          0x00 - No exit ocurring
//          0x01 - Stage exit via normal exit
//          0x02 - Stage exit via keyhole
//          0x80 - Stage exit via Start+Select
// $000F5E: [8-bit] Various events
//          --- Break the Targets ($13bf = 0x50)
//          Number of targets broken in Break the Targets!
//          --- Back Door ($13bf = 0x4d)
//          Number of challenge rooms entered in current attempt (max: 0x08)
// $0013BF: [8-bit] Level ID of most recently entered stage (final rooms when protection is needed)
// $001426: [8-bit] Message box status; some messages are assigned to 0x01 and others are assigned to 0x02. This may change "Level ID (0x13bf)" temporarily, use "Screen ID (0x10b)"
// $001434: [8-bit] End level timer - Key exit
//          Value is 0x00 until a keyhole is entered and the end level fanfare begins; value will tick down each frame until it reaches 0x01 and begin exiting the stage on the next frame
// $00148F: [8-bit] Holding something (ex: a shell)
//          0x00 - Not holding
//          0x01 - Holding
// $001493: [8-bit] End level timer - Normal/Orb goal
//          Value is 0x00 until a goal is touched and the end level fanfare begins; value will tick down each frame until it reaches 0x01 and begin exiting the stage on the next frame
// $0014AF: [8-bit] Switch value
//          0x00 - Off
//          0x01 - On
// $001EAC: [8-bit] Overworld flags
// $001F27: [8-bit] Green switch
//          bit0 - Active
// $001F28: [8-bit] Yellow switch
//          bit0 - Active
// $001F29: [8-bit] Blue switch
//          bit0 - Active
// $001F2A: [8-bit] Red switch
//          bit0 - Active
// $001F2E: exits 1
// $001FD5: exits 2
// $001FEE: moons
//          bit0 - bouncin' on it palace (0x07; 0x34)
// $001FEF: bit0 - palace of the dead friends moon (0x0f; 0x64)
//          bit3 - bicurious palace moon (0x0c; 0x54)
//          bit5 - Jeff Bezos Climate Pledge palace moon (0x0a, 0x44)
// $001FF0: [8-bit] Moons pt. 1 (stage; screen)
//          bit3 - all your friends (0x14; 0x4e)
//          bit4 - ABR (Always Be Reaping) moon (0x13; 0x13)
// $001FF1: bit5 - Monster Energy Drink ocean spire moon (0x1a; 0x1a)
//          bit7 - Daddy's Castle moon (
// $001FF3: moon
//          bit5 - i keep crawlin back moon (0x21; 0x13c)
// $001FF7: bit1 - abheri moon
// $001FF9: [8-bit] Moons pt. ? (stage; screen)
//          bit1 - masterpiece moon
//          bit3 - inner critic moon (0x5c; 0xd4)
// $001FFF: [8-bit] Game mode
//          0x00 - 99 Lives
//          0x01 - Infinite Lives
// $01B403: [16-bit] Current checkpoint
// $01B405: [8-bit] Retry status
//          Bit0 - Retry chosen
// $01B420: [8-bit] Overall File Death Count (Ten Thousands place)
// $01B421: [8-bit] Overall File Death Count (Thousands place)
// $01B422: [8-bit] Overall File Death Count (Hundreds place)
// $01B423: [8-bit] Overall File Death Count (Tens place)
// $01B424: [8-bit] Overall File Death Count (Ones place)
// $01B425: [8-bit] "Wins" for "HOME" (boss) team - Ones
// $01B426: [8-bit] "Wins" for "HOME" (boss) team - Tens
// $01B427: [8-bit] "Wins" for "HOME" (boss) team - Hundreds
// $01BA00: indulge me total
//          lives in limited stages
// $01BA04: induldge me chain
//          inner critic level
