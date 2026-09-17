--------------------------------------------------------------------------
-- Locale/zhTW.lua
-- Traduction non relue par un locuteur natif (cf. plan) : à vérifier en jeu.
--------------------------------------------------------------------------
if GetLocale() ~= "zhTW" then return end
local L = MooveAlert.L

L.MSG_LOADED = "已載入。輸入 /ma 取得說明。"

L.HELP_HEADER = "可用指令："
L.HELP_OPTIONS = "  /ma options            -- 開啟選項面板"
L.HELP_TEST = "  /ma test [1-4]         -- 預覽警報（預設等級 3）"
L.HELP_SOUND = "  /ma sound on|off       -- 開啟/關閉聲音"
L.HELP_FLASH = "  /ma flash on|off       -- 開啟/關閉全螢幕閃光"
L.HELP_VOLUME = "  /ma volume <0-100>     -- 設定音量"
L.HELP_MUTE = "  /ma mute <spellID>     -- 將特定法術靜音（僅此角色）"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- 取消靜音"
L.HELP_SCAN = "  /ma scan               -- 切換掃描模式（偵測未知法術）"
L.HELP_REPORT = "  /ma report             -- 列出上次重置後偵測到的未知法術"
L.HELP_REPORTRESET = "  /ma reportreset        -- 清空掃描模式清單"

L.WORD_ON = "已開啟"
L.WORD_OFF = "已關閉"

L.MSG_SOUND = "聲音：%s"
L.MSG_FLASH = "全螢幕閃光：%s"
L.MSG_VOLUME = "音量：%d%%"
L.MSG_MUTED = "此角色已將法術 %d 靜音。"
L.MSG_UNMUTED = "法術 %d 已取消靜音。"
L.MSG_SCAN = "掃描模式：%s"
L.MSG_REPORT_EMPTY = "自上次重置後未偵測到未知法術。"
L.MSG_REPORT_HEADER = "偵測到的未知法術（複製以貢獻）："
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "掃描模式清單已清空。"

L.TEST_ALERT_LABEL = "MooveAlert 測試警報"

L.OPT_SOUND = "啟用聲音"
L.OPT_FLASH = "啟用全螢幕閃光"
L.OPT_TRIVIAL = "即使在低等級內容中也發出警報"
L.OPT_VOLUME_LABEL = "音量"
L.OPT_HAZARD_FATIGUE = "疲勞警報"
L.OPT_HAZARD_DROWNING = "溺水警報"
L.OPT_HAZARD_LAVA = "熔岩 / 營火警報"

L.HAZARD_FATIGUE_NAME = "疲勞"
L.HAZARD_DROWNING_NAME = "溺水"
L.HAZARD_LAVA_NAME = "熔岩"
