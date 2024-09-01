// Jaki Crush
// #ID = 3066

// $0002: [8-bit] Sound/song playing (except in Wheel Demon Bonus)
//        0xaa - Boss theme 1
//        0xcf - Four Gods theme
//        0xd8 - Face Demon theme
//        0xf9 - Bonus victory flourish
//        0x58 - Bonus points / Last Chance screen
//        0x77 - Main board
//        0x85 - Boss theme 2
//        0x90 - "PERFECT"
//        0xb2 - Game Over
//        0xee - Leaderboard
BGM = byte(0x2)
BonusWin = 0xf9
// $00C0: [8-bit] Cheats enabled
//        Bit0 - MENERABU (Level Select)
//        Bit1 - BALLUGOK (Move ball with D-Pad); block this always
//        Bit2 - MONOZUKI (Black and white visuals)
BALLUGOK = bit1(0xC0) == 1
MENERABU = bit0(0xC0) == 1
MONOZUKI = bit2(0xC0)
MONOZUKIRP = {
    0:"",
    1:" in monochrome"
}
// $00C4: [8-bit] BALLUGOK status (freely move ball)
//        Bit0 - Active
BALLUGOKActive = bit0(0xc4) == 1
// $00F3: [8-bit] Pause
//        Bit1 - Paused
Paused = bit1(0xf3) == 1
// $00F4: [8-bit] Sound effect to be played
//        0x01 - Starting a BGM
//        0x21 - Going into a bonus
//        0x2d - Special Point / Extra Ball
//        0xf2 - Starting bonus BGM
// $0149: [8-bit] Controls pt. 1
//        Bit4 - R
//        Bit5 - L
//        Bit6 - X
//        Bit7 - A
// $014A: [8-bit] Controls pt. 1
//        Bit0 - Right
//        Bit1 - Left
//        Bit2 - Down
//        Bit3 - Up
//        Bit4 - Start
//        Bit5 - Select
//        Bit6 - Y
//        Bit7 - B
// $014E: [8-bit] Control style - Player 1; cursor is D-Pad
//        0x00 - Flipper > Cursor/A | Tilt > L/R
//        0x01 - Flipper > Cursor/A | Tilt > B
//        0x02 - Flipper > L/R | Tilt > Cursor
// $014F: [8-bit] Control style - Player 2; cursor is D-Pad
//        0x00 - Flipper > Cursor/A | Tilt > L/R
//        0x01 - Flipper > Cursor/A | Tilt > B
//        0x02 - Flipper > L/R | Tilt > Cursor
// $0150: [8bit]
//        00=High Speed
//        01=Low Speed
Speed = byte(0x150)
High = 0
Low = 1
// $0598: [16-bit] X-position of main ball; lower is left
//        0xee - Shooter lane
XPos = word(0x598)
// $059A: [16-bit] X-position of multiball; lower is left
//        - Original position is 0x76 before multiball is active while demon head is on upper table
MultiXPos = word(0x59a)
// $0658: [16-bit] Y-position of ball; lower is up
YPos = word(0x658)
// $065A: [16-bit] Y-position of multiball; lower is up
MultiYPos = word(0x65a)
//        - Original position is 0x280 before multiball is active while demon head is on upper table
// $06AE: [8-bit] Plunger depth; (default: 0xa0, max: 0xcc)
// $0BD1: [8-bit] Middle Table - State of lantern; progresses to the next state for every 4 middle demons defeated
//        0x00 - No damage
//        0x01 - 1 damage
//        0x02 - 2 damage
//        0x03 - Open; able to get either red bonus ball or enter Four Gods Bonus
// $0D00: Main Menu: Which option? [8-bit]
//        0x00: New Game
//        0x01: Password (Protect against this!)
//        0x02: Configuration
// $0D1A: 0x00 - face down
//        0x02 - face up
//        0x01 - multiball
FaceStatus = byte(0xd1a)
MultiballRP = {
    0:"",
    1:" with multiball",
    2:""
}
// $0BB1: [8-bit] Lower Table - Bonus gate status; increments from 0x00 to 0x07 when opening and back down to 0x00 when closing
//        0x00 - Closed
//        0x06 - Ball is in gate / opening up
//        0x07 - Gate is open
LowerGateBallIn = byte(0xbb1) == 6
// $0BF5: [8-bit] Upper Table - Horse gate state; increments from 0x00 to 0x03 when opening and back down to 0x00 when closing
//        0x00 - Closed
//        0x02 - Ball is in gate / opening up
//        0x03 - Gate is open
UpperGateBallIn = byte(0xbf5) == 2
// $0EA8: [8-bit] Bonus Boss 1 HP
//        Fire Demon Bonus - Left head (Initial: 0x08)
//        Thunder Demon Bonus (Initial: 0x07)
// $0EAA: [8-bit] Bonus Boss 2 HP
//        Fire Demon Bonus - Right head (Initial: 0x08)
// $0ECE: [8-bit] Splitting demon HP; starts at 0x04 and spawns smaller demons at 0x00
// $0EF0: [8-bit] Lower Table - Upper dragon HP
//        Initial is 0x08 and it ticks down 0x01 every time it's hit. Opens when reaches 0x00 and Bonus # is available.
// $0EF2: [8-bit] Lower Table - Lower dragon HP
//        Initial is 0x08 and it ticks down 0x01 every time it's hit. Opens when reaches 0x00 and Bonus # is available.
// $0F58: [8-bit] Ball status
//        Bit0 - Locked in place
//        Bit1 - Touching something that slows it down / manual control
//        Bit7 - On launcher
BallLocked = bit0(0xf58) == 1
// $0F68: [8-bit] Thunder Demon hit
//        Bit7 - Deal 1 damage
// $0F6C: [8-bit] Face Demon Bonus
//        Bit7 - Defeated
// $0FA7: [8-bit] Middle Table - Cave extra ball status
//        Bit6 - Extra ball achieved; resets after ball color goes back to normal
//        Bit7 - Cave eligible for extra ball; ball turning red lights up the green arrow until the ball is shot out of cave or it turns back to normal
ExtraBallMid = bit7(0xfa7) == 1 && prev(bit6(0xfa7)) == 0 && bit6(0xfa7) == 1
// $1110: [8-bit] Middle Table -  Number of times the lantern has been cracked fully open
//        - Turns orange on 0x04 and lets the player enter Four Gods Bonus
//        - Temporarily 0x00 when on another screen
// $18F0: block of respawn timers
// $1C02: [8-bit] Screen ID
//        0x00 - Main menu / Bonus loading
//        0x01 - Main table
//        0x02 - Fire Demon Bonus
//        0x03 - Ice Demon Bonus
//        0x04 - Wheel Demon Bonus
//        0x05 - Thunder Demon Bonus
//        0x06 - Face Demon Bonus
//        0x07 - Four Gods Bonus
//        0x08 - Post-Bonus scoring
//        0x09 - Bonus point redemptoin
//        0x0a - Leaderboard
//        0x0e - Ending
//        0x0f - Last Chance
Screen = byte(0x1c02)
MainMenu = 0
Loading = 0
MainTable = 1
FireBonus = 2
IceBonus = 3
WheelBonus = 4
ThunderBonus = 5
FaceBonus = 6
GodsBonus = 7
PostBonusScreen = 8
BonusPointsScreen = 9
Leaderboard = 0xa
Ending = 0xe
LastChance = 0xf
ScreenRP = {
    1:"main table",
    2:"Fire Demons bonus",
    3:"Ice Demons bonus",
    4:"Wheel Demon bonus",
    5:"Thunder Demon bonus",
    6:"Face Demon bonus",
    7:"Four Gods bonus",
    8:"Seeing their bonus stage results",
    9:"Earning bonus points",
    10:"Looking at the leaderboard",
    0xe:"Watching the ending",
    0xf:"Hoping for another chance"
}
// $1C54: [8-bit] Tilt
//        0xff - Tilting
Tilt = byte(0x1c54) == 0xff
// $1C62: [8bit BCD] Ball count - Player 1; 0x02 is default, 0xff on Game Over
//        - Value changes on main menu when a password that affects ball total is entered
P1Balls = bcd(byte(0x1c62))
P1BallsLastChance = prev(byte(0x1c62)) == 0xff
P1BallsGameOver = byte(0x1c62) == 0xff
P1BallsGameOverLB = prior(byte(0x1c62)) == 0xff // use this for first ball LB
// $1C63: [8bit BCD] Ball count - Player 2; 0x02 is default, 0xff on Game Over
//        - Value changes on main menu when a password that affects ball total is entered
P2Balls = bcd(byte(0x1c62))
// $1C92: [32-bit BCD] Player 1 Score
//        - Ones and Tens place are always 0 on the in-game display; multiply by 100 to get the true score
//        - Value changes on main menu when a password that affects score is entered
//        
//        [Lower4] Digit to match during last chance
P1Score = bcd(dword(0x1c92)) * 100
// $1C96: [32-bit BCD] Player 2 Score
//        - Ones and Tens place are always 0 on the in-game display; multiply by 100 to get the true score
//        - Value changes on main menu when a password that affects score is entered
P2Score = bcd(dword(0x1c96)) * 100
// $1C9A: [32-bit BCD] Bonus score being paid out
//        - Ones and Tens place are always 0 on the in-game display; multiply by 100 to get the true score
//        
//        [Lower4] Digit to match during last chance
BonusPoints = bcd(dword(0x1c9a)) * 100
// $1CA0: [8bit]
//        MENERABU level select indicator.
//        01=Stage 1 aka legit gameplay
//        02=Twin Fire Oni/dragon flippers
//        03=Ice Goblins
//        04=Oni Wheel/bamboo
//        05=Raijin Thunder God
//        06=Funny Face/Space Invaders w/bugs
//        07=Summoning Circle
LevelSelect = byte(0x1ca0)
// $1CA2: [8bit]
//        Most recent bonus game entered
//        00=None
//        02=Twin Fire Oni/dragon flippers
//        03=Ice Goblins
//        04=Oni Wheel/bamboo
//        05=Raijin Thunder God
//        06=Funny Face/Space Invaders w/bugs
//        07=Summoning Circle
BonusEntered = byte(0x1ca2)
// $1CA4: [8bit]
//        00=Title Screen / level select
//        01=gameplay / demo
TitleScreen = byte(0x1ca4) == 0
OnTitleScreen = byte(0x1ca4) == 0 && Screen == MainMenu
// $1CA8: [8-bit] Show score toggle (while on the table)
//        0x00 - Off
//        0x01 - On
// $1CBE: [8-bit] Password Cursor Position for Player 1 [8-bit]
// $1CBF: [8-bit] Password Cursor Position for Player 2 [8-bit]
// $1CC0: [8-bit] Game mode
//        0x00 - 1 Player
//        0x01 - 2 Player
//        0x02 - 2 Player VS

// $1CD8: [8bit]
//        This and its next 7 neighbors to the right, 0x1cd9-0x1cdf are the Player 1 Password indicators. The next 8 after that in the row below, 0x1ce0-0x001ce7 are for Player 2.
//        An important one to protect against is BALLUGOK, which is: 07 06 11 11 1a 0c 14 10
//        Thankfully, the game retains this memory on table load, so protecting against it should be simple.
// $1CF1: [8-bit] Last sound effect played in Sound Test
// $1CF2: [8bit]
//        Player state
//        01, 02, 05, and 07 = Title screen/demo
//        00=Player in-menu and inital title load and ending cutscene
//        80=Player in-game
Status = byte(0x1cf2)
InGame = byte(0x1cf2) == 0x80
PlayerState = byte(0x1cf2)
// $1CF3: [8-bit] Sound Test cursor position; 0x01 when main menu is initiated. Demo mode doesn't seem to be able to start after this happens
// $1CF8: [8-bit] Current ball color
//        0x00 - Default (1x)
//        0x01 - Blue (2x); perfect any bonus
//        0x02 - Purple (3x); defeat the splitting demon
//        0x03 - Red (4x); enter the lantern in the middle table
BallColor = byte(0x1cf8)
Blue = 1
Purple = 2
Red = 3
// $1D40: [8-bit] Red chip total
//        - Counts up by 0x01 for every enemy killed until it reaches 0x10 where it resets to 0x00 and adds a green orb at 0x1d42
//        - Acts as a multiplier when redeeming bonus points
RedChips = byte(0x1d40)
// $1D42: [8-bit] Top & Bottom - Green orb total (Max: 0x09)
//        - Counts up by 0x01 for every 10 red chips (enemies killed)
//        - Acts as a multiplier when redeeming bonus points
GreenOrb = byte(0x1d42)
// $1D44: [8-bit] Middle - Red orb total (Max: 0x09); considered the main "multiplier"
//        - Counts up by 0x01 for every 4 enemies killed in the middle, full set of enemies killed on the top, or when the right-hand purple monsters are killed on the bottom
//        - Acts as a multiplier when redeeming bonus points
RedOrb = byte(0x1d44)
// $1D46: [8-bit BCD] B.P. (Bonus Points)
//        - Ones and Tens place are always 0 on the in-game display; multiply by 100 to get the true value
//        - Acts as a multiplier when redeeming bonus points
BP = bcd(byte(0x1d46))
// $1D48: [8-bit] Lower Table - Goblin; bit is on while the imp is alive
//        - Bit0 ~ Bit2 each represents a different goblin
//        - Tower "ball saver" spawns between the lower flippers once all goblins are defeated
Goblins = bitcount(0x1d48)
// $1D4A: [8-bit] Lower Table - Slimes; bit is on while the slime is alive
//        - Bit0 ~ Bit1 each represents a different slime
//        - Bonus point redemption area opens when both of these are defeated
Slimes = bitcount(0x1d4a)
// $1D4C: [8-bit] Upper Table - Frogs; bit is on while the frog is alive
//        Bit0 ~ Bit7 each represents a different frog
Frogs = bitcount(0x1d4c)
// $1D52: [8-bit] Left outlane guard active (leads to drain)
LeftGuard = bit0(0x1d52)
// $1D54: [8-bit] Right outlane guard active (leads to drain)
RightGuard = bit0(0x1d54)
// $1D56: [8-bit] Middle Table - Flames on the left; bit is on while the flame is active
//        - Bit0 ~ Bit4 each represents a different flame
//        - Opens gate to the plunger once all flames are extinguished
Flames = bitcount(0x1d56)
// $1D5A: [8-bit] Upper Table - Demon head to Face Demon Bonus (left demon destroyed)
//        Bit0 - Open
FaceEntrance = bit0(0x1d5a)
// $1D66: [8-bit] Middle Table - Demons; bit is on while the demon is alive
//        - Bit0 ~ Bit3 each represents a different demon
//        - Each set of demons defeated will move the lantern to the next state
LanternDemons = bitcount(0x1d66)
// $1D6C: [8-bit] Demon Head
//        Bit0 - Fully formed; ready for the ball to enter (starting on the lower table)
//        Bit1 - Moved to the top table; ready for multiball (changes to 0x00 after multiball is achieved)
DemonHead = bit0(0x1d6c)
MultiBallReady = bit1(0x1d6c)
// $1D70: [8-bit] Tower "ball saver" status
//        Bit0 - Active
TowerSaver = bit0(0x1d70)
// $1D72: [8-bit] Riding elevator status
//        Bit0 - Riding elevator to a bonus / Playing aforementioned bonus
RidingElevator = bit0(0x1d72) == 1
// $1D74: [Lower4] Elevator Bonus (use with 0x1d72)
//        --- When player is on the main table ---
//        Bit0 - Elevator Bonus available (protective demon is defeated)
//        
//        --- When player activates the elevator and is transferred to a bonus ---
//        0x0 - Twin Fire Demon Bonus
//        0x1 - Ice Demon Bonus
//        0x2 - Demon Wheel Bonus
//        0x3 - Thunder Demon Bonus
//        0x4 - Face Demon Bonus
//        0x5 - Four Gods Bonus
ElevatorBonus = low4(0x1d74)
EFire = 0
EIce = 1
EWheel = 2
EThunder = 3
EFace = 4
EGods = 5
// $1D78: [8-bit] Lower Table - Gate to re-enter plunger
//        Bit0 - Open
PlungerGate = bit0(0x1d78)
// $1D7C: [8-bit] Upper Table - Horse spirit hand
//        - If the fog is active (0x1d7e) the player will enter a bonus redemption screen when shooting the ball into the hand. If the fog is not active, activates the fog instead
//        Bit0 - Open
// $1D7E: [8-bit] Upper Table - Fog status
//        Bit0 - Active
Fog = bit0(0x1d7e) == 1
// $1D82: [8-bit] Middle Table - Split demons; bit is on when the demon is alive
//        - Bit0 ~ Bit3 each represents a different split demon
//        - Value is 0x00 until the big demon that splits is defeated, all 4 bits flip once this happens
//        - Turns the ball purple (x3 points) once all 4 split demons are defeated
SplitDemons = bitcount(0x1d82)
// $1D84: [8-bit] Spiders on the left; bit is on while the spider is alive
//        Bit0 - Top
//        Bit1 - 2nd from top
//        Bit2 - 2nd from bottom
//        Bit3 - Bottom
//        Bit7 - "Orange"; if this is flipped the spiders knock the ball away when it comes in contact
Spiders = bit0(0x1d84) + bit1(0x1d84) + bit2(0x1d84) + bit3(0x1d84)
// $1D86: [8-bit] Middtle Table - Lantern progresses to the next "state" every time this flips to 0x01
// $1D94: [8-bit] Lower Table - Bumper formation; flips up through formations in order, changes back to 0x00 after 0x03
//        0x00 - None / Basic Triangle (first)
//        0x01 - Line
//        0x02 - Right Triangle 1
//        0x03 - Right Triangle 2
BumperFormation = byte(0x1d94) //there are 4 formations from 0x00~0x03
// $1D9D: [8-bit] Middle Table - Right oni head to Thunder Demon Bonus
//        Bit0 - Open
ThunderEntrance = bit0(0x1d90) == 1
// $1DA0: [8-bit] Lower Table - Upper dragon head to Fire Demon Bonus
//        Bit0 - Open
FireEntrance = bit0(0x1da0) == 1
// $1DA1: [8-bit] Lower Table - Lower dragon head to Ice Demon Bonus
//        Bit0 - Open
IceEntrance = bit0(0x1da1) == 1
// $1DAE: [8-bit] Lower Table - Number of bats alive that were released from the left bumper
//        - Value starts at 0x00 until the first bats spawn from this bumper
//        - 0x04 spawn and a bonus is awarded if all 4 are defeated before they fly off of the screen
//        - Value persists at the number of bats that flew away and resets back to 0x04 the next time they spawn
LeftBats = byte(0x1dae)
// $1DAF: [8-bit] Lower Table - Number of bats alive that were released from the right bumper
//        - Value starts at 0x00 until the first bats spawn from this bumper
//        - 0x04 spawn and a bonus is awarded if all 4 are defeated before they fly off of the screen
//        - Value persists at the number of bats that flew away and resets back to 0x04 the next time they spawn
RightBats = byte(0x1daf)
// $1DB4: [8-bit] Upper Table - Left Devil Cave
//        Bit0 - Spawning frogs; arm open and able to enter
//        Bit1 - Closed
// $1DB5: [8-bit] Upper Table - Right Devil Cave; used for 80m bonus
//        Bit0 - Spawning frogs; arm open and able to enter
//        Bit1 - Closed
PerfectRP = measured(tally(6,
                once(prior(Screen) == FireBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 2000000),
                once(prior(Screen) == IceBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 5000000),
                once(prior(Screen) == WheelBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 10000000),
                once(prior(Screen) == ThunderBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 2000000),
                once(prior(Screen) == FaceBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 3000000),
                once(prior(Screen) == GodsBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 4000000)))

ExploitExempt = XPos != 0x70 && YPos != 0x1bd
ExploitExemptMulti = MultiXPos != 0x70 && MultiYPos != 0x1bd && MultiXPos != 0x76 && MultiYPos != 0x280

Exploit = !Paused && ExploitExempt && YPos >= 0x181 && YPos <= 0x286 && XPos >= 0x67 && XPos <= 0xb7 && Screen == MainTable
ExploitMulti = !Paused && ExploitExemptMulti && MultiYPos >= 0x181 && MultiYPos <= 0x286 && MultiXPos >= 0x67 && MultiXPos <= 0xb7 && Screen == MainTable
ExploitReset = YPos < 0x181 || YPos > 0x286 || XPos < 0x67 || XPos > 0xb7
ExploitResetMulti = MultiYPos < 0x181 || MultiYPos > 0x286 || MultiXPos < 0x67 || MultiXPos > 0xb7
//GeneralProtection = InGame && !MENERABU && once(InGame && P1Balls == 2 && P1Score == 0) && never(TitleScreen) && !BALLUGOK && never(BALLUGOKActive)
//BonusProtection = InGame && once(InGame && P1Balls == 2 && P1Score == 0) && never(TitleScreen) && !BALLUGOK && never(BALLUGOKActive)

//remove && !BALLUGOK && never(BALLUGOKActive) for debug
GeneralProtection = InGame && !MENERABU && once(InGame && P1Balls == 2 && P1Score == 0) && never(TitleScreen) && !BALLUGOK && never(BALLUGOKActive)
MeasuredProtection = InGame && !MENERABU && once(InGame && P1Balls == 2 && P1Score == 0) && !BALLUGOK && !BALLUGOKActive
BonusProtection = InGame && once(InGame && P1Balls == 2 && P1Score == 0) && never(OnTitleScreen) && !BALLUGOK && never(BALLUGOKActive)
LeaderboardProtection = !MENERABU && once(InGame && P1Balls == 2 && P1Score == 0) && never(TitleScreen) && !BALLUGOK && never(BALLUGOKActive)

//protects against infinite idle scoring setup
ExploitProtection = never(repeated(7200,Exploit && never(ExploitReset))) || never(repeated(7200,ExploitMulti && never(ExploitResetMulti)))
ExploitProtectionLB = never(repeated(7201,Exploit && never(ExploitReset))) && never(repeated(7201,ExploitMulti && never(ExploitResetMulti)))

ExploitLeaderboard = repeated(7200,Exploit && never(ExploitReset)) || repeated(7200,ExploitMulti && never(ExploitResetMulti))

BonusGame = {
    "1fire":{"name":"Fire Demons bonus","screen":2,"entry":"upper dragon mouth","pointsE":5,"pointsP":10,"pointsS":25,"perfect":2000000,"speedrun":6301,
            "titleEnter":"Out of the Fying Pan","titlePerfect":"Flame Perfect", "titleSpeed":"Blazing Speed","destime":"1 minute and 45 seconds"},
    "2ice":{"name":"Ice Demons bonus","screen":3,"entry":"lower dragon mouth","pointsE":5,"pointsP":10,"pointsS":10,"perfect":5000000,"speedrun":5401,
            "titleEnter":"Into the Freezer","titlePerfect":"Ice Job", "titleSpeed":"Flash Frozen","destime":"1 minute and 30 seconds"},
    "3wheel":{"name":"Wheel Demon bonus","screen":4,"entry":"left ogre mouth","pointsE":5,"pointsP":10,"pointsS":25,"perfect":10000000,"speedrun":7201,
            "titleEnter":"The Wheel of Fate Is Turning","titlePerfect":"Smooth Ride", "titleSpeed":"Burning Rubber","destime":"2 minutes"},
    "4thunder":{"name":"Thunder Demon bonus","screen":5,"entry":"right ogre mouth","pointsE":5,"pointsP":5,"pointsS":10,"perfect":2000000,"speedrun":2701,
            "titleEnter":"Calm Before the Storm","titlePerfect":"A Perfect Storm", "titleSpeed":"Quick as Lightning","destime":"45 seconds"},
    "5face":{"name":"Face Demon bonus","screen":6,"entry":"demon mouth","pointsE":5,"pointsP":10,"pointsS":25,"perfect":3000000,"speedrun":8101,
            "titleEnter":"Face Your Fears","titlePerfect":"Ideal Complexion", "titleSpeed":"Rapid Mood Swings","destime":"2 minutes and 15 seconds"},
    "6gods":{"name":"Four Gods bonus","screen":7,"entry":"lantern","pointsE":5,"pointsP":10,"pointsS":25,"perfect":4000000,"speedrun":7201,
            "titleEnter":"Ancient Rites","titlePerfect":"Four Gods, One Ball", "titleSpeed":"Deity Dash","destime":"2 minutes"}
}
ScoreGoals = {
    "5000000":{"title":"Point Crusher","desScore":"5,000,000","scoreTarget":5000000,"points":5},
    "10000000":{"title":"Bat Crusher","desScore":"10,000,000","scoreTarget":10000000,"points":5},
    "25000000":{"title":"Goblin Crusher","desScore":"25,000,000","scoreTarget":25000000,"points":10},
    "50000000":{"title":"Demon Crusher","desScore":"50,000,000","scoreTarget":50000000,"points":10},
    "100000000":{"title":"Ogre Crusher","desScore":"100,000,000","scoreTarget":100000000,"points":50},
//    "200000000":{"title":"points 6","desScore":"200,000,000","scoreTarget":200000000,"points":100}    
}
bonus_array = ["1fire","2ice","3wheel","4thunder","5face","6gods"]
score_array = [5000000,10000000,25000000,50000000,100000000] //took 200m out for now

achievement(
    "Read Me Before You Shoot!","Passwords other than MONOZUKI are disabled for all achievements and leaderboards unless noted otherwise. 
Everything must be done in 1 Player mode. Score achievements and leaderboards will lock if the player idles in an infinite loop for an extended time.",
        0, trigger = InGame && ((prev(Screen) == MainMenu && Screen == MainTable) || (prev(P1Score) != P1Score))
)

function EnterBonus(bonus) {
    achievement(
        title=BonusGame[bonus]["titleEnter"], points = BonusGame[bonus]["pointsE"],
        description="Enter the " + BonusGame[bonus]["name"] + " through the " + BonusGame[bonus]["entry"]+ ".",
        trigger = GeneralProtection && !RidingElevator && prev(Screen) == Loading && Screen == BonusGame[bonus]["screen"]
    )
}
//Enter bonus achievements
for bonus_array in BonusGame
    EnterBonus(bonus_array)

function PerfectBonus(bonus) {
    achievement(
        title=BonusGame[bonus]["titlePerfect"], points = BonusGame[bonus]["pointsP"],
        description="Earn a perfect on the " + BonusGame[bonus]["name"] + ". [Level select OK]",
        trigger = BonusProtection && prior(Screen) == BonusGame[bonus]["screen"] && Screen == PostBonusScreen && prev(BonusPoints) == 0 &&
                BonusPoints == BonusGame[bonus]["perfect"]
    )
}

//Perfect bonus achievements
for bonus_array in BonusGame
    PerfectBonus(bonus_array)
           
//function SpeedBonus(bonus) {
//    achievement(
//        title=BonusGame[bonus]["titleSpeed"], points = BonusGame[bonus]["points"],
//        description="Win the " + BonusGame[bonus]["name"] + " encounter within " + BonusGame[bonus]["destime"] + ".",
//        trigger = BonusProtection && Screen == BonusGame[bonus]["screen"] && prev(BGM) != BonusWin && trigger_when(BGM == BonusWin) &&
//                disable_when(repeated(BonusGame[bonus]["speedrun"], once(prev(Screen) != BonusGame[bonus]["screen"] && Screen == BonusGame[bonus]["screen"])),
//                Screen != BonusGame[bonus]["screen"])
//    )
//}

//function SpeedBonus(bonus) {
//    achievement(
//        title=BonusGame[bonus]["titleSpeed"], points = BonusGame[bonus]["points"],
//        description="Win the " + BonusGame[bonus]["name"] + " encounter within " + BonusGame[bonus]["destime"] + ".",
//        trigger = BonusProtection && Screen == BonusGame[bonus]["screen"] && prev(BGM) != BonusWin && trigger_when(BGM == BonusWin) &&
//                once(prev(Screen) != BonusGame[bonus]["screen"] && Screen == BonusGame[bonus]["screen"]) &&
//                never(repeated(BonusGame[bonus]["speedrun"],Screen == BonusGame[bonus]["screen"]))
//                )
//}

function SpeedBonus(bonus) {
    achievement(
        title=BonusGame[bonus]["titleSpeed"], points = BonusGame[bonus]["pointsS"],
        description="Complete the " + BonusGame[bonus]["name"] + " within " + BonusGame[bonus]["destime"] + ". [Level select OK]",
        trigger = BonusProtection && Screen == BonusGame[bonus]["screen"] && XPos != 0 && prev(BGM) != BonusWin && trigger_when(BGM == BonusWin) &&
                disable_when(repeated(BonusGame[bonus]["speedrun"], BonusEntered == BonusGame[bonus]["screen"] && 
                XPos != 0 && Screen == BonusGame[bonus]["screen"]),
                Screen != BonusGame[bonus]["screen"])
    )
}
//Speedrun achievements
for bonus_array in BonusGame
    SpeedBonus(bonus_array)

achievement(
        title="I'll Take the Stairs", points = 10,
        description="Enter every bonus through its non-elevator entrance in a single game.",
        trigger = never(TitleScreen) && measured(tally(6,
                once(!RidingElevator && prev(Screen) == Loading && Screen == FireBonus),
                once(!RidingElevator && prev(Screen) == Loading && Screen == IceBonus),
                once(!RidingElevator && prev(Screen) == Loading && Screen == WheelBonus),
                once(!RidingElevator && prev(Screen) == Loading && Screen == ThunderBonus),
                once(!RidingElevator && prev(Screen) == Loading && Screen == FaceBonus),
                once(!RidingElevator && prev(Screen) == Loading && Screen == GodsBonus)
                ), MeasuredProtection
        )
)

achievement(
        title="Tower of Terror", points = 10,
        description="Enter every bonus using the elevator in a single game.",
        trigger = never(TitleScreen) && measured(tally(6,
                once(RidingElevator && prev(Screen) == Loading && Screen == FireBonus),
                once(RidingElevator && prev(Screen) == Loading && Screen == IceBonus),
                once(RidingElevator && prev(Screen) == Loading && Screen == WheelBonus),
                once(RidingElevator && prev(Screen) == Loading && Screen == ThunderBonus),
                once(RidingElevator && prev(Screen) == Loading && Screen == FaceBonus),
                once(RidingElevator && prev(Screen) == Loading && Screen == GodsBonus)
                ), MeasuredProtection
        )
)  

achievement(
        title="Total Victory", points = 25,
        description="Earn a perfect on every bonus in a single game.",
        trigger = never(TitleScreen) && measured(tally(6,
                once(prior(Screen) == FireBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 2000000),
                once(prior(Screen) == IceBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 5000000),
                once(prior(Screen) == WheelBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 10000000),
                once(prior(Screen) == ThunderBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 2000000),
                once(prior(Screen) == FaceBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 3000000),
                once(prior(Screen) == GodsBonus && Screen == PostBonusScreen && prev(BonusPoints) == 0 && BonusPoints == 4000000)
                ), MeasuredProtection
        )
)    

achievement(
        title="CRUSHEND", points=2,
        description="Have 999,999,900 points and watch the ending. [Password OK]",
        trigger = Status == 0 && P1Score == 999999900 && prev(Screen) == MainTable && Screen == Ending
)

achievement(
        title="Full Protection", points=4,
        description="Activate the shrine and both gutter guards on the bottom screen.",
        trigger = GeneralProtection && prev(LeftGuard + TowerSaver + RightGuard) == 2 && LeftGuard + TowerSaver + RightGuard == 3
)

achievement(
        title="Live to Shoot Another Day", points=3,
        description="Enter the shooting lane again after opening it up by collecting the flames in the outer left lane.",
        trigger = GeneralProtection && prev(PlungerGate) == 1 && PlungerGate == 0 && XPos != 0 && prior(XPos) != 0 && prior(XPos) != 0x76
)
achievement(
        title="Anger Management", points=5,
        description="Anger the demon's head on the lower table area and enter it to make the pop bumpers appear.",
        trigger = GeneralProtection && DemonHead == 1 && prev(MultiBallReady) == 0 && MultiBallReady == 1
)
achievement(
        title="Rescue Mission", points=5,
        description="Enter the demon mouth after the angry demon's head moves to the upper table area and free the multiball.",
        trigger = GeneralProtection && prev(MultiBallReady) == 1 && MultiBallReady == 0 && MultiXPos != 0
)
achievement(
        title="Consider Therapy", points=10,
        description="Anger the demon's head on the bottom of the screen for a third time and enter its final form.",
        trigger = GeneralProtection && repeated(3,DemonHead == 1 && prev(MultiBallReady) == 0 && MultiBallReady == 1)
)
achievement(
        title="Delta Formation", points=5,
        description="Cycle through all of the pop bumper configurations using a single ball.",
        trigger = GeneralProtection && repeated(3, prev(BumperFormation) != BumperFormation) && never(P1Balls < prev(P1Balls))
)
achievement(
        title="Divide and Conquer", points=5,
        description="Defeat the splitting demon and turn the ball purple.",
        trigger = GeneralProtection && prev(BallColor) != Purple && BallColor == Purple
)
achievement(
        title="Seeing Red", points=5,
        description="Enter the lantern on the middle table area and turn the ball red.",
        trigger = GeneralProtection && prev(BallColor) != Red && BallColor == Red
)
achievement(
        title="Flippin' Out", points=10,
        description="Have an extra set of flippers active in a bonus by entering with 51 or more red chips.",
        trigger = GeneralProtection && GreenOrb >= 5 && RedOrb + GreenOrb >= 6 && prev(Screen) == Loading && Screen >= 2 && Screen <= 7
)
achievement(
        title="Batricide", points=3,
        description="Defeat all 4 bats that release from a single broken bumper and earn bonus points.",
        trigger = GeneralProtection && ((prev(LeftBats) == 1 && LeftBats == 0) || (prev(RightBats) == 1 && RightBats == 0))
)
achievement(
        title="Tour de Force", points=5,
        description="Defeat every slime, lantern demon, and frog at least once in a single game.",
        trigger = GeneralProtection && tally(3,
                once(prev(Slimes) == 1 && Slimes == 0),
                once(prev(LanternDemons) == 1 && LanternDemons == 0),
                once(prev(Frogs) == 1 && Frogs == 0)
        )
)
achievement(
        title="To the Nines", points=10,
        description="Reach a x9 bonus multiplier. This is shown on the middle table area.",
        trigger = GeneralProtection && __ornext(prev(RedOrb) == 7 || prev(RedOrb) == 8) && RedOrb == 9
)
achievement(
        title="Big Money", points=25,
        description="Earn 4,000,000 or more points from a single bonus point redemption.",
        trigger = GeneralProtection && Screen == BonusPointsScreen && prev(BonusPoints) != BonusPoints && BonusPoints >= 4000000
)
achievement(
        title="Killing Spree", points=10,
        description="Collect 99 red chips and earn an extra ball.",
        trigger = GeneralProtection && GreenOrb == 9 && prev(RedChips) == 8 && RedChips == 9
)

achievement(
        title="Buddy System", points=10,
        description="Enter a bonus point redemption area while multiball is active for an extra ball.",
        trigger = GeneralProtection && P1Balls > prev(P1Balls) && __ornext(LowerGateBallIn || UpperGateBallIn)
)
achievement(
        title="Cave of Life", points=10,
        description="Enter the cave on the middle table area while the ball is red for an extra ball.",
        trigger = GeneralProtection && ExtraBallMid
)

achievement(
        title="Back from the Grave", points=5,
        description="Match the numbers during last chance to earn an extra ball.",
        trigger = GeneralProtection && prior(Screen) == LastChance && Screen == MainTable && P1BallsLastChance && P1Balls == 0
)
achievement(
        title="More than Meets the Eye", points=25,
        description="Have 10 extra balls at once.",
        trigger = GeneralProtection && prev(P1Balls) == 9 && P1Balls == 10
)

//removed BallLocked from the next 4 achievements
achievement(
        title="Spider Sniper", points=5,
        description="Kill all of the spider demons on the first launch before scoring anything to earn a special point.",
        trigger = GeneralProtection && BonusPoints == P1Score && prev(BonusPoints) != 500000 && BonusPoints == 500000
)
achievement(
        title="Horse Power", points=10,
        description="Lock the ball into the horse statue while the elevator is open to earn a special point.",
        trigger = GeneralProtection && BonusPoints == P1Score && prev(BonusPoints) != 1000000 && BonusPoints == 1000000
)
achievement(
        title="A Special Friend", points=25,
        description="Enter the dragon head that leads to the Ice Demons bonus while both having 5 green orbs and leaving bottom goblin alive to earn a special point.",
        trigger = GeneralProtection && BonusPoints == P1Score && prev(BonusPoints) != 10000000 && BonusPoints == 10000000
)
achievement(
        title="Stars Aligned", points=100,
        description="Enter the small cave on the right of the upper table area while having exactly 77 red chips, a x7 multiplier, and leaving a single frog alive to earn a special point.",
        trigger = GeneralProtection && BonusPoints == P1Score && prev(BonusPoints) != 80000000 && BonusPoints == 80000000
)
achievement(
        title="Seven Million Samurai", points=5,
        description="Score 7,000,000 points with the MONOZUKI cheat active.",
        trigger = GeneralProtection && ExploitProtection && MONOZUKI == 1 && prev(P1Score) < 7000000 && trigger_when(P1Score >= 7000000)
)
achievement(
        title="First Try", points=10,
        description="Score 10,000,000 points with your first ball.",
        trigger = GeneralProtection && ExploitProtection && prev(P1Score) < 10000000 && trigger_when(P1Score >= 10000000) && never(prev(P1Balls) > P1Balls)
)
achievement(
        title="Steady Hands", points=10,
        description="Score 10,000,000 points without shaking the table.",
        trigger = GeneralProtection && ExploitProtection && prev(P1Score) < 10000000 && trigger_when(P1Score >= 10000000) && never(Tilt) && never(P1BallsGameOver && Screen == Leaderboard)
)

function ScoreTarget(score) {
    achievement(
        title=ScoreGoals[score]["title"], points=ScoreGoals[score]["points"],
        description="Score " + ScoreGoals[score]["desScore"] + " points on any speed.",
        trigger = GeneralProtection && ExploitProtection && prev(P1Score) < ScoreGoals[score]["scoreTarget"] && P1Score >= ScoreGoals[score]["scoreTarget"]
    )
}

//Unrestricted score achievements
for score_array in ScoreGoals
    ScoreTarget(score_array)
    
achievement(
        title="Swift Demon Crusher", points=25,
        description="Score 50,000,000 points on high speed.",
        trigger = GeneralProtection && ExploitProtection && never(Speed == Low) && prev(P1Score) < 50000000 && trigger_when(P1Score >= 50000000)
)
achievement(
        title="Jaki Crusher", points=100,
        description="Score 200,000,000 points on any speed.",
        trigger = GeneralProtection && ExploitProtection && prev(P1Score) < 200000000 && trigger_when(P1Score >= 200000000)
)

//Leaderboards    
leaderboard(
        title="Point Crusher [High]",
        description="Score as many points as you can on high speed.",
        start=LeaderboardProtection && ExploitProtectionLB && ((P1BallsGameOver && prev(Screen) != Leaderboard && Screen == Leaderboard) || ExploitLeaderboard) && Speed == High,
        cancel=always_false(),
        submit=always_true(),
        value=P1Score, 
        format="VALUE", lower_is_better= false
)
leaderboard(
        title="Point Crusher [Low]",
        description="Score as many points as you can on low speed.",
        start=LeaderboardProtection && ExploitProtectionLB && ((P1BallsGameOver && prev(Screen) != Leaderboard && Screen == Leaderboard) || ExploitLeaderboard) && Speed == Low,
        cancel=always_false(),
        submit=always_true(),
        value=P1Score, 
        format="VALUE", lower_is_better= false
)       
leaderboard(
        title="First Try [High]",
        description="Score as many points as you can with your first ball on high speed.",
        start=GeneralProtection && ExploitProtectionLB && (prev(P1Balls) > P1Balls || ExploitLeaderboard) && 
                never(prior(P1Balls) > prev(P1Balls) && !P1BallsGameOverLB) && Speed == High,
        cancel=always_false(),
        submit=always_true(),
        value=P1Score, 
        format="VALUE", lower_is_better= false
)
leaderboard(
        title="First Try [Low]",
        description="Score as many points as you can with your first ball on low speed.",
        start=GeneralProtection && ExploitProtectionLB && (prev(P1Balls) > P1Balls || ExploitLeaderboard) && 
                never(prior(P1Balls) > prev(P1Balls) && !P1BallsGameOverLB) && Speed == Low,
        cancel=always_false(),
        submit=always_true(),
        value=P1Score, 
        format="VALUE", lower_is_better= false
)

function SpeedBonusLeaderboard(bonus) {
    leaderboard(
        title=BonusGame[bonus]["titleSpeed"],
        description="Complete the " + BonusGame[bonus]["name"] + " as fast as you can.",
        start= InGame && Screen == BonusGame[bonus]["screen"] && XPos != 0 ,
        cancel= __ornext(Screen != BonusGame[bonus]["screen"] || BALLUGOK || BALLUGOKActive),
        submit= prev(BGM) != BonusWin && BGM == BonusWin,
        value=always_true(),
        format="FRAMES", lower_is_better=true
    )
}        
leaderboard(
        title="RetroOlympics 2023 - Point Crusher [High]",
        description="Score as many points as you can on high speed. Auto-submits after 7 minutes.",
        start=LeaderboardProtection && Speed == High,
        cancel=TitleScreen,
        submit=((P1BallsGameOver && prev(Screen) != Leaderboard && Screen == Leaderboard) || repeated(25200, always_true())) && never(TitleScreen),
        value=P1Score, 
        format="VALUE", lower_is_better= false
)
leaderboard(
        title="RetroOlympics 2023 - Time Tracker",
        description="This is simply a time tracker for the RetroOlympics competition.",
        start=LeaderboardProtection && Speed == High,
        cancel=((P1BallsGameOver && prev(Screen) != Leaderboard && Screen == Leaderboard) || repeated(25200, always_true())) && never(TitleScreen),
        value=always_true(),
        submit=always_false(), 
        format="FRAMES", lower_is_better= false
)
//Speedrun leaderboards
for bonus_array in BonusGame
    SpeedBonusLeaderboard(bonus_array) 
        
//Exploit detection leaderboard
leaderboard(
        title="SCORE ACHIEVEMENTS DISABLED, PLEASE RESTART",
        description="This leaderboard triggers if a player sits in the idle point loop for too long.",
        start=LeaderboardProtection && ExploitProtectionLB && ExploitLeaderboard,
        cancel=always_false(),
        submit=always_true(),
        value=P1Score, 
        format="VALUE", lower_is_better= false
)
//Rich Presence
rich_presence_conditional_display(InGame && never(OnTitleScreen) && __ornext(BALLUGOK || once(BALLUGOKActive)), "Exploring the table with cheats enabled")
rich_presence_conditional_display(OnTitleScreen, "Player is on the title screen")
rich_presence_conditional_display(Screen == Ending, "Player is watching the ending")
rich_presence_conditional_display(GeneralProtection && ExploitProtection && Screen == Leaderboard && P1BallsGameOver, "Submitting a high score • Score: {0}",
        rich_presence_value("Digit",P1Score, format="VALUE")
)
rich_presence_conditional_display(GeneralProtection && ExploitProtection && Screen == LastChance && P1BallsGameOver, "{0}{1} • Score: {2} • Extra Balls: 0 • Perfect Bonus: {3}/6",
        rich_presence_lookup("Screen", Screen, ScreenRP),
        rich_presence_lookup("MONOZUKI", MONOZUKI, MONOZUKIRP),
        rich_presence_value("Digit",P1Score, format="VALUE"),
        rich_presence_value("Digit",PerfectRP, format="VALUE")
)
rich_presence_conditional_display(Status >=1 && Status <= 7 && Screen == MainTable, "Player is watching the demo play")
rich_presence_conditional_display(MENERABU && BonusProtection && LevelSelect >= 2, "Practicing the {0} stage",
        rich_presence_lookup("Screen", Screen, ScreenRP)
)
rich_presence_conditional_display(GeneralProtection && ExploitProtection && Screen <= 7 && P1BallsGameOver, "Flipping around the {0}{1}{5} • Score: {2} • Extra Balls: 0 • Perfect Bonus: {4}/6",
        rich_presence_lookup("Screen", Screen, ScreenRP),
        rich_presence_lookup("MONOZUKI", MONOZUKI, MONOZUKIRP),
        rich_presence_value("Digit",P1Score, format="VALUE"),
        rich_presence_value("Digit",P1Balls, format="VALUE"),
        rich_presence_value("Digit",PerfectRP, format="VALUE"),
        rich_presence_lookup("Multiball", FaceStatus, MultiballRP)
)
rich_presence_conditional_display(GeneralProtection && ExploitProtection && Screen <= 7, "Flipping around the {0}{1}{5} • Score: {2} • Extra Balls: {3} • Perfect Bonus: {4}/6",
        rich_presence_lookup("Screen", Screen, ScreenRP),
        rich_presence_lookup("MONOZUKI", MONOZUKI, MONOZUKIRP),
        rich_presence_value("Digit",P1Score, format="VALUE"),
        rich_presence_value("Digit",P1Balls, format="VALUE"),
        rich_presence_value("Digit",PerfectRP, format="VALUE"),
        rich_presence_lookup("Multiball", FaceStatus, MultiballRP)
)
rich_presence_conditional_display(GeneralProtection && ExploitProtection, "{0}{1}{5} • Score: {2} • Extra Balls: {3} • Perfect Bonus: {4}/6",
        rich_presence_lookup("Screen", Screen, ScreenRP),
        rich_presence_lookup("MONOZUKI", MONOZUKI, MONOZUKIRP),
        rich_presence_value("Digit",P1Score, format="VALUE"),
        rich_presence_value("Digit",P1Balls, format="VALUE"),
        rich_presence_value("Digit",PerfectRP, format="VALUE"),
        rich_presence_lookup("Multiball", FaceStatus, MultiballRP)
)
rich_presence_conditional_display(InGame, "Playing around with score or all achievements disabled")
rich_presence_display("Loading")