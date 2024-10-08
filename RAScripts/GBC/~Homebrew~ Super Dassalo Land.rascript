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
// $CBBA: [8-bit] Settings - Cutscenes
//        0x00 - On
//        0x01 - Skip
// $CBBC: [8-bit] Goal completion (star) pt. 1; Kewpie gets a crown on the scorecard when all are collected
//        Bit0 - Ramen Springs 1-1
//        Bit1 - Ramen Springs 1-2
//        Bit2 - Ramen Springs 1-3
//        Bit3 - Ramen Springs 1-Boss
//        Bit4 - Scrolling Skies 2-1
//        Bit5 - Scrolling Skies 2-2
//        Bit6 - Scrolling Skies 2-Boss
//        Bit7 - Blackout HQ 3-1
// $CBBD: [8-bit] Goal completion (star) pt. 2
//        Bit0 - Blackout HQ 3-2
//        Bit1 - Blackout HQ 3-3
//        Bit2 - Blackout HQ 3-Boss
// $CBBE: [8-bit] Rank - Ramen Springs 1-3
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBC0: [8-bit] Stages completed pt. 1
//        Bit0 - Ramen Springs 1-1
//        Bit1 - Ramen Springs 1-2
//        Bit2 - Ramen Springs 1-3
//        Bit3 - Ramen Springs 1-Boss
//        Bit4 - Scrolling Skies 2-1
//        Bit5 - Scrolling Skies 2-2
// $CBC1: [8-bit] Stages completed pt. 2
//        Bit0 - Blackout HQ 3-2
//        Bit1 - Blackout HQ 3-3
//        Bit2 - Blackout HQ 3-Boss
// $CBC2: [8-bit] Rank - Ramen Springs 1-1
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBC4: [8-bit] Rank - Ramen Springs 1-2
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBC6: [8-bit] Rank - Scrolling Skies 2-1
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBC8: [8-bit] Rank - Scrolling Skies 2-2
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBCC: [8-bit] Taking damage; flips to 0x01 when hit
// $CBCE: [8-bit] Rank - Ramen Springs 1-Boss
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBD0: [8-bit] Damage frames; goes to 0x00 when hit and counts up to 0x0b in normal stages and 0x06 in SHMUP bosses -- player is invincibile while counting
// $CBD2: [8-bit] Rank - Scrolling Skies 2-Boss
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBD8: [8-bit] Most recent rank
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBDE: 0x03 when not attacking, flips to 0x00 and counts up when attacking
// $CBE2: [8-bit] Rank - Blackout HQ 3-1
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBF0: [8-bit] Rank - Blackout HQ 3-2
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBF4: [8-bit] Rank - Blackout HQ 3-3
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CBF6: [8-bit] Rank - Blackout HQ 3-Boss
//        0x00 - None | 0x01 - C | 0x02 - B | 0x03 - A | 0x04 - S
// $CC04: [8-bit] Settings - Music
//        0x00 - On
//        0x01 - Off
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
// $CC28: [8-bit] Damage frames active; flips to 0x01 when invulnerable
