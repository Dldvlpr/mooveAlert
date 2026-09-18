--------------------------------------------------------------------------
-- Locale/deDE.lua
--------------------------------------------------------------------------
if GetLocale() ~= "deDE" then return end
local L = MooveAlert.L

L.MSG_LOADED = "geladen. /ma für Hilfe."

L.HELP_HEADER = "verfügbare Befehle:"
L.HELP_OPTIONS = "  /ma options            -- Optionsfenster öffnen"
L.HELP_TEST = "  /ma test [1-4]         -- Alarm testen (Standard: Stufe 3)"
L.HELP_SOUND = "  /ma sound on|off       -- Ton an/aus"
L.HELP_FLASH = "  /ma flash on|off       -- Bildschirmblitz an/aus"
L.HELP_VOLUME = "  /ma volume <0-100>     -- Lautstärke einstellen"
L.HELP_MUTE = "  /ma mute <spellID>     -- einen Zauber stummschalten (dieser Charakter)"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- einen Zauber wieder aktivieren"
L.HELP_SCAN = "  /ma scan               -- Scan-Modus umschalten (unbekannte Zauber erfassen)"
L.HELP_REPORT = "  /ma report             -- unbekannte Zauber seit letztem Reset auflisten"
L.HELP_REPORTRESET = "  /ma reportreset        -- Scan-Modus-Liste leeren"

L.WORD_ON = "an"
L.WORD_OFF = "aus"

L.MSG_SOUND = "Ton: %s"
L.MSG_FLASH = "Bildschirmblitz: %s"
L.MSG_VOLUME = "Lautstärke: %d%%"
L.MSG_MUTED = "Zauber %d auf diesem Charakter stummgeschaltet."
L.MSG_UNMUTED = "Zauber %d wieder aktiviert."
L.MSG_SCAN = "Scan-Modus: %s"
L.MSG_REPORT_EMPTY = "kein unbekannter Zauber seit dem letzten Reset erfasst."
L.MSG_REPORT_HEADER = "erfasste unbekannte Zauber (zum Beitragen kopieren):"
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "Scan-Modus-Liste geleert."

L.TEST_ALERT_LABEL = "MooveAlert-Testalarm"

L.OPT_SOUND = "Ton aktiviert"
L.OPT_FLASH = "Bildschirmblitz aktiviert"
L.OPT_TRIVIAL = "Auch bei trivialen (niedrigstufigen) Inhalten warnen"
L.OPT_VOLUME_LABEL = "Lautstärke"
L.OPT_HAZARD_FATIGUE = "Erschöpfungswarnung"
L.OPT_HAZARD_DROWNING = "Ertrinkenswarnung"
L.OPT_HAZARD_LAVA = "Lava-/Lagerfeuerwarnung"

L.HAZARD_FATIGUE_NAME = "Erschöpfung"
L.HAZARD_DROWNING_NAME = "Ertrinken"
L.HAZARD_LAVA_NAME = "Lava"

L.MSG_NO_COMBATLOG_SOUND = "Client ohne Kampfprotokoll: nur Tonwarnung bei Zaubern, die eine Aura anlegen."
L.MSG_NO_COMBATLOG_NONE = "Client ohne Kampfprotokoll und Aura-API: keine Erkennung möglich."
