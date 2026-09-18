--------------------------------------------------------------------------
-- Locale/enUS.lua
-- Base de repli, toujours chargée. Les autres fichiers de Locale/ ne font
-- que surcharger ces clés quand GetLocale() correspond.
--------------------------------------------------------------------------

MooveAlert = MooveAlert or {}
MooveAlert.L = {
    MSG_LOADED = "loaded. /ma for help.",

    HELP_HEADER = "available commands:",
    HELP_OPTIONS = "  /ma options            -- open the options panel",
    HELP_TEST = "  /ma test [1-4]         -- preview an alert (default severity 3)",
    HELP_SOUND = "  /ma sound on|off       -- toggle sound",
    HELP_FLASH = "  /ma flash on|off       -- toggle the screen flash",
    HELP_VOLUME = "  /ma volume <0-100>     -- set the volume",
    HELP_MUTE = "  /ma mute <spellID>     -- mute a specific spell (this character)",
    HELP_UNMUTE = "  /ma unmute <spellID>   -- unmute a spell",
    HELP_SCAN = "  /ma scan               -- toggle Scan mode (unknown spell tracking)",
    HELP_REPORT = "  /ma report             -- list unknown spells seen since the last reset",
    HELP_REPORTRESET = "  /ma reportreset        -- clear the Scan mode list",

    WORD_ON = "on",
    WORD_OFF = "off",

    MSG_SOUND = "sound: %s",
    MSG_FLASH = "screen flash: %s",
    MSG_VOLUME = "volume: %d%%",
    MSG_MUTED = "spell %d muted on this character.",
    MSG_UNMUTED = "spell %d unmuted.",
    MSG_SCAN = "Scan mode: %s",
    MSG_REPORT_EMPTY = "no unknown spell detected since the last reset.",
    MSG_REPORT_HEADER = "unknown spells detected (copy this to contribute):",
    MSG_REPORT_LINE = "  [%d] %s x%d",
    MSG_REPORT_RESET = "Scan mode list cleared.",

    TEST_ALERT_LABEL = "MooveAlert test alert",

    OPT_SOUND = "Sound enabled",
    OPT_FLASH = "Full-screen flash enabled",
    OPT_TRIVIAL = "Alert even on trivial (low-level) content",
    OPT_VOLUME_LABEL = "Volume",
    OPT_HAZARD_FATIGUE = "Fatigue alert",
    OPT_HAZARD_DROWNING = "Drowning alert",
    OPT_HAZARD_LAVA = "Lava / campfire alert",

    HAZARD_FATIGUE_NAME = "Fatigue",
    HAZARD_DROWNING_NAME = "Drowning",
    HAZARD_LAVA_NAME = "Lava",
}

MooveAlert.L.MSG_NO_COMBATLOG_SOUND = "client without combat log: sound alert only, on spells that apply an aura."
MooveAlert.L.MSG_NO_COMBATLOG_NONE = "client without combat log or aura API: no detection possible."
