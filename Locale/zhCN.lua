--------------------------------------------------------------------------
-- Locale/zhCN.lua
-- Traduction non relue par un locuteur natif (cf. plan) : à vérifier en jeu.
--------------------------------------------------------------------------
if GetLocale() ~= "zhCN" then return end
local L = MooveAlert.L

L.MSG_LOADED = "已加载。输入 /ma 获取帮助。"

L.HELP_HEADER = "可用命令："
L.HELP_OPTIONS = "  /ma options            -- 打开选项面板"
L.HELP_TEST = "  /ma test [1-4]         -- 预览警报（默认等级 3）"
L.HELP_SOUND = "  /ma sound on|off       -- 开启/关闭声音"
L.HELP_FLASH = "  /ma flash on|off       -- 开启/关闭全屏闪烁"
L.HELP_VOLUME = "  /ma volume <0-100>     -- 设置音量"
L.HELP_MUTE = "  /ma mute <spellID>     -- 静音指定法术（仅此角色）"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- 取消静音"
L.HELP_SCAN = "  /ma scan               -- 切换扫描模式（记录未知法术）"
L.HELP_REPORT = "  /ma report             -- 列出上次重置以来检测到的未知法术"
L.HELP_REPORTRESET = "  /ma reportreset        -- 清空扫描模式列表"

L.WORD_ON = "已开启"
L.WORD_OFF = "已关闭"

L.MSG_SOUND = "声音：%s"
L.MSG_FLASH = "全屏闪烁：%s"
L.MSG_VOLUME = "音量：%d%%"
L.MSG_MUTED = "此角色已静音法术 %d。"
L.MSG_UNMUTED = "法术 %d 已取消静音。"
L.MSG_SCAN = "扫描模式：%s"
L.MSG_REPORT_EMPTY = "自上次重置以来未检测到未知法术。"
L.MSG_REPORT_HEADER = "检测到的未知法术（复制以供贡献）："
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "扫描模式列表已清空。"

L.TEST_ALERT_LABEL = "MooveAlert 测试警报"

L.OPT_SOUND = "启用声音"
L.OPT_FLASH = "启用全屏闪烁"
L.OPT_TRIVIAL = "即使在低等级内容中也发出警报"
L.OPT_VOLUME_LABEL = "音量"
L.OPT_HAZARD_FATIGUE = "疲劳警报"
L.OPT_HAZARD_DROWNING = "溺水警报"
L.OPT_HAZARD_LAVA = "熔岩 / 篝火警报"

L.HAZARD_FATIGUE_NAME = "疲劳"
L.HAZARD_DROWNING_NAME = "溺水"
L.HAZARD_LAVA_NAME = "熔岩"
