-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, ns = ...
local L = ns.locale

local Group = ns.Group

local Pin = ns.pin.Pin

-------------------------------------------------------------------------------

ns.expansion = 10 -- Dragonflight
ns.chat_command = 'bwm-df'

-------------------------------------------------------------------------------
----------------------------------- GROUPS ------------------------------------
-------------------------------------------------------------------------------

ns.groups.ANCIENT_WAYGATES = Group({
    atlas = 'flightmaster_ancientwaygate-taxinode_neutral',
    label = L['ancient_waygate_label'],
    name = 'ancient_waygate',
    type = 'flightpoint'
}) -- Ancient Waygates

ns.groups.DRAGONRIDING_RALLY = Group({
    atlas = 'racing',
    label = L['dragonriding_rally_label'],
    name = 'dragonriding_rally'
}) -- Dragonriding Rally

ns.groups.ELEMENTAL_STORM = Group({
    atlas = 'ElementalStorm-Lesser-Fire',
    label = L['elemental_storm_label'],
    name = 'elemental_storm'
}) -- Elemental Storms

ns.groups.FISHING_HOLE = Group({
    atlas = 'Fishing-Hole',
    label = L['tuskarr_fishing_hole_label'],
    name = 'tuskarr_fishing_hole'
}) -- Tuskarr Fishing Holes

ns.groups.GRAND_HUNTS = Group({
    atlas = 'minimap-genericevent-hornicon',
    label = L['grand_hunt_label'],
    name = 'grand_hunt'
}) -- Grand Hunt

ns.groups.ZARALEK_CAVERN_ENTRANCES = Group({
    atlas = 'CaveUnderground-Down',
    label = L['zaralek_cavern_entrance_label'],
    name = 'zaralek_cavern_entrance'
}) -- Zaralek Cavern Entrances

------------------------------- THE WAKING SHORE ------------------------------

ns.groups.FACTION_EXPEDITION = Group({
    atlas = 'MajorFactions_MapIcons_Expedition64',
    label = L['faction_expedition'],
    name = 'faction_expedition',
}) -- Dragonscale Basecamp

ns.groups.DRAGONBANE_SIEGE = Group({
    atlas = 'minimap-genericevent-hornicon',
    label = L['siege_on_dragonbane_keep_label'],
    name = 'siege_on_dragonbane_keep'
}) -- Siege on Dragonbane Keep

------------------------------- OHN'AHRAN PLAINS ------------------------------

ns.groups.FACTION_CENTAUR = Group({
    atlas = 'MajorFactions_MapIcons_Centaur64',
    label = L['faction_centaur'],
    name = 'faction_centaur',
}) -- Maruukai

ns.groups.AYLAAG_CAMPS = Group({
    atlas = 'MajorFactions_MapIcons_Centaur64',
    label = L['aylaag_camp_label'],
    name = 'aylaag_camp'
}) -- Aylaag Camp

---------------------------------- AZURE SPAN ---------------------------------

ns.groups.FACTION_TUSKARR = Group({
    atlas = 'MajorFactions_MapIcons_Tuskarr64',
    label = L['faction_tuskarr'],
    name = 'faction_tuskarr',
}) -- Iskaara

ns.groups.COMMUNITY_FEAST = Group({
    atlas = 'MajorFactions_MapIcons_Tuskarr64',
    label = L['community_feast_label'],
    name = 'community_feast'
}) -- Community Feast

--------------------------------- THALDRASZUS ---------------------------------

ns.groups.FACTION_VALDRAKKEN = Group({
    atlas = 'MajorFactions_MapIcons_Valdrakken64',
    label = L['faction_valdrakken'],
    name = 'faction_valdrakken',
}) -- The Seat of the Aspects

ns.groups.GREAT_VAULT = Group({
    atlas = 'greatvault-dragonflight-32x32',
    label = L['great_vault_label'],
    name = 'great_vault'
}) -- Great Vault

ns.groups.STORMS_FURY = Group({
    atlas = 'ElementalStorm-Boss-Water',
    label = L['storms_fury_label'],
    name = 'storms_fury'
}) -- Storm's Fury

ns.groups.SECRETS_OF_AZEROTH = Group({
    atlas = 'minimap-genericevent-hornicon',
    label = L['secrets_of_azeroth_label'],
    name = 'secrets_of_azeroth',
    IsVisible = function()
        local us = ns.CalendarEventIsActive(1396)
        local eu = ns.CalendarEventIsActive(1398)
        local tw = ns.CalendarEventIsActive(1399)
        return us or eu or tw
    end
}) -- Secrets of Azeroth

ns.groups.TIME_RIFT = Group({
    atlas = 'minimap-genericevent-hornicon',
    label = L['time_rift_label'],
    name = 'time_rift'
}) -- Time Rift

----------------------------- THE FORBIDDEN REACH -----------------------------

ns.groups.FROSTSTONE_VAULT_STORM = Group({
    atlas = 'ElementalStorm-Boss-Air',
    label = L['froststone_vault_storm_label'],
    name = 'froststone_vault_storm'
}) -- Froststone Vault Primal Storm

-------------------------------- ZARALEK CAVERN -------------------------------

ns.groups.FACTION_NIFFEN = Group({
    atlas = 'MajorFactions_MapIcons_Niffen64',
    label = L['faction_niffen'],
    name = 'faction_niffen',
}) -- Loamm

ns.groups.RESEARCHERS_UNDER_FIRE = Group({
    atlas = 'minimap-genericevent-hornicon',
    label = L['researchers_under_fire'],
    name = 'researchers_under_fire'
}) -- Researchers Under Fire

-------------------------------- DRAGONRIDING ---------------------------------

ns.groups.KALIMDOR_CUP = Group({
    atlas = 'racing',
    label = L['kalimdor_cup'],
    name = 'kalimdor_cup',
    IsVisible = function()
        return ns.CalendarEventIsActive(1395)
    end
}) -- Kalimdor Cup

ns.groups.EASTERN_KINGDOMS_CUP = Group({
    atlas = 'racing',
    label = L['eastern_kingdoms_cup'],
    name = 'eastern_kingdoms_cup',
    IsVisible = function()
        return ns.CalendarEventIsActive(1400)
    end
}) -- Eastern Kingdom Cup

-- ns.groups.OUTLAND_CUP = Group({
--     atlas = 'racing',
--     label = L['outland_cup'],
--     name = 'outland_cup'
-- }) -- Outland Cup

-------------------------------------------------------------------------------
------------------------------------ PINS -------------------------------------
-------------------------------------------------------------------------------

local function AncientWaygate(attrs)
    return Pin({
        group = ns.groups.ANCIENT_WAYGATES,
        coordinates = attrs.coordinates
    })
end -- Ancient Waygates

local DragonridingRally = Pin({
    group = ns.groups.DRAGONRIDING_RALLY
}) -- Dragonriding Rally

local ElementalStorm = Pin({
    group = ns.groups.ELEMENTAL_STORM
}) -- Elemental Storm

local FishingHole = Pin({group = ns.groups.FISHING_HOLE}) -- Fishing Hole

local GrandHunt = Pin({group = ns.groups.GRAND_HUNTS}) -- Grand Hunt

local ZaralekCavern = Pin({
    group = ns.groups.ZARALEK_CAVERN_ENTRANCES,
    passive = true
}) -- Zaralek Cavern

ns.pin.AncientWaygate = AncientWaygate
ns.pin.DragonridingRally = DragonridingRally
ns.pin.ElementalStorm = ElementalStorm
ns.pin.FishingHole = FishingHole
ns.pin.GrandHunt = GrandHunt
ns.pin.ZaralekCavern = ZaralekCavern

-------------------------------------------------------------------------------
--------------------------------- MENU GROUPS ---------------------------------
-------------------------------------------------------------------------------

ns.menuGroups = {
    [12] = { -- Kalimdor
        [1] = {
            groups = {
                [1] = ns.groups.KALIMDOR_CUP
            }
        }
    },
    [13] = { -- Eastern Kingdoms
        [1] = {
            groups = {
                [1] = ns.groups.EASTERN_KINGDOMS_CUP
            }
        }
    },
    -- [101] = { -- Outland
    --     [1] = {
    --         groups = {
    --             [1] = ns.groups.OUTLAND_CUP
    --         }
    --     }
    -- },
    [1978] = { -- Dragon Isles
        [1] = {
            title = L['zone_dragon_isles'],
            groups = {
                [1] = ns.groups.ANCIENT_WAYGATES,
                [2] = ns.groups.DRAGONRIDING_RALLY,
                [3] = ns.groups.ELEMENTAL_STORM,
                [4] = ns.groups.FISHING_HOLE,
                [5] = ns.groups.GRAND_HUNTS,
                [6] = ns.groups.ZARALEK_CAVERN_ENTRANCES
            }
        },
        [2] = {
            title = L['zone_the_waking_shores'],
            groups = {
                [1] = ns.groups.FACTION_EXPEDITION,
                [2] = ns.groups.DRAGONBANE_SIEGE
            }
        },
        [3] = {
            title = L['zone_ohnahran_plains'],
            groups = {
                [1] = ns.groups.FACTION_CENTAUR,
                [2] = ns.groups.AYLAAG_CAMPS
            }
        },
        [4] = {
            title = L['zone_azure_span'],
            groups = {
                [1] = ns.groups.FACTION_TUSKARR,
                [2] = ns.groups.COMMUNITY_FEAST
            }
        },
        [5] = {
            title = L['zone_thaldraszus'],
            groups = {
                [1] = ns.groups.FACTION_VALDRAKKEN,
                [2] = ns.groups.GREAT_VAULT,
                [3] = ns.groups.STORMS_FURY,
                [4] = ns.groups.SECRETS_OF_AZEROTH,
                [5] = ns.groups.TIME_RIFT
            }
        },
        [6] = {
            title = L['zone_the_forbidden_reach'],
            groups = {
                [1] = ns.groups.FROSTSTONE_VAULT_STORM
            }
        },
        [7] = {
            title = L['zone_zaralek_cavern'],
            groups = {
                [1] = ns.groups.FACTION_NIFFEN,
                [2] = ns.groups.RESEARCHERS_UNDER_FIRE
            }
        }
    }
}
