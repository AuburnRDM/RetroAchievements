// Ys III: Wanderers from Ys
// #ID = 9451

// $1D4590: [32-bit] Boss attacking status
//          0x00 - Not attacking
//          0x01 - Currently attacking
// $25F3C0: [32-bit] Playtime of current file / Playtime of current boss rush (frames)
Playtime = dword(0x25F3C0)
// $25F3F8: [8-bit] Game state; value for Save/Load is determined by where the menu was entered from (Main Menu / In-game)
//          0x00 - In-game
//          0x01 - Main Menu (Sound Test, Save, Load)
//          0x02 - Overworld Map
//          0x03 - Town Map
//          0x04 - Game Menu (Equip, Status, Save, Load)
//          0x05 - Death Menu
//          0x07 - Watching Credits
Game_State = byte(0x25F3F8)
// $25F404: [8-bit] Pause status
//          b0 - Paused / In shop
Pause = bit0(0x25F404)
// $25F410: [8-bit] Bosses Defeated Pt. 1
//          b0 - Dularn
//          b1 - Elfeilu
//          b2 - Girun
//          b3 - Gyalva
//          b4 - Istersiva
//          b5 - Ligaty
//          b6 - Gildias
//          b7 - Death=Falwon
Dularn = bit0(0x25F410)
Elfeilu = bit1(0x25F410)
Girun = bit2(0x25F410)
Gyalva = bit3(0x25F410)
Istersiva = bit4(0x25F410)
Ligaty = bit5(0x25F410)
Gildias = bit6(0x25F410)
Death_Falwon = bit7(0x25F410)
// $25F411: [8-bit] Bosses Defeated Pt. 2
//          b0 - Zelfel=Zam=Schtilger
//          b1 - Garland (Castle)
//          b2 - Garland (Island)
//          b3 - Galbaran
Fire_Dog = bit0(0x25F411)
GarlandC = bit1(0x25F411)
GarlandI = bit2(0x25F411)
Galbaran = bit3(0x25F411)
function BossCheck() => bitcount(0x25F410) == 8 && bitcount(0x25F411) == 4
// $25F444: [8-bit] Door / Screen transition interacted with; teleports to shops from any screen if value is changed
//          0x00 - None
//          0x01 - Transitions to a new map
//          0x02 - Item Shop
//          0x03 - Equipment Shop
Shop = byte(0x25F444)
// $25F454: [8-bit] Game Status
//          0x00 - Not in-game / In menus / Shop
//          0x01 - In-game
Game_Status = byte(0x25F454)
// $25F510: [32-bit] Sound Effect volume option (Max: 0x80)
// $25F514: [32-bit] Voice volume option (Max: 0x3e8)
// $25F518: [32-bit] BGM volume option (Max: 0x73)
// $25F55C: [32-bit] Most recent Boss Rush clear time (Milliseconds)
RecentRush = dword(0x25F55C)
// $5E8F60: [32-bit] Last attack from Elfeilu
//          0x00 - None
//          0x01 - Energy Blast
//          0x02 - Laser Attack
// $5E9274: [32-bit] Current BGM playing; does not change if nothing is playing until new track starts
//          0x00 - Title screen
//          0x02 - Redmont City
//          0x03 - Redmont residences / church
//          0x04 - Redmont shops
//          0x05 - Overworld map
//          0x06 - Outside Tegrey Quarry / Eldarm Mountains Base / Ballastein Castle
//          0x07 - Tegrey Quarry
//          0x08 - Boss theme (Boss 1, 3, 4, 6, 8)
//          0x09 - Ilverns Ruins
//          0x0a - Ilverns Volcano
//          0x0b - Tegrey Quarry Part 2
//          0x0c - Boss theme 2 (Boss 2, 5, 7, 10, 11)
//          0x0e - Eldarm Mountains
//          0x10 - Ballastein Castle
//          0x11 - Clock Tower
//          0x12 - Galbaran's Island
//          0x15 - Boss Theme Galbaran
//          0x16 - Redmont after final boss
//          0x17 - Credits
// $5E92AC: bgm is also here. pointer?
// $5F1EE8: also music?
// $6F1EE8: also music?
// $7EF180: [8-bit] Main Menu cursor position
//          0xff - Menu not available
//          0x00 - New Game
//          0x01 - Load
//          0x02 - Option
//          0x03 - Boss Rush
// $816810: [8-bit] Event Flags pt. 1
//          b2 - Initial scene with Dogi
//          b3 - Scene in town; Tegrey Quarry unlocked
//          b4 - Entered Tegrey Quarry
//          b5 - Controls tutorial completed
//          b6 - Chester and Miner scene; storeroom key obtained
//          b7 - Second Chester scene (with Edgar)
// $816811: [8-bit] Event Flags pt. 2
//          b0 - Edgar gets rescued before 2nd boss; 2nd boss available
//          b1 - Long Sword from Dularn obtained; can now go past miner blocking the way
//          b2 - Elfeilu defeated and 2nd statue obtained; warped outside of quarry
//          b3 - Return to Redmond and spoke to the gate guard
//          b4 - Talk to Dogi & Elena in town after Tegrey
//          b5 - Went to the church and read the note
//          b6 - Talked to Edgar in the house next to Dogi/Elena's place; Ilverns Ruins unlocked
//          b7 - Enter item shop again after being told about Brosha Elixir?
// $816812: [8-bit] Event Flags pt. 3
//          b0 - Ilverns Ruins entered for the first time
//          b1 - Got caught eavesdropping on Chester and got kicked down into Ilverns Volcano
//          b2 - Used Fire Dragon Scale to remove lava
//          b3 - Met with Elena after escaping Ilverns Volcano
//          b5 - Met Chester after Gyvala; warped to Ruins entrance
//          b6 - Talked to Dogi outside of Redmont
//          b7 - Talked to Edgar in town and received Timer Ring
// $816813: [8-bit] Event Flags pt. 4
//          b0 - Talk to kid outside Church to learn about the trouble in Tegrey Quarry
//          b1 - Tablet obtained in Tegrey Quarry Pt. 2 and cutscene watched
//          b2 - Item shop tells you about Brosha Elixir
//          b3 - Spoke to miner on the way out of Pt. 2; returns to entrance
//          b4 - Scene with Edgar and McGuire; obtain Grady's Letter and unlock Eldarm Mountains
//          b5 - Shining Crystal returned to the item shop; Brosha Elixir now available to purchase--first given free
//          b6 - Eldarm Mountains entered for the first time
//          b7 - Met with Dogi and his Master on the mountain; obtained Bastard Sword
// $816814: [8-bit] Event Flags pt. 5
//          b0 - Interact with the Dragon statue on Eldarm Mountains with the Staff of Judgement and open the path forward
//          b1 - Defeated Zelfel=Zam=Schtilger and opened the courtyard door
//          b2 - Meet Chester after Gildias, get rescued by Dogi, obtain the Heal Ring
//          b3 - Return back to Redmont and catch up with Edgar
//          b4 - Finish up with Edgar and unlock Ballastein Castle
//          b5 - Enter Ballastein Castle for the first time
//          b6 - Meet Elena at the start of Ballastein Castle
//          b7 - Cathedral scene after Zelfel=Zam=Schtilger; sewer open
// $816815: [8-bit] Event Flags pt. 6
//          b0 - Cathedral scene after Zelfel=Zam=Schtilger; sewer open
//          b1 - Obtained the Clock Tower Key in the jail cell
//          b2 - Open the door to the Clock Tower
//          b3,b4,b6 - All flip at once; Garland defeated, Crest of the Nightmare obtained, Elena kidnapped
//          b7 - Return to Redmont to talk to Dogi and the others
// $816816: [8-bit] Event Flags pt. 7
//          b0 - Spoke to Edgar after Ballastein Castle; obtained Oni Orb and unlocked Galbaran's Island
//          b1 - Enter Galbaran's Island for the first time
//          b2 - Entrance to the final area opened
//          b3 - Event with Chester and Elena before final boss; Galbaran fight available
//          b4 - Broke the barrier in Ballastein Castle; flips back to 0x00 when entering Galbaran's Island; flips to 0x01 again when meeting Garland for the 2nd encounter; flips back to 0x00 after Galbaran is destroye and Adol leaves the island with Elena
//          b5 - Adol defeats Galbaran and speaks to Elena, then they escape and return to Redmont
//          b6 - Automatic cutscene talking to Dogi in Redmont; player control is resumed afterwards
// $816817: [8-bit] Event Flags pt. 8
//          b0 - Credits rolling
Credits = bit0(0x816817)
// $816820: [32-bit] Boss Rush Ranking - 1st Place (Milliseconds)
RushBest = dword(0x816820)
// $816830: [32-bit] Boss Rush Ranking - 2nd Place (Milliseconds)
// $816840: [32-bit] Boss Rush Ranking - 3rd Place (Milliseconds)
// $816850: [32-bit] Boss Rush Ranking - 4th Place (Milliseconds)
// $816860: [32-bit] Boss Rush Ranking - 5th Place (Milliseconds)
// $816870: [32-bit] Boss Rush Ranking - 6th Place (Milliseconds)
// $816880: [32-bit] Boss Rush Ranking - 7th Place (Milliseconds)
// $816890: [32-bit] Boss Rush Ranking - 8th Place (Milliseconds)
// $8168A0: [32-bit] Boss Rush Ranking - 9th Place (Milliseconds)
// $8168B0: [32-bit] Boss Rush Ranking - 10th Place (Milliseconds)
// $81C0C0: [8-bit] Difficulty
//          0x00 - Easy
//          0x01 - Normal
//          0x02 - Hard
Difficulty = byte(0x81C0C0)
DifficultyLookup = {
    0: "Easy",
    1: "Normal",
    2: "Hard"
}
// $81C0C4: [8-bit] Adol's Level (Max: 0x10)
Adol_Level = byte(0x81C0C4)
// $81C0C8: [8-bit] Adol's HP (Max: 0xff)
Adol_HP = byte(0x81C0C8)
// $81C0CA: [16-bit] Adol's Current EXP (Max: 0xffff)
// $81C0CC: [16-bit] Current Gold (Max: 0xffff)
Gold = word(0x81C0CC)
// $81C0D0: [32-bit] Adol's X-position; lower is left
//          0x42db5054 - Left of Gyvalva, halfway up the cliff
//          0x43c10000 - Middle of Gyvalva arena
//          0x42900000 - Left of this is illegal in Istersiva
//          0x43c8f9ef - Istersiva camera moves right
Adol_X = dword(0x81C0D0)
Hide = dword(0x81C0D0) <= 0x42900000
// $81C0D4: [32-bit] Adol's Y-position; lower is higher
//          0x44100000 - Top of the middle rock for Gyvalva
Adol_Y = dword(0x81C0D4)
Ditch = Adol_X > 0x43c10000 && Adol_Y > 0x44100000
// $81C0D8: [32-bit] Playtime of currently loaded file (Frames)
// $81C0E0: [8-bit] Ring "MP" (Max: 0xff)
RingMP = byte(0x81C0E0)
// $81C0E4: [32-bit] Currently equipped ring
//          0xffffffff - None
//          0x00 - Power Ring
//          0x01 - Shield Ring
//          0x02 - Timer Ring
//          0x03 - Heal Ring
//          0x04 - Protect Ring
Ring = dword(0x81C0E4)
// $81C0E8: [32-bit] Currently equipped sword
//          0xffffffff - None
//          0x05 - Shortsword
//          0x06 - Longsword
//          0x07 - Broadsword
//          0x08 - Bastard Sword
//          0x09 - Flame Sword
Sword = dword(0x81C0E8)
// $81C0EC: [32-bit] Currently equipped shield
//          0xffffffff - None
//          0x0a - Wood Shield
//          0x0b - Small Shield
//          0x0c - Large Shield
//          0x0d - Kite Shield
//          0x0e - Battle Shield
// $81C0F0: [32-bit] Currently equipped armor
//          0xffffffff - None
//          0x0f - Leather Armor
//          0x10 - Chainmail
//          0x11 - Scale Mail
//          0x12 - Plate Mail
//          0x13 - Battle Armor
// $81C0F4: [32-bit] Currently equipped item
//          0xffffffff - None
//          0x14 - Herb
//          0x15 - Brosha Elixir
//          0x16 - Mirror
//          0x17 - Amulet
//          0x18 - Oni Orb
Item = dword(0x81C0F4)
// $81C0F8: [8-bit] Power Ring; increase STR
//          b0 - Obtained
Power_Ring = bit0(0x81C0F8)
// $81c0fc: [8-bit] Shield Ring; increase DEF
//          b0 - Obtained
Shield_Ring = bit0(0x81c0fc)
// $81C100: [8-bit] Timer Ring; slows down enemies
//          b0 - Obtained
Timer_Ring = bit0(0x81C100)
// $81C104: [8-bit] Heal Ring; heals HP over time
//          b0 - Obtained
Heal_Ring = bit0(0x81C104)
// $81C108: [8-bit] Protect Ring; blocks all incoming attacks
//          b0 - Obtained
Protect_Ring = bit0(0x81C108)
// $81C10C: [8-bit] Shortsword (T1)
//          b0 - Obtained
Shortsword = bit0(0x81C10C)
// $81C110: [8-bit] Longsword (T2)
//          b0 - Obtained
Longsword = bit0(0x81C110)
// $81C114: [8-bit] Broadsword (T3)
//          b0 - Obtained
Broadsword = bit0(0x81C114)
// $81C118: [8-bit] Bastard Sword (T4)
//          b0 - Obtained
Bastard_Sword = bit0(0x81C118)
// $81C11C: [8-bit] Flame Sword (T5)
//          b0 - Obtained
Flame_Sword = bit0(0x81C11C)
SwordCount = measured(Shortsword + Longsword + Broadsword + Bastard_Sword + Flame_Sword + 1)
// $81C120: [8-bit] Wood Shield (T1)
//          b0 - Obtained
Wood_Shield = bit0(0x81C120)
// $81C124: [8-bit] Small Shield (T2)
//          b0 - Obtained
Small_Shield = bit0(0x81C124)
// $81C128: [8-bit] Large Shield (T3)
//          b0 - Obtained
Large_Shield = bit0(0x81C128)
// $81C12C: [8-bit] Kite Shield (T4)
//          b0 - Obtained
Kite_Shield = bit0(0x81C12C)
// $81C130: [8-bit] Battle Shield (T5)
//          b0 - Obtained
Battle_Shield = bit0(0x81C130)
ShieldCount = measured(Wood_Shield + Small_Shield + Large_Shield + Kite_Shield + Battle_Shield + 1)
// $81C134: [8-bit] Leather Armor (T1)
//          b0 - Obtained
Leather_Armor = bit0(0x81C134)
// $81C138: [8-bit] Chainmail (T2)
//          b0 - Obtained
Chainmail = bit0(0x81C138)
// $81C13C: [8-bit] Scale Mail (T3)
//          b0 - Obtained
Scale_Mail = bit0(0x81C13C)
// $81C140: [8-bit] Plate Mail (T4)
//          b0 - Obtained
Plate_Mail = bit0(0x81C140)
// $81C144: [8-bit] Battle Armor (T5)
//          b0 - Obtained
Battle_Armor = bit0(0x81C144)
ArmorCount = measured(Leather_Armor + Chainmail + Scale_Mail + Plate_Mail + Battle_Armor + 1)
// $81C148: [8-bit] Item - Total Herb (Max 0x01); heals HP
Herb = bit0(0x81C148)
// $81C14C: [8-bit] Item - Total Brosha Elixir (Max 0x03); fully restores Ring MP
Brosha = byte(0x81C14C)
// $81C150: [8-bit] Item - Total Illusionary Mirror (Max 0x03); freezes on-screen enemies
Mirror = byte(0x81C150)
// $81C154: [8-bit] Item - Total Amulet (Max 0x03); damages on-screen enemies
Amulet = byte(0x81C154)
// $81C158: [8-bit] Item - Oni Orb; illuminates the dark when equipped
//          b0 - Obtained
Oni_Orb = bit0(0x81C158)
// $81C15C: [8-bit] Statue - Setting Sun
//          bit0 - Obtained
// $81C160: [8-bit] Statue - Starry Sculpture
//          bit0 - Obtained
// $81C164: [8-bit] Statue -  White Light
//          bit0 - Obtained
// $81C168: [8-bit] Statue - Darkness
//          bit0 - Obtained
// $81C16C: [8-bit] Event Item - Storeroom Key (Tegrey Quarry)
//          bit0 - Obtained
// $81C170: [8-bit] Event Item - Necklace (Tegrey Quarry)
//          bit0 - Obtained
// $81C174: [8-bit] Event Item - Fire Dragon Scale (Ilverns Volcano); calms lava
//          bit0 - Obtained
// $81C178: [8-bit] Event Item - Tablet (Tegrey Quarry Pt. 2)
//          bit0 - Obtained
// $81C17C: [8-bit] Event Item - Staff of Judgement (Eldarm Mountains); unlocks the next path forward after Ligaty
//          bit0 - Obtained
// $81C180: [8-bit] Event Item - Crimson Bracelet (Ballastein Castle)
//          bit0 - Obtained
// $81C184: [8-bit] Event Item - Dungeon Key (Ballastein Castle)
//          bit0 - Obtained
// $81C188: [8-bit] Event Item - Clock Tower Key (Ballastein Castle)
//          bit0 - Obtained
// $81C18C: [8-bit] Event Item - Crest of the Nightmare (Ballastein Castle)
//          bit0 - Obtained
// $81C190: [8-bit] Event Item - Spirit's Necklace (Redmont City Shop / Galbaran's Island); revives user if HP is brought to 0
//          bit0 - Obtained
Spirit_Necklace = bit0(0x81C190)
// $81C194: [8-bit] Event Item - Edgar's Letter (Redmont City)
//          bit0 - Obtained
// $81C198: [8-bit] Event Item - Shining Crystal (Tegrey Quarry Pt. 2); allows purchase of Brosha Elixir in item shop
//          bit0 - Obtained
// $81C1E4: [8-bit] Screen Effect - Mirror Active; everything but monsters and player goes grayscale
//          0x00 - Normal | 0x01 = Grayscale
MirrorActive = bit0(0x81C1E4)
// $81C2D4: [8-bit] Most recently entered room?
// $81C2F3: [8-bit] Enemy state; can be used for bosses except for Garland (castle)
//          0x00 - Boss is dormant
//          0x01 - Boss is waking up / in aggro range / neutral attack status
//          ---
//          Elfeilu
//          0x02 - Winding up Energy Blast
//          0x03 - First shot of Energy Blast
//          0x04 - Second Shot of Energy Blast
//          0x05 - Laser attack charging/firing
//          0x06 - Laser attack reaches the end point
Boss_State = byte(0x81C2F3)
// $81C300: [32-bit] X-position of enemy (lower is left); can be used for bosses except for Garland (castle)
Enemy_X = dword(0x81C300)
// $81C318: [16-bit] Boss HP; 0xfe when fight starts
//          -- Includes all bosses except for Garland (Castle) and Galbaran
Boss_HP = word(0x81C318)
// $81C31E: [16-bit] Frames remaining until current boss idle or attack phase ends; is 0x00 until boss is engaged
// $81C383: [8-bit] Enemy state; can be used for Garland (castle); flips back to 0x00 after scene and before the boss becomes aggressive
//          0x00 - Boss is dormant
//          0x01 - Boss is waking up / in aggro range / in cutscene
GarlandC_State = byte(0x81C383)
// $81C3A8: [16-bit] Garland (Castle) boss HP / Galbaran Main Body HP; 0xfe when fight starts
GarlandC_Galbaran_HP = byte(0x81C3A8)
// $823642: [8-bit] Player invincibility frames remaining after being hit; starts at 0x78 and counts down once every frame
// $823643: [8-bit] Adol's STR
STR = byte(0x823643)
// $823644: [8-bit] Adol's DEF
// $823646: [16-bit] Adol's Max HP (Max: 0xff)
// $823648: [16-bit] Total EXP needed to reach the next level (Max: 0xffff)
// $823664: [32-bit] Adol's control status
//          0x00 - Not in control of Adol; usually in menus or when boss is dying
//          0x01 - Player has control of Adol
// $823674: [8-bit] Ring MP consumption timer; counts up every frame to specified value per ring and flips back to 0x00 once upper limit is reached and 1MP is deducted when the count starts again
//          0x2f - Power Ring / Shield Ring
//          0x11 - Timer Ring
//          0x08 - Heal Ring
//          0x04 - Shield Ring
// $823680: [32-bit] Adol's action pointer
//          +64 = [32-bit] Adol's animation state
//          -- 0x03 - Up-stab; facing right
//          -- 0x1d - Up-stab; facing left
//          -- 0x0a - Crouch-stab; facing right
//          -- 0x24 - Crouch-stab; facing left
//          -- 0x17 - Down-stab starting; facing right
//          -- 0x31 - Down-stab starting; facing left
//          +68 = [32-bit] Adol's action state
//          -- 0x01 - Jumping / Down-stab
//          -- 0x02 - Starting frame of down-stab / Last frame of standing slash / Changing direction during down-stab
//          -- 0x04 - Idle / Crouch
//          -- 0x06 - Up-slash / Crouch slash
//          -- 0x07 - Aerial slash
//          -- 0x0a - Moving either direction
//          -- 0x0b - Down stab hitting the ground (blue shockwave animation)
//          -- 0x22 - Standing slash (And combo)
function Adol_Action() => dword(dword(0x823680) + 0x68)
function Adol_Animation() => dword(dword(0x823680) + 0x64)
function DownStab() => never(Adol_Action() == 7) && never(Adol_Action() == 0x22) &&
            never(Adol_Animation() == 3) && never(Adol_Animation() == 0x1d) && never(Adol_Animation() == 0x0a) && never(Adol_Animation() == 0x24)
function DownStabLB() => Adol_Action() == 7 || Adol_Action() == 0x22 || Adol_Animation() == 3 ||
            Adol_Animation() == 0x1d || Adol_Animation() == 0x0a || Adol_Animation() == 0x24
function NoAttack() => never(Adol_Action() == 7) && never(Adol_Action() == 0x22) && never(Adol_Action() == 0x0b) &&
            never(Adol_Animation() == 3) && never(Adol_Animation() == 0x1d) && never(Adol_Animation() == 0x0a) && never(Adol_Animation() == 0x24) &&
            never(Adol_Animation() == 0x17) && never(Adol_Animation() == 0x31)
// $8236B0: [32-bit] Current level
//          0x00 - Redmont City
//          0x01 - Tegrey Quarry
//          0x02 - Ilverns Ruins
//          0x03 - Ilverns Volcano
//          0x04 - Tegrey Quarry Part 2
//          0x05 - Eldarm Mountains
//          0x06 - Ballastein Castle
//          0x07 - Clock Tower
//          0x08 - Galbaran's Island
//          0x09 - Boss Rush
Stage = dword(0x8236B0)
StageLookup = {
    0: "Redmont City",
    1: "Tegrey Quarry",
    2: "the Ilverns Ruins",
    3: "the Ilverns Volcano",
    4: "the Tegrey Quarry Depths",
    5: "Eldarm Mountains",
    6: "Ballastein Castle",
    7: "the Clock Tower",
    8: "Galbaran's Island",
    9: "Boss Rush"
}
// $8236B4: [32-bit] Current Screen ID; each level starts with a Screen ID of 0x00
//          (Use with 0x8236b0 to determine current level)
//          ---
//          Level = 0x00 (Redmont City)
//          Range: 0x00~0x09
//          0x00 - Edge of town
//          0x01 - Town square
//          0x02 - Outside of the shops
//          0x03 - Outside of Inn/Edgar's House
//          0x04 - Outside of church
//          0x06 - Old lady's house (Shield ring)
//          0x07 - Inside of Inn
//          0x08 - Inside of Church
//          0x09 - Edgar's House (Timer Ring)
//          ---
//          Level = 0x01 (Tegrey Quarry)
//          Screen Range = 0x00~0x1a
//          Notable screens:
//          0x06 - Screen with door to Dularn
//          0x07 - Dularn arena
//          0x0e - Necklace (Event Item)
//          0x15 - Room with 5 green slugs
//          0x17 - Screen with door to Elfeilu
//          0x18 - Elfeilu arena
//          0x19 - Power Ring treasure
//          0x1a - Setting Sun statue
//          ---
//          Level = 0x02 (Ilverns Ruins)
//          Screen Range = 0x00~0x1c
//          Notable Screens:
//          0x0c - Small Shield treasure
//          0x1a - Screen before Gyalva
//          0x1b - Gyvala arena
//          0x1c - Starry Sculpture statue
//          ---
//          Level = 0x03 (Ilverns Volcano)
//          Screen Range = 0x00~0x10
//          Notable Screens:
//          0x06 - Infinite Herb spawn
//          0x0c - Screen before Girun
//          0x0f - Girun arena
//          ---
//          Level = 0x04 (Tegrey Quarry Part 2)
//          Screen Range = 0x01~0x12
//          Notable Screens:
//          0x07 - Shining Crystal treasure
//          0x0a - Tablet treasure
//          0x0f - Scale Mail treasure
//          0x10 - Room before Istersiva
//          0x11 - Istersiva arena
//          0x12 - White Light statue
//          ---
//          Level = 0x05 (Eldarm Mountains)
//          Screen Range = 0x00~0x1b
//          Notable Screens:
//          0x0c - Outside Dogi's Master's Cabin (Heal Ring)
//          0x0d - Dogi's Master's Cabin
//          0x14 - Screen before Ligaty
//          0x15 - Ligaty arena
//          0x16 - Screen before Gildias
//          0x1a - Gildias arena
//          0x1b - Darkness statue
//          ---
//          Level = 0x06 (Ballastein Castle)
//          Screen Range = 0x00~0x36
//          Notable Screens:
//          0x13 - Barrier screen
//          0x15 - Crimson Bracelet treasure
//          0x1c - Battle Shield treasure
//          0x1f - Screen before Death=Falwon
//          0x20 - Death=Falwon arena
//          0x25 - Battle Armor treasure
//          0x27 - Screen before Zelfel=Zam=Schtilger
//          0x28 - Zelfel=Zam=Schtilger arena
//          0x30 - Jail in the sewers
//          0x33 - Screen before Clock Tower
//          0x34 - Screen before Garland
//          0x35 - Garland arena
//          0x36 - Cutscene room with McGuire; obtain Crest of the Nightmare
//          ---
//          Level = 0x07 (Clock Tower)
//          Screen Range = 0x01~0x04
//          Notable Screens:
//          0x01 - Protect Ring treasure
//          0x02 - Flame Sword treasure
//          ---
//          Level = 0x08 (Galbaran's Island)
//          Screen Range = 0x00~0x29
//          Notable Screens:
//          0x17 - Screen before Garland Rematch
//          0x1f - Spirit's Necklace treasure; always available if Adol does not have one
//          0x20 - Garland Rematch arena
//          0x22 - Screen before Galaran
//          0x23 - Galbaran arena
//          ---
//          Level = 0x09 (Boss Rush)
//          Screen Range = 0x01~0x0c
//          Notable Screens:
//          0x01 - Dularn
//          0x02 - Elfeilu
//          0x03 - Girun
//          0x04 - Gyalva
//          0x05 - Istersiva
//          0x06 - Ligaty
//          0x07 - Gildias
//          0x08 - Death=Falwon
//          0x09 - Zelfel=Zam=Schtilger
//          0x0a - Garland (Castle)
//          0x0b - Garland (Island)
//          0x0c - Galbaran
Screen = dword(0x8236B4)
BRLookup = {
    1: "Dularn",
    2: "Elfeilu",
    3: "Girun",
    4: "Gyalva",
    5: "Istersiva",
    6: "Ligaty",
    7: "Gildias",
    8: "Death=Falwon",
    9: "Zelfel=Zam=Schtilger",
    10: "Garland (Castle)",
    11: "Garland (Island)",
    12: "Galbaran"
}
// $8236B8: [32-bit] Camera position; jumps to roughly 0x4000000 when the position is not all the way left
//          0x00000000 - All the way left
//          0x44200000 - All the way right
Camera = dword(0x8236B8)
// $8405EC: [32-bit] Saved playtime of current slot (Frames)
// $845E84: [32-bit] Last save file selected on LOAD menu
//          0x00 - Slot 1 | 0x01 - Slot 2 | 0x02 - Slot 3 | 0x03 - Slot 4 |0x04 - Slot 5

None = 0xffffffff

function AllItems() =>
    sum_of(range(0x81c0f8,0x81C198,step=4), addr => dword(addr)/dword(addr))
    
function Items() =>
    sum_of(range(0x81C148,0x81C154,step=4), addr => dword(addr))
    
function NoItem() =>
    never(Herb < prev(Herb)) && never(Brosha < prev(Brosha)) && never(Mirror < prev(Mirror)) && never(Amulet < prev(Amulet))
    
function NoItemLB() => Herb < prev(Herb) || Brosha < prev(Brosha) || Mirror < prev(Mirror) || Amulet < prev(Amulet)

function InGame() => __ornext(Game_Status  == 1 || Shop == 2 || Shop == 3)
    
function boss(boss, stage, screen) => prev(boss) == 0 && boss == 1 && Stage == stage && Screen == screen && Game_Status ==1

function bosschallenge(boss, stage, screen, level) => prev(boss) == 0 && trigger_when(boss == 1) && //Stage == stage && Screen == screen && (redundancy with new reset)
            Game_Status == 1 && Adol_Level <= level && never(Adol_HP ==0) && never(Stage != stage) && never(Screen != screen)

function BossStart() => once(Boss_HP == 0xfe && prev(Boss_State) == 0 && Boss_State == 1)

function GarlandCStart() => once(GarlandC_Galbaran_HP == 0xfe && prev(GarlandC_State) == 0 && GarlandC_State == 1)

function GarlandIStart() => once(Boss_HP == 0xfe && prev(Boss_State) == 0 && Boss_State == 2)

function GalbaranStart() => once(GarlandC_Galbaran_HP == 0xfe && prev(Boss_State) == 0 && Boss_State == 1)

function BossLBStart(stage,screen,level) => Boss_HP == 0xfe && prev(Boss_State) == 0 && Boss_State == 1 &&
         Stage == stage && Screen == screen && Game_Status == 1 && Adol_Level <= level && Difficulty == 2
         
function BossLBSubmit(boss) => prev(boss) == 0 && boss ==1 && Game_Status ==1
         
function GarlandCLBStart(stage,screen,level) => GarlandC_Galbaran_HP == 0xfe && prev(GarlandC_State) == 0 && GarlandC_State == 1 &&
         Stage == stage && Screen == screen && Game_Status == 1 && Adol_Level <= level && Difficulty == 2
         
function GarlandILBStart(stage,screen,level) => Boss_HP == 0xfe && prev(Boss_State) == 0 && Boss_State == 2 &&
         Stage == stage && Screen == screen && Game_Status == 1 && Adol_Level <= level && Difficulty == 2
         
function GalbaranLBStart(stage,screen,level) => GarlandC_Galbaran_HP == 0xfe && prev(Boss_State) == 0 && Boss_State == 1 &&
         Stage == stage && Screen == screen && Game_Status == 1 && Adol_Level <= level && Difficulty == 2

function levelchallenge(stage, start, stage_end, d_end, end) => once(Stage == stage && Screen == start) && trigger_when(Stage == stage_end && prev(Screen) == d_end &&
            Screen == end) && never(Adol_HP < prev(Adol_HP)) && never(Ring != None) && never(Game_Status != 1) && never(MirrorActive == 1 && Stage == stage && Screen == start)

function levelchallengeclock(stage, d_start, start, stage_end, d_end, end) => once(Stage == stage && prev(Screen) == d_start && Screen == start) && 
            trigger_when(Stage == stage_end && prev(Screen) == d_end && Screen == end) && never(Adol_HP < prev(Adol_HP)) && never(Ring != None) && never(Game_Status != 1) &&
            never(MirrorActive == 1 && Stage == stage && Screen == start)
         
//commented out all the ResetBoss functions in order to put better resets in bosschallenge function
function ResetBoss(stage,screen) => never(Stage == stage && Screen == screen)

function ResetLBBoss(stage,screen) => Stage != stage || Screen != screen

function ResetLevel(stage,d_start,start) => never(Stage == stage && prev(Screen) == d_start && Screen == start)

function BossRush() => Stage == 9 && Screen == 0x0c && BossCheck() && RecentRush != prev(RecentRush) && Game_Status == 1

achievement(
    title = "action pointer", points = 0,
    description = "",
    trigger = dword(dword(0x823680) + 0x000068) == 0xB2DD10 && SwordCount
)
achievement(
    title = "test", points = 0,
    description = "",
    trigger = byte((byte(0x4424)-1)*0x1f4) + byte(0x4415a) == 1
)
achievement(
    title = "Adventuring Starter Kit", points = 3,
    description = "Purchase the Shortsword, Leather Armor, Wood Shield, and Herb from the shops in Redmont. Now you're ready for an adventure!",
    trigger = prev(Shortsword + Wood_Shield + Leather_Armor + Herb) == 3 &&
            measured(Shortsword + Wood_Shield + Leather_Armor + Herb == 4) &&
            Stage == 0 && Screen == 2 && InGame()
)
achievement(
    title = "Storeroom Surprise", points = 5,
    description = "Defeat Dularn in the Tegrey Quarry. Don't forget to pick up his sword!",
    trigger = boss(Dularn,1,7)
)

achievement(
    title = "The Creeping Shadow", points = 10,
    description = "Defeat Dularn on Hard. [Level <= 4, No Mirror]",
    trigger = bosschallenge(Dularn,1,7,4) && BossStart() && //ResetBoss(1,6) &&
            Difficulty == 2 && never(Mirror < prev(Mirror)) 
)

achievement(
    title = "Artful Dodger", points = 25,
    description = "Defeat Dularn on Hard without taking damage. [Level <= 4, No Rings, No Items]",
    trigger = bosschallenge(Dularn,1,7,4) && BossStart() && //ResetBoss(1,6) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP))
)

leaderboard(
    id = 0, lower_is_better=true, title = "Dularn",
    description = "Defeat Dularn on Hard as fast as you can. [Level <= 4, No Mirror]",
    start  = BossLBStart(1,7,4),
    cancel = __ornext(ResetLBBoss(1,7) || Adol_HP == 0 || Mirror < prev(Mirror)),
    submit = BossLBSubmit(Dularn),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Dularn Master",
    description = "Defeat Dularn on Hard as fast as you can without taking damage. [Level <=4, No Rings, No Items]",
    start  = BossLBStart(1,7,4),
    cancel = __ornext(ResetLBBoss(1,7) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB()),
    submit = BossLBSubmit(Dularn),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Sky-Blue Sentinel", points = 5,
    description = "Defeat Elfeilu in the Tegrey Quarry.",
    trigger = boss(Elfeilu,1,0x18)
)

achievement(
    title = "The Azure Queen of Death", points = 5,
    description = "Defeat Elfeilu on Hard. [Level <= 5, No Rings]",
    trigger = bosschallenge(Elfeilu,1,0x18,5) && BossStart() && //ResetBoss(1,0x17) &&
            Difficulty == 2 && never(Ring != None)
)

//need to give leeway for attack
achievement(
    title = "Laser Light Show", points = 10,
    description = "Defeat Elfeilu on Hard without taking damage or letting her use an Energy Blast after the first attack. [Level <= 5, No Rings, No Items]",
    trigger = bosschallenge(Elfeilu,1,0x18,5) && BossStart() && //ResetBoss(1,0x17) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP)) &&
            never(tally(75, Boss_State > 0) && Boss_State == 2)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Elfeilu",
    description = "Defeat Elfeilu on Hard as fast as you can. [Level <= 5, No Rings]",
    start  = BossLBStart(1,0x18,5),
    cancel = __ornext(ResetLBBoss(1,0x18) || Adol_HP == 0 || Ring != None),
    submit = BossLBSubmit(Elfeilu),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Elfeilu Master",
    description = "Defeat Elfeilu on Hard as fast as you can without taking damage or letting her use an Energy Blast after the first attack. [Level <= 5, No Rings, No Items]",
    start  = BossLBStart(1,0x18,5),
    cancel = ResetLBBoss(1,0x18) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB() || tally(75, Boss_State > 0 && never(ResetLBBoss(1,0x18))) && Boss_State == 2,
    submit = BossLBSubmit(Elfeilu),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Scorching Serpent", points = 5,
    description = "Defeat Girun in the Ilverns Volcano.",
    trigger = boss(Girun,3,0x0f)
)

achievement(
    title = "The Fire Eater", points = 10,
    description = "Defeat Girun on Hard. [Level <= 7, No Rings, No Mirror]",
    trigger = bosschallenge(Girun,3,0x0f,7) && BossStart() && //ResetBoss(3,0x0c) &&
            Difficulty == 2 && never(Ring != None) && never(Mirror < prev(Mirror))
)

achievement(
    title = "Digging for Wyrms", points = 10,
    description = "Defeat Girun on Hard without taking damage in 50 seconds or less. [Level <= 7, No Rings, No Items]",
    trigger = bosschallenge(Girun,3,0x0f,7) && BossStart() && //ResetBoss(3,0x0c) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP)) && never(tally(3001, Boss_State > 0)) 
)

leaderboard(
    id = 0, lower_is_better=true, title = "Girun",
    description = "Defeat Girun on Hard as fast as you can. [Level <= 7, No Rings, No Mirror]",
    start  = BossLBStart(3,0x0f,7),
    cancel = __ornext(ResetLBBoss(3,0x0f) || Adol_HP == 0 || Ring != None || Mirror < prev(Mirror)),
    submit = BossLBSubmit(Girun),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Girun Master",
    description = "Defeat Girun on Hard as fast as you can without taking damage. [Level <= 7, No Rings, No Items]",
    start  = BossLBStart(3,0x0f,7),
    cancel = __ornext(ResetLBBoss(3,0x0f) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB()),
    submit = BossLBSubmit(Girun),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Winged Warden", points = 5,
    description = "Defeat Gyalva in the Ilverns Ruins.",
    trigger = boss(Gyalva,2,0x1b)
)

achievement(
    title = "Lord of the Blazing Prison", points = 10,
    description = "Defeat Gyalva on Hard. [Level <= 8, No Rings]",
    trigger = bosschallenge(Gyalva,2,0x1b,8) && BossStart() && //ResetBoss(2,0x1a) &&
            Difficulty == 2 && never(Ring != None)
)

achievement(
    title = "Stay In Your Lane", points = 10,
    description = "Defeat Gyalva on Hard without taking damage or stepping into the rightmost ditch. [Level <= 8, No Rings, No Items]",
    trigger = bosschallenge(Gyalva,2,0x1b,8) && BossStart() && //ResetBoss(2,0x1a) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP)) &&
            never(Ditch)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Gyalva",
    description = "Defeat Gyalva on Hard as fast as you can. [Level <= 8, No Rings]",
    start  = BossLBStart(2,0x1b,8),
    cancel = __ornext(ResetLBBoss(2,0x1b) || Adol_HP == 0 || Ring != None),
    submit = BossLBSubmit(Gyalva),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Gyalva Master",
    description = "Defeat Gyalva on Hard as fast as you can without taking damage or stepping into the rightmost ditch. [Level <= 8, No Rings, No Items]",
    start  = BossLBStart(2,0x1b,8),
    cancel = __ornext(ResetLBBoss(2,0x1b) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB() || Ditch),
    submit = BossLBSubmit(Gyalva),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Prismatic Protector", points = 5,
    description = "Defeat Istersiva in the Tegrey Quarry Depths.",
    trigger = boss(Istersiva,4,0x11)
)

achievement(
    title = "The Crystalline Entity", points = 10,
    description = "Defeat Istersiva on Hard. [Level <= 9, No Rings, No hiding under the boss]",
    trigger = bosschallenge(Istersiva,4,0x11,9) && BossStart() && //ResetBoss(4,0x10) &&
            Difficulty == 2 && never(Ring != None) && never(Hide)
)

achievement(
    title = "Embodiment of Crimson Devil", points = 25,
    description = "Defeat Istersiva on Hard without taking damage or letting the camera scroll to the right. [Level <= 9, No Rings, No Items, No hiding under the boss]",
    trigger = bosschallenge(Istersiva,4,0x11,9) && BossStart() && //ResetBoss(4,0x10) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP)) && never(Hide) &&
            never(Camera > prev(Camera))
)

leaderboard(
    id = 0, lower_is_better=true, title = "Istersiva",
    description = "Defeat Istersiva on Hard as fast as you can. [Level <= 9, No Rings, No hiding under the boss]",
    start  = BossLBStart(4,0x11,9),
    cancel = __ornext(ResetLBBoss(4,0x11) || Adol_HP == 0 || Ring != None || Hide),
    submit = BossLBSubmit(Istersiva),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Istersiva Master",
    description = "Defeat Istersiva on Hard as fast as you can without taking damage or letting the camera scroll to the right. [Level <= 9, No Rings, No Items, No hiding under the boss]",
    start  = BossLBStart(4,0x11,9),
    cancel = __ornext(ResetLBBoss(4,0x11) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB() || Hide || Camera > prev(Camera)),
    submit = BossLBSubmit(Istersiva),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Hovering Harpy", points = 5,
    description = "Defeat Ligaty in the Eldarm Mountains.",
    trigger = boss(Ligaty,5,0x15)
)

achievement(
    title = "The Flying Fury", points = 10,
    description = "Defeat Ligaty on Hard. [Level <= 10, No Rings, No Mirror]",
    trigger = bosschallenge(Ligaty,5,0x15,10) && BossStart() && //ResetBoss(5,0x14) &&
            Difficulty == 2 && never(Ring != None) &&
            never(Mirror < prev(Mirror))
)

achievement(
    title = "Swift Slayer", points = 10,
    description = "Defeat Ligaty on Hard without taking damage in under 1 minute. [Level <= 10, No Rings, No Items]",
    trigger = bosschallenge(Ligaty,5,0x15,10) && BossStart() && //ResetBoss(5,0x14) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP) && Boss_HP != 0) && never(tally(3601, Boss_State > 0)) 
)

leaderboard(
    id = 0, lower_is_better=true, title = "Ligaty",
    description = "Defeat Ligaty on Hard as fast as you can. [Level <= 10, No Rings, No Mirror]",
    start  = BossLBStart(5,0x15,10),
    cancel = __ornext(ResetLBBoss(5,0x15) || Adol_HP == 0 || Ring != None || Mirror < prev(Mirror)),
    submit = BossLBSubmit(Ligaty),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Ligaty Master",
    description = "Defeat Ligaty on Hard as fast as you can without taking damage. [Level <= 10, No Rings, No Items]",
    start  = BossLBStart(5,0x15,10),
    cancel = __ornext(ResetLBBoss(5,0x15) || (Adol_HP < prev(Adol_HP) && Boss_HP != 0) || Ring != None || NoItemLB()),
    submit = BossLBSubmit(Ligaty),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Deepfreeze Dragon", points = 5,
    description = "Defeat Gildias in the Eldarm Mountains.",
    trigger = boss(Gildias,5,0x1a)
)

achievement(
    title = "Guardian of the Icy Depths", points = 10,
    description = "Defeat Gildias on Hard. [Level <= 11, No Rings]",
    trigger = bosschallenge(Gildias,5,0x1a,11) && BossStart() && //ResetBoss(5,0x16) &&
            Difficulty == 2 && never(Ring != None)
)

achievement(
    title = "I Don't Need Combos!", points = 10,
    description = "Defeat Gildias on Hard without taking damage while using the Broken Sword (ATK+0). [Level <= 11, No Rings, No Items]",
    trigger = bosschallenge(Gildias,5,0x1a,11) && BossStart() && //ResetBoss(5,0x16) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP)) && never(Sword != None)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Gildias",
    description = "Defeat Gildias on Hard. [Level <= 11, No Rings]",
    start  = BossLBStart(5,0x1a,11),
    cancel = __ornext(ResetLBBoss(5,0x1a) || Adol_HP == 0 || Ring != None),
    submit = BossLBSubmit(Gildias),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Gildias Master",
    description = "Defeat Gildias on Hard as fast as you can without taking damage while using the Broken Sword (ATK+0). [Level <= 11, No Rings, No Items]",
    start  = BossLBStart(5,0x1a,11),
    cancel = __ornext(ResetLBBoss(5,0x1a) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB() || Sword != None),
    submit = BossLBSubmit(Gildias),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Halberd Hurricane", points = 5,
    description = "Defeat Death=Falwon at Ballastein Castle.",
    trigger = boss(Death_Falwon,6,0x20)
)

achievement(
    title = "The Armored Assassin", points = 10,
    description = "Defeat Death=Falwon on Hard. [Level <= 12, No Rings]",
    trigger = bosschallenge(Death_Falwon,6,0x20,12) && BossStart() && //ResetBoss(6,0x1f) &&
            Difficulty == 2 && never(Ring != None)
)

achievement(
    title = "Aim for the Neck", points = 10,
    description = "Defeat Death=Falwon on Hard without taking damage or jumping over the boss. [Level <= 12, No Rings, No Items]",
    trigger = bosschallenge(Death_Falwon,6,0x20,12) && BossStart() && //ResetBoss(6,0x1f) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP)) && never(Adol_X > Enemy_X)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Death=Falwon",
    description = "Defeat Death=Falwon on Hard as fast as you can. [Level <= 12, No Rings]",
    start  = BossLBStart(6,0x20,12),
    cancel = __ornext(ResetLBBoss(6,0x20) || Adol_HP == 0 || Ring != None),
    submit = BossLBSubmit(Death_Falwon),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Death=Falwon Master",
    description = "Defeat Death=Falwon on Hard as fast as you can without taking damage or jumping over the boss. [Level <= 12, No Rings, No Items]",
    start  = BossLBStart(6,0x20,12),
    cancel = __ornext(ResetLBBoss(6,0x20) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB() || Adol_X > Enemy_X),
    submit = BossLBSubmit(Death_Falwon),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Dashing Demon Dog", points = 5,
    description = "Defeat Zelfel=Zam=Schtilger at Ballastein Castle.",
    trigger = boss(Fire_Dog,6,0x28)
)

achievement(
    title = "The Savage Mongrel", points = 10,
    description = "Defeat Zelfel=Zam=Schtilger on Hard. [Level <= 13, No Rings]",
    trigger = bosschallenge(Fire_Dog,6,0x28,13) && BossStart() && //ResetBoss(6,0x27) &&
            Difficulty == 2 && never(Ring != None)
)

achievement(
    title = "Take the Plunge", points = 10,
    description = "Defeat Zelfel=Zam=Schtilger on Hard without taking damage while only using down-stab attacks. [Level <= 13, No Rings, No Items]",
    trigger = bosschallenge(Fire_Dog,6,0x28,13) && BossStart() && //ResetBoss(6,0x27) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP) && Boss_HP != 0) && DownStab()
)

leaderboard(
    id = 0, lower_is_better=true, title = "Zelfel=Zam=Schtilger",
    description = "Defeat Zelfel=Zam=Schtilger on Hard as fast as you can. [Level <= 13, No Rings]",
    start  = BossLBStart(6,0x28,13),
    cancel = __ornext(ResetLBBoss(6,0x28) || Adol_HP == 0 || Ring != None),
    submit = BossLBSubmit(Fire_Dog),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Zelfel=Zam=Schtilger Master",
    description = "Defeat Zelfel=Zam=Schtilger on Hard as fast as you can without taking damage while only using down-stab attacks. [Level <= 13, No Rings, No Items]",
    start  = BossLBStart(6,0x28,13),
    cancel = __ornext(ResetLBBoss(6,0x28) || (Adol_HP < prev(Adol_HP) && Boss_HP != 0) || Ring != None || NoItemLB() || DownStabLB()),
    submit = BossLBSubmit(Fire_Dog),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Blasphemous Bishop", points = 5,
    description = "Defeat Garland at Ballastein Castle.",
    trigger = boss(GarlandC,6,0x35)
)

achievement(
    title = "This Isn't Even My Final Form", points = 10,
    description = "Defeat Garland at Ballastein Castle on Hard. [Level <= 14, No Rings]",
    trigger = bosschallenge(GarlandC,6,0x35,14) && GarlandCStart() && //ResetBoss(6,0x34) &&
            Difficulty == 2 && never(Ring != None)
)

achievement(
    title = "Practice Round", points = 10,
    description = "Defeat Garland at Ballastein Castle on Hard without taking damage. [Level <=14, No Rings, No Items]",
    trigger = bosschallenge(GarlandC,6,0x35,14) && GarlandCStart() && //ResetBoss(6,0x34) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP))
)

leaderboard(
    id = 0, lower_is_better=true, title = "Garland (Castle)",
    description = "Defeat Garland at Ballastein Castle on Hard as fast as you can. [Level <= 14, No Rings]",
    start  = GarlandCLBStart(6,0x35,14),
    cancel = __ornext(ResetLBBoss(6,0x35) || Adol_HP == 0 || Ring != None),
    submit = BossLBSubmit(GarlandC),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Garland (Castle) Master",
    description = "Defeat Garland at Ballastein Castle on Hard as fast as you can without taking damage. [Level <=14, No Rings, No Items]",
    start  = GarlandCLBStart(6,0x35,14),
    cancel = __ornext(ResetLBBoss(6,0x35) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB()),
    submit = BossLBSubmit(GarlandC),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Conniving Kidnapper", points = 5,
    description = "Defeat Garland on Galbaran's Island.",
    trigger = boss(GarlandI,8,0x20)
)

achievement(
    title = "The Dark Bishop", points = 10,
    description = "Defeat Garland on Galbaran's Island on Hard. [No Rings, No Elixir]",
    trigger = bosschallenge(GarlandI,8,0x20,16) && GarlandIStart() && //ResetBoss(8,0x17) &&
            Difficulty == 2 && never(Ring != None)
)

achievement(
    title = "Celestial Sidestepper", points = 25,
    description = "Defeat Garland on Galbaran's Island on Hard without taking damage. [Power Ring OK, No Items]",
    trigger = bosschallenge(GarlandI,8,0x20,16) && GarlandIStart() && //ResetBoss(8,0x17) &&
            Difficulty == 2 && NoItem() && never(Adol_HP < prev(Adol_HP)) && never(Ring != None && Ring != 0)
)

leaderboard(
    id = 0, lower_is_better=true, title = "Garland (Island)",
    description = "Defeat Garland on Galbaran's Island on Hard as fast as you can. [No Rings, No Elixir]",
    start  = GarlandILBStart(8,0x20,16),
    cancel = __ornext(ResetLBBoss(8,0x20) || Adol_HP == 0 || Ring != None),
    submit = BossLBSubmit(GarlandI),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Garland (Island) Master",
    description = "Defeat Garland on Galbaran's Island on Hard as fast as you can without taking damage. [Power Ring OK, No Items]",
    start  = GarlandILBStart(8,0x20,16),
    cancel = __ornext(ResetLBBoss(8,0x20) || Adol_HP < prev(Adol_HP) || (Ring != None && Ring != 0) || NoItemLB()),
    submit = BossLBSubmit(GarlandI),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Destructive Demon", points = 10,
    description = "Defeat Galbaran on his island. Felghana is safe again!",
    trigger = boss(Galbaran,8,0x23)
)

achievement(
    title = "Sinister Marauder From Afar", points = 10,
    description = "Defeat Galbaran on Hard. [No Rings, No Elixir]",
    trigger = bosschallenge(Galbaran,8,0x23,16) && GalbaranStart() && //ResetBoss(8,0x22) &&
            Difficulty == 2 && never(Ring != None)
)

achievement(
    title = "Warrior of Legend", points = 25,
    description = "Defeat Galbaran on Hard without taking damage. [No Rings, No Items]",
    trigger = bosschallenge(Galbaran,8,0x23,16) && GalbaranStart() && //ResetBoss(8,0x22) &&
            Difficulty == 2 && never(Ring != None) &&
            NoItem() && never(Adol_HP < prev(Adol_HP))
)

leaderboard(
    id = 0, lower_is_better=true, title = "Galbaran",
    description = "Defeat Galbaran on Hard as fast as you can. [No Rings, No Elixir]",
    start  = GalbaranLBStart(8,0x23,16),
    cancel = __ornext(ResetLBBoss(8,0x23) || Adol_HP == 0 || Ring != None),
    submit = BossLBSubmit(Galbaran),
    value = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 0, lower_is_better=true, title = "Galbaran Master",
    description = "Defeat Galbaran on Hard as fast as you can without taking damage. [No Rings, No Items]",
    start  = GalbaranLBStart(8,0x23,16),
    cancel = __ornext(ResetLBBoss(8,0x23) || Adol_HP < prev(Adol_HP) || Ring != None || NoItemLB()),
    submit = BossLBSubmit(Galbaran),
    value = measured(always_true()),
    format = "FRAMES"
)

achievement(
    title = "Until Next Shipwreck", points = 10,
    description = "Say your good-byes in Redmont and bring your current adventure to a close. The Boss Rush awaits you on the Main Menu after the credits!",
    trigger = InGame() && prev(Credits) == 0 && Credits == 1 && BossCheck()
)

achievement(
    title = "Adol the Red", points = 25,
    description = "Say your good-byes in Redmont and bring your current adventure to a close on Hard.",
    trigger = InGame() && prev(Credits) == 0 && Credits == 1 && BossCheck() && Difficulty == 2
)

achievement(
    title = "Dusty Implements", points = 5,
    description = "Obtain the Longsword, Chainmail, and Small Shield.",
    trigger = prev(Longsword + Small_Shield + Chainmail) == 2 &&
             measured(Longsword + Small_Shield + Chainmail == 3) && InGame()
)

achievement(
    title = "A Few Sizes Too Big", points = 5,
    description = "Obtain the Broadsword, Scale Mail, and Large Shield.",
    trigger = prev(Broadsword + Large_Shield + Scale_Mail) == 2 && 
            measured(Broadsword + Large_Shield + Scale_Mail == 3) && InGame()
) 

achievement(
    title = "The Power of Friendship and Gold", points = 5,
    description = "Obtain the Bastard Sword, Plate Mail, and Kite Shield.",
    trigger = prev(Bastard_Sword + Kite_Shield + Plate_Mail) == 2 &&
            measured(Bastard_Sword + Kite_Shield + Plate_Mail == 3) && InGame()
)

achievement(
    title = "Peak Performance", points = 10,
    description = "Obtain the Flame Sword, Battle Armor, and Battle Shield.",
    trigger = prev(Flame_Sword + Battle_Shield + Battle_Armor) == 2 && 
            measured(Flame_Sword + Battle_Shield + Battle_Armor == 3) && InGame()
)

achievement(
    title = "A Little Overpowered", points = 3,
    description = "Find the Power Ring in a treasure chest in the Tegrey Quarry.",
    trigger = prev(Power_Ring) == 0 && Power_Ring == 1 &&
            Stage == 1 && Screen == 0x19 && Game_Status == 1
)

achievement(
    title = "Precious Protection [m]", points = 3,
    description = "Return the pendant found in Tegrey Quarry to the old lady in town and receieve the Shield Ring.",
    trigger = prev(Shield_Ring) == 0 && Shield_Ring == 1 &&
            Stage == 0 && Screen == 6 && Game_Status == 1
)

achievement(
    title = "All the Time in Za World", points = 2,
    description = "Receive the Timer Ring from Edgar after clearing the Ilverns Ruins.",
    trigger = prev(Timer_Ring) == 0 && Timer_Ring == 1 &&
            Stage == 0 && Screen == 9 && Game_Status == 1
)

achievement(
    title = "Revitalizing Bond", points = 2,
    description = "Receive the Heal Ring from Dogi after clearing the Eldarm Mountains.",
    trigger = prev(Heal_Ring) == 0 && Heal_Ring == 1 &&
            Stage == 5 && Screen == 0x0c && Game_Status == 1
)

achievement(
    title = "Absolute Defense", points = 3,
    description = "Find the Protect Ring in a treasure chest in the Clock Tower.",
    trigger = prev(Protect_Ring) == 0 && Protect_Ring == 1 &&
            Stage == 7 && Screen == 1 && Game_Status == 1
)

achievement(
    title = "Free Herbs With Local Pickup", points = 3,
    description = "Find the replenishing Herb growing on the rock walls of the Ilverns Volcano. (This only appears if you do not have an Herb in your inventory.)",
    trigger = prev(Herb) == 0 && Herb == 1 &&
            Stage == 3 && Screen == 6 && Game_Status == 1
)

achievement(
    title = "First One's Free", points = 3,
    description = "Bring the Shining Crystal found in the Tegrey Quarry Depths to the Item Shop in Redmont and receive your first Brosha Elixir.",
    trigger = prev(Brosha) == 0 && Brosha == 1 && Shop == 2 &&
            Stage == 0 && Screen == 2
)

achievement(
    title = "The Secret to Everlasting Life", points = 3,
    description = "Find the replenishing Spirit's Necklace in a treasure chest on Galbaran's Island. (Use your current one and re-enter the room if the treasure already appears as open.)",
    trigger = prev(Spirit_Necklace) == 0 && Spirit_Necklace == 1 &&
            Game_Status == 1 && Stage == 8 && Screen == 0x1f
)

achievement(
    title = "Spine of Steel [m]", points = 25,
    description = "Have at least one of every single item in the game. [Equipment, Statue, Event Item]",
    trigger = prev(AllItems()) == 40 && measured(AllItems() == 41) && InGame()
)

achievement(
    title = "Stealthy Spelunker", points = 10,
    description = "Reach Elfeilu's room from the start of Tegrey Quarry without taking damage, attacking, or going into a menu on the way. (Quick select OK) [No Rings, 1 Mirror allowed]",
    trigger = levelchallenge(1,0,1,0x17,0x18) && ResetLevel(1,1,0) && never(tally(2,Mirror < prev(Mirror))) && never(Amulet < prev(Amulet)) && NoAttack() && Dularn == 1
)

achievement(
    title = "Fleet-Footed Fire Dancer", points = 25,
    description = "Reach Gyalva's room in the Ilverns Ruins from Girun's room in the Ilverns Volcano without taking damage, attacking, or going into a menu on the way. (Quick select OK) [No Rings, 2 Mirrors allowed]",
    trigger = levelchallenge(3,0x0f,2,0x1a,0x1b) && ResetLevel(3,0x0c,0x0f) && never(tally(3,Mirror < prev(Mirror))) && never(Amulet < prev(Amulet)) && NoAttack() && Girun == 1
)

achievement(
    title = "Arctic Acrobat", points = 10,
    description = "Reach Ligaty's area from the start of Eldarm Mountains without taking damage, attacking, or loading a save on the way. [No Rings, 1 Mirror allowed on Normal/Hard, 0 Mirror allowed on Easy]",
    trigger = levelchallenge(5,0,5,0x14,0x15) && ResetLevel(5,1,0) && NoAttack() && never(Amulet < prev(Amulet)) && 
            (never(Difficulty == 0 && Mirror < prev(Mirror)) || never(tally(2, Difficulty != 0 && Mirror < prev(Mirror))))
)

achievement(
    title = "Castle Crasher", points = 25,
    description = "Reach Death=Falwon's room from the start of Ballastein Castle without taking damage or loading a save on the way. [MAX STR: 210, No Rings, No Mirror, 1 Amulet allowed]",
    trigger = levelchallenge(6,0,6,0x1f,0x20) && ResetLevel(6,1,0) && STR <= 210 && never(Mirror < prev(Mirror)) &&
            never(tally(2, Amulet < prev(Amulet)))
)

achievement(
    title = "All Wound Up", points = 10,
    description = "Make it through the entire Clock Tower and reach the bridge before Garland without taking damage or loading a save on the way. [MAX STR: 210, No Rings, No Items]",
    trigger =  levelchallengeclock(7,0x33,1,6,4,0x34) && STR <= 210 && NoItem()
)

achievement(
    title = "Fighting Through the Dark", points = 10,
    description = "Reach Garland's room from the start of Galbaran's Island without taking damage or loading a save on the way. [No Rings, No Items other than Oni Orb]",
    trigger =  levelchallenge(8,0,8,0x17,0x20) && ResetLevel(6,1,0) && NoItem()
)

achievement(
    title = "Victory Lap", points = 10,
    description = "Complete the Boss Rush.",
    trigger =  BossRush()
)

achievement(
    title = "No Holding Back", points = 10,
    description = "Complete the Boss Rush in under 5 minutes.",
    trigger =  trigger_when(BossRush()) && Stage == 9 && Playtime <  18001
)

achievement(
    title = "Organic Ginger", points = 25,
    description = "Complete the Boss Rush without using Rings or Items.",
    trigger =  trigger_when(BossRush()) && Stage == 9 && Items() == 10 && Ring == None && RingMP == 0xff
)

achievement(
    title = "Crimson King", points = 25,
    description = "Complete the Boss Rush without using Rings or Items in under 7 minutes and 30 seconds.",
    trigger =  trigger_when(BossRush()) && Stage == 9 && Items() == 10 && Ring == None && RingMP == 0xff && Playtime < 27001
)

leaderboard(
    id = 111000002, lower_is_better=true, title = "Boss Rush",
    description = "Clear the Boss Rush as fast as you can.",
    start  = BossRush(),
    cancel = always_false(),
    submit = always_true(),
    value = RecentRush / 10 ,
    format = "MILLISECS"
)

leaderboard(
    id = 111000003, lower_is_better=true, title = "Boss Rush Master",
    description = "Clear the Boss Rush as fast as you can without using Rings or Items.",
    start  = BossRush() && Stage == 9 && Items() == 10 && Ring == None && RingMP == 0xff,
    cancel = always_false(),
    submit = always_true(),
    value = RecentRush / 10,
    format = "MILLISECS"
)

leaderboard(
    id = 111000004, lower_is_better=true, title = "Full Game - Easy",
    description = "Finish the game as fast as you can on Easy.",
    start  = InGame() && prev(Credits) == 0 && Credits == 1 && BossCheck() && Difficulty == 0,
    cancel = always_false(),
    submit = always_true(),
    value = Playtime,
    format = "FRAMES"
)

leaderboard(
    id = 111000005, lower_is_better=true, title = "Full Game - Normal",
    description = "Finish the game as fast as you can on Normal.",
    start  = InGame() && prev(Credits) == 0 && Credits == 1 && BossCheck() && Difficulty == 1,
    cancel = always_false(),
    submit = always_true(),
    value = Playtime,
    format = "FRAMES"
)

leaderboard(
    id = 111000006, lower_is_better=true, title = "Full Game - Hard",
    description = "Finish the game as fast as you can on Hard.",
    start  = InGame() && prev(Credits) == 0 && Credits == 1 && BossCheck() && Difficulty == 2,
    cancel = always_false(),
    submit = always_true(),
    value = Playtime,
    format = "FRAMES"
)

rich_presence_conditional_display(Game_State == 0 && Game_Status == 0 && Pause == 0 && Playtime == prev(Playtime),"Adol is on the Main Menu"
)

rich_presence_conditional_display(Game_State == 1 && Game_Status == 1 && Stage == 9 && Pause == 0 && Shop != 1 && Playtime == prev(Playtime), "Adol is on the Main Menu"
)

rich_presence_conditional_display(RushBest== 0x1b7740 && Stage == 9 && Items() == 10 && Ring == None && RingMP == 0xff,
    "Adol is challenging {0} in the Boss Rush without Rings or Items • Current: {1}",
        rich_presence_lookup("Boss", Screen, BRLookup),
        rich_presence_value("Time2", Playtime, format="FRAMES")
)

rich_presence_conditional_display(Stage == 9 && Items() == 10 && Ring == None && RingMP == 0xff,
    "Adol is challenging {0} in the Boss Rush without Rings or Items • Current: {1} • Last: {2} • Best: {3}",
        rich_presence_lookup("Boss", Screen, BRLookup),
        rich_presence_value("Time2", Playtime, format="FRAMES"),
        rich_presence_value("Rush", RecentRush/10, format="MILLISECS"),
        rich_presence_value("Rush", RushBest/10, format="MILLISECS")        
)

rich_presence_conditional_display(RushBest== 0x1b7740 && Stage == 9,
    "Adol is challenging {0} in the Boss Rush • Current: {1}",
        rich_presence_lookup("Boss", Screen, BRLookup),
        rich_presence_value("Time2", Playtime, format="FRAMES")
)

rich_presence_conditional_display(Stage == 9,
    "Adol is challenging {0} in the Boss Rush • Current: {1} • Last: {2} • Best: {3}",
        rich_presence_lookup("Boss", Screen, BRLookup),
        rich_presence_value("Time2", Playtime, format="FRAMES"),
        rich_presence_value("Rush", RecentRush/10, format="MILLISECS"),
        rich_presence_value("Rush", RushBest/10, format="MILLISECS")        
)
rich_presence_conditional_display(Game_Status == 1 && Game_State == 0 || Game_State == 3, 
    "[{0}] Adol is Level {1} and exploring {2} • ⚔️[{3}/6] 👚[{4}/6] 🛡️[{5}/6] 💰[{6}] 🕘[{7}m]",
        rich_presence_lookup("Difficulty", Difficulty, DifficultyLookup),
        rich_presence_value("Digit", Adol_Level, format="VALUE"),
        rich_presence_lookup("Stage", Stage, StageLookup),        
        rich_presence_value("Digit", SwordCount, format="VALUE"),
        rich_presence_value("Digit", ArmorCount, format="VALUE"),
        rich_presence_value("Digit", ShieldCount, format="VALUE"),
        rich_presence_value("Digit", Gold, format="VALUE"),
        rich_presence_value("Time", Playtime/3600, format="MINUTES")
)

rich_presence_conditional_display(Game_State == 4, "[{0}] Adol is Level {1} and in the menus • ⚔️[{2}/6] 👚[{3}/6] 🛡️[{4}/6] 💰[{5}] 🕘[{6}m]",
        rich_presence_lookup("Difficulty", Difficulty, DifficultyLookup),
        rich_presence_value("Digit", Adol_Level, format="VALUE"),               
        rich_presence_value("Digit", SwordCount, format="VALUE"),
        rich_presence_value("Digit", ArmorCount, format="VALUE"),
        rich_presence_value("Digit", ShieldCount, format="VALUE"),
        rich_presence_value("Digit", Gold, format="VALUE"),
        rich_presence_value("Time", Playtime/3600, format="MINUTES")
)

rich_presence_display("[{0}] Adol is Level {1} on the Overworld Map • ⚔️[{2}/6] 👚[{3}/6] 🛡️[{4}/6] 💰[{5}] 🕘[{6}m]",
    rich_presence_lookup("Difficulty", Difficulty, DifficultyLookup),
    rich_presence_value("Digit", Adol_Level, format="VALUE"),
    rich_presence_value("Digit", SwordCount, format="VALUE"),
    rich_presence_value("Digit", ArmorCount, format="VALUE"),
    rich_presence_value("Digit", ShieldCount, format="VALUE"),
    rich_presence_value("Digit", Gold, format="VALUE"),
    rich_presence_value("Time", Playtime/3600, format="MINUTES")
)
//Adol is Level {0} and exploring {1} || Sword: {2}/6 Armor: {3}/6 Shield: {4}/6 Gold: {5} Rank: {6} Playtime: {7}



