--------------------------------------------------------------------------
-- Core.lua
-- Chargement, profils (compte + personnage), API d'enregistrement des sorts,
-- commandes slash, mode Scan (repérage de sorts non répertoriés).
--------------------------------------------------------------------------

MooveAlert = {}
MooveAlert.Spells = {}          -- [spellID:number] = { sound, friendlyFire, applicationOnly, trivialLevel, trivialPercent, tankSound, excludeTimewalking, desc }
MooveAlert.IgnoreScan = {}      -- [spellID:number] = true  (bruit connu à exclure du mode Scan)
MooveAlert.Scans = {}           -- [spellID] = { count, name }

local ADDON_NAME = ...

local DEFAULT_ACCOUNT_DB = {
    soundEnabled = true,
    flashEnabled = true,
    volume = 1.0,
    scanMode = false,
    trivialMode = false,
    hazards = { Fatigue = true, Drowning = true, Lava = true },
}

local DEFAULT_CHAR_DB = {
    mutedSpells = {},
}

-- ponytail: pas de panneau d'options graphique, commandes slash seulement (YAGNI tant que non demandé)

function MooveAlert:RegisterSpell(spellID, data)
    spellID = tonumber(spellID)
    if not spellID then return end
    local existing = self.Spells[spellID]
    if existing then
        for k, v in pairs(data) do
            existing[k] = v
        end
    else
        self.Spells[spellID] = data
    end
end

function MooveAlert:RegisterSpells(list)
    for spellID, data in pairs(list) do
        self:RegisterSpell(spellID, data)
    end
end

function MooveAlert:RegisterIgnoreScan(list)
    for spellID in pairs(list) do
        self.IgnoreScan[tonumber(spellID)] = true
    end
end

local function Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ccffMooveAlert|r: " .. tostring(msg))
end
MooveAlert.Print = Print

-- ScanMode : quand un dégât touche le joueur sans correspondre à un spellID connu,
-- on le compte pour permettre un export communautaire (voir /ma report).
function MooveAlert:TrackUnknownSpell(spellID, spellName)
    if not MooveAlertDB.scanMode then return end
    if self.Spells[spellID] or self.IgnoreScan[spellID] then return end
    local entry = self.Scans[spellID]
    if entry then
        entry.count = entry.count + 1
    else
        self.Scans[spellID] = { count = 1, name = spellName }
    end
end

local function IsMuted(spellID)
    return MooveAlertCharDB.mutedSpells[spellID] == true
end
MooveAlert.IsMuted = IsMuted

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, name)
    if event == "ADDON_LOADED" and name == ADDON_NAME then
        MooveAlertDB = MooveAlertDB or {}
        for k, v in pairs(DEFAULT_ACCOUNT_DB) do
            if MooveAlertDB[k] == nil then MooveAlertDB[k] = v end
        end
        MooveAlertCharDB = MooveAlertCharDB or {}
        for k, v in pairs(DEFAULT_CHAR_DB) do
            if MooveAlertCharDB[k] == nil then MooveAlertCharDB[k] = v end
        end
        frame:UnregisterEvent("ADDON_LOADED")
        Print(MooveAlert.L.MSG_LOADED)
    end
end)

local function PrintHelp()
    local L = MooveAlert.L
    Print(L.HELP_HEADER)
    Print(L.HELP_OPTIONS)
    Print(L.HELP_TEST)
    Print(L.HELP_SOUND)
    Print(L.HELP_FLASH)
    Print(L.HELP_VOLUME)
    Print(L.HELP_MUTE)
    Print(L.HELP_UNMUTE)
    Print(L.HELP_SCAN)
    Print(L.HELP_REPORT)
    Print(L.HELP_REPORTRESET)
end

SLASH_MOOVEALERT1 = "/moovealert"
SLASH_MOOVEALERT2 = "/ma"
SlashCmdList["MOOVEALERT"] = function(msg)
    local L = MooveAlert.L
    local cmd, arg = msg:match("^(%S*)%s*(.-)$")
    cmd = (cmd or ""):lower()

    if cmd == "options" then
        MooveAlert:OpenOptions()
    elseif cmd == "test" then
        local level = tonumber(arg) or 3
        MooveAlert:Fire(1, { sound = level }, L.TEST_ALERT_LABEL)
    elseif cmd == "sound" then
        MooveAlertDB.soundEnabled = (arg:lower() == "on")
        Print(string.format(L.MSG_SOUND, MooveAlertDB.soundEnabled and L.WORD_ON or L.WORD_OFF))
    elseif cmd == "flash" then
        MooveAlertDB.flashEnabled = (arg:lower() == "on")
        Print(string.format(L.MSG_FLASH, MooveAlertDB.flashEnabled and L.WORD_ON or L.WORD_OFF))
    elseif cmd == "volume" then
        local pct = tonumber(arg)
        if pct then
            MooveAlertDB.volume = math.max(0, math.min(100, pct)) / 100
            Print(string.format(L.MSG_VOLUME, math.floor(MooveAlertDB.volume * 100)))
        end
    elseif cmd == "mute" then
        local id = tonumber(arg)
        if id then
            MooveAlertCharDB.mutedSpells[id] = true
            Print(string.format(L.MSG_MUTED, id))
        end
    elseif cmd == "unmute" then
        local id = tonumber(arg)
        if id then
            MooveAlertCharDB.mutedSpells[id] = nil
            Print(string.format(L.MSG_UNMUTED, id))
        end
    elseif cmd == "scan" then
        MooveAlertDB.scanMode = not MooveAlertDB.scanMode
        Print(string.format(L.MSG_SCAN, MooveAlertDB.scanMode and L.WORD_ON or L.WORD_OFF))
    elseif cmd == "report" then
        if next(MooveAlert.Scans) == nil then
            Print(L.MSG_REPORT_EMPTY)
        else
            Print(L.MSG_REPORT_HEADER)
            for spellID, data in pairs(MooveAlert.Scans) do
                Print(string.format(L.MSG_REPORT_LINE, spellID, tostring(data.name), data.count))
            end
        end
    elseif cmd == "reportreset" then
        MooveAlert.Scans = {}
        Print(L.MSG_REPORT_RESET)
    else
        PrintHelp()
    end
end
