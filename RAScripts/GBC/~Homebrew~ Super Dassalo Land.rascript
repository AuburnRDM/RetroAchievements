// ~Homebrew~ Super Dassalo Land
// #ID = 30719

// $C0B2: [16-bit] Player x-position; lower is left
// $C0B4: [16-bit] Player y-position; lower is up
// $C11B: [8-bit] Position of letter sprite; prev 0x07 && 0x08
ScoreTallied = prev(byte(0xC11B) == 7 && byte(0xC11B) == 8
// $C530: some screen ID around here?
// $C636: music address
// $CB9A: 0x01 - in the air
// $CB9E: 0x01 - ground pound
// $CBA0: [16-bit] Number of collectibles found in current stage
// $CBA2: [16-bit] Number of total collectibles in current stage
// $CBA6: [16-bit] Score in current stage; multiply by 100 (dec)
Score = word(0xCBA6)
// $CBA8: [16-bit] Time remaining in stage; 0xffff when time runs out
StageTime = word(0xCBA8)
// $CBAA: [8-bit] Mandatory collectible status
//        0x00 - Not collected in stage; cannot complete
//        0x01 - Collected; can complete
MainCollectible = byte(0xCBAA)
// $CBAE: [8-bit] Subseconds timer
LevelStart = prev(byte(0xCBAE)) == 0 && byte(0xCBAE) == 1
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
RamenCake = bit0(0xCBBC) + bit1(0xCBBC) + bit2(0xCBBC)
ScrollingStar = bit4(0xCBBC) == 1 && bit5(0xCBBC) == 1 && prev(bit6(0xCBBC)) == 0 && bit6(0xCBBC) == 1
ScrollingCake = bit4(0xCBBC) + bit5(0xCBBC)
// $CBBD: [8-bit] Goal completion (star) pt. 2
//        Bit0 - Blackout HQ 3-2
//        Bit1 - Blackout HQ 3-3
//        Bit2 - Blackout HQ 3-Boss
BlackoutStar = bit7(0xCBBC) == 1 && bit0(0xCBBD) == 1 && bit1(0xCBBD) == 1 && prev(bit2(0xCBBD)) == 0 && bit2(0xCBBD) == 1
BlackoutCake = bit7(0xCBBC) + bit0(0xCBBD)
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
Damaged = byte(0xCBCC) == 1
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
TotalScore = (word(0xCC0C)*100) + (word(0xCC0E)*100) + (word(0xCC10)*100) + (word(0xCC12)*100) + (word(0xCC14)*100) + (word(0xCC16)*100) +
                (word(0xCC18)*100) + (word(0xCC1A)*100) + (word(0xCC1C)*100) + (word(0xCC1E)*100) + (word(0xCC20)*100)
// $CC22: [16-bit] Total game time (seconds); only accumulates when in a stage
//        - Display caps at 9999 (dec); time will count past this number, but reverts to 9999 (dec) when viewing the score card
GameTime = word(0xCC22)

// $CC28: [8-bit] Damage frames active; flips to 0x01 when invulnerable
//maybe use this for Damaged = byte(0xCC28) == 1

//need to define LevelComplete, InLevel, and MainMenu
//Functions and such
RankArray = [Ramen1Rank,Ramen2Rank,Ramen3Rank,RamenBossRank,Scrolling1Rank,Scrolling2Rank,ScrollingBossRank,Blackout1Rank,Blackout2Rank,Blackout3Rank,BlackoutBossRank]
function AllSRank(target) => tally_of(RankArray,target,addr => once(addr == 4)) // maybe add the byte back
function prevAllSRank(target) => tally_of(RankArray,target,addr => once(prev(addr) == 4))
LevelStart = 
//Achievements
//Complete every stage in Ramen Springs
achievement(
        title="ramen complete",points=2,type="progression",
        description="Complete every stage in Ramen Springs.",
        trigger=!MainMenu && RamenComplete
)
//Coin RS
achievement(
        title="Believe It",points=3,
        description="Earn every fish cake collection star in Ramen Springs.",
        trigger= !MainMenu && prev(RamenCake) == 2 && measured(RamenCake == 3)
)
//S RS
achievement(
        title="Slurping it Up", points= 5,
        description="Earn an S rank on every stage in Ramen Springs.",
        trigger= !MainMenu && 
                tally(3,
                        once(prev(Ramen1Rank) == 4),
                        once(prev(Ramen2Rank) == 4),
                        once(prev(Ramen3Rank) == 4),
                        once(prev(RamenBossRank) == 4)) &&
                measured(tally(4,
                        once(Ramen1Rank == 4),
                        once(Ramen2Rank == 4),
                        once(Ramen3Rank == 4),
                        once(RamenBossRank == 4))) &&
                never(tally(4,
                        once(prev(Ramen1Rank) == 4),
                        once(prev(Ramen2Rank) == 4),
                        once(prev(Ramen3Rank) == 4),
                        once(prev(RamenBossRank) == 4)))
)

//Complete Scrolling Skies
achievement(
        title="SS complete",points=3,type="progression",
        description="Complete every stage in Scrolling Skies.",
        trigger=!MainMenu && ScrollingComplete
)
//Coin SS
achievement(
        title="ss cake",points=3,
        description="Earn every fish cake collection star in Scrolling Skies.",
        trigger= !MainMenu && prev(ScrollingCake) == 1 && measured(ScrollingCake == 2)
)
//S SS
achievement(
        title="sky s", points= 5,
        description="Earn an S rank on every stage in Scrolling Skies.",
        trigger= !MainMenu && 
                tally(2,
                        once(prev(Scrolling1Rank) == 4),
                        once(prev(Scrolling2Rank) == 4),
                        once(prev(ScrollingBossRank) == 4)) &&
                measured(tally(3,
                        once(Scrolling1Rank == 4),
                        once(Scrolling2Rank == 4),
                        once(ScrollingBossRank == 4))) &&
                never(tally(3,
                        once(prev(Scrolling1Rank) == 4),
                        once(prev(Scrolling2Rank) == 4),
                        once(prev(ScrollingBossRank) == 4)))
)

//Complete  Blackout HQ
achievement(
        title="blackout complete",points=3,type="win_condition",
        description="Complete every stage in Blackout HQ and beat the game.",
        trigger=!MainMenu && BlackoutComplete
)
//Coin BHQ
achievement(
        title="blackout cake",points=3,
        description="Earn every fish cake collection star in Blackout HQ.",
        trigger= !MainMenu && prev(BlackoutCake) == 1 && measured(BlackoutCake == 2)
)
//S BHQ
achievement(
        title="blackout s", points= 5,
        description="Earn an S rank on every stage in Blackout HQ.",
        trigger= !MainMenu && 
                tally(3,
                        once(prev(Blackout1Rank) == 4),
                        once(prev(Blackout2Rank) == 4),
                        once(prev(Blackout3Rank) == 4),
                        once(prev(BlackoutBossRank) == 4)) &&
                measured(tally(4,
                        once(Blackout1Rank == 4),
                        once(Blackout2Rank == 4),
                        once(Blackout3Rank == 4),
                        once(BlackoutBossRank == 4))) &&
                never(tally(4,
                        once(prev(Ramen1Rank) == 4),
                        once(prev(Ramen2Rank) == 4),
                        once(prev(Ramen3Rank) == 4),
                        once(prev(RamenBossRank) == 4)))
)

//Somehow find a way to die in 1-1.
achievement(
        title="Fraud",points=1,
        description="Somehow find a way to die in 1-1.",
        trigger= InLevel && Stage == 1 && Dead && StageTime != 0xFFFF
)
//Reach Kewpie in 3-2 without collecting any beers with 125 seconds or more left on the clock.
achievement(
        title="Some Kind of Speedrunner", points=3,
        description="Reach Kewpie in 3-2 without collecting any beers with 125 seconds or more left on the clock.",
        trigger= InLevel && Stage == 9 && StageTime <= 125 && trigger_when(LevelComplete)

//Complete 3-3 without taking damage.
achievement(
        title="shmup 1",points=5,
        description="Complete 3-3 without taking damage.",
        trigger= Stage == 0xa && once(LevelStart) trigger_when(LevelComplete) && never(!InLevel) && never(Damaged)
)

//Defeat the final boss without taking damage.
achievement(
        title="shmup 1",points=5,
        description="Complete 3-3 without taking damage.",
        trigger= Stage == 0xb && once(LevelStart) trigger_when(LevelComplete) && never(!InLevel) && never(Damaged)
)
//Earn over 150,000 total points across every stage.
achievement(
        title="King of Games",points=25,
        description="Earn over 150,000 total points across every stage.",
        trigger=!MainMenu && prev(TotalScore) < 150000 & TotalScore >= 150000
)
//Leaderboards
//Full game any%
leaderboard(
        title="Full Game - Any%",
        description="Complete the game with as few in-game seconds spent in levels as you can.",
        start=!MainMenu && BlackoutComplete,
        cancel=always_false(),
        submit=always_true(),
        value=GameTime,
        format="VALUE",lower_is_better=true
)
//Full game 100%
leaderboard(
        title="Full Game - 100%",
        description="Earn an S rank on every stage with as few in-game seconds spent in levels as you can.",
        start=!MainMenu && prevAllSRank(11) && AllSRank(12) && never(prevAllSRank(12)),
        cancel=always_false(),
        submit=always_true(),
        value=GameTime,
        format="VALUE",lower_is_better=true
)
//RTA with jokes off
leaderboard(
        title="Full Game - Any% [Single Session/RTA]",
        description="Start a new game with cutscenes off and complete the game as fast as you can.",
        start=!MainMenu && CutsceneSkip && Stage == 0 && LevelStart,
        cancel=MainMenu,
        submit=!MainMenu && BlackoutComplete,
        value=always_true(),
        format="FRAMES",lower_is_better=true
)
leaderboard(
        title="Full Game - 100% [Single Session/RTA]",
        description="Start a new game with cutscenes off and earn an S rank on every stage as fast as you can.",
        start=!MainMenu && CutsceneSkip && Stage == 0 && LevelStart,
        cancel=MainMenu,
        submit=!MainMenu && prevAllSRank(11) && AllSRank(12) && never(prevAllSRank(12)),
        value=always_true(),
        format="FRAMES",lower_is_better=true
)
//Level speed/score (no board boss 2, no score boss 1) -- maybe scrap speed
function StageSpeedLB(stage) {
        leaderboard(
                title=StageRP[stage] + " Speed",
                description="Complete " + StageRP[stage] + " with as many seconds remaining as you can.",
                start=Stage == stage && LevelComplete
                cancel=always_false(),
                submit=always_true(),
                value=StageSeconds, 
                format="VALUE", lower_is_better=false
        )
}
function StageScoreLB(stage) {
        leaderboard(
                title=StageRP[stage] + " Score",
                description="Complete " + StageRP[stage] + " with as many points as you can.",
                start=Stage == stage && LevelFinished && ScoreTallied
                cancel=always_false(),
                submit=always_true(),
                value=Score, 
                format="VALUE", lower_is_better=false
        )
}
//RP
//Tommy is {0} • Stars: {1}/12 • S-Ranks: {2}/12 • Total Score: {3}
