-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...

ns.groups = {}

-------------------------------------------------------------------------------
------------------------------------ GROUP ------------------------------------
-------------------------------------------------------------------------------

local function Group(attrs)
    local group = {}
    if attrs then for k, v in pairs(attrs) do group[k] = v end end

    if not group.atlas then error('Group must have an atlas!') end
    if not group.label then error('Group must have a label!') end
    if not group.name then error('Group must have a name!') end

    if not group.IsVisible then
        group.IsVisible = function() return true end
    end

    ns.PrepareText(group.label)

    return group
end

ns.Group = Group
