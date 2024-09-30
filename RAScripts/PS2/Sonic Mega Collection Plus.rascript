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
// $8ED14B: [Mean Bean Machine (GG)]
//          [8-bit] Pause status
//          Bit0 - Paused
// $8ED496: [Mean Bean Machine (GG)]
//          [16-bit] Number of beans freed
// $8ED4C0: [Mean Bean Machine (GG)]
//          [32-bit] Player Score
// $8EDA0A: [Mean Bean Machine (GG)]
//          [16-bit] Bonus points awarded at the end of a round in Scenario mode
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
// $8EE7FF: end of mean bean

// $1EC6818: [Any Genesis Game] PS2 Pause Menu State [8-bit]
//           0x00: Not Active
//           0x01: Fade In (Unused)
//           0x02: Active
//           0x03: Fade Out
//           0x05: In Sub-Menu
// $1EC6820: [Any Genesis Game] PS2 Pause Menu Option [8-bit] (See options at 0x1ec69e0)
// $1EC6828: [Any Genesis Game] PS2 Pause Menu Option [8-bit] (See options at 0x1ec69e0)
// $1EC69D8: [Any GG Game] PS2 Pause Menu State [8-bit]
//           0x00: Not Active
//           0x01: Fade In (Unused)
//           0x02: Active
//           0x03: Fade Out
//           0x05: In Sub-Menu
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
