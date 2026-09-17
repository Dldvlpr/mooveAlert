--------------------------------------------------------------------------
-- Alerts.lua
-- Rendu de l'alerte : flash plein écran + texte (absent de GTFO) + son.
-- Utilise uniquement des textures colorées et des sons intégrés Blizzard :
-- aucun asset audio/texture tiers embarqué.
--------------------------------------------------------------------------

local SEVERITY_COLOR = {
    [1] = { 1, 1, 0.2 },   -- jaune : info
    [2] = { 1, 0.6, 0 },   -- orange : attention
    [3] = { 1, 0.15, 0.15 }, -- rouge : danger
    [4] = { 1, 0, 0.6 },   -- magenta : danger critique (friendly fire)
}

-- SOUNDKIT n'existe pas (ou pas toutes ses clés) sur les tout premiers
-- clients Classic Era : chaque palier a un repli en ID numérique connu.
local RAID_WARNING_SOUND = (SOUNDKIT and SOUNDKIT.RAID_WARNING) or 8959
local SEVERITY_SOUNDKIT = {
    [1] = (SOUNDKIT and SOUNDKIT.IG_QUEST_LOG_OPEN) or 887,           -- info, discret
    [2] = (SOUNDKIT and SOUNDKIT.ALARM_CLOCK_WARNING_3) or 3175,      -- attention
    [3] = RAID_WARNING_SOUND,                                        -- danger (+ 1 répétition, cf. PlayAlertSound)
    [4] = RAID_WARNING_SOUND,                                        -- danger critique (+ 2 répétitions)
}
-- Nombre de répétitions supplémentaires par palier (0 = un seul son).
-- Permet de distinguer 3 et 4 sans ajouter d'asset audio.
local SEVERITY_REPEATS = { [1] = 0, [2] = 0, [3] = 1, [4] = 2 }

local overlay = CreateFrame("Frame", "MooveAlertOverlay", UIParent)
overlay:SetAllPoints(UIParent)
overlay:SetFrameStrata("FULLSCREEN_DIALOG")
overlay:Hide()

local flashTexture = overlay:CreateTexture(nil, "BACKGROUND")
flashTexture:SetAllPoints(overlay)
flashTexture:SetColorTexture(1, 0, 0, 0.35)

local flashText = overlay:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
flashText:SetPoint("TOP", overlay, "TOP", 0, -160)
flashText:SetTextColor(1, 1, 1)

local fadeInfo = {
    mode = "OUT",
    timeToFade = 0.6,
    startAlpha = 1,
    endAlpha = 0,
    finishedFunc = function() overlay:Hide() end,
}

local function PlayAlertSound(severity)
    if not MooveAlertDB.soundEnabled then return end
    local soundKit = SEVERITY_SOUNDKIT[severity] or SEVERITY_SOUNDKIT[2]
    PlaySound(soundKit, "Master")
    local repeats = SEVERITY_REPEATS[severity] or 0
    for i = 1, repeats do
        C_Timer.After(0.25 * i, function() PlaySound(soundKit, "Master") end)
    end
end

local function PlayFlash(severity, label)
    if not MooveAlertDB.flashEnabled then return end
    local color = SEVERITY_COLOR[severity] or SEVERITY_COLOR[2]
    flashTexture:SetColorTexture(color[1], color[2], color[3], 0.35)
    flashText:SetText(label or "")
    overlay:SetAlpha(1)
    overlay:Show()
    UIFrameFade(overlay, fadeInfo)
end

-- Anti-spam global : une mécanique à plusieurs effets ne doit pas marteler
-- flash/son coup sur coup. Une alerte déjà affichée n'est interrompue que
-- par une alerte de sévérité STRICTEMENT supérieure ; à sévérité égale ou
-- inférieure, la nouvelle est ignorée tant que l'affichage en cours dure.
local currentSeverity = 0
local currentExpiry = 0

-- data attendu : { desc = "nom du sort (repli)", sound = 1-4, tankSound = 1-4 }
-- label (optionnel) : nom déjà localisé (spellName du combat log, ou hazard L.*),
-- prioritaire sur data.desc.
function MooveAlert:Fire(spellID, data, label)
    if MooveAlert.IsMuted(spellID) then return end

    local isTank = UnitGroupRolesAssigned and (UnitGroupRolesAssigned("player") == "TANK")
    local severity = (isTank and data.tankSound) or data.sound or 2
    if severity <= 0 then return end

    local now = GetTime()
    if now < currentExpiry and severity <= currentSeverity then
        return
    end
    currentSeverity = severity
    currentExpiry = now + fadeInfo.timeToFade

    PlayFlash(severity, label or data.desc)
    PlayAlertSound(severity)
end
