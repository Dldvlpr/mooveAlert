--------------------------------------------------------------------------
-- Locale/itIT.lua
--------------------------------------------------------------------------
if GetLocale() ~= "itIT" then return end
local L = MooveAlert.L

L.MSG_LOADED = "caricato. /ma per l'aiuto."

L.HELP_HEADER = "comandi disponibili:"
L.HELP_OPTIONS = "  /ma options            -- apri il pannello opzioni"
L.HELP_TEST = "  /ma test [1-4]         -- anteprima di un allarme (livello 3 predefinito)"
L.HELP_SOUND = "  /ma sound on|off       -- attiva/disattiva il suono"
L.HELP_FLASH = "  /ma flash on|off       -- attiva/disattiva il flash a schermo intero"
L.HELP_VOLUME = "  /ma volume <0-100>     -- imposta il volume"
L.HELP_MUTE = "  /ma mute <spellID>     -- silenzia un incantesimo specifico (questo personaggio)"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- riattiva un incantesimo silenziato"
L.HELP_SCAN = "  /ma scan               -- attiva/disattiva la modalità Scan (rilevamento incantesimi sconosciuti)"
L.HELP_REPORT = "  /ma report             -- elenca gli incantesimi sconosciuti rilevati dall'ultimo reset"
L.HELP_REPORTRESET = "  /ma reportreset        -- svuota la lista della modalità Scan"

L.WORD_ON = "attivato"
L.WORD_OFF = "disattivato"

L.MSG_SOUND = "suono: %s"
L.MSG_FLASH = "flash a schermo intero: %s"
L.MSG_VOLUME = "volume: %d%%"
L.MSG_MUTED = "incantesimo %d silenziato su questo personaggio."
L.MSG_UNMUTED = "incantesimo %d riattivato."
L.MSG_SCAN = "modalità Scan: %s"
L.MSG_REPORT_EMPTY = "nessun incantesimo sconosciuto rilevato dall'ultimo reset."
L.MSG_REPORT_HEADER = "incantesimi sconosciuti rilevati (copia per contribuire):"
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "lista della modalità Scan svuotata."

L.TEST_ALERT_LABEL = "Allarme di prova MooveAlert"

L.OPT_SOUND = "Suono attivato"
L.OPT_FLASH = "Flash a schermo intero attivato"
L.OPT_TRIVIAL = "Avvisa anche su contenuti trascurabili (basso livello)"
L.OPT_VOLUME_LABEL = "Volume"
L.OPT_HAZARD_FATIGUE = "Allarme affaticamento"
L.OPT_HAZARD_DROWNING = "Allarme annegamento"
L.OPT_HAZARD_LAVA = "Allarme lava / falò"

L.HAZARD_FATIGUE_NAME = "Affaticamento"
L.HAZARD_DROWNING_NAME = "Annegamento"
L.HAZARD_LAVA_NAME = "Lava"

L.MSG_NO_COMBATLOG_SOUND = "client senza registro di combattimento: solo avviso sonoro, sugli incantesimi che applicano un'aura."
L.MSG_NO_COMBATLOG_NONE = "client senza registro di combattimento né API delle aure: nessun rilevamento possibile."
