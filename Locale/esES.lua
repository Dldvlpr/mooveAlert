--------------------------------------------------------------------------
-- Locale/esES.lua
--------------------------------------------------------------------------
if GetLocale() ~= "esES" then return end
local L = MooveAlert.L

L.MSG_LOADED = "cargado. /ma para ayuda."

L.HELP_HEADER = "comandos disponibles:"
L.HELP_OPTIONS = "  /ma options            -- abrir el panel de opciones"
L.HELP_TEST = "  /ma test [1-4]         -- previsualizar una alerta (nivel 3 por defecto)"
L.HELP_SOUND = "  /ma sound on|off       -- activar/desactivar el sonido"
L.HELP_FLASH = "  /ma flash on|off       -- activar/desactivar el destello en pantalla"
L.HELP_VOLUME = "  /ma volume <0-100>     -- ajustar el volumen"
L.HELP_MUTE = "  /ma mute <spellID>     -- silenciar un hechizo concreto (este personaje)"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- reactivar un hechizo silenciado"
L.HELP_SCAN = "  /ma scan               -- alternar el modo Scan (detección de hechizos desconocidos)"
L.HELP_REPORT = "  /ma report             -- listar los hechizos desconocidos desde el último reinicio"
L.HELP_REPORTRESET = "  /ma reportreset        -- vaciar la lista del modo Scan"

L.WORD_ON = "activado"
L.WORD_OFF = "desactivado"

L.MSG_SOUND = "sonido: %s"
L.MSG_FLASH = "destello en pantalla: %s"
L.MSG_VOLUME = "volumen: %d%%"
L.MSG_MUTED = "hechizo %d silenciado en este personaje."
L.MSG_UNMUTED = "hechizo %d reactivado."
L.MSG_SCAN = "modo Scan: %s"
L.MSG_REPORT_EMPTY = "ningún hechizo desconocido detectado desde el último reinicio."
L.MSG_REPORT_HEADER = "hechizos desconocidos detectados (copia esto para contribuir):"
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "lista del modo Scan vaciada."

L.TEST_ALERT_LABEL = "Alerta de prueba MooveAlert"

L.OPT_SOUND = "Sonido activado"
L.OPT_FLASH = "Destello en pantalla activado"
L.OPT_TRIVIAL = "Alertar incluso en contenido trivial (bajo nivel)"
L.OPT_VOLUME_LABEL = "Volumen"
L.OPT_HAZARD_FATIGUE = "Alerta de fatiga"
L.OPT_HAZARD_DROWNING = "Alerta de ahogamiento"
L.OPT_HAZARD_LAVA = "Alerta de lava / hoguera"

L.HAZARD_FATIGUE_NAME = "Fatiga"
L.HAZARD_DROWNING_NAME = "Ahogamiento"
L.HAZARD_LAVA_NAME = "Lava"

L.MSG_NO_COMBATLOG_SOUND = "cliente sin registro de combate: solo alerta sonora, en hechizos que aplican un aura."
L.MSG_NO_COMBATLOG_NONE = "cliente sin registro de combate ni API de auras: no es posible detectar nada."
