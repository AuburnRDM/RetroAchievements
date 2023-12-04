// ~Hack~ Celeste Mario's Zap & Dash!
// #ID = 25038

// $000E: [8-bit] Player state
//        0x00 - Loading
//        0x03 - Entering a pipe going down
//        0x04 - Entering a pipe going up
//        0x07 - Spawning into stage
//        0x08 - In stage
//        0x0b - Dying
//        0x0d - Screen transition via scroll
//        0x0e - Loading between a screen
//        0x10 - Screen transition via fade
//        0x11 - Using binoculars
//        0x12 - Picking up a power item/super moon/saving
//        0x14 - Scanning with X-Ray
State = byte(0xE)
function InGame() => State != 0x0b && State != 0
function Dead() => State == 0x0b
// $0065: [8-bit] "Page" for Mario's X-position
//        -- Starts at 0x00 and increments by 0x01 every time Mario's X-position from $0x7a rolls over
//        -- Left is lower
PageX = byte(0x65)
// $007A: [8-bit] Mario X-position; lower is left
//        0xa6 - B-Side super moon
MarioX = byte(0x7A)
ThwompX = byte(0x7B)
// $00A4: [8-bit] "Page" for Mario's Y-position
//        -- Starts at 0x00 and increments by 0x01 every time Mario's X-position from $0xb9 rolls over
//        -- Up is lower
PageY = byte(0xA4)
// $00B9: [8-bit] Mario Y-position; lower is higher
//        0x31 - B-Side super moon (give tolerance to 0x40)
MarioY = byte(0xB9)
BSidePosition = MarioX >= 0xA6 && MarioY <= 0x40
// $00E2: [8-bit] Controls
//        b0 - Right
//        b1 - Left
//        b2 - Down
//        b3 - Up
//        b4 - Start
//        b5 - Select
//        b6 - B
//        b7 - A
// $0119: [8-bit] Map/minimap location; does not affect player location
//        - Top left is 0x01, bottom right is 0xff
//        - Cursor moves across a row as the value increases and wraps back around to the start of the next row when it reaches the end
// $0405: some camera stuff
// $0527: [8-bit] Amount of base dashes; it's always 0x01 in this game
BaseDash = byte(0x527)
// $074D: [8-bit] Room ID; use in conjunction with 0x75b to determine overall map
//        -----
//        Map 0x00 - Intro / World 1
//        0x00 - Gloves / Air Dash (previous room 0x02)
//        0x02 - Save #1 (Mountain)
//        0x03 - Mountain deathless start
//        0x08 - Save #2 (Mountain)
//        0x0c - Save #3 (Mountain)
//        0x12 - X-Ray
//        0x14 - Rest stop / end of the mountain deathless
//        0x17 - QR Code
//        0x19 - Before easter egg room
//        0x1a - Save #4 (Mountain)
//        -----
//        Map 0x01 - World 2 (except for 4 W3 rooms)
//        0x00 - Save #1 (Caves) / Start of Caves deathless
//        0x04 - Speedrun challenge
//        0x07 - First multi dash challenge
//        0x08 - Save #3 (Caves)
//        0x09 - Save #2 (Caves)
//        0x0b - 1st room of World 3
//        0x0c - No-checkpoint challenge
//        0x0d - QR Code
//        0x0e - 2nd room of World 3
//        0x0f - Easter egg room
//        0x10 - Random large room of World 3 (Northeast of the +)
//        0x13 - Large room under the start of World 3
//        0x1a - Save #4
//        0x1b - Warp #1 (no save) of World 3
//        0x1d - Spiky challenge
//        -----
//        Map 0x02 - World 3
//        0x06 - QR Code
//        0x07 - Save #1 (warp 2)
//        0x0b - Save #2 (warp 3) / Start of Shadow Mario deathless
//        0x13 - Final chase room
//        0x15 - On the way up to the credits
//        0x14 - Credits area
//        0x16 - Room before challenge hub / Shadow Mario deathless Super Moon
//        0x17 - Challenge hub / Save #3 (Warp 4)
//        -----
//        Map 0x03 - B Sides
//        0x0a - First room
//        0x0e - Start of caves
//        0x11 - Start of final world
//        0x12 - Secret
//        0x13 - Final room
Room = byte(0x74D)
// $075B: [8-bit] Map modifier
//        0x00 - Intro / World 1
//        0x01 - World 2 (except for 4 W3 rooms)
//        0x02 - World 3
//        0x03 - B Sides
Map = byte(0x75b)
Mountain = 0
Cave = 1
Dream = 2
BSide = 3

map = {
    0: "Mountain area",
    1: "Cave area",
    2: "Dream area",
    3: "B-Sides"
}
// $0766: [8-bit] Deathless challenge status
//        0x00 - N/A
//        0x01 - Mountain
//        0x02 = Cave
//        0x03 - Dream
Deathless = byte(0x766)
// $6E50: [8-bit] Number of remaining Moon shards to collect in a room (to obtain a Moon or open a door)
MoonShards = byte(0x6E50)
// $77A3: [8-bit] Seconds left in the speedrun Moon challenge; Map 1, Room 0x04
MoonSeconds = byte(0x77A3)
// $77A4: [8-bit] Frame counter for the speedrun Moon challenge; Map 1, Room 0x04
//        - Ticks down 10 frames when transitioning to the next screen
MoonFrames = byte(0x77A4)
// $7B02: Start of map data
// $7B19: World 3 Save #3 (Warp 4) / Challenge hub
// $7B24: Save #1 on Map 1
// $7B30: World 3 Save #2 (Warp 3)
// $7B63: [8-bit] Save #2 on map 0
// $7B69: World 3 Save #1 (Warp 2)
// $7B7D: Save #4 map 0
// $7B82: Warp #1 (no save) world 3
// $7B87: Save #2 on Map 1
// $7B9C: Save #4 Map 1
// $7BAA: Save #3 on map 0
// $7BF5: Save #3 Map 1
// $7F02: Controls Mario's jump height
// $7F03: [8-bit] Max dash amount; starts at 0x01
// $7F06: [8-bit] Current Coins (thousands and hundreds place)
// $7F07: [8-bit] Current Coins (tens and ones place)
// $7F08: [8-bit] Current max hearts
//        0x02 - 3 hearts (default)
MaxHearts = byte(0x7F08)
function Title() => BaseDash == 0 && MaxHearts == 0
// $7F09: [8-bit] Amount of full hearts remaining;
//        - 1 heart is consumed when a wall jump (jumping off a wall when holding up) is performed or when the grip meter hits 0
//        - The last heart is tied to the remaining grip value (0x7f0a). example: if this value = 0x00 and grip is > 0x00, there is one heart remaining
Hearts = byte(0x7F09)
// $7F0A: [8-bit] Grip meter left until a heart is taken
Grip = byte(0x7F0A)
// $0526: [8-bit] Dashes available
Dash = byte(0x526)
// $7F0D: [8-bit] Progress towards next moon upgrade; unlocks at 0x20
// $7F0E: [8-bit] Total Moons
TotalMoons = byte(0x7F0E)
// $7F16: [8-bit] Switch status
//        0x00 - Off
//        0x03 - On
// $7F1C: [8-bit] Current Deaths (tens and ones place)
// $7F1D: [8-bit] Current Deaths (thousands and hundreds place)
function TotalDeath() => byte(0x7F1C) + (byte(0x7F1D) * 100)
WallGrip = bit1(0x7F2F)
AirDash = bit1(0x7F2A)
XRay = bit1(0x7F23)
// $7F2F: [8-bit] Powerups
//        b1 - Wall Grip
// $7F2A: [8-bit] Powerups
//        b1 - Air Dash

// $7F22: [8-bit] Intro - Moon; Map 0, Room 0x02
//        b4 - Obtained
// $7FC0: [8-bit] Intro - Moon (broken); Map 0, Room 0x00
//        b4 - Obtained
MoonIntro = bit4(0x7F22) + bit4(0x7FC0)
// $7F23: [8-bit] Power and Moon
//        b1 - X-Ray Scope
//        b4 - Mountain - Moon (hidden); Map 0, Room 0x03
// $7F43: [8-bit] Mountain - Moon; Map 0, Room 0x03
//        b4 - Obtained
// $7F24: [8-bit] Mountain - Moon; Map 0, Room 0x04
//        b4 - Obtained
// $7F25: [8-bit] Mountain - Moon; Map 0, Room 0x05
//        b4 - Obtained
// $7F65: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x05
//        b4 - Obtained
// $7F47: [8-bit] Mountain - Moon; Map 0, Room 0x07
//        b4 - Obtained
// $7F27: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x07
//        b4 - Obtained
// $7F29: [8-bit] Mountain - Moon; Map 0, Room 0x09
//        b4 - Obtained
// $7FC9: [8-bit] Mountain - Moon (broken); Map 0, Room 0x0a > 0x09
//        b4 - Obtained
// $7FCB: [8-bit] Mountain - Moon (broken); Map 0, Room 0x0b
//        b4 - Obtained
// $7F2B: [8-bit] Mountain - Moon; Map 0, Room 0x0b
//        b4 - Obtained
// $7F4B: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x0b
//        b4 - Obtained
// $7F4D: [8-bit] Mountain - Moon; Map 0, Room 0x0d
//        b4 - Obtained
// $7F6D: [8-bit] Mountain - Moon; Map 0, Room 0x0d
//        b4 - Obtained
// $7F2D: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x0d
//        b4 - Obtained
// $7F30: [8-bit] Mountain - Moon; Map 0, Room 0x10
//        b4 - Obtained
// $7F31: [8-bit] Mountain - Moon; Map 0, Room 0x11
//        b4 - Obtained
// $7F32: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x12
//        b4 - Obtained
// $7F33: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x13
//        b4 - Obtained
// $7F34: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x14
//        b4 - Obtained
// $7F55: [8-bit] Mountain - Moon; Map 0, Room 0x15
//        b4 - Obtained
// $7F35: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x15
//        b4 - Obtained
// $7FD5: [8-bit] Mountain - Moon (broken); Map 0, Room 0x13 > 0x15
//        b4 - Obtained
// $7F36: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x16
//        b4 - Obtained
// $7F39: [8-bit] Mountain - Moon (hidden); Map 0, Room 0x19
//        b4 - Obtained

MountainMoon1 = bit4(0x7F43)
MountainMoon2 = bit4(0x7F24)
MountainMoon3 = bit4(0x7F25)
MountainMoon4 = bit4(0x7F47)
MountainMoon5 = bit4(0x7F29)
MountainMoon6 = bit4(0x7FC9)
MountainMoon7 = bit4(0x7FCB)
MountainMoon8 = bit4(0x7F2B)
MountainMoon9 = bit4(0x7F4D)
MountainMoon10 = bit4(0x7F6D)
MountainMoon11 = bit4(0x7F30)
MountainMoon12 = bit4(0x7F31)
MountainMoon13 = bit4(0x7F55)
MountainMoon14 = bit4(0x7FD5)
MountainHMoon1 = bit4(0x7F23)
MountainHMoon2 = bit4(0x7F65)
MountainHMoon3 = bit4(0x7F27)
MountainHMoon4 = bit4(0x7F4B)
MountainHMoon5 = bit4(0x7F2D)
MountainHMoon6 = bit4(0x7F32)
MountainHMoon7 = bit4(0x7F33)
MountainHMoon8 = bit4(0x7F34)
MountainHMoon9 = bit4(0x7F35)
MountainHMoon10 = bit4(0x7F36)
MountainHMoon11 = bit4(0x7F39)

SmallMountainMoons = MountainMoon1 + MountainMoon2 + MountainMoon3 + MountainMoon4 + MountainMoon5 + MountainMoon6 + MountainMoon7 + MountainMoon8 + MountainMoon9 + 
                    MountainMoon10 + MountainMoon11 + MountainMoon12 + MountainMoon13 + MountainMoon14 + MountainHMoon1 + MountainHMoon2 + MountainHMoon3 +
                    MountainHMoon4 + MountainHMoon5 + MountainHMoon6 + MountainHMoon7 + MountainHMoon8 + MountainHMoon9 + MountainHMoon10 + MountainHMoon11
                    
// $7F21: [8-bit] Caves - Moon (hidden); Map 1, Room 0x01
//        b4 - Obtained
// $7F41: [8-bit] Caves - Moon; Map 1, Room 0x01
//        b4 - Obtained
// $7F42: [8-bit] Caves - Moon (hidden); Map 1, Room 0x02
//        b4 - Obtained
// $7F62: [8-bit] Caves - Moon (switch challenge); Map 1, Room 0x02
//        b4 - Obtained
// $7F82: [8-bit] Caves - Moon (switch challenge); Map 1, Room 0x02
//        b4 - Obtained
// $7F63: [8-bit] Caves - Moon; Map 1, Room 0x03
//        b4 - Obtained
// $7F67: [8-bit] Caves - Moon; Map 1, Room 0x07
//        b4 - Obtained
// $7F87: [8-bit] Caves - Moon (multidash challenge); Map 1, Room 0x07
//        b4 - Obtained
// $7FA7: [8-bit] Caves - Moon (multidash challenge); Map 1, Room 0x07
//        b4 - Obtained
// $7F54: [8-bit] Caves - Moon (speedrun challenge); Map 1, Room 0x14
//        b4 - Obtained
// $7F74: [8-bit] Caves - Moon (hidden); Map 1, Room 0x014
//        b4 - Obtained
// $7F97: [8-bit] Event flags and Moon
//        b1 - First credits
//        b4 - Caves - Moon (multidash challenge); Map 1, Room 0x17
// $7F77: [8-bit] Caves - Moon (multidash challenge); Map 1, Room 0x17
//        b4 - Obtained
// $7F37: [8-bit] Caves - Moon; Map 1, Room 0x17
//        b4 - Obtained
// $7F38: [8-bit] Caves - Moon; Map 1, Room 0x18
//        b4 - Obtained
// $7F3C: [8-bit] Caves - Moon; Map 1, Room 0x1c
//        b4 - Obtained
// $7F7E: [8-bit] Caves - Moon (Hidden); Map 1, Room 0x1e
//        b4 - Obtained
// $7FDE: [8-bit] Caves - Moon (broken); Map 1, Room 0x1e
//        b4 - Obtained
CaveMoon1 = bit4(0x7F41)
CaveMoon2 = bit4(0x7F62)
CaveMoon3 = bit4(0x7F82)
CaveMoon4 = bit4(0x7F63)
CaveMoon5 = bit4(0x7F67)
CaveMoon6 = bit4(0x7F87)
CaveMoon7 = bit4(0x7FA7)
CaveMoon8 = bit4(0x7F54)
CaveMoon9 = bit4(0x7F97)
CaveMoon10 = bit4(0x7F77)
CaveMoon11 = bit4(0x7F37)
CaveMoon12 = bit4(0x7F38)
CaveMoon13 = bit4(0x7F3C)
CaveMoon14 = bit4(0x7FDE)
CaveHMoon1 = bit4(0x7F21)
CaveHMoon2 = bit4(0x7F42)
CaveHMoon3 = bit4(0x7F74)
CaveHMoon4 = bit4(0x7F7E)

SmallCaveMoons = CaveMoon1 + CaveMoon2 + CaveMoon3 + CaveMoon4 + CaveMoon5 + CaveMoon6 + CaveMoon7 + CaveMoon8 + CaveMoon9 + CaveMoon10 + 
                    CaveMoon11 + CaveMoon12 + CaveMoon13 + CaveMoon14 + CaveHMoon1 + CaveHMoon2 + CaveHMoon3 + CaveHMoon4 
// $7FB5: [8-bit] Caves - Super Moon (no-checkpoint challenge); Map 1, Room 0x15
//        b4 - Obtained
SuperCheckpoint = bit4(0x7fb5)
// $7FD9: [8-bit] Cave - Super Moon; Map 1, Room 0x19
//        b4 - Obtained
SuperBubble = bit4(0x7fd9)

// $7F20: [8-bit] Dream - Moon; Map 2, Room 0x00
//        b4 - Obtained
// $7F61: [8-bit] Dream - Moon; Map 2, Room 0x01
//        b4 - Obtained
// $7F64: [8-bit] Dream - Moon; Map 2, Room 0x04
//        b4 - Obtained
// $7F44: [8-bit] Dream - Moon; Map 2, Room 0x04
//        b4 - Obtained
// $7F84: [8-bit] Dream - Moon; Map 2, Room 0x04
//        b4 - Obtained
// $7FA4: [8-bit] Dream - Moon; Map 2, Room 0x04
//        b4 - Obtained
// $7FC4: [8-bit] Dream - Moon (hidden); Map 2, Room 0x04
//        b4 - Obtained
// $7FC5: [8-bit] Dream - Moon (hidden); Map 2, Room 0x05
//        b4 - Obtained
// $7FA5: [8-bit] Dream - Moon; Map 2, Room 0x05
//        b4 - Obtained
// $7F85: [8-bit] Dream - Moon; Map 2, Room 0x05
//        b4 - Obtained
// $7F45: [8-bit] Dream - Moon; Map 2, Room 0x05
//        b4 - Obtained
// $7F8D: [8-bit] Dream - Moon (hidden); Map 2, Room 0x0d
//        b4 - Obtained
// $7F2E: [8-bit] Dream - Moon; Map 1, Room 0x0e
//        b4 - Obtained
// $7F50: [8-bit] Dream - Moon; Map 1, Room 0x10
//        b4 - Obtained
// $7F90: [8-bit] Dream - Moon (hidden); Map 2, Room 0x10
//        b4 - Obtained
// $7F70: [8-bit] Dream - Moon (hidden); Map 1, Room 0x10
//        b4 - Obtained
// $7F53: [8-bit] Dream - Moon; Map 1, Room 0x13
//        b4 - Obtained
// $7FD3: [8-bit] Dream - Moon (broken); Map 1, Room 0x13
//        b4 - Obtained
DreamMoon1 = bit4(0x7F20)
DreamMoon2 = bit4(0x7F61)
DreamMoon3 = bit4(0x7F64)
DreamMoon4 = bit4(0x7F44)
DreamMoon5 = bit4(0x7F84)
DreamMoon6 = bit4(0x7FA4)
DreamMoon7 = bit4(0x7FA5)
DreamMoon8 = bit4(0x7F85)
DreamMoon9 = bit4(0x7F45)
DreamMoon10 = bit4(0x7F2E)
DreamMoon11 = bit4(0x7F50)
DreamMoon12 = bit4(0x7F53)
DreamMoon13 = bit4(0x7FD3)
DreamHMoon1 = bit4(0x7FC4)
DreamHMoon2 = bit4(0x7FC5)
DreamHMoon3 = bit4(0x7F8D)
DreamHMoon4 = bit4(0x7F90)
DreamHMoon5 = bit4(0x7F70)

SmallDreamMoons = DreamMoon1 + DreamMoon2 + DreamMoon3 + DreamMoon4 + DreamMoon5 + DreamMoon6 + DreamMoon7 + DreamMoon8 + DreamMoon9 + DreamMoon10 + 
                DreamMoon11 + DreamMoon12 + DreamMoon13 + DreamHMoon1 + DreamHMoon2 + DreamHMoon3 + DreamHMoon4 + DreamHMoon5
// $7F4A: [8-bit] Dream - Super Moon (5 moons) (rhythm challenge); Map 2, Room 0x0a
//        b4 - Obtained
// $7FB2: [8-bit] Dream - Super Moon (5 moons) (chase challenge); Map 2, Room 0x12
//        b4 - Obtained

SuperRhythm = bit4(0x7f4a)
SuperChase = bit4(0x7fb2)

function SeventyNineMoons() =>  MoonIntro + SmallMountainMoons + SmallCaveMoons + SmallDreamMoons + SuperCheckpoint + SuperBubble + SuperRhythm + SuperChase
HiddenMoons = MountainHMoon1 + MountainHMoon2 + MountainHMoon3 + MountainHMoon4 + MountainHMoon5 +
             MountainHMoon6 + MountainHMoon7 + MountainHMoon8 + MountainHMoon9+ MountainHMoon10 + MountainHMoon11 +
             CaveHMoon1 + CaveHMoon2 + CaveHMoon3 + CaveHMoon4 + DreamHMoon1 + DreamHMoon2 +
             DreamHMoon3 + DreamHMoon4 + DreamHMoon5 
// $7FDD: [8-bit] Challenge - Spiky challenge Super Moon (3 moons); Map 1, Room 0x1d
//        b4 - Obtained
// $7F94: [8-bit] Challenge - Mountain deathless Super Moon (3 moons); Start Map 0, Room 0x03 ~ End Map 0, Room 0x14
//        b4 - Obtained
// $7F3A: [8-bit] Challenge - Caves deathless Super Moon (5 moons); Start Map 1, Room 0x00 ~ End Map 1, Room 0x1a
//        b4 - Obtained
// $7F56: [8-bit] Challenge - Shadow Mario deathless Super Moon (5 moons); Start Map 2, Room 0x0b ~ End Map 2, Room 0x16
//        b4 - Obtained
// $7F73: [8-bit] Challenge - B-Sides Super Moon (5 moons); Map 3 Room 0x13
//        b4 - Obtained
SuperSpiky = bit4(0x7fdd)
DeathlessMountain = bit4(0x7f94)
DeathlessCave = bit4(0x7f3a)
DeathlessChase = bit4(0x7f56)
SuperBSide = bit4(0x7f73)


// $7F52: [8-bit] Challenge - Secret Moon; Map 3 Room 0x12
//        b4 - Obtained
HokaiMoon = bit4(0x7f52)
// $7F80: [8-bit] Events
//        b1 - First moon obtained and message about power moons shown
//        b7 - Permanent door open in Dream World
DreamDoor = bit7(0x7F80)
// $7F8A: [8-bit] Event
//        b1 -X-Ray Scope tutorial triggered
// $7F91: [8-bit] Event
//        b1 - Air Dash tutorial triggered
// $7F96: [8-bit] Event
//        b1 - Wall Grip tutorial triggered

// $7F98: [8-bit] Event flags
//        b1 - 2nd credits
// $7F9E: [8-bit] Event flag
//        b1 - Final credits scene - THANK YOU FOR PLAYING!
Credits = bit1(0x7F9E)
// $7FF8: [8-bit] Current World
// $7FFA: [8-bit] Currently selected item; mostly unused in this hack since there is no way to change items
//        0x03 - X-Ray Scope

function MapCheckRow1() => sum_of(range(0x7B02,0x7B1D,step=1), addr => byte(addr)/byte(addr))
function MapCheckRow2() => sum_of(range(0x7B22,0x7B3D,step=1), addr => byte(addr)/byte(addr))
function MapCheckRow3() => sum_of(range(0x7B42,0x7B5D,step=1), addr => byte(addr)/byte(addr))
function MapCheckRow4() => sum_of(range(0x7B62,0x7B7D,step=1), addr => byte(addr)/byte(addr))
function MapCheckRow5() => sum_of(range(0x7B82,0x7B9D,step=1), addr => byte(addr)/byte(addr))
function MapCheckRow6() => sum_of(range(0x7BA2,0x7BBD,step=1), addr => byte(addr)/byte(addr))
function MapCheckRow7() => sum_of(range(0x7BC2,0x7BDD,step=1), addr => byte(addr)/byte(addr))
function MapCheckRow8() => sum_of(range(0x7BE2,0x7BFD,step=1), addr => byte(addr)/byte(addr))

function MapCheckFull() => MapCheckRow1() + MapCheckRow2() + MapCheckRow3() + MapCheckRow4() + MapCheckRow5() + MapCheckRow6() + MapCheckRow7() + MapCheckRow8()

function CaveMapCheck() => Room != 0x0e && Room != 0x10 && Room != 0x13 && Room != 0x1b
function DreamMapCheck() => Map == Cave && (Room == 0x0e || Room == 0x10 || Room == 0x13 || Room == 0x1b)

achievement(
    title = "Map check tool", points = 0,
    description = "",
    trigger = DreamMapCheck() || Map == Dream
)
achievement(
    title = "And Thus, Dash Mario Was Born", points = 1,
    description = "Obtain the Wall Grip and Air Dash power-ups. You're now ready to truly begin your journey.",
    trigger = InGame() && Map == Mountain && Room == 0 && prev(AirDash + WallGrip) == 1 && (AirDash + WallGrip) == 2
)

achievement(
    title = "Wait, Come Back!", points = 1,
    description = "Find both of the moons in the Intro section.",
    trigger = InGame() && prev(MoonIntro) == 1 && measured(MoonIntro == 2)
)
achievement(
    title = "Tastes Like Chicken", points = 1,
    description = "Find any moon that is hidden in the walls.",
    trigger = InGame() && prev(HiddenMoons) == 0 && HiddenMoons == 1
)
achievement(
    title = "Moons Can’t Hide From Me Now", points = 3,
    description = "Obtain the X-Ray Specs. Don't forget to scan the QR codes if you want hints.",
    trigger = InGame() && Map == Mountain && Room == 0x12 && prev(XRay) == 0 && (XRay) == 1
)
achievement(
    title = "Mountain Climber", points = 10,
    description = "Explore the Mountain area and fill every square of the map. (Screens with no mini-map do not count)",
    trigger = State != 0 && prev(MapCheckFull()) == 63 && measured(MapCheckFull() == 64,Map == Mountain,format="percent")
)
achievement(
    title = "Daring Forager", points = 10,
    description = "Find all of the small moons in the Mountain area.",
    trigger = InGame() && Map == Mountain && prev(SmallMountainMoons) == 24 && measured(SmallMountainMoons == 25)
)
achievement(
    title = "This Sounds Familiar", points = 1,
    description = "Find the secret music room in the Mountain area.",
    trigger = InGame() && prev(Room) == 0x19 && Room == 0x0f && Map == Cave
)
achievement(
    title = "Gone Spelunking", points = 10,
    description = "Explore the Cave area and fill every square of the map. (Screens with no mini-map do not count)",
    trigger = State != 0 && prev(MapCheckFull()) == 76 && measured(MapCheckFull() == 77,Map == Cave && CaveMapCheck(),format="percent")
)
achievement(
    title = "Fleet-Footed", points = 3,
    description = "Get through the bottom door of the timed moon challenge in the Cave area with 5 or more seconds left on the clock.",
    trigger = trigger_when(InGame()) && Map == Cave && prev(Room) == 0x04 && trigger_when(Room == 0x14 && MarioY > 0xa0) && MoonSeconds >= 5
)
achievement(
    title = "Platforms Are Merely a Suggestion", points = 3,
    description = "Make it through the final Cave area room without touching the Thwomp.",
    trigger = trigger_when(State != 0) && Map == Cave && prev(Room) == 0x1c && trigger_when(Room == 0x1a) && disable_when(State == 8 && ThwompX != 0x54,Dead() || Room == 0x19)
)
achievement(
    title = "No Stone Left Unturned", points = 10,
    description = "Find all of the small moons in the Cave area.",
    trigger = InGame() && Map == Cave && prev(SmallCaveMoons) == 17 && measured(SmallCaveMoons == 18)
)
achievement(
    title = "The Training Wheels Are Off", points = 3,
    description = "Obtain the Super Moon in the Cave area for completing the No-Checkpoint challenge.",
    trigger = InGame() && Map == Cave && Room == 0x15 && prev(SuperCheckpoint) == 0 && SuperCheckpoint == 1
)
achievement(
    title = "Sorry to Burst Your Bubble", points = 3,
    description = "Obtain the Super Moon in the Cave area for completing the Bubble challenge.",
    trigger = InGame() && Map == Cave && Room == 0x19 && prev(SuperBubble) == 0 && SuperBubble == 1
)
achievement(
    title = "Are You Prepared?", points = 3,
    description = "Activate the switch to permanently open the door in the Dream area that leads to the final stretch.",
    trigger = InGame() && Map == Dream && Room == 0x07 && prev(DreamDoor) == 0 && DreamDoor == 1
)
achievement(
    title = "Vivid Dreamer", points = 10,
    description = "Explore the Dream area and fill every square of the map. (Screens with no mini-map do not count)",
    trigger = State != 0 && prev(MapCheckFull()) == 94 && measured(MapCheckFull() == 95,Map == Dream || DreamMapCheck(),format="percent")
)
achievement(
    title = "Planning Ahead", points = 3,
    description = "In the Dream area room with a door locked by shards in dream blocks, collect all 7 shards within 4 seconds of collecting the first.",
    trigger = State == 8 && Map == Dream && Room == 0x0 && trigger_when(prev(MoonShards) == 1 && MoonShards == 0) &&
            disable_when(repeated(241,once(prev(MoonShards) == 7 && MoonShards == 6) && always_true()) ,MoonShards == 7)
)
achievement(
    title = "Dream Catcher", points = 10,
    description = "Find all of the small moons in the Dream area.",
    trigger = InGame() && __ornext(Map == Cave || Map == Dream) && prev(SmallDreamMoons) == 17 && measured(SmallDreamMoons == 18)
)
achievement(
    title = "Show Me Your Moves", points = 5,
    description = "Obtain the Super Moon in the Dream area for completing the Rhythm Stage challenge.",
    trigger = InGame() && Map == Dream && Room == 0x0a && prev(SuperRhythm) == 0 && SuperRhythm == 1
)
achievement(
    title = "Beat Maniac", points = 5,
    description = "Reach the top of the Rhythm Stage room either without using any stamina or without using any dashes.",
    trigger = trigger_when(State != 0) && Map == Dream && Room == 0x0a && trigger_when(MarioY <= 0x41 && PageY == 1 && MarioX <= 0xbe && PageX == 1) &&
            once(MarioY >= 0x7a && PageY == 2 && MarioX >= 0xb4 && PageX == 1) && never(Dead()) && never(Room == 0x08) &&
                (unless(once(State == 8 && Dash < prev(Dash))) ||
                unless(once(State == 8 && Hearts < prev(Hearts) || Grip < prev(Grip))))
)
achievement(
    title = "Two Steps Ahead", points = 10,
    description = "Obtain the Super Moon in the Dream area for completing the Shadow Shard challenge.",
    trigger = InGame() && Map == Dream && Room == 0x12 && prev(SuperChase) == 0 && SuperChase == 1
)
achievement(
    title = "The Summit Within", points = 10,
    description = "Reach the final credits sequence and complete the main game. There's more waiting behind the door in front of you.",
    trigger = InGame() && prev(Credits) == 0x00 && Credits == 0x01 && Map == Dream && Room == 0x16
)
achievement(
    title = "Speed Climber", points = 25,
    description = "Reach the final credits sequence within 15 minutes of starting a New Game.",
    trigger = trigger_when(InGame()) && once(State == 0x07 && Map == Mountain && Room == 0x02 && WallGrip == 0x00 && PageY == 1) && 
            trigger_when(prev(Credits) == 0x00 && Credits == 0x01 && Map == Dream && Room == 0x16) &&
            unless(repeated(54001, once(State == 0x07 && Map == Mountain && Room == 0x02 && WallGrip == 0x00) && always_true())) && (always_false() || never(Title()))
)
achievement(
    title = "Warning: Do Not Touch", points = 5,
    description = "Obtain the Spiky challenge Super Moon by entering the post-game door and reaching the end.",
    trigger = InGame() && Map == Cave && Room == 0x1d && prev(SuperSpiky) == 0 && SuperSpiky == 1
)
achievement(
    title = "They Call Me (Wall) Jump Man", points = 10,
    description = "Make it through the main Spiky challenge room using no more than a combined total of 2 dashes and hearts.",
    trigger = State != 0 && Map == Cave && Room == 0x1d && trigger_when(PageX == 3 && MarioX > 0x33) && 
            disable_when(tally(3,Hearts < prev(Hearts), once(State != 0 && Dash < prev(Dash)), Hearts == 0 && prev(Grip) > 0 && Grip == 0), Dead() || 
            (Map != Cave && Room != 0x1d)) && unless(PageX == 3 && MarioX >= 0x60) && unless(PageX >= 4)
)
achievement(
    title = "Mountain Master", points = 10,
    description = "Obtain the World 1 challenge Super Moon by entering the post-game door and making it through the Mountain area without dying or warping.",
    trigger = once(Map == Mountain && Room == 0x3 && Deathless == 1) && prev(DeathlessMountain) == 0 && trigger_when(State != 0 && DeathlessMountain == 1) &&
            never(Dead()) && never(Room != 0x14 && Deathless == 0) 
)
achievement(
    title = "Cave Champion", points = 10,
    description = "Obtain the World 2 challenge Super Moon by entering the post-game door and making it through the Cave area without dying or warping.",
    trigger = once(Map == Cave && Room == 0x00 && Deathless == 2) && prev(DeathlessCave) == 0 && trigger_when(State != 0 && DeathlessCave == 1) &&
            never(Dead()) && never(Room != 0x1a && Deathless == 0) 
)
achievement(
    title = "Shadow Sidestepper", points = 25,
    description = "Obtain the World 3 challenge Super Moon by entering the post-game door and making it through the Shadow Chase without dying or warping.",
    trigger = once(Map == Dream && Room == 0x0b && Deathless == 3) && prev(DeathlessChase) == 0 && trigger_when(State != 0 && DeathlessChase == 1) &&
            never(Dead()) && never(Room != 0x16 && Deathless == 0) 
)
achievement(
    title = "Flip That Cassette Over", points = 10,
    description = "Take on the B-Side challenge and obtain the Super Moon waiting for you at the end.",
    trigger = InGame() && Map == BSide && Room == 0x13 && prev(SuperBSide) == 0 && SuperBSide == 1
)
achievement(
    title = "Listening on Fast Forward", points = 25,
    description = "Complete the B-Side challenge within 6 minutes.",
    trigger = trigger_when(InGame()) && once(State == 0x07 && Map == BSide && Room == 0x0a && never(Map != BSide)) && 
            trigger_when(Map == BSide && Room == 0x13) && trigger_when((prev(SuperBSide) == 0 && SuperBSide == 1) || (MarioX >= 0xA8 && MarioX != 0xff && MarioY <= 0x40)) &&
            unless(repeated(21601, once(State == 0x07 && Map == BSide && Room == 0x0a && never(Map != BSide)) && always_true()))
)
achievement(
    title = "Navigating in the Dark", points = 5,
    description = "Find the secret moon brought to you by Hokai Engineering.",
    trigger = InGame() && Map == BSide && Room == 0x12 && prev(HokaiMoon) == 0 && HokaiMoon == 1
)
achievement(
    title = "Unlocking Your Potential", points = 3,
    description = "Collect 9 moons and upgrade your maximum stored dashes for the first time",
    trigger = InGame() && prev(TotalMoons) >= 4 && prev(TotalMoons) <= 8 && measured(TotalMoons >= 9)
)
achievement(
    title = "All the Dashes You Need", points = 3,
    description = "Collect 20 moons and upgrade your maximum stored dashes for the second time.",
    trigger = InGame() && prev(TotalMoons) >= 15 && prev(TotalMoons) <= 19 && measured(TotalMoons >= 20)
)
achievement(
    title = "Pain Unlocked", points = 5,
    description = "Collect 40 moons. All world challenges will be unlocked once you reach them.",
    trigger = InGame() && prev(TotalMoons) >= 35 && prev(TotalMoons) <= 39 && measured(TotalMoons >= 40)
)
achievement(
    title = "R-R-R-Remix", points = 5,
    description = "Collect 60 moons. A special challenge will be unlocked once you reach it.",
    trigger = InGame() && prev(TotalMoons) >= 55 && prev(TotalMoons) <= 59 && measured(TotalMoons >= 60)
)
achievement(
    title = "Like a Moth", points = 10,
    description = "Collect 80 moons. You're getting close to the end!",
    trigger = InGame() && prev(TotalMoons) >= 75 && prev(TotalMoons) <= 79 && measured(TotalMoons >= 80)
)
achievement(
    title = "Luna Lover", points = 10,
    description = "Collect all 101 moons... for now.",
    trigger = InGame() && prev(TotalMoons) >= 96 && prev(TotalMoons) <= 100 && measured(TotalMoons == 101)
)

leaderboard(
    id = 71825, title = "Full Game - Any%",
    description = "From a new game, reach the final credits sequence as fast as you can.",
    start  = State == 0x07 && Map == Mountain && Room == 0x02 && WallGrip == 0x00 && PageY == 1,
    cancel = Title(),
    submit = prev(Credits) == 0x00 && Credits == 0x01 && Map == Dream && Room == 0x16,
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)
leaderboard(
    id = 111000005, title = "Full Game - Any% SRC",
    description = "From a new game, reach the final credits sequence as fast as you can.",
    start  = State == 0x07 && Map == Mountain && Room == 0x02 && WallGrip == 0x00 && PageY == 1,
    cancel = Title(),
    submit = State != 0 && Map == Dream && prev(Room) == 0x13 && Room == 0x15,
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)
leaderboard(
    id = 71826, title = "Full Game - 79 Moons",
    description = "From a new game, reach the final credits sequence and collect all 79 of the main game moons as fast as you can.",
    start  = State == 0x07 && Map == Mountain && Room == 0x02 && WallGrip == 0x00 && PageY == 1,
    cancel = Title(),
    submit = Credits == 0x01 && Map == Dream && Room == 0x16 && __ornext(prev(Credits) == 0x00 || prev(SeventyNineMoons()) == 66) && SeventyNineMoons() == 67,
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 71827, title = "Full Game - 100%",
    description = "From a new game, collect all 101 moons as fast as you can.",
    start  = State == 0x07 && Map == Mountain && Room == 0x02 && WallGrip == 0x00 && PageY == 1,
    cancel = Title(),
    submit = once(prev(Credits) == 0x00 && Credits == 0x01) && State != 0 && prev(TotalMoons) >= 96 && prev(TotalMoons) <= 100 && TotalMoons == 101,
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)
leaderboard(
    id = 111000008, title = "Full Game - Deaths",
    description = "Reach the final credits sequence with as few deaths as you can.",
    start  = InGame() && prev(Credits) == 0x00 && Credits == 0x01 && Map == Dream && Room == 0x16,
    cancel = always_false(),
    submit = always_true(),
    value = measured(TotalDeath()),
    format = "VALUE", lower_is_better = true
)
leaderboard(
    id = 111000004, title = "B-Side",
    description = "Complete the B-Side challenge as fast as you can.",
    start  = State == 0x07 && Map == BSide && Room == 0x0a,
    cancel = Map != BSide,
    submit = (Room == 0x13 && prev(SuperBSide) == 0 && SuperBSide == 1) || (Room == 0x13 && MarioX >= 0xA8 && MarioX != 0xff && MarioY <= 0x40),
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)
leaderboard(
    id = 111000009, title = "B-Side - Deaths",
    description = "Complete the B-Side challenge with as few deaths as you can.",
    start  = State == 0x07 && Map == BSide && Room == 0x0a,
    cancel = Map != BSide,
    submit = (Room == 0x13 && prev(SuperBSide) == 0 && SuperBSide == 1) || (Room == 0x13 && MarioX >= 0xA8 && MarioX != 0xff && MarioY <= 0x40),
    value = measured(tally(1,State == 0x0b && prev(State) != 0x0b)),
    format = "VALUE", lower_is_better = true
)
leaderboard(
    title = "Mountain Master",
    description = "Complete the World 1 deathless challenge from the post-game area as fast as you can.",
    start  = State == 0x07 && Map == Mountain && Room == 0x3 && Deathless == 1,
    cancel = Room != 0x14 && Deathless == 0,
    submit = (Map == Mountain && Room == 0x14 && prev(DeathlessMountain) == 0 && DeathlessMountain == 1) || 
            (Room == 0x13 && MarioX >= 0xA8 && MarioX != 0xff && MarioY <= 0x40),
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)
leaderboard(
    title = "Cave Champion",
    description = "Complete the World 2 deathless challenge from the post-game area as fast as you can.",
    start  = State == 0x07 && Map == Cave && Room == 0x00 && Deathless == 2,
    cancel = Room != 0x1a && Deathless == 0,
    submit = (Map == Cave && Room == 0x1a && prev(DeathlessCave) == 0 && DeathlessCave == 1) ||
            (Room == 0x13 && MarioX >= 0xA8 && MarioX != 0xff && MarioY <= 0x40),
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)
leaderboard(
    title = "Shadow Sidestepper",
    description = "Complete the World 3 deathless challenge from the post-game area as fast as you can.",
    start  = State == 0x07 && Map == Dream && Room == 0x0b && Deathless == 3,
    cancel = Room != 0x16 && Deathless == 0,
    submit = (Map == Dream && Room == 0x16 && prev(DeathlessChase) == 0 && DeathlessChase == 1) || 
            (Map == Dream && Room == 0x16 && PageX == 0 && MarioX <= 0x87 && State != 0),
    value = measured(always_true()),
    format = "FRAMES", lower_is_better = true
)

rich_presence_conditional_display(MaxHearts != 2, "Mario is preparing for a journey"    
)
rich_presence_conditional_display(Map==BSide,"Mario is taking on the B-Side challenge • 🌙[{2}/101] 💀[{3}]",
    rich_presence_lookup("map", Map, map),
    rich_presence_value("Digit", MapCheckFull(), format="VALUE"),
    rich_presence_value("Digit", TotalMoons, format="VALUE"),
    rich_presence_value("Digit", TotalDeath(), format="VALUE")
)
rich_presence_conditional_display(Map==Cave && Room == 0x1d,"Mario is taking on the Spiky challenge • 🌙[{2}/101] 💀[{3}]",
    rich_presence_lookup("map", Map, map),
    rich_presence_value("Digit", MapCheckFull(), format="VALUE"),
    rich_presence_value("Digit", TotalMoons, format="VALUE"),
    rich_presence_value("Digit", TotalDeath(), format="VALUE")
)
rich_presence_conditional_display(Map==Mountain&&(Room==0||Room ==2),"Mario is learning the ropes in the Intro • 🌙[{2}/101] 💀[{3}]",
    rich_presence_lookup("map", Map, map),
    rich_presence_value("Digit", MapCheckFull(), format="VALUE"),
    rich_presence_value("Digit", TotalMoons, format="VALUE"),
    rich_presence_value("Digit", TotalDeath(), format="VALUE")
)
rich_presence_conditional_display(Deathless > 0,"Mario is attempting a deathless challenge in the {0} • 🌙[{2}/101] 💀[{3}]",
    rich_presence_lookup("map", Map, map),
    rich_presence_value("Digit", MapCheckFull(), format="VALUE"),
    rich_presence_value("Digit", TotalMoons, format="VALUE"),
    rich_presence_value("Digit", TotalDeath(), format="VALUE")
)
rich_presence_conditional_display(DreamMapCheck() || Map == Dream,"Mario is exploring the Dream area • 🗺️[{1}/95] 🌙[{2}/101] 💀[{3}]",
    rich_presence_lookup("map", Map, map),
    rich_presence_value("Digit", MapCheckFull(), format="VALUE"),
    rich_presence_value("Digit", TotalMoons, format="VALUE"),
    rich_presence_value("Digit", TotalDeath(), format="VALUE")
)
rich_presence_conditional_display(Map==Cave,"Mario is exploring the Cave area • 🗺️[{1}/77] 🌙[{2}/101] 💀[{3}]",
    rich_presence_lookup("map", Map, map),
    rich_presence_value("Digit", MapCheckFull(), format="VALUE"),
    rich_presence_value("Digit", TotalMoons, format="VALUE"),
    rich_presence_value("Digit", TotalDeath(), format="VALUE")
)
rich_presence_conditional_display(Map==Mountain,"Mario is exploring the Mountain area • 🗺️[{1}/64] 🌙[{2}/101] 💀[{3}]",
    rich_presence_lookup("map", Map, map),
    rich_presence_value("Digit", MapCheckFull(), format="VALUE"),
    rich_presence_value("Digit", TotalMoons, format="VALUE"),
    rich_presence_value("Digit", TotalDeath(), format="VALUE")
)
rich_presence_display("Mario is exploring the {0} • 🌙[{2}/101] 💀[{3}]",
    rich_presence_lookup("map", Map, map),
    rich_presence_value("Digit", MapCheckFull(), format="VALUE"),
    rich_presence_value("Digit", TotalMoons, format="VALUE"),
    rich_presence_value("Digit", TotalDeath(), format="VALUE")
)
// "Mario is exploring the Mountain area | Map {1}/64 | Moons {2}/101 | Deaths {3}",
// maybe add something for the chase