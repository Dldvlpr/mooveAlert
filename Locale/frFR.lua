--------------------------------------------------------------------------
-- Locale/frFR.lua
--------------------------------------------------------------------------
if GetLocale() ~= "frFR" then return end
local L = MooveAlert.L

L.MSG_LOADED = "chargé. /ma pour l'aide."

L.HELP_HEADER = "commandes disponibles :"
L.HELP_OPTIONS = "  /ma options            -- ouvrir le panneau d'options"
L.HELP_TEST = "  /ma test [1-4]         -- prévisualiser une alerte (palier 3 par défaut)"
L.HELP_SOUND = "  /ma sound on|off       -- activer/désactiver le son"
L.HELP_FLASH = "  /ma flash on|off       -- activer/désactiver l'alerte visuelle"
L.HELP_VOLUME = "  /ma volume <0-100>     -- régler le volume"
L.HELP_MUTE = "  /ma mute <spellID>     -- couper un sort précis (ce personnage)"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- réactiver un sort coupé"
L.HELP_SCAN = "  /ma scan               -- basculer le mode Scan (repérage sorts inconnus)"
L.HELP_REPORT = "  /ma report             -- lister les sorts inconnus détectés depuis le dernier reset"
L.HELP_REPORTRESET = "  /ma reportreset        -- vider la liste du mode Scan"

L.WORD_ON = "activé"
L.WORD_OFF = "désactivé"

L.MSG_SOUND = "son : %s"
L.MSG_FLASH = "alerte visuelle : %s"
L.MSG_VOLUME = "volume : %d%%"
L.MSG_MUTED = "sort %d coupé sur ce personnage."
L.MSG_UNMUTED = "sort %d réactivé."
L.MSG_SCAN = "mode Scan : %s"
L.MSG_REPORT_EMPTY = "aucun sort inconnu détecté depuis le dernier reset."
L.MSG_REPORT_HEADER = "sorts inconnus détectés (à copier pour contribution) :"
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "liste du mode Scan vidée."

L.TEST_ALERT_LABEL = "Test d'alerte MooveAlert"

L.OPT_SOUND = "Son activé"
L.OPT_FLASH = "Flash plein écran activé"
L.OPT_TRIVIAL = "Alerter même sur contenu trivial (bas niveau)"
L.OPT_VOLUME_LABEL = "Volume"
L.OPT_HAZARD_FATIGUE = "Alerte fatigue"
L.OPT_HAZARD_DROWNING = "Alerte noyade"
L.OPT_HAZARD_LAVA = "Alerte lave / feu de camp"

L.HAZARD_FATIGUE_NAME = "Fatigue"
L.HAZARD_DROWNING_NAME = "Noyade"
L.HAZARD_LAVA_NAME = "Lave"
