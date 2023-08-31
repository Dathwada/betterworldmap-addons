-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...

local Addon = LibStub('AceAddon-3.0'):NewAddon(ADDON_NAME, 'AceEvent-3.0', 'AceConsole-3.0')
local L = LibStub('AceLocale-3.0'):GetLocale(ADDON_NAME)

ns.addon = Addon
ns.locale = L

ns.DB = ADDON_NAME .. 'DB'

ns.libs = {
    HBD = LibStub('HereBeDragons-2.0'),
    PIN = LibStub('HereBeDragons-Pins-2.0'),
    DDM = LibStub('LibUIDropDownMenu-4.0'),
    WMB = LibStub('Krowi_WorldMapButtons-1.4')
}

_G[ADDON_NAME] = Addon

-------------------------------------------------------------------------------
----------------------------------- OPTIONS -----------------------------------
-------------------------------------------------------------------------------

ns.SetDefaultOptions = function()
    _G[ns.DB] = {}
    for _, group in pairs(ns.groups) do
        _G[ns.DB]['enable_' .. group.name] = true
    end
end

ns.GetOpt = function(o) return _G[ns.DB][o] end

ns.SetOpt = function(o) _G[ns.DB][o] = not _G[ns.DB][o] ns.addon:Refresh() end

-------------------------------------------------------------------------------
------------------------------ WORLD MAP BUTTON -------------------------------
-------------------------------------------------------------------------------

local WorldMapOptionsButtonMixin = {}
_G[ADDON_NAME .. 'WorldMapOptionsButtonMixin'] = WorldMapOptionsButtonMixin

function WorldMapOptionsButtonMixin:OnLoad()
    local drop_down_name = ADDON_NAME .. 'WorldMapDropDownMenu'
    self.DropDown = ns.libs.DDM:Create_UIDropDownMenu(drop_down_name, self)
    ns.libs.DDM:UIDropDownMenu_SetInitializeFunction(self.DropDown, function(dropdown)
        dropdown:GetParent():InitializeDropDown()
    end)
end

function WorldMapOptionsButtonMixin:OnMouseDown()
    self.Icon:SetPoint('TOPLEFT', 8, -8)
    local xOffset = WorldMapFrame.isMaximized and 30 or 0
    self.DropDown.point = WorldMapFrame.isMaximized and 'TOPRIGHT' or 'TOPLEFT'
    ns.libs.DDM:ToggleDropDownMenu(1, nil, self.DropDown, self, xOffset, -5)
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
end

function WorldMapOptionsButtonMixin:OnMouseUp()
    self.Icon:SetPoint('TOPLEFT', self, 'TOPLEFT', 6, -6)
end

function WorldMapOptionsButtonMixin:OnEnter()
    GameTooltip:SetOwner(self, 'ANCHOR_RIGHT')
    GameTooltip_SetTitle(GameTooltip, ns.addon_name)
    GameTooltip_AddNormalLine(GameTooltip, L['addon_description'])
    GameTooltip:Show()
end

function WorldMapOptionsButtonMixin:Refresh()
    local mapID = self:GetParent():GetMapID()
    if ns.IsActiveMap(mapID) then self:Show() else self:Hide() end
end

function WorldMapOptionsButtonMixin:InitializeDropDown()
    local mapID = self:GetParent():GetMapID()
    if ns.IsActiveMap(mapID) then
        local menuGroup = ns.menuGroups[mapID]
        for _, section in ipairs(menuGroup) do
            if section.title then
                ns.libs.DDM:UIDropDownMenu_AddButton({
                    isTitle = true,
                    text = section.title,
                    notClickable = 1,
                    notCheckable = 1
                })
            end
            for _, group in ipairs(section.groups) do
                local atlas = CreateAtlasMarkup(group.atlas, 20, 20)
                ns.libs.DDM:UIDropDownMenu_AddButton({
                    text = atlas .. ' ' .. ns.RenderText(group.label),
                    isNotRadio = true,
                    keepShownOnClick = true,
                    checked = ns.GetOpt('enable_' .. group.name),
                    func = function()
                        ns.SetOpt('enable_' .. group.name)
                    end
                })
            end
        end
    end
end

-------------------------------------------------------------------------------
------------------------------------ ADDON ------------------------------------
-------------------------------------------------------------------------------

function Addon:OnInitialize()
    if not _G[ns.DB] then ns:SetDefaultOptions() end

    local template = ADDON_NAME .. 'WorldMapOptionsButtonTemplate'
    ns.libs.WMB:Add(template, 'DROPDOWNTOGGLEBUTTON')

    if ns.addon_name then
        ns.addon_name = 'BetterWorldMap: ' .. ns.addon_name
    end

    if ns.expansion then
        self:RegisterEvent('PLAYER_ENTERING_WORLD', function()
            self:UnregisterEvent('PLAYER_ENTERING_WORLD')
            local expansionName = EJ_GetTierInfo(ns.expansion)
            ns.addon_name = 'BetterWorldMap: ' .. expansionName
        end)
    end

    if ns.chat_command then
        self:RegisterChatCommand(ns.chat_command, function(input)
            if input == 'dev true' then
                _G[ns.DB].dev_enabled = true
                self:Print('Dev mode enabled')
            elseif input == 'dev false' then
                _G[ns.DB].dev_enabled = false
                self:Print('Dev mode disabled')
            end
            self:Refresh()
        end)
    end
end

function Addon:Refresh()
    for provider in next, WorldMapFrame.dataProviders do
        provider:RefreshAllData()
    end
    ns.FP.UpdateAllFlightPoints(WorldMapFrame.mapID)
end
