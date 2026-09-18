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

-- Moteur 12.x (Midnight, WoW Forever 1.60) : COMBAT_LOG_EVENT_UNFILTERED est interdit aux addons,
-- même sous pcall (popup ADDON_ACTION_FORBIDDEN), et les auras du joueur sont secrètes en combat
-- (UNIT_AURA inexploitable). Seul repli : demander au client de jouer lui-même un son quand un
-- sort de la liste pose une aura sur le joueur (C_UnitAuras.AddPrivateAuraAppliedSound, comme GTFO).
-- Son uniquement : pas de flash, pas de dégâts sans aura, pas de lave/fatigue/noyade.
local HAS_COMBAT_LOG = not (C_DamageMeter or issecretvalue or (C_CombatLog and C_CombatLog.SetFilteredEventsEnabled))
local RAID_WARNING_FILE_ID = 567397   -- Sound\Interface\RaidWarning.ogg

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
if HAS_COMBAT_LOG then
    frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

local AddAuraSound = C_UnitAuras and (C_UnitAuras.AddAuraAppliedSound or C_UnitAuras.AddPrivateAuraAppliedSound)
local RemoveAuraSound = C_UnitAuras and (C_UnitAuras.RemoveAuraAppliedSound or C_UnitAuras.RemovePrivateAuraAppliedSound)
local auraSoundIDs = {}

-- (Ré)enregistre un son client par sort connu, sauf sorts coupés et sévérité 0.
function MooveAlert:RegisterAuraSounds()
    if HAS_COMBAT_LOG or not AddAuraSound then return end
    for _, id in ipairs(auraSoundIDs) do
        if RemoveAuraSound then pcall(RemoveAuraSound, id) end
    end
    wipe(auraSoundIDs)
    if not MooveAlertDB.soundEnabled then return end
    for spellID, data in pairs(self.Spells) do
        if (data.sound or 2) > 0 and not self.IsMuted(spellID) then
            local ok, id = pcall(AddAuraSound, {
                spellID = spellID, unitToken = "player",
                soundFileID = RAID_WARNING_FILE_ID, outputChannel = "Master",
            })
            if ok and id then auraSoundIDs[#auraSoundIDs + 1] = id end
        end
    end
end

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
        MooveAlert:RegisterAuraSounds()
        -- Message d'information une seule fois par compte, pas à chaque connexion.
        if not HAS_COMBAT_LOG and not MooveAlertDB.noCombatLogNoticeShown then
            MooveAlertDB.noCombatLogNoticeShown = true
            MooveAlert.Print(AddAuraSound and MooveAlert.L.MSG_NO_COMBATLOG_SOUND or MooveAlert.L.MSG_NO_COMBATLOG_NONE)
        end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        OnCombatLogEvent()
    end
end)
