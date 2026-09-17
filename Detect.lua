--------------------------------------------------------------------------
-- Detect.lua
-- Moteur UNIQUE de détection, Retail et Classic confondus : lecture du
-- combat log ciblée sur le joueur. GTFO fait cohabiter deux moteurs
-- (API native retail C_UnitAuras.AddAuraSound + parsing combat log classic).
-- Ici un seul moteur suffit : le combat log n'est jamais restreint côté
-- Blizzard (contrairement à l'API private aura), et permet en prime le
-- flash visuel que l'API native ne peut pas déclencher (aura privée =
-- invisible côté Lua, son uniquement).
-- ponytail: pas d'intégration C_UnitAuras.AddAuraSound. Gain marginal
-- (latence légèrement plus basse) pour le coût de deux moteurs à
-- maintenir + gestion des réinscriptions par zone/encounter. À ajouter
-- seulement si la latence du combat log s'avère un problème mesuré en jeu.
--------------------------------------------------------------------------

local THROTTLE_SECONDS = 3
local lastFired = {}

local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:RegisterEvent("PLAYER_LOGIN")

local playerGUID

local function ShouldFire(spellID, applicationOnly, isApplicationEvent)
    if applicationOnly and not isApplicationEvent then
        return false
    end
    local now = GetTime()
    local last = lastFired[spellID]
    if last and (now - last) < THROTTLE_SECONDS then
        return false
    end
    lastFired[spellID] = now
    return true
end

local function IsTrivial(data)
    if MooveAlertDB.trivialMode then return false end
    if data.trivialLevel and UnitLevel("player") >= data.trivialLevel then
        return true
    end
    return false
end

local AURA_APPLIED_EVENTS = {
    SPELL_AURA_APPLIED = true,
    SPELL_AURA_APPLIED_DOSE = true,
}

local DAMAGE_EVENTS = {
    SPELL_DAMAGE = true,
    SPELL_PERIODIC_DAMAGE = true,
    RANGE_DAMAGE = true,
}

local function OnCombatLogEvent()
    local _, subevent, _, sourceGUID, sourceName, _, _, destGUID, _, _, _, spellID, spellName = CombatLogGetCurrentEventInfo()

    if subevent == "ENVIRONMENTAL_DAMAGE" then
        if destGUID ~= playerGUID then return end
        local L = MooveAlert.L
        local environmentalType = select(12, CombatLogGetCurrentEventInfo())
        local category, label
        if environmentalType == "Fatigue" then
            category, label = "Fatigue", L.HAZARD_FATIGUE_NAME
        elseif environmentalType == "Drowning" then
            category, label = "Drowning", L.HAZARD_DROWNING_NAME
        elseif environmentalType == "Lava" or environmentalType == "Fire" then
            category, label = "Lava", L.HAZARD_LAVA_NAME
        end
        if category and MooveAlertDB.hazards[category] then
            if ShouldFire("env_" .. category, false, true) then
                MooveAlert:Fire(0, { sound = 3 }, label)
            end
        end
        return
    end

    local isApplicationEvent = AURA_APPLIED_EVENTS[subevent]
    local isDamageEvent = DAMAGE_EVENTS[subevent]
    if not (isApplicationEvent or isDamageEvent) then return end
    if destGUID ~= playerGUID then return end
    if not spellID then return end

    local data = MooveAlert.Spells[spellID]
    if not data then
        MooveAlert:TrackUnknownSpell(spellID, spellName)
        return
    end
    if data.friendlyFire and sourceGUID == playerGUID then return end
    if IsTrivial(data) then return end

    if ShouldFire(spellID, data.applicationOnly, isApplicationEvent) then
        MooveAlert:Fire(spellID, data, spellName)
    end
end

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        playerGUID = UnitGUID("player")
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        OnCombatLogEvent()
    end
end)
