-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, ns = ...
local Map = ns.Map

local Dungeon = ns.pin.Dungeon
local Raid = ns.pin.Raid

-------------------------------------------------------------------------------

local naz = Map({id = 863, parent = 875}) -- Nazmir
local vol = Map({id = 864, parent = 875}) -- Vol'dun
local zul = Map({id = 862, parent = 875}) -- Zuldazar

-------------------------------------------------------------------------------
---------------------------------- DUNGEONS -----------------------------------
-------------------------------------------------------------------------------

naz.pins[5841] = Dungeon -- Underrot
vol.pins[5840] = Dungeon -- Temple of Sethraliss
zul.pins[5836] = Dungeon -- THE MOTHERLODE!! (Horde)
zul.pins[5837] = Dungeon -- THE MOTHERLODE!! (Alliance)
zul.pins[5838] = Dungeon -- Atal'Dazar
zul.pins[5839] = Dungeon -- Kings' Rest

-------------------------------------------------------------------------------
------------------------------------ RAIDS ------------------------------------
-------------------------------------------------------------------------------

naz.pins[5842] = Raid -- Uldir
zul.pins[6012] = Raid -- Battle of Dazar'alor (Horde)
