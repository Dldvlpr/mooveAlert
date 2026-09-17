--------------------------------------------------------------------------
-- Options.lua
-- Panneau graphique. Compat Retail (Settings.RegisterAddOnCategory,
-- API 10.0+) et Classic (InterfaceOptions_AddCategory, ancienne API,
-- seule dispo sur les clients Classic à ce jour).
--------------------------------------------------------------------------

local panel = CreateFrame("Frame", "MooveAlertOptionsPanel", UIParent)
panel.name = "MooveAlert"

local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("MooveAlert")

local function CreateCheckbox(name, label, anchor, x, y)
    local cb = CreateFrame("CheckButton", "MooveAlertOpt" .. name, panel, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", x, y)
    local text = cb:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    text:SetPoint("LEFT", cb, "RIGHT", 4, 0)
    text:SetText(label)
    return cb
end

local L = MooveAlert.L
local cbSound = CreateCheckbox("Sound", L.OPT_SOUND, title, 0, -16)
local cbFlash = CreateCheckbox("Flash", L.OPT_FLASH, cbSound, 0, -8)
local cbTrivial = CreateCheckbox("Trivial", L.OPT_TRIVIAL, cbFlash, 0, -8)
local cbFatigue = CreateCheckbox("Fatigue", L.OPT_HAZARD_FATIGUE, cbTrivial, 0, -20)
local cbDrowning = CreateCheckbox("Drowning", L.OPT_HAZARD_DROWNING, cbFatigue, 0, -8)
local cbLava = CreateCheckbox("Lava", L.OPT_HAZARD_LAVA, cbDrowning, 0, -8)

local volumeSlider = CreateFrame("Slider", "MooveAlertOptVolume", panel, "OptionsSliderTemplate")
volumeSlider:SetPoint("TOPLEFT", cbLava, "BOTTOMLEFT", 4, -28)
volumeSlider:SetMinMaxValues(0, 100)
volumeSlider:SetValueStep(5)
volumeSlider:SetObeyStepOnDrag(true)
volumeSlider:SetWidth(200)
_G[volumeSlider:GetName() .. "Low"]:SetText("0")
_G[volumeSlider:GetName() .. "High"]:SetText("100")
_G[volumeSlider:GetName() .. "Text"]:SetText(L.OPT_VOLUME_LABEL)

local function RefreshControls()
    cbSound:SetChecked(MooveAlertDB.soundEnabled)
    cbFlash:SetChecked(MooveAlertDB.flashEnabled)
    cbTrivial:SetChecked(MooveAlertDB.trivialMode)
    cbFatigue:SetChecked(MooveAlertDB.hazards.Fatigue)
    cbDrowning:SetChecked(MooveAlertDB.hazards.Drowning)
    cbLava:SetChecked(MooveAlertDB.hazards.Lava)
    volumeSlider:SetValue(math.floor(MooveAlertDB.volume * 100))
end
panel:SetScript("OnShow", RefreshControls)

cbSound:SetScript("OnClick", function(self) MooveAlertDB.soundEnabled = self:GetChecked() and true or false end)
cbFlash:SetScript("OnClick", function(self) MooveAlertDB.flashEnabled = self:GetChecked() and true or false end)
cbTrivial:SetScript("OnClick", function(self) MooveAlertDB.trivialMode = self:GetChecked() and true or false end)
cbFatigue:SetScript("OnClick", function(self) MooveAlertDB.hazards.Fatigue = self:GetChecked() and true or false end)
cbDrowning:SetScript("OnClick", function(self) MooveAlertDB.hazards.Drowning = self:GetChecked() and true or false end)
cbLava:SetScript("OnClick", function(self) MooveAlertDB.hazards.Lava = self:GetChecked() and true or false end)
volumeSlider:SetScript("OnValueChanged", function(self, value)
    MooveAlertDB.volume = value / 100
end)

if Settings and Settings.RegisterCanvasLayoutCategory then
    local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
    Settings.RegisterAddOnCategory(category)
    MooveAlert.OptionsCategoryID = category:GetID()
else
    InterfaceOptions_AddCategory(panel)
end

function MooveAlert:OpenOptions()
    if Settings and Settings.OpenToCategory then
        Settings.OpenToCategory(self.OptionsCategoryID or panel.name)
    else
        InterfaceOptionsFrame_OpenToCategory(panel)
        InterfaceOptionsFrame_OpenToCategory(panel) -- bug Blizzard connu : premier appel ignoré
    end
end
