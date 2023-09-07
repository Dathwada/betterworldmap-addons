-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, ns = ...
local Map = ns.Map

local AncientWaygate = ns.pin.AncientWaygate
local DragonridingRally = ns.pin.DragonridingRally
local ElementalStorm = ns.pin.ElementalStorm
local FishingHole = ns.pin.FishingHole
local Pin = ns.pin.Pin
local ZaralekCavern = ns.pin.ZaralekCavern

-------------------------------------------------------------------------------

local map = Map({id = 2024, parent = 1978})

-------------------------------------------------------------------------------
----------------------------------- ISKAARA -----------------------------------
-------------------------------------------------------------------------------

map.pins[7393] = Pin({group = ns.groups.FACTION_TUSKARR}) -- Iskaara

-------------------------------------------------------------------------------
------------------------------ ANCIENT WAYGATES -------------------------------
-------------------------------------------------------------------------------

map.pins[2838] = AncientWaygate({coordinates = 51466802}) -- Cobalt Assembly
map.pins[2837] = AncientWaygate({coordinates = 63966829}) -- Vakthros

-------------------------------------------------------------------------------
------------------------------- COMMUNITY FEAST -------------------------------
-------------------------------------------------------------------------------

local CommunityFeast = Pin({group = ns.groups.COMMUNITY_FEAST}) -- Community Feast

map.pins[7218] = CommunityFeast -- Community Feast - Before
map.pins[7219] = CommunityFeast -- Community Feast - During
map.pins[7220] = CommunityFeast -- Community Feast - After

-------------------------------------------------------------------------------
------------------------------ DRAGONRIDING RALLY -----------------------------
-------------------------------------------------------------------------------

map.pins[7263] = DragonridingRally -- Azure Span Rally

-------------------------------------------------------------------------------
------------------------------- ELEMENTAL STORM -------------------------------
-------------------------------------------------------------------------------

map.pins[7229] = ElementalStorm -- Brakenhide Hollow - Thunderstorm
map.pins[7230] = ElementalStorm -- Brakenhide Hollow - Sandstorm
map.pins[7231] = ElementalStorm -- Brakenhide Hollow - Firestorm
map.pins[7232] = ElementalStorm -- Brakenhide Hollow - Snowstorm
map.pins[7233] = ElementalStorm -- Cobalt Assembly - Thunderstorm
map.pins[7234] = ElementalStorm -- Cobalt Assembly - Sandstorm
map.pins[7235] = ElementalStorm -- Cobalt Assembly - Firestorm
map.pins[7236] = ElementalStorm -- Cobalt Assembly - Snowstorm
map.pins[7237] = ElementalStorm -- Imbu - Thunderstorm
map.pins[7238] = ElementalStorm -- Imbu - Sandstorm
map.pins[7239] = ElementalStorm -- Imbu - Firestorm
map.pins[7240] = ElementalStorm -- Imbu - Snowstorm

-------------------------------------------------------------------------------
-------------------------------- FISHING HOLE ---------------------------------
-------------------------------------------------------------------------------

map.pins[7266] = FishingHole -- Grimtusks Fishing Hole

-------------------------------------------------------------------------------
-------------------------- ZARALEK CAVERN ENTRANCES ---------------------------
-------------------------------------------------------------------------------

map.pins[7469] = ZaralekCavern -- Lookout Breach
