--------------------------------------------------------------------------
-- Locale/ruRU.lua
-- Traduction non relue par un locuteur natif (cf. plan) : à vérifier en jeu.
--------------------------------------------------------------------------
if GetLocale() ~= "ruRU" then return end
local L = MooveAlert.L

L.MSG_LOADED = "загружен. /ma для справки."

L.HELP_HEADER = "доступные команды:"
L.HELP_OPTIONS = "  /ma options            -- открыть панель настроек"
L.HELP_TEST = "  /ma test [1-4]         -- предпросмотр оповещения (по умолчанию уровень 3)"
L.HELP_SOUND = "  /ma sound on|off       -- вкл/выкл звук"
L.HELP_FLASH = "  /ma flash on|off       -- вкл/выкл вспышку на экране"
L.HELP_VOLUME = "  /ma volume <0-100>     -- настроить громкость"
L.HELP_MUTE = "  /ma mute <spellID>     -- отключить конкретное заклинание (на этом персонаже)"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- включить отключённое заклинание"
L.HELP_SCAN = "  /ma scan               -- переключить режим Scan (поиск неизвестных заклинаний)"
L.HELP_REPORT = "  /ma report             -- список неизвестных заклинаний с последнего сброса"
L.HELP_REPORTRESET = "  /ma reportreset        -- очистить список режима Scan"

L.WORD_ON = "включено"
L.WORD_OFF = "выключено"

L.MSG_SOUND = "звук: %s"
L.MSG_FLASH = "вспышка на экране: %s"
L.MSG_VOLUME = "громкость: %d%%"
L.MSG_MUTED = "заклинание %d отключено на этом персонаже."
L.MSG_UNMUTED = "заклинание %d снова включено."
L.MSG_SCAN = "режим Scan: %s"
L.MSG_REPORT_EMPTY = "неизвестных заклинаний с последнего сброса не обнаружено."
L.MSG_REPORT_HEADER = "обнаруженные неизвестные заклинания (скопируйте для вклада):"
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "список режима Scan очищен."

L.TEST_ALERT_LABEL = "Тестовое оповещение MooveAlert"

L.OPT_SOUND = "Звук включён"
L.OPT_FLASH = "Вспышка на экране включена"
L.OPT_TRIVIAL = "Оповещать даже на тривиальном (низкоуровневом) контенте"
L.OPT_VOLUME_LABEL = "Громкость"
L.OPT_HAZARD_FATIGUE = "Оповещение об усталости"
L.OPT_HAZARD_DROWNING = "Оповещение о утоплении"
L.OPT_HAZARD_LAVA = "Оповещение о лаве / костре"

L.HAZARD_FATIGUE_NAME = "Усталость"
L.HAZARD_DROWNING_NAME = "Утопление"
L.HAZARD_LAVA_NAME = "Лава"

L.MSG_NO_COMBATLOG_SOUND = "клиент без журнала боя: только звуковое оповещение по заклинаниям, накладывающим ауру."
L.MSG_NO_COMBATLOG_NONE = "клиент без журнала боя и API аур: обнаружение невозможно."
