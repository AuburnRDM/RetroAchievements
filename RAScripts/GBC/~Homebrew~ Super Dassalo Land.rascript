// ~Homebrew~ Super Dassalo Land
// #ID = 30719

// $C0B2: [16-bit] Player x-position; lower is left
// $C0B4: [16-bit] Player y-position; lower is up
// $C530: some screen ID around here?
// $C636: music address
// $CB9A: 0x01 - in the air
// $CB9E: 0x01 - ground pound
// $CBA0: [16-bit] Number of collectibles found in current stage
// $CBA2: [16-bit] Number of total collectibles in current stage
// $CBA6: [16-bit] Score in current stage; multiply by 100 (dec)
Score = word(0xCBA6)
// $CBA8: [16-bit] Time remaining in stage; 0xffff when time runs out
// $CBAA: [8-bit] Mandatory collectible status
//        0x00 - Not collected in stage; cannot complete
//        0x01 - Collected; can complete
// $CBB2: [8-bit] Current stage
//        0x00 - Tutorial
//        0x01 - Ramen Springs 1-1
//        0x02 - Ramen Springs 1-2
//        0x03 - Ramen Springs 1-3
//        0x04 - Ramen Springs 1-Boss
//        0x05 - Scrolling Skies 2-1
//        0x06 - Scrolling Skies 2-2
//        0x07 - Scrolling Skies 2-Boss
//        0x08 - Blackout HQ 3-1
//        0x09 - Blackout HQ 3-2
//        0x0a - Blackout HQ 3-3
//        0x0b - Blackout HQ 3-Boss (final)
//        0x0c - Ramen Springs Stage Door
//        0x0d - Scrolling Skies Stage Door
Stage = byte(0xCBB2)
StageRP = {
    0:"Tutorial",
    1:"Ramen Springs 1-1",
    2:"Ramen Springs 1-2",
    3:"Ramen Springs 1-3",
    4:"Ramen Springs Boss",
    5:"Scrolling Skies 2-1",
    6:"Scrolling Skies 2-2",
    7:"Scrolling Skies Boss",
    8:"Blackout HQ 3-1",
    9:"Blackout HQ 3-2",
    0xa:"Blackout HQ 3-3",
    0xb:"Blackout HQ Boss",
    0xc:"on stage at the Ramen Springs",
    0xd:"on stage at the Scrolling Skies"
}
    
// $CBBA: [8-bit] Settings - Cutscenes
//        0x00 - On
//        0x01 - Skip
CutsceneSkip = byte(0xCBBA) == 1
// $CBBC: [8-bit] Goal completion (star) pt. 1; Kewpie gets a crown on the scorecard when all are collected
//        Bit0 - Ramen Springs 1-1
//        Bit1 - Ramen Springs 1-2
//        Bit2 - Ramen Springs 1-3
//        Bit3 - Ramen Springs 1-Boss
//        Bit4 - Scrolling Skies 2-1
//        Bit5 - Scrolling Skies 2-2
//        Bit6 - Scrolling Skies 2-Boss
//        Bit7 - Blackout HQ 3-1
RamenStar = bit0(0xCBBC) == 1 && bit1(0xCBBC) == 1 && bit2(0xCBBC) == 1 && prev(bit3(0xCBBC)) == 0 && bit3(0xCBBC) == 1
ScrollingStar = bit4(0xCBBC) == 1 && bit5(0xCBBC) == 1 && prev(bit6(0xCBBC)) == 0 && bit6(0xCBBC) == 1
// $CBBD: [8-bit] Goal completion (star) pt. 2
//        Bit0 - Blackout HQ 3-2
//        Bit1 - Blackout HQ 3-3
//        Bit2 - Blackout HQ 3-Boss
BlackoutStar = bit7(0xCBBC) == 1 && bit0(0xCBBD) == 1 && bit1(0xCBBD) == 1 && prev(bit2(0xCBBD)) == 0 && bit2(0xCBBD) == 1
// $CBBE: [8-bit] Rank - Ramen Springs 1-3
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBC0: [8-bit] Stages completed pt. 1
//        Bit0 - Ramen Springs 1-1
//        Bit1 - Ramen Springs 1-2
//        Bit2 - Ramen Springs 1-3
//        Bit3 - Ramen Springs 1-Boss
//        Bit4 - Scrolling Skies 2-1
//        Bit5 - Scrolling Skies 2-2
//        Bit6 - Scrolling Skies 2-Boss
//        Bit7 - Blackout HQ 3-1
RamenComplete = bit0(0xCBC0) == 1 && bit1(0xCBC0) == 1 && bit2(0xCBC0) == 1 && prev(bit3(0xCBC0)) == 0 && bit3(0xCBC0) == 1
ScrollingComplete = bit4(0xCBC0) == 1 && bit5(0xCBC0) == 1 && prev(bit6(0xCBC0)) == 0 && bit6(0xCBC0) == 1
// $CBC1: [8-bit] Stages completed pt. 2
//        Bit0 - Blackout HQ 3-2
//        Bit1 - Blackout HQ 3-3
//        Bit2 - Blackout HQ 3-Boss
BlackoutComplete = bit7(0xCBC0) == 1 && bit0(0xCBC1) == 1 && bit1(0xCBC1) == 1 && prev(bit2(0xCBC1)) == 0 && bit2(0xCBC1) == 1
// $CBC2: [8-bit] Rank - Ramen Springs 1-1
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
Ramen1Rank = byte(0xCBC2)
// $CBC4: [8-bit] Rank - Ramen Springs 1-2
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
Ramen2Rank = byte(0xCBC4)
// $CBC6: [8-bit] Rank - Scrolling Skies 2-1
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
Scrolling1Rank = byte(0xCBC6)
// $CBC8: [8-bit] Rank - Scrolling Skies 2-2
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
Scrolling2Rank = byte(0xCBC8)
// $CBCC: [8-bit] Taking damage; flips to 0x01 when hit
// $CBCE: [8-bit] Rank - Ramen Springs 1-Boss
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
RamenBossRank = byte(0xCBCE)
// $CBD0: [8-bit] Damage frames; goes to 0x00 when hit and counts up to 0x0b in normal stages and 0x06 in SHMUP bosses -- player is invincibile while counting
// $CBD2: [8-bit] Rank - Scrolling Skies 2-Boss
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
ScrollingBossRank = byte(0xCBD2)
// $CBD8: [8-bit] Most recent rank
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBDE: 0x03 when not attacking, flips to 0x00 and counts up when attacking
// $CBE2: [8-bit] Rank - Blackout HQ 3-1
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
Blackout1Rank = byte(0xCBE2)
// $CBF0: [8-bit] Rank - Blackout HQ 3-2
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
Blackout2Rank = byte(0xCBF0)
// $CBF4: [8-bit] Rank - Blackout HQ 3-3
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
Blackout3Rank = byte(0xCBF4)
// $CBF6: [8-bit] Rank - Blackout HQ 3-Boss
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
BlackoutBossRank = byte(0xCBF6)
// $CC04: [8-bit] Settings - Music
//        0x00 - On
//        0x01 - Off
MusicOn = byte(0xCC04) == 0
// $CC06: [8-bit] Settings - SFX
//        0x00 - On
//        0x01 - Off
// $CC0C: [16-bit] Ramen Springs 1-1 high score; multiply by 100 (dec)
// $CC0E: [16-bit] Ramen Springs 1-2 high score; multiply by 100 (dec)
// $CC10: [16-bit] Ramen Springs 1-3 high score; multiply by 100 (dec)
// $CC12: [16-bit] Ramen Springs 1-Boss high score; multiply by 100 (dec)
// $CC14: [16-bit] Scrolling Skies 2-1 high score; multiply by 100 (dec)
// $CC16: [16-bit] Scrolling Skies 2-2 high score; multiply by 100 (dec)
// $CC18: [16-bit] Scrolling Skies 2-Boss high score; multiply by 100 (dec)
// $CC1A: [16-bit] Blackout HQ 3-1 high score; multiply by 100 (dec)
// $CC1C: [16-bit] Blackout HQ 3-2 high score; multiply by 100 (dec)
// $CC1E: [16-bit] Blackout HQ 3-3 high score; multiply by 100 (dec)
// $CC20: [16-bit] Blackout HQ 3-Boss high score; multiply by 100 (dec)
// $CC22: [16-bit] Total game time (seconds); only accumulates when in a stage
//        - Display caps at 9999 (dec); time will count past this number, but reverts to 9999 (dec) when viewing the score card
GameSeconds = word(0xCC22)
// $CC28: [8-bit] Damage frames active; flips to 0x01 when invulnerable
Damaged = byte(0xCC28) == 1

//need to define LevelComplete and MainMenu

//Achievements
//Complete every stage in Ramen Springs
achievement(
        title="ramen complete",points=2,type="progression",
        description="Complete every stage in Ramen Springs.",
        trigger=!MainMenu && RamenComplete
)
//Coin RS

//S RS

//Complete Scrolling Skies
achievement(
        title="SS complete",points=3,type="progression",
        description="Complete every stage in Scrolling Skies.",
        trigger=!MainMenu && ScrollingComplete
)
//Coin SS

//S SS

//Complete  Blackout HQ
achievement(
        title="blackout complete",points=3,type="win_condition",
        description="Complete every stage in Blackout HQ and beat the game.",
        trigger=!MainMenu && BlackoutComplete
)
//Coin BHQ

//S BHQ

//Somehow find a way to die in 1-1.

//Reach Kewpie in 3-2 without collecting any beers with 125 seconds or more left on the clock.

//Complete 3-3 without taking damage.

//Defeat the final boss without taking damage.

//Earn over 150,000 total points across every stage.

//Leaderboards
//Full game any%
//Full game 100%
//RTA with jokes off
//Level speed/score (no board boss 2, no score boss 1)
