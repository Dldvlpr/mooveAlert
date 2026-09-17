--------------------------------------------------------------------------
-- Locale/ptBR.lua
--------------------------------------------------------------------------
if GetLocale() ~= "ptBR" then return end
local L = MooveAlert.L

L.MSG_LOADED = "carregado. /ma para ajuda."

L.HELP_HEADER = "comandos disponíveis:"
L.HELP_OPTIONS = "  /ma options            -- abrir o painel de opções"
L.HELP_TEST = "  /ma test [1-4]         -- pré-visualizar um alerta (nível 3 por padrão)"
L.HELP_SOUND = "  /ma sound on|off       -- ativar/desativar o som"
L.HELP_FLASH = "  /ma flash on|off       -- ativar/desativar o flash de tela cheia"
L.HELP_VOLUME = "  /ma volume <0-100>     -- ajustar o volume"
L.HELP_MUTE = "  /ma mute <spellID>     -- silenciar uma magia específica (este personagem)"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- reativar uma magia silenciada"
L.HELP_SCAN = "  /ma scan               -- alternar o modo Scan (detecção de magias desconhecidas)"
L.HELP_REPORT = "  /ma report             -- listar magias desconhecidas detectadas desde o último reset"
L.HELP_REPORTRESET = "  /ma reportreset        -- limpar a lista do modo Scan"

L.WORD_ON = "ativado"
L.WORD_OFF = "desativado"

L.MSG_SOUND = "som: %s"
L.MSG_FLASH = "flash de tela cheia: %s"
L.MSG_VOLUME = "volume: %d%%"
L.MSG_MUTED = "magia %d silenciada neste personagem."
L.MSG_UNMUTED = "magia %d reativada."
L.MSG_SCAN = "modo Scan: %s"
L.MSG_REPORT_EMPTY = "nenhuma magia desconhecida detectada desde o último reset."
L.MSG_REPORT_HEADER = "magias desconhecidas detectadas (copie isto para contribuir):"
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "lista do modo Scan limpa."

L.TEST_ALERT_LABEL = "Alerta de teste do MooveAlert"

L.OPT_SOUND = "Som ativado"
L.OPT_FLASH = "Flash de tela cheia ativado"
L.OPT_TRIVIAL = "Alertar mesmo em conteúdo trivial (baixo nível)"
L.OPT_VOLUME_LABEL = "Volume"
L.OPT_HAZARD_FATIGUE = "Alerta de fadiga"
L.OPT_HAZARD_DROWNING = "Alerta de afogamento"
L.OPT_HAZARD_LAVA = "Alerta de lava / fogueira"

L.HAZARD_FATIGUE_NAME = "Fadiga"
L.HAZARD_DROWNING_NAME = "Afogamento"
L.HAZARD_LAVA_NAME = "Lava"
