// Bomb Jack Twin
// #ID = 12001

// $1836: [8-bit] Lives 1P
Lives1P = byte(0x1836)
// $184C: [16-bit BCD] 1P Score - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x00184e
// $184E: [16-bit BCD] 1P Score - rightmost 4 digits - 0000xxxx; add to (0x00184c * 10,000)
Score1P = (bcd(word(0x184C)) * 10000) + bcd(word(0x184E))
// $186A: [8-bit] Number of bombs collected in current round by 1P; 0x18 total in each round
// $186C: [8-bit] Total number of Fire Bombs collected in the current Round by 1P (Max: 0x17)
// $186E: [DNP] [8-bit] Invincibility frames timer; goes to 0x07 at the end of the round
// $1936: [8-bit] Lives 2P
Lives2P = byte(0x1936)
// $194C: [16-bit BCD] 2P Score - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x00194e
// $194E: [16-bit BCD] 2P Score - rightmost 4 digits - 0000xxxx; add to (0x00194c * 10,000)
Score1P = (bcd(word(0x194C)) * 10000) + bcd(word(0x194E))
// $196A: [8-bit] Number of bombs collected in current round by 2P; 0x18 total in each round
BombsCollected = byte(0x186A) + byte(0x196A)
// $196C: [8-bit] Total number of Fire Bombs collected in the current Round by 2P (Max: 0x17)
FireBombs = byte(0x186C) + byte(0x196C)
// $9801: [8-bit] Players status
//        Bit0 - 2P active
//        Bit1 - 1P active
//        Bit5 - Any player active in stage
//        Bit7 - Game started; this is 0 during demo and on main menu
P1Active = bit1(0x9801) == 1
P2Active = bit0(0x9801) == 1
P1 = bit0(0x9801) + bit1(0x9801) == 1
P2 = bit0(0x9801) + bit1(0x9801) == 2
InStage = bit5(0x9801) == 1
InGame = bit7(0x9801) == 1

// $9802: [8-bit] Number of credits (max 0x09); still goes down in Free Play--loops back to 0x09 after losing a continue at 0x00
Credits = byte(0x9802)
// $9807: [bitflags] DIP Switches
//        Difficulty
//        Bit4 = 1 & Bit5 = 0 - Easy
//        Bit4 = 0 & Bit5 = 0 - Normal (default)
//        Bit4 = 0 & Bit5 = 1 - Hard
//        Bit4 = 1 & Bit5 = 1 - Hardest
//        ------
//        Lives
//        Bit6 = 1 & Bit7 = 1 - 1 life
//        Bit6 = 0 & Bit7 = 1 - 2 lives
//        Bit6 = 0 & Bit7 = 0 - 3 lives (default)
//        Bit6 = 1 & Bit7 = 0 - 4 lives
//        ------
HardestDifficulty = bit4(0x9807) == 1 && bit5(0x9807) == 1
NormalDifficulty = bit4(0x9807) == 0 && bit5(0x9807) == 0
MaxLives = bit6(0x9807) == 1 && bit7(0x9807) == 0
//        Starting area (just cosmetic)
//        Bits 1,2,3
// $9820: [8-bit] Number of levels cleared in current arcade run; - Changing this changes the next level
//        - Goes up to 0x45 and then rolls back to 0x00 and adds 0x01 to $9822 and 'loops' even though there are only 32 unique maps
Level = byte(0x9820) + 1
LevelRP = {
    1:"1-1",2:"1-2",3:"1-3",4:"Bonus"
// $9822: [8-bit] Current 'loop'; this starts at 0x00 and goes up by 0x01 every 20 rounds cleared
Loop = byte(0x9822) + 1
// $9844: [16-bit BCD] High Score - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x9846
// $9846: [16-bit BCD] High Score - rightmost 4 digits - 0000xxxx; add to (0x9844 * 10,000)
// $9848: [8-bit] Round that the last death was on; starts at 0x00 when starting a new game and will change to 0x01 if player dies in the first round, etc.
// $9850: [16-bit] Countdown for continue
// $9858: [8-bit] Current bomb map (final: 0x1f); starts from 0x00 and rolls back to 0x00 after final map
//        - One rotation is completed after finishing the bonus stage right after 9-3
//        - Continues to loop until 20-3 is completed and then resets to 0x00 to start a new game 'loop'
// $9870: [8-bit] Current multiplier
//        0x00 - x1
//        ~
//        0x04 - x5
Multiplier = byte(0x9870)
// $9872: [8-bit] Progress towards "P" power-up spawn
//        - Normal bomb increments by 0x02
//        - Fire bomb increments by 0x03
//        - "P" power-up appears at 0x14; value resets to 0x00 after the power-up wears off or the level changes
// $9876: [8-bit] "P" color; higher the value, the more points it's worth
//        0x01 - Blue
//        0x02 - Red
//        0x03 - Purple
//        0x04 - Green
//        0x05 - Light blue
//        0x06 - Yellow
//        0x07 - Silver
// $9878: [8-bit] Progress towards extra life; goes up every time an enemy is killed and will spawn a life if the threshold is met and a bonus coin would otherwise spawn
//        - First extra life at 0x2f, next at 0x
//        - Resets with continue
// $9882: [8-bit] Game states
//        0x01 - Main menu/demo
//        0x02 ~ 0x04 - In a stage (changes in order)
//        0x06 - Stage complete
//        0x07 - Bonus tallying (fire bombs or bonus stage)
//        0x08 - Final game over
//        0x09 - Continue
//        0x0a - Push start/high score
// $988C: [8-bit] Enemy combo while under "P" power-up; resets to 0x00 when next "P" power-up is collected
//        0x07 - Max combo (2000 points)
EnemyCombo = byte(0x988C)
    MaxCombo = 0x07
// $9892: [16-bit BCD] Seconds left in bonus round (fixed 1decimal point)
// $9893: round; loops from 0x01 to 0x09 then 0x00. stays at 0x05 after round 20
// $9894: [8-bit] Current stage in Round; 0x90 when bonus
// $9895: [8-bit BCD] Current round in 'loop'; goes up to 20 and then rolls back to 0 and counts up again; - displays as 0x89 during bonus
// $9900: [16-bit BCD] High Score leaderboard #1 - leftmost 4 digits - xxxx0000; multiply by 10,000 and add to 0x9902
// $9902: [16-bit BCD] High Score leaderboard #1 - rightmost 4 digits - 0000xxxx; add to (0x9900 * 10,000)
// $9904: [8-bit BCD] High Score leaderboard #1 - Round reached

//Achievements

//Leaderboards

//RP
rich_presence_conditional_display(InGame && P1 && P1Active,"Bomb Jack is defusing the situation on {0} • Difficulty:  {1} • Score: {2} • Lives:{3},
    rich_presence_lookup("Level",Level,LevelRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score1P, format="VALUE"),
    rich_presence_value("Digit",Lives1P, format="VALUE")
)
rich_presence_conditional_display(InGame && P1 && P2Active,"Bomb Jill is defusing the situation on {0} • Difficulty:  {1} • Score: {2} • Lives:{3},
    rich_presence_lookup("Level",Level,LevelRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score2P, format="VALUE"),
    rich_presence_value("Digit",Lives2P, format="VALUE")
)
rich_presence_conditional_display(InGame && P2,"Bomb Jack & Jill is defusing the situation on {0} • Difficulty:  {1} • 1P Score: {2} • 1P Lives:{3} • 1P Score: {4} • 1P Lives:{5},
    rich_presence_lookup("Level",Level,LevelRP),
    rich_presence_lookup("Difficulty",DifficultyCheck,DifficultyCheckRP),
    rich_presence_value("Digit",Score1P, format="VALUE"),
    rich_presence_value("Digit",Lives1P, format="VALUE"),
    rich_presence_value("Digit",Score2P, format="VALUE"),
    rich_presence_value("Digit",Lives2P, format="VALUE")
)
rich_presence_display("Getting ready to play")
    
