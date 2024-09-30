// Sonic Mega Collection Plus
// #ID = 20255

// $308BDA: [8-bit] FF = Level Select Code Entered
// $45269C: Player 1 Buttons Held This Frame (Inverted) [8-bit flags]
//          bit0: Select
//          bit1: L3
//          bit2: R3
//          bit3: Start
//          bit4: Up
//          bit5: Right
//          bit6: Down
//          bit7: Left
// $45269D: Player 1 Buttons Held This Frame Part 2 (Inverted) [8-bit flags]
//          bit0: L2
//          bit1: R2
//          bit2: L1
//          bit3: R1
//          bit4: Triangle
//          bit5: Circle
//          bit6: X
//          bit7: Square
// $45269E: Right Analogue Stick [16-bit]
// $4526A0: Left Analogue Stick [16-bit]

// $8EC800: start of mean bean
// $8EC895: [Sonic Drift] [8-bits]
//          Pause = 0x80
// $8EC900: [Sonic Drift] [8-bits]
//          Current Course
//          0x00 = Green Hill
//          0x01 = Marble
//          0x02 = Spring Yard
//          0x03 = Labyrinth
//          0x04 = Star Light
//          0x05 = Scrap Brain
// $8EC954: (Sonic Labyrinth)
//          00 = normal stage
//          01 = pre-boss slide
//          02 = boss batle
// $8EC955: (Sonic Labyrinth)
//          stage
//          0 = Labyrinth of the Sky 1
//          1 = Labyrinth of the Sky 2
//          17 = demo
//          18 = time attack
// $8EC956: (Sonic Labyrinth)
//          06 = stage completed
//          1a = all keys collected
//          ff = being teleported
// $8EC958: [16-bit]
//          (Sonic Labyrinth)
//          level type value
//          (this is actually 2 8-bit values, but using it as a 16-bit value is easier)
//          ca13 = normal level
//          ca0e = pre-boss slide
//          000e = boss level

// $8ECB05: [Mean Bean Machine (GG)]
//          [8-bit] Password cursor
// $8ECB4A: [Sonic Drift] [8-bit] Race Time Seconds ~ Sutarion
//          [Mean Bean Machine (GG)]
//          [8-bit] Bean orientation in Puzzle mode
//          0x00 - 0 degrees (vertical)
//          0x01 - 90 degrees (horizontal)
//          0x02 - 180 degrees (vertical)
// $8ECB6A: [Mean Bean Machine (GG)]
//          [8-bit] Bean orientation in Exercise mode
//          0x00 - 0 degrees (vertical)
//          0x01 - 90 degrees (horizontal)
//          0x02 - 180 degrees (vertical)
//          0x03 - 270 degrees (horizontal)
// $8ECBEA: [Mean Bean Machine (GG)]
//          [8-bit] Bean orientation in Scenario mode
//          0x00 - 0 degrees (vertical)
//          0x01 - 90 degrees (horizontal)
//          0x02 - 180 degrees (vertical)
// $8ECD00: (Sonic Labyrinth)
//          frames until the next second counts down
// $8ECD01: (Sonic Labyrinth)
//          seconds remaining (second digit)
// $8ECD02: (Sonic Labyrinth)
//          seconds remaining (first digit)
// $8ECD03: (Sonic Labyrinth)
//          minutes remaining
// $8ECD04: (Sonic Labyrinth)
//          bit 0 - middle key collected
//          bit 1 - leftmost key collected
//          bit 2 - rightmost key collected
// $8ECD06: (sonic labyrinth)
//          lives remaining
// $8ECD0D: (Sonic Labyrinth)
//          control scheme
//          0 = straight
//          1 = slant
// $8ECD24: (Sonic Labyrinth)
//          +1 when the player enters the bonus stage
//          +2 when the player gets a good time on 4-2
//          get both to get the good ending
// $8ECD26: (Sonic Labyrinth) 14 = level select cheat enabled
// $8ECD27: (Sonic Labyrinth)
//          counts up by 1 when the player presses a successful input for the level select cheat. when it hits 0x14,  the cheat is input correctly and 0x8ecd26 also turns to 14
//          when the game quits to the menu, this is 80
// $8ECD40: [16-bit]
//          (Sonic Labyrinth)
//          frame timer for how long player has been in stage
// $8ECD42: [16-bit] total game time in frames - every time the player finishes a stage, the value of 0x8ecd40 is added to this value, and 0x8ecd40 is reset to zero
// $8ED14B: [Mean Bean Machine (GG)]
//          [8-bit] Pause status
//          Bit0 - Paused
// $8ED496: [Mean Bean Machine (GG)]
//          [16-bit] Number of beans freed
// $8ED4C0: [Mean Bean Machine (GG)]
//          [32-bit] Player Score
// $8ED919: [8 Bit] [Sonic Blast] States
//          
//          0x0d: Special Stage
//          0x19: Character Select
//          0x3a: Title Screen
// $8ED923: [8 Bit] [Sonic Blast] Demo
//          
//          0x01: Demo Playing
// $8ED92C: [8 Bit] [Sonic Blast] Zone
//          
//          0x00: Green Hill
//          0x01: Yellow Desert
//          0x02: Red Volcano
//          0x03: Blue Marine
//          0x04: Silver Castle
// $8ED92D: [8 Bit] [Sonic Blast] Act
//          
//          3 acts per zone (0x00-0x02)
// $8ED92E: [8 Bit] Level ID
//          
//          0x00: Green Hill Act 1
//          0x01: Green Hill Act 2
//          0x02: Green Hill Act 3
//          0x03: Yellow Desert Act 1
//          0x04: Yellow Desert Act 2
//          0x05: Yellow Desert Act 3
//          0x06: Red Volcano Act 1
//          0x07: Red Volcano Act 2
//          0x08: Red Volcano Act 3
//          0x09: Blue Marine Act 1
//          0x0a: Blue Marine Act 2
//          0x0b: Blue Marine Act 3
//          0x0c: Silver Castle Act 1
//          0x0d: Silver Castle Act 2
//          0x0e: Silver Castle Act 3
// $8ED933: [8 Bit] [Sonic Blast] Characters
//          
//          0x00: Sonic
//          0x01: Knuckles
// $8ED940: [8 Bit] [Sonic Blast] Cheats
//          
//          0xff: Level Select Enable
// $8ED941: [8 Bit] [Sonic Blast] Checkpoint
//          
//          0xff: Checkpoint has been reached
// $8ED971: [8 Bit] [Sonic Blast] Music ID
//          
//          0x8f: Death Music
//          0x91: Special Stage
//          0x95: Special Stage Win
// $8ED972: [Bitflags] [Sonic Blast] Chaos Emerald
//          
//          Bit0: Green
//          Bit1: Yellow
//          Bit2: Red
//          Bit3: Blue
//          Bit4: White
// $8ED973: [Bitflags] [Sonic Blast] Special Stage Cleared?
//          
//          Bit0: Green Hill Zone Act 1 Special Stage
// $8ED978: [8 Bit] [Sonic Blast] Lives
// $8EDA03: [Sonic 1 GG] Buttons Held This Frame (In-Game) (Reverse) [8-bit flags]
//          bit0: Up
//          bit1: Down
//          bit2: Left
//          bit3: Right
//          bit4: Button 1
//          bit5: Button 1...huh? Why two bits?
//          bit6: Button 2
//          bit7: Start
// $8EDA06: [Sonic 1 GG] Player State Data? [8-bit flags]
//          bit5: Shield Active
// $8EDA08: [Sonic 1 GG] Some of Sonic's Other States [8-bit flags]
//          bit1: 0 if in the air, 1 if grounded
// $8EDA0A: [Mean Bean Machine (GG)]
//          [16-bit] Bonus points awarded at the end of a round in Scenario mode
// $8EDA0B: [Sonic 1 GG] Demo Flag [8-bit]
//          0x00: Not Demo
//          0x02: Demo
// $8EDA17: [Sonic 1 GG] Which Ending Bonus? [8-bit]
//          0x00: Chaos Emeralds
//          0x01: Lives
//          0x02: Special
// $8EDA24: [Sonic 1 GG] In-Game Frame Counter [16-bit]
//          ...well, this could be used as a fallback I guess.
// $8EDA36: [Sonic 1 GG] Sonic's finger animation in the title? (and likely other animations) [8-bit]
// $8EDA38: [Sonic 1 GG] Level ID [8-bit]
//          Modifying this value will cause it to trigger on the next life for some reason. Still, helpful for being an impromptu level select dev tool I guess.
//          0x00: Green Hill 1
//          0x01: Green Hill 2
//          0x02: Green Hill 3
//          0x03: Bridge 1
//          0x04: Bridge 2
//          0x05: Bridge 3
//          0x06: Jungle 1
//          0x07: Jungle 2
//          0x08: Jungle 3
//          0x09: Labyrinth 1
//          0x0a: Labyrinth 2
//          0x0b: Labyrinth 3
//          0x0c: Scrap Brain 1
//          0x0d: Scrap Brain 2
//          0x0e: Scrap Brain 3
//          0x0f: Sky Base 1
//          0x10: Sky Base 2
//          0x11: Sky Base 3
//          0x12: Ending Part 1
//          0x13: Ending Part 2
//          0x1c: Special Stage 1
//          0x1d: Special Stage 2
//          0x1e: Special Stage 3
//          0x1f: Special Stage 4
//          0x20: Special Stage 5
//          0x21: Special Stage 6
//          0x22: Special Stage 7
//          0x23: Special Stage 8
// $8EDA40: [Sonic 1 GG] Life Count [8-bit]
//          You get a game over if this hits zero.
// $8EDA4C: [8 Bit] [Sonic Blast] Sonic Death
//          
//          0xff: Dead
// $8EDA54: [Sonic 1 GG] Camera X Position [16-bit]
// $8EDA57: [Sonic 1 GG] Camera Y Position [16-bit]
// $8EDA5E: [16 Bit BCD] [Sonic Blast] Ring Counter
//          It doesn't display the hundred value but its there.
// $8EDA61: [8 Bit] [Sonic Blast] Timer Check
//          
//          0x00: Playing
//          0xff: Finished
// $8EDA79: [Sonic 1 GG] Chaos Emerald Count [8-bit]
//          This goes up by one for each emerald obtained.
// $8EDA7A: [Sonic 1 GG] 1-Up Act Monitor Count [8-bit]
//          This must hit 18 at the end of the game for the max bonus.
//          This only increases for 1-up monitors in the act, not any other form of 1-up.
// $8EDA7B: [Sonic 1 GG] Number of Special Stages Entered [8-bit]
// $8EDA7C: [Sonic 1 GG] Number of Special Stages Completed [8-bit]
// $8EDA7D: [Sonic 1 GG] Did Sonic die at all this run? [8-bit] (Unconfirmed)
//          0x00: No deaths yet.
//          0x01: At least one death.
// $8EDA7E: [Sonic 1 GG] Number of Continues [8-bit]
//          Gain one on finding a special monitor during a special stage. Spend one on game over to continue your game.
// $8EDA99: [Sonic Chaos] [8-bit]
//          Zone
//          0x00 = Turquoise Hill Zone
//          0x01 = Gigapolis Zone
//          0x02 = Sleeping Egg Zone
//          0x03 = Mecha Green Hill Zone
//          0x04 = Aqua Planet Zone
//          0x05 = Electric Egg Zone
//          0x06 = Ending
//          0x07 = Title screen
//          0x08 = Special Stage 1
//          0x09 = Special Stage 2
//          0x0a = Special Stage 3
//          0x0b = Special Stage 4
//          0x0c = Special Stage 5
// $8EDA9A: [Sonic Chaos] [8-bit]
//          Act
// $8EDA9B: [Sonic Chaos] [8-bit BCD]
//          Lives
// $8EDA9C: [Sonic Chaos] [8-bit BCD]
//          Rings
// $8EDAA8: [Sonic Chaos] [16-bit LE BCD]
//          Speed
// $8EDAA9: [Sonic 1 GG] Ring Counter [8-bit BCD]
// $8EDAB6: [Sonic Chaos] [8-bit]
//          Score - 00000X0
// $8EDAB7: [Sonic Chaos] [8-bit]
//          Score - 0000X00
// $8EDAB8: [Sonic Chaos] [8-bit]
//          Score - 000X000
// $8EDAB9: [Sonic Chaos] [8-bit]
//          Score - 00X0000
// $8EDABA: [Sonic Chaos] [8-bit]
//          Score - 0X00000
// $8EDABB: [Sonic 1 GG] Score [32-bit BE BCD]
//          
//          [Sonic Chaos] [8-bit]
//          Score - X000000
// $8EDAC1: [Sonic Chaos] [8-bit BCD]
//          Timer - Seconds
// $8EDAC2: [Sonic Chaos] [8-bit BCD]
//          Timer - Minutes
// $8EDAC4: [Sonic Chaos] [8-bit]
//          Timer - Frames
// $8EDAC5: [Sonic Chaos] [8-bit]
//          Continues
//          Bit7 is on when a continue is used
// $8EDACA: [Sonic Chaos] [8-bit]
//          Character
//          0x01 = Sonic
//          0x02 = Tails
// $8EDACE: [Sonic Chaos] [Bitflags]
//          Chaos Emeralds
// $8EDACF: [Sonic 1 GG] Minutes on Timer [8-bit]
//          As usual, going over 9:59 results in a lost life.
// $8EDAD0: [Sonic 1 GG] Seconds on Timer [8-bit BCD]
//          
//          [Sonic Chaos] [Bitflags]
//          Extra modes
//          Bit0 = Zone Select
//          Bit 1 = Sount Test
// $8EDAD1: [Sonic 1 GG] Frames on Timer (not shown) [8-bit]
// $8EDAD3: [Sonic 1 GG] Music ID [8-bit]
//          0x00: Green Hill Zone
//          0x01: Bridge Zone
//          0x02: Jungle Zone
//          0x03: Labyrinth Zone
//          0x04: Scrap Brain Zone (and most acts of Sky Base)
//          0x05: Sky Base Zone Act 2 (Outside)
//          0x06: Title Screen
//          0x07: Map View
//          0x09: Stage Clear
//          0x0a: Life Lost
//          0x0b: Boss Battle
//          0x0d: Alternate Boss Battle
//          0x0e: Credits
//          0x10: Special Stage Theme
//          0x13: Chaos Emeralds Ending
//          0x14: Collected a Chaos Emerald
//          0xff: ...unknown? Maybe it comes from taking a death?
// $8EDAED: [Sonic 1 GG] Robotnik's Health in Green Hill Zone (Reverse) [8-bit]
//          Start at 0. Bring up to 8 for victory.
// $8EDAFA: [Sonic 1 GG] Special Bonus Value * 10000 [8-bit BCD]
//          You want this to hit 50 during the end score for it to count.
// $8EDB00: [Sonic 1 GG] Death Counter [8-bit]
//          The last special bonus depends on many factors: apparently death count is one of them.
//          This WILL reset on using a continue.
// $8EDB06: [Sonic 1 GG] 1-Up Monitors Collected [8-bit flags]
//          bit0: Green Hill 1
//          bit1: Green Hill 2
// $8EDB0C: [Sonic 1 GG] Chaos Emeralds Collected [8-bit flags]
//          bit1: Green Hill
// $8EDB80: [Sonic 1 GG] Sprite Slot ID [8-bit]
//          0xd4: Jungle Boss Ball (when not exploding to death)
// $8EDB82: [Sonic 1 GG] Sprite Slot ID [8-bit]
// $8EDBFF: [Sonic 1 GG] Sonic's X Position on Stage [16-bit]
//          Useful for positioning challenges like bosses.
// $8EDC01: [Mean Bean Machine (GG)]
//          [8-bit] Game Mode
//          0x00 - Scenario
//          0x01 - Gear 2 Gear
//          0x02 - Exercise
//          0x03 - Puzzle
// $8EDC05: [Mean Bean Machine (GG)]
//          [8-bit] In-game status
//          0x00 - In-game
//          0x01 - On menus
// $8EDC06: [Mean Bean Machine (GG)]
//          [8-bit] Exercise Mode - Starting level
//          b0 - Level 1 (Easy)
//          b1 - Level 3 (Normal)
//          b2 - Level 5 (Hard)
// $8EDC0C: [Mean Bean Machine (GG)]
//          [8-bit] Puzzle Mode - Main Menu / Continue
//          ---Main Menu
//          0x00 - Start
//          0x01 - Continue
//          ---Continue
//          0x00 - Yes
//          0x01 - No
// $8EDC0D: [Mean Bean Machine (GG)]
//          [8-bit] Puzzle Mode - Quit Menu
//          0x00 - Yes
//          0x01 - No
// $8EDC10: [Mean Bean Machine (GG)]
//          [8-bit] Scenario Mode - Current stage
//          0x01 - Arms
//          0x02 - Frankly
//          0x03 - Humpty
//          0x04 - Coconuts
//          0x05 - Davy Sprocket
//          0x06 - Skweel
//          0x07 - Dynamight
//          0x08 - Grounder
//          0x09 - Spike
//          0x0a - Sir Ffuzzy-Logik
//          0x0b - Dragon Breath
//          0x0c - Scratch
//          0x0d - Dr. Robotnik
// $8EDC1F: [Mean Bean Machine (GG)]
//          [8-bit] Number of beans on the player side
// $8EDC21: [Mean Bean Machine (GG)]
//          [8-bit] Number of beans on the opponent side
// $8EDC24: [Mean Bean Machine (GG)]
//          [8-bit] Enemy portrait
//          0x00 - Normal
//          0x01 - Dead
// $8EDC58: [Mean Bean Machine (GG)]
//          [16-bit] Stage timer; seconds
// $8EDC5A: [Mean Bean Machine (GG)]
//          [8-bit] Stage timer; frames
// $8EDCC7: [Mean Bean Machine (GG)]
//          [8-bit] Match status
//          Bit0 - In match
// $8EDF21: [Sonic Drift] [8-bits]
//          Sonic's Current Score Ranking
// $8EDF25: [Sonic Drift] [8-bits]
//          Eggman's Current Score Ranking
// $8EDF29: [Sonic Drift] [8-bits]
//          Tails' Current Score Ranking
// $8EDF2D: [Sonic Drift] [8-bits]
//          Amy's Current Score Ranking
// $8EDF34: [8 Bit] [Sonic Blast] Boss Health
// $8EDF40: [Sonic Drift] [8-bits]
//          Current 1st Place Character
//          0x00 = Sonic
//          0x01 = Eggman
//          0x02 = Tails
//          0x03 = Amy
// $8EDF41: [Sonic Drift] [8-bits]
//          Current 1st Place Score Ranking
// $8EDF44: [Sonic Drift] [8-bits]
//          Current 2nd Place Character
//          0x00 = Sonic
//          0x01 = Eggman
//          0x02 = Tails
//          0x03 = Amy
// $8EDF45: [Sonic Drift] [8-bits]
//          Current 2nd Place Score Ranking
// $8EDF48: [Sonic Drift] [8-bits]
//          Current 3rd Place Character
//          0x00 = Sonic
//          0x01 = Eggman
//          0x02 = Tails
//          0x03 = Amy
// $8EDF49: [Sonic Drift] [8-bits]
//          Current 3rd Place Score Ranking
// $8EDF4C: [Sonic Drift] [8-bits]
//          Current 4th Place Character
//          0x00 = Sonic
//          0x01 = Eggman
//          0x02 = Tails
//          0x03 = Amy
// $8EDF4D: [Sonic Drift] [8-bits]
//          Current 4th Place Score Ranking
// $8EDF66: [Sonic Chaos] [8-bit]
//          Final boss health
// $8EDFA2: [Sonic Drift] Demo Mode [8-bit]
//          0x00 = Off
//          0x01 = On
// $8EDFAE: [Sonic Drift] [8-bits]
//          Current Character
//          0x00 = Sonic
//          0x01 = Eggman
//          0x02 = Tails
//          0x03 = Amy
// $8EE230: [Sonic Drift] [8-bits]
//          Current Mode
//          0x00 = Chaos GP
//          0x01 = Free Run
//          0x03 = Option
// $8EE233: [Sonic Drift] [8-bits]
//          Current Option
//          0x01 = Level
//          0x03 = End
//          0xFF = Sound
// $8EE234: [Sonic Drift] Selected Sound in Options [8-bit]
// $8EE235: [Sonic Drift] [8-bits]
//          Current Level/Difficulty
//          0x00 = Normal
//          0x01 = Hard
// $8EE236: [Sonic Drift] [8-bits]
//          Current GP
//          0x01 = Green
//          0x02 = Yellow
//          0x03 = Red
// $8EE301: acdtual mean beans placed by both side not counting trash
// $8EE30B: [Mean Bean Machine (GG)]
//          [8-bit] Current puzzle; starts at 0x00
// $8EE30C: [Mean Bean Machine (GG)]
//          [8-bit] Puzzle cleared
//          Bit0 flips from 0 > 1 when a puzzle is completed
// $8EE30F: [Mean Bean Machine (GG)]
//          [8-bit] Password entry value 1; 0xff - none
// $8EE310: [Mean Bean Machine (GG)]
//          [8-bit] Password entry value 2; 0xff - none
// $8EE311: [Mean Bean Machine (GG)]
//          [8-bit] Password entry value 3; 0xff - none
// $8EE312: [Mean Bean Machine (GG)]
//          [8-bit] Password entry value 4; 0xff - none
// $8EE314: [Mean Bean Machine (GG)]
//          [8-bit] Level password starts the player at; starts at 0x00
// $8EE469: [Sonic Drift] [8-bits]
//          Final Time Milliseconds [Hex]
// $8EE46A: [Sonic Drift] [8-bits]
//          Final Time Seconds [Hex]
// $8EE46B: [Sonic Drift] [8-bits]
//          Final Time Minutes [Hex]
// $8EE59E: [8 Bit BCD] [Sonic Blast] Special Stage Rings
// $8EE675: [Sonic Drift] Music ID [8-bits]
//          0xf8 = Final GP Results
//          0xf1 = Victory Credits (Red GP only)
//          0xf4 = Main Menu
//          0xe8 = Free Run Results
// $8EE7EF: [Sonic Chaos] [8-bit] Ingame
//          Any value from 0x13-0x18 is ingame
//          0x04 = Title screen
//          0x15 = End of level
// $8EE7FF: end of mean bean

// $1EC6818: [Any Genesis Game] PS2 Pause Menu State [8-bit]
//           0x00: Not Active
//           0x01: Fade In (Unused)
//           0x02: Active
//           0x03: Fade Out
//           0x05: In Sub-Menu
// $1EC6820: [Any Genesis Game] PS2 Pause Menu Option [8-bit] (See options at 0x1ec69e0)
// $1EC6828: [Any Genesis Game] PS2 Pause Menu Option [8-bit] (See options at 0x1ec69e0)
// $1EC69D8: game gear pause menu
//           0x05 - restart or save/load
// $1EC69E0: [Sonic 1 GG, maybe others] PS2 Pause Menu Option [8-bit]
//           0x00: Resume
//           0x01: Game Title
//           0x02: Save Game Data
//           0x03: Load Game Data
//           0x04: Controller Configuration
//           0x05: View Hints
//           0x06: Exit
// $1EC69E8: [Sonic 1 GG, maybe others] PS2 Pause Menu Option [8-bit] (duplicate of 0x1ec69e0)
// $1EC7A8C: PS2 Pause Menu: Mega Drive (8-bit)
//           Load Saves - 0x02
//           Save Select - 0x03
//           Creating Save File - 0x04
//           Loading Save File - 0x05
//           Save File created - 0x06
//           Save File loaded & Memory Card Format Prompt - 0x07
//           Load Prompt - 0x08
//           Formatting - 0x09
//           no load - 0x0c
//           Save Game Exit - 0x10
//           Load Game Exit - 0x11
//           Save File overwrite - 0x12
//           Overwrite done - 0x13
// $1EC7C4C: PS2 Pause Menu: Game Gear (8-bit)
//           Load Saves - 0x02
//           Save Select - 0x03
//           Creating Save File - 0x04
//           Loading Save File - 0x05
//           Save File created - 0x06
//           Save File loaded & Memory Card Format Prompt - 0x07
//           Load Prompt - 0x08
//           Formatting - 0x09
//           no load - 0x0c
//           Save Game Exit - 0x10
//           Load Game Exit - 0x11
//           Save File overwrite - 0x12
//           Overwrite done - 0x13
// $1FDA5F0: [Sonic Mega Collection Plus] [8-bits] (original note by Lewis50248)
//           Screen Indicator
//           0x03 = In a Genesis Game
//           0x04 = In a Game Gear Game
//           0x05 = In a multiplayer Game Gear game (2 instances)
// $1FDA628: [Sonic Mega Collection Plus] [8-bits]
//           Game Indicator
//           0x00 = Sonic the Hedgehog (Genesis)
//           0x01 = Sonic the Hedgehog 2
//           0x02 = Sonic the Hedgehog 3
//           0x03 = Sonic & Knuckles
//           0x04 = Blue Sphere
//           0x05 = Knuckles in Sonic 2
//           0x06 = Sonic 3 & Knuckles
//           0x07 = Sonic 3D Blast
//           0x08 = Sonic Spinball
//           0x09 = Dr. Robotnik's Mean Bean Machine (Genesis)
//           0x0a = Flicky
//           0x0b = Ristar
//           0x0c = The Ooze
//           0x0d = Comix Zone
//           0x0e = Sonic the Hedgehog (Game Gear)
//           0x0f = Sonic Labyrinth
//           0x10 = Sonic Drift
//           0x11 = Sonic Chaos
//           0x12 = Sonic Blast
//           0x13 = Dr. Robotnik's Mean Bean Machine (Game Gear)
