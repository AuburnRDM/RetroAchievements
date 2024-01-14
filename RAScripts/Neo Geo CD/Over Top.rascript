// Over Top
// #ID = 23856

// $400E: [8-bit] Currently selected car
//        0x00 - PLOT 146comp (sedan)
//        0x01 - F Project F350 (sports car 1)
//        0x02 - Drei-Stern AW600 (box truck w/o box)
//        0x03 - AD Power FALCON 395 (hummer)
//        0x04 - ASUN DOMI-NATOR (station wagon)
//        0x05 - CRAFTWORK Akw. D12 (boat?)
//        0x06 - HONMA Safari 750 (motorcycle)
//        0x07 - Ipac Dio Version R (sports car 2)
Vehicle = byte(0x400e)
    Craftwork = 0x05
VehicleRP = {
    0:"PLOT 146comp",
    1:"F Project F350",
    2:"Drei-Stern AW600",
    3:"AD Power FALCON 395",
    4:"ASUN DOMNI-NATOR",
    5:"CRAFTWORK Akw. D12",
    6:"HONMA Safari 750",
    7:"Ipac Dio Version R"
}
VehicleData = {
    0:{"name":"PLOT 146comp","title":"Family Outing","points":10},
    1:{"name":"F Project F350","title":"Slip 'N Slide","points":10},
    2:{"name":"Drei-Stern AW600","title":"Heavy Duty","points":10},
    3:{"name":"AD Power FALCON 395","title":"Military Grade","points":10},
    4:{"name":"ASUN DOMNI-NATOR","title":"Accurate Marketing","points":10},
    5:{"name":"CRAFTWORK Akw. D12","title":"Master of None","points":10},
    6:{"name":"HONMA Safari 750","title":"Copyright Dodging","points":10},
    7:{"name":"Ipac Dio Version R","title":"JoJo Reference","points":10}
}
// $400F: [8-bit] Currently selected car color
// $4804: [8-bit] Current gear
//        - Does not go down if gas is still held, but car acts as if it's in a lower gear
//        - This is not displayed in-game
// $4806: [8-bit] Type of road being driven on
//        0x00 - None
//        0x01 - Pavement
//        0x02 - Dirt
//        0x03 - Sand
//        0x04 - Grass
//        0x05 - Mountain rock / thick dirt
//        0x06 - Snow
//        0x07 - Water
Road = byte(0x4806)
    None = 0
    Pavement = 1
    Dirt = 2
    Sand = 3
    Grass = 4
    Rock = 5
    Snow = 6
    Water = 7
// $4812: [16-bit BE] Y-position; lower is down
//        0x1ed2 - bottom of parking space
//        0x1f22 - top of parking space
YPos = word_be(0x4812)
// $4816: [16-bit BE] X-position; lower is left
//        0x0808 - left side of parking space
//        0x0838 - right side of parking space
XPos = word_be(0x4816)
// $4851: [8-bit] Current speed
CurrentSpeed = byte(0x4851)
// $B000: [8-bit] Game state
//        0x00 - Loading Disc / Main Menu / Opening Movie / How to Play
//        0x01 - Selecting a car
//        0x03 - Race is about to start
//        0x04 - Racing
//        0x05 - Time Up
//        0x07 - Game Over
//        0x08 - Race complete; persists until "Game Over"
//        0x09 - Checkpoint complete
//        0xa - Lap mode complete
GameState = byte(0xb000)
    MainMenu = 0
    Loading = 0
    Opening = 0
    CarSelect = 1
    PreRace = 3
    Racing = 4
    TimeUp = 5
    GameOver = 7
    FinishLine = 8
    Checkpoint = 9
    LapModeComplete = 0x0a
    
CheckpointReachedTrigger = prev(GameState) == Racing && trigger_when(GameState == Checkpoint)
CheckpointReached = prev(GameState) == Racing && GameState == Checkpoint
RaceFinishedTrigger = prev(GameState) == Racing && trigger_when(GameState == FinishLine)
RaceFinished = prev(GameState) == Racing && GameState == FinishLine
LapFinishedTrigger = prev(GameState) == Racing && __ornext(GameState == Checkpoint || trigger_when(GameState == LapModeComplete))
LapFinished = prev(GameState) == Racing && __ornext(GameState == Checkpoint || GameState == LapModeComplete)
ParkFinishedTrigger = prev(GameState) == Racing && __ornext(GameState == Checkpoint || GameState == LapModeComplete || trigger_when(GameState == FinishLine))
ParkFinished = prev(GameState) == Racing && __ornext(GameState == Checkpoint || GameState == LapModeComplete || GameState == FinishLine)
// $B001: [8-bit] Player in control state
//        0xff - Level starting/player in control
//        0x00 - Lap finished or not in game
// $B002: [8-bit] Screen identifier; use with 0xb000
//        0x00 - Stage 2 (Village) / Loading Disc
//        0x01 - Stage 3 (Lake Side)
//        0x02 - Stage 4 (Mountain)
//        0x03 - Stage 5 (Desert)
//        0x04 - Stage 6 (Port Town)
//        0x05 - Stage 7 (Park) / "Winner" screen if race has been won
//        0x06 - Stage 1 (City) MVS mode / Select Car (if 0xb000 is 0x01)
//        0x07 - Stage 1 (City) Level select mode
//        0x10 - Game Over / Loading / Lap recap
//        0x11 - How to Play
//        0x12 - Ranking placement
//        0x13 - Credits
//        0x14 - Main Menu / Loading "Winner" screen / Opening Movie
//        0x15 - Options / Name Entry
//        0x16 - Demo play #4
//        0x17 - Demo play #1
//        0x18 - Demo play #2
//        0x19 - Demo play #3
Screen = byte(0xb002)
    Village = 0
    LakeSide = 1
    Mountain = 2
    Desert = 3
    PortTown = 4
    Park = 5
    CityMVS = 6
    CityLapMode = 7
    GameOverScreen = 0x10
    HowToPlay = 0x11
    Ranking = 0x12
    Credits = 0x13
    MainMenuScreen = 0x14
    WinnerTransition = 0x14
    Options = 0x15
    NameEntry = 0x15
    Demo4 = 0x16
    Demo1 = 0x17
    Demo2 = 0x18
    Demo3 = 0x19
StageRP = {
    0:"Village",
    1:"Lake Side",
    2:"Mountain",
    3:"Desert",
    4:"Port Town",
    5:"Park",
    6:"City",
    7:"City"
}
// $B004: [8-bit BCD] Time remaining (seconds)
TimeRemainingSeconds = bcd(byte(0xb004))
// $B005: [8-bit] Time remaining (frames)
TimeRemainingFrames = byte(0xb005)
// $B00D: checkpoint reached
//        0x7f - Transition to next area
//        0xff - Crossed the stage checkpoint or the final finish line; stays 0xff after finishing the game until reaching the main menu
// $B066: [8-bit BCD] Time remaining to select a car or enter ranking data
// $B20A: [8-bit] Pause status
//        0x00 - Not paused
//        0xff - Paused
Paused = byte(0xb20a) == 0xff
// $B241: [8-bit] Options - Menu position
//        0x00 - Time
//        0x01 - Course
//        0x02 - Lap
//        0x03 - Sound
//        0x04 - Car Select
//        0x05 - Data
//        0x06 - Exit
// $B245: [8-bit] Options Menu - Time (real setting at 0xe107)
//        0x00 - Infinite
//        0x01 - Easy
//        0x02 - Normal
//        0x03 - MVS
//        0x04 - Hard
// $B247: [8-bit] Option - Course
//        0x00 - MVS (main mode)
//        0x01 - City
//        0x02 - Village
//        0x03 - Lake Side
//        0x04 - Mountain
//        0x05 - Desert
//        0x06 - Port Town
//        0x07 - Park
Mode = byte(0xB247)
    MVSMode = 0
ModeRP = {
    0:"Event Mode",
    1:"Lap Mode",
    2:"Lap Mode",
    3:"Lap Mode",
    4:"Lap Mode",
    5:"Lap Mode",
    6:"Lap Mode",
    7:"Lap Mode",
}
// $B249: [8-bit] Options - Lap
//        0x00 - 1 Lap
//        ~
//        0x07 - 8 Laps
LapCount = byte(0xb249) + 1
// $B24B: [8-bit] Options - Sound
// $B24D: [8-bit] Options - Car Select
//        0x00 - MVS (manual select)
//        0x01 - PLOT 146comp (sedan)
//        0x02 - F Project F350 (sports car 1)
//        0x03 - Dret-Stern AW600 (box truck w/o box)
//        0x04 - AD Power FALCON 395 (hummer)
//        0x05 - ASUN DOMI-NATOR (station wagon)
//        0x06 - CRAFTWORK Akw. D12 (boat?)
//        0x07 - HONMA Safari 750 (motorcycle)
//        0x08 - Ipac DIO Version R (sports car 2)
// $B253: [8-bit] Options - Car Select - Color Select; irrelevant if set to MVS car
// $CE0F: [8-bit] Main menu selection
//        0x00 - Game Start
//        0x01 - Demo Game
//        0x02 - How to Play
//        0x03 - Option
//        0x04 - Exit
// $CE80: [8-bit BCD] Best lap in level select - Minutes
//        - This shows during the recap
// $CE81: [8-bit BCD] Best lap in level select - Seconds
// $CE82: [8-bit BCD] Best lap in level select - Milliseconds
//        - This shows during the recap
// $E010: [8-bit BCD] Ranking - Rank 1 time (Minutes)
// $E011: [8-bit BCD] Ranking - Rank 1 time (seconds)
// $E012: [8-bit BCD] Ranking - Rank 1 time (Milliseconds)
// $E014: [24-bit ASCII] Ranking - Rank 1 initials
// $E018: [8-bit BCD] Ranking - Rank 2 time (Minutes)
// $E019: [8-bit BCD] Ranking - Rank 2 time (seconds)
// $E01A: [8-bit BCD] Ranking - Rank 2 time (Milliseconds)
// $E01C: [24-bit ASCII] Ranking - Rank 2 initials
// $E020: [8-bit BCD] Ranking - Rank 3 time (Minutes)
// $E021: [8-bit BCD] Ranking - Rank 3 time (seconds)
// $E022: [8-bit BCD] Ranking - Rank 3 time (Milliseconds)
// $E024: [24-bit ASCII] Ranking - Rank 3 initials
// $E028: [8-bit BCD] Ranking - Rank 4 time (Minutes)
// $E029: [8-bit BCD] Ranking - Rank 4 time (seconds)
// $E02A: [8-bit BCD] Ranking - Rank 4 time (Milliseconds)
// $E02C: [24-bit ASCII] Ranking - Rank 4 initials
// $E030: [8-bit BCD] Ranking - Rank 5 time (Minutes)
// $E031: [8-bit BCD] Ranking - Rank 5 time (seconds)
// $E032: [8-bit BCD] Ranking - Rank 5 time (Milliseconds)
// $E034: [24-bit ASCII] Ranking - Rank 5 initials

//These lap time values persist after completing each stage in MVS mode until returning to the main menu. 
//These values persist when reaching a checkpoint in lap mode until the game state ($b000) flips back to racing.
//----------------------------------------------------------------
// $E080: [8-bit BCD] Stage 2 (Village) lap time - Minutes
// $E081: [8-bit BCD] Stage 2 (Village) lap time - Seconds
// $E082: [8-bit BCD] Stage 2 (Village) lap time - Milliseconds
// $E084: [8-bit BCD] Stage 3 (Lake Side) lap time - Minutes
// $E085: [8-bit BCD] Stage 3 (Lake Side) lap time - Seconds
// $E086: [8-bit BCD] Stage 3 (Lake Side) lap time - Milliseconds
// $E088: [8-bit BCD] Stage 4 (Mountain) lap time - Minutes
// $E089: [8-bit BCD] Stage 4 (Mountain) lap time - Seconds
// $E08A: [8-bit BCD] Stage 4 (Mountain) lap time - Milliseconds
// $E08C: [8-bit BCD] Stage 5 (Desert) lap time - Minutes
// $E08D: [8-bit BCD] Stage 5 (Desert) lap time - Seconds
// $E08E: [8-bit BCD] Stage 5 (Desert) lap time - Milliseconds
// $E090: [8-bit BCD] Stage 6 (Port Town) lap time - Minutes
// $E091: [8-bit BCD] Stage 6 (Port Town) lap time - Seconds
// $E092: [8-bit BCD] Stage 6 (Port Town) lap time - Milliseconds
// $E094: [8-bit BCD] Stage 7 (Park) lap time - Minutes
// $E095: [8-bit BCD] Stage 7 (Park) lap time - Seconds
// $E096: [8-bit BCD] Stage 7 (Park) lap time - Milliseconds
// $E098: [8-bit BCD] Stage 1 (City) MVS lap time - Minutes
//        - This is the only stage that uses a different address between MVS and level select modes
// $E099: [8-bit BCD] Stage 1 (City) MVS lap time - Seconds
//        - This is the only stage that uses a different address between MVS and level select modes
// $E09A: [8-bit BCD] Stage 1 (City) MVS lap time - Milliseconds
//        - This is the only stage that uses a different address between MVS and level select modes
// $E09C: [8-bit BCD] Stage 1 (City) level select lap time - Minutes
//        - This is the only stage that uses a different address between MVS and level select modes
// $E09D: [8-bit BCD] Stage 1 (City) level select lap time - Seconds
//        - This is the only stage that uses a different address between MVS and level select modes
// $E09E: [8-bit BCD] Stage 1 (City) level select lap time - Milliseconds
//        - This is the only stage that uses a different address between MVS and level select modes
CityMVSLapTime = (bcd(byte(0xE098)) * 6000) + (bcd(byte(0xE099)) * 100) + bcd(byte(0xE09A))
CityLapTime = (bcd(byte(0xE09C)) * 6000) + (bcd(byte(0xE09D)) * 100) + bcd(byte(0xE09E))
VillageLapTime = (bcd(byte(0xE080)) * 6000) + (bcd(byte(0xE081)) * 100) + bcd(byte(0xE082))
LakeSideLapTime = (bcd(byte(0xE084)) * 6000) + (bcd(byte(0xE085)) * 100) + bcd(byte(0xE086))
MountainLapTime = (bcd(byte(0xE088)) * 6000) + (bcd(byte(0xE089)) * 100) + bcd(byte(0xE08A))
DesertLapTime = (bcd(byte(0xE08C)) * 6000) + (bcd(byte(0xE08D)) * 100) + bcd(byte(0xE08E))
PortTownLapTime = (bcd(byte(0xE090)) * 6000) + (bcd(byte(0xE091)) * 100) + bcd(byte(0xE092))
ParkLapTime = (bcd(byte(0xE094)) * 6000) + (bcd(byte(0xE095)) * 100) + bcd(byte(0xE096))
//***The full course values do not change unless the game is reset or the full race is won again
// $E0A0: [8-bit BCD] MVS full course time - Minutes
// $E0A1: [8-bit BCD] MVS full course time - Seconds
// $E0A2: [8-bit BCD] MVS full course time - Milliseconds
FullCourseTime = CityMVSLapTime + VillageLapTime + LakeSideLapTime + MountainLapTime + DesertLapTime + PortTownLapTime + ParkLapTime
FullCourseValue = (bcd(byte(0xE0A0)) * 6000) + (bcd(byte(0xE0A1)) * 100) + bcd(byte(0xE0A2))
// $E0B0: [8-bit BCD] Stage 2 (Village) fastest lap record - Minutes
// $E0B1: [8-bit BCD] Stage 2 (Village) fastest lap record - Seconds
// $E0B2: [8-bit BCD] Stage 2 (Village) fastest lap record - Milliseconds
// $E0B4: [8-bit BCD] Stage 3 (Lake Side) fastest lap record - Minutes
// $E0B5: [8-bit BCD] Stage 3 (Lake Side) fastest lap record - Seconds
// $E0B6: [8-bit BCD] Stage 3 (Lake Side) fastest lap record - Milliseconds
// $E0B8: [8-bit BCD] Stage 4 (Mountain) fastest lap record - Minutes
// $E0B9: [8-bit BCD] Stage 4 (Mountain) fastest lap record - Seconds
// $E0BA: [8-bit BCD] Stage 4 (Mountain) fastest lap record - Milliseconds
// $E0BC: [8-bit BCD] Stage 5 (Desert) fastest lap record - Minutes
// $E0BD: [8-bit BCD] Stage 5 (Desert) fastest lap record - Seconds
// $E0BE: [8-bit BCD] Stage 5 (Desert) fastest lap record - Milliseconds
// $E0C0: [8-bit BCD] Stage 6 (Port Town) fastest lap record - Minutes
// $E0C1: [8-bit BCD] Stage 6 (Port Town) lap time - Seconds
// $E0C2: [8-bit BCD] Stage 6 (Port Town) lap time - Milliseconds
// $E0C4: [8-bit BCD] Stage 7 (Park) fastest lap record - Minutes
// $E0C5: [8-bit BCD] Stage 7 (Park) fastest lap record - Seconds
// $E0C6: [8-bit BCD] Stage 7 (Park) fastest lap record - Milliseconds
// $E0C8: [8-bit BCD] Stage 1 (City) fastest lap record - Minutes
// $E0C9: [8-bit BCD] Stage 1 (City) fastest lap record - Seconds
// $E0CA: [8-bit BCD] Stage 1 (City) fastest lap record - Milliseconds
// $E0FD: [8-bit] Current race position; starts at 0x00
// $E0FE: [8-bit] Current race position (display); starts at 0x00
RacePosition = byte(0xe0fe) + 1
// $E0FF: [8-bit] Total number of racers (Rank /#); starts at 0x00
// $E107: [8-bit] Time Difficulty
//        0x00 - Infinite
//        0x01 - Easy
//        0x02 - Normal
//        0x03 - Hard
//        0x04 - MVS
Difficulty = byte(0xe107)
    Infinite = 0
    Easy = 1
    Normal = 2
    Hard = 3
    MVS = 4
DifficultyRP = {
    0:"Infinite",
    1:"Easy",
    2:"Normal",
    3:"Hard",
    4:"MVS"
}
// $E820: [256-bit] This block of data is used to store times for each lap in level select mode
// $FE30: [32-bit] UniBIOS block; make sure this is 0 for all achievements
UniBIOS = dword(0xfe30) > 0

//data for most cheevos
MVSData = {
    1:{"screen":6,"tMVS":"Sunday Driving","name":"City","pMVS":1,"pSpeedrun":2,"tSpeedrun":"Rush Hour","dSpeedrun":"18''50","ms":1850},
    2:{"screen":0,"tMVS":"Countryside Cruise","name":"Village","pMVS":2,"pSpeedrun":3,"tSpeedrun":"Local Disturbance","dSpeedrun":"22''00","ms":2200,"Time":VillageLapTime},
    3:{"screen":1,"tMVS":"Dangerous Bends","name":"Lake Side","pMVS":3,"pSpeedrun":5,"tSpeedrun":"No Time to Swim","dSpeedrun":"22''00","ms":2200,"Time":LakeSideLapTime},
    4:{"screen":2,"tMVS":"Perilous Peak","name":"Mountain","pMVS":3,"pSpeedrun":5,"tSpeedrun":"Quick Ascent","dSpeedrun":"30''00","ms":3000,"Time":MountainLapTime},
    5:{"screen":3,"tMVS":"Heat Stroke","name":"Desert","pMVS":5,"pSpeedrun":4,"tSpeedrun":"Dune Dash","dSpeedrun":"26''00","ms":2600,"Time":DesertLapTime},
    6:{"screen":4,"tMVS":"Lovely View","name":"Port Town","pMVS":5,"pSpeedrun":5,"tSpeedrun":"Backyard Biker","dSpeedrun":"24''00","ms":2400,"Time":PortTownLapTime},
    7:{"screen":5,"tMVS":"Final Stretch","name":"Park","pMVS":10,"pSpeedrun":10,"tSpeedrun":"Sportscar Sprint","dSpeedrun":"39''00","ms":3900,"Time":ParkLapTime},
}

//achievements

function MVSClear(stage) {
    achievement(
        title=MVSData[stage]["tMVS"], points= MVSData[stage]["pMVS"],
        description="Clear " + MVSData[stage]["name"] + " in MVS mode on any timed difficulty.",
        trigger= !UniBIOS && Mode == MVSMode && Screen == MVSData[stage]["screen"] && CheckpointReached
    )
}

//first 6 cheevos
for i in range(1,6)
    MVSClear(i)
    
achievement(
        title=MVSData[7]["tMVS"], points= MVSData[7]["pMVS"],
        description="Clear Park in MVS mode on any timed difficulty and complete the event.",
        trigger= !UniBIOS && Mode == MVSMode && Screen == Park && RaceFinished
)

function FirstPlace(car) {
    achievement(
        title=VehicleData[car]["title"], points=VehicleData[car]["points"],
        description="Finish the event in first place while driving the " + VehicleData[car]["name"] + " on normal difficulty or higher.",
        trigger= !UniBIOS && Mode == MVSMode && Difficulty >= 2 && Vehicle == car && Screen == Park && RaceFinished && RacePosition == 1
    )
}

//first place cheevos
for i in range(0,7)
    FirstPlace(i)
    
achievement(
        title="Fierce Competition", points=10,
        description="Finish the event in first place while driving any vehicle on hard difficulty.",
        trigger= !UniBIOS && Mode == MVSMode && Difficulty == Hard && Screen == Park && RaceFinished && RacePosition == 1
)

function TimeTrial(stage) {
    achievement(
        title=MVSData[stage]["tSpeedrun"], points=MVSData[stage]["pSpeedrun"],
        description="Finish " + MVSData[stage]["name"] + " within " + MVSData[stage]["dSpeedrun"] + ".",
        trigger= !UniBIOS && Screen == MVSData[stage]["screen"] && MVSData[stage]["Time"] <= MVSData[stage]["ms"] && LapFinishedTrigger
    )
}

achievement(
        title="Rush Hour", points=2,
        description="Finish City within 18''50.",
        trigger= !UniBIOS && 
                ((Screen == CityMVS && CityMVSLapTime <= 1850 && CheckpointReachedTrigger) ||
                (Screen == CityLapMode && CityLapTime <= 1850 && LapFinishedTrigger))
)

//standard time trial cheevos
for i in range (2,6)
    TimeTrial(i)
    
achievement(
        title="Sportscar Sprint", points=10,
        description="Finish Park within 39''00.",
        trigger= !UniBIOS && Screen == MVSData[7]["screen"] && MVSData[7]["Time"] <= MVSData[7]["ms"] && ParkFinishedTrigger
)

achievement(
        title="Redline Racer", points=25,
        description="Finish the entire event within 3'30''00.",
        trigger= !UniBIOS && Mode == MVSMode && once(Screen == CityMVS && prev(GameState) == PreRace && GameState == Racing) &&
                trigger_when(Screen == Park && RaceFinished) && FullCourseTime <= 21000 && never(GameState == MainMenu) && never(GameState == TimeUp)
)

achievement(
        title="Vanilla Racer", points=10,
        description="Finish the event in MVS mode on normal or higher without taking any shortcuts or alternate routes.",
        trigger= !UniBIOS && Mode == MVSMode && once(Screen == CityMVS && prev(GameState) == PreRace && GameState == Racing) &&
                trigger_when(Screen == Park && RaceFinished) && never(GameState == MainMenu) && never(GameState == TimeUp) &&
                never(Screen == Village && XPos >= 0xa00 && XPos <= 0xc00 && YPos >= 0x750 && YPos <= 0x800) && //village woods
                never(Screen == LakeSide && XPos >= 0x600 && XPos <= 0x800 && YPos >= 0x700 && YPos <= 0x780) && //lakeside woods
                never(Screen == LakeSide && XPos >= 0x900 && XPos <= 0xb00 && YPos >= 0xf00 && YPos <= 0x1050) && //lakeside water
                never(Screen == Mountain && XPos >= 0xa80 && XPos <= 0xb00 && YPos >= 0xc40 && YPos <= 0x1000) && //mountain first shortcut
                never(Screen == Mountain && XPos >= 0x1890 && XPos <= 0x1920 && YPos >= 0x1a90 && YPos <= 0x1b00) && //mountain side snow path
                never(Screen == Mountain && XPos >= 0x1500 && XPos <= 0x1700 && YPos >= 0x1c00 && YPos <= 0x1c80) && //mountain snow shortcut
                never(Screen == Desert && XPos >= 0xff0 && XPos <= 0x1100 && YPos >= 0x10a0 && YPos <= 0x1200) && //desert skip
                never(Screen == PortTown && XPos >= 0x700 && XPos <= 0x790 && YPos >= 0xe00 && YPos <= 0x1000) && //port town grass shortcut
                never(Screen == PortTown && XPos >= 0xab0 && XPos <= 0xc00 && YPos >= 0xf30 && YPos <= 0x1080) && //port town beach
                never(Screen == PortTown && XPos >= 0x8d0 && XPos <= 0x950 && YPos >= 0x1c20 && YPos <= 0x1c80) && //port town parking lot
                never(Screen == PortTown && XPos >= 0x9e0 && XPos <= 0xa80 && YPos >= 0x1c60 && YPos <= 0x1cb0) && //port town backyard
                never(Screen == Park && XPos >= 0x790 && XPos <= 0x850 && YPos >= 0xba0 && YPos <= 0xc20) && //park first shortcut
                never(Screen == Park && XPos >= 0x1310 && XPos <= 0x1490 && YPos >= 0xe50 && YPos <= 0xef0) && //park second shortcut
                never(Screen == Park && XPos >= 0x6e0 && XPos <= 0x740 && YPos >= 0x2ec0 && YPos <= 0x2fa0) && //park bottom end path
                never(Screen == Park && XPos >= 0x6e0 && XPos <= 0x740 && YPos >= 0x32d0 && YPos <= 0x33f0) //park top end path
)
achievement(
        title="Is This Even Helping?", points=1,
        description="Take the CRAFTWORK Akw. D12 into the water on any stage for a ''shortcut''.",
        trigger= !UniBIOS && GameState == Racing && Vehicle == Craftwork && prev(Road) != Water && Road == Water
)
achievement(
        title="You're Number 01", points=1,
        description="Find and park in the 01 parking space.",
        trigger= !UniBIOS && Screen == PortTown && GameState == Racing && CurrentSpeed == 0 &&
                ((XPos >= 0x808 && XPos <= 0x838 && YPos >= 0x1ed2 && YPos <= 0x1f22) || //parking space position lap mode
                (XPos >= 0xc06 && XPos <= 0xc36 && YPos >= 0x21d0 && YPos <= 0x2220))    //parking space position mvs
)

//leaderboards
function CourseLeaderboard(car) {
    leaderboard(
        title=VehicleData[car]["title"],
        description="Finish the event as fast as you can while driving the " + VehicleData[car]["name"] + ".",
        start=!UniBIOS && Mode == MVSMode && Vehicle == car && Screen == Park && RaceFinished,
        cancel=always_false(),
        submit=always_true(),
        value=FullCourseTime,
        format="MILLISECS",
        lower_is_better=true
    )
}
//backup         start=!UniBIOS && Mode == MVSMode && Vehicle == car && Screen == Park && RaceFinished && prev(FullCourseTime) != FullCourseTime,
//full game for each car
for i in range(0,7)
    CourseLeaderboard(i)

leaderboard(
        title="Best Lap - City",
        description="Finish a lap in City as fast as you can.",
        start=!UniBIOS && 
              ((Screen == CityMVS && CheckpointReached) ||
              (Screen == CityLapMode && LapFinished)),
        cancel=always_false(),
        submit=always_true(),
        value=(measured(CityMVSLapTime, Screen == CityMVS)) || (measured(CityLapTime, Screen == CityLapMode)),
        format="MILLISECS",
        lower_is_better=true
)

function LapLeaderboard(stage) {
    leaderboard(
        title="Best Lap - " + MVSData[stage]["name"],
        description="Finish a lap in " + MVSData[stage]["name"] + " as fast as you can.",
        start=!UniBIOS && Screen == MVSData[stage]["screen"] && LapFinished,
        cancel=always_false(),
        submit=always_true(),
        value=MVSData[stage]["Time"],
        format="MILLISECS",
        lower_is_better=true
    )
}
//best lap for standard stages
for i in range(2,6)
    LapLeaderboard(i)
    
leaderboard(
        title="Best Lap - Park",
        description="Finish a lap in Park as fast as you can.",
        start=!UniBIOS && Screen == Park && ParkFinished,
        cancel=always_false(),
        submit=always_true(),
        value=ParkLapTime,
        format="MILLISECS",
        lower_is_better=true
)

//Rich Presence
rich_presence_conditional_display(UniBIOS, "UniBIOS detected • Please use a different BIOS to unlock achievements and participate in leaderboards.")
rich_presence_conditional_display(GameState == FinishLine && Mode == MVSMode, "Finished the event while driving the {0}!",
        rich_presence_lookup("Vehicle", Vehicle, VehicleRP)
)
rich_presence_conditional_display(GameState == CarSelect, "Selecting a car")
rich_presence_conditional_display(GameState == 3 || GameState == 4 || GameState == 9 || GameState == 0xa, "Driving the {0} in {1} • {3} • {2}",
        rich_presence_lookup("Vehicle", Vehicle, VehicleRP),
        rich_presence_lookup("Stage",Screen,StageRP),
        rich_presence_lookup("Difficulty",Difficulty,DifficultyRP),
        rich_presence_lookup("Mode",Mode,ModeRP)
)
rich_presence_conditional_display(GameState == GameOver, "GAME OVER")
rich_presence_conditional_display(Screen >= 0x16, "Watching the demo")
rich_presence_conditional_display(byte(0x0c05) == 2, "Watching the impressive opening movie")
rich_presence_display("On the menus")