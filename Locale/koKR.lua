--------------------------------------------------------------------------
-- Locale/koKR.lua
-- Traduction non relue par un locuteur natif (cf. plan) : à vérifier en jeu.
--------------------------------------------------------------------------
if GetLocale() ~= "koKR" then return end
local L = MooveAlert.L

L.MSG_LOADED = "로드됨. 도움말은 /ma."

L.HELP_HEADER = "사용 가능한 명령어:"
L.HELP_OPTIONS = "  /ma options            -- 옵션 패널 열기"
L.HELP_TEST = "  /ma test [1-4]         -- 경고 미리보기 (기본 등급 3)"
L.HELP_SOUND = "  /ma sound on|off       -- 소리 켜기/끄기"
L.HELP_FLASH = "  /ma flash on|off       -- 화면 플래시 켜기/끄기"
L.HELP_VOLUME = "  /ma volume <0-100>     -- 음량 설정"
L.HELP_MUTE = "  /ma mute <spellID>     -- 특정 주문 음소거 (이 캐릭터)"
L.HELP_UNMUTE = "  /ma unmute <spellID>   -- 음소거 해제"
L.HELP_SCAN = "  /ma scan               -- 스캔 모드 전환 (알 수 없는 주문 탐지)"
L.HELP_REPORT = "  /ma report             -- 마지막 초기화 이후 감지된 알 수 없는 주문 목록"
L.HELP_REPORTRESET = "  /ma reportreset        -- 스캔 모드 목록 비우기"

L.WORD_ON = "켜짐"
L.WORD_OFF = "꺼짐"

L.MSG_SOUND = "소리: %s"
L.MSG_FLASH = "화면 플래시: %s"
L.MSG_VOLUME = "음량: %d%%"
L.MSG_MUTED = "이 캐릭터에서 주문 %d 음소거됨."
L.MSG_UNMUTED = "주문 %d 음소거 해제됨."
L.MSG_SCAN = "스캔 모드: %s"
L.MSG_REPORT_EMPTY = "마지막 초기화 이후 알 수 없는 주문이 없습니다."
L.MSG_REPORT_HEADER = "감지된 알 수 없는 주문 (기여하려면 복사하세요):"
L.MSG_REPORT_LINE = "  [%d] %s x%d"
L.MSG_REPORT_RESET = "스캔 모드 목록이 비워졌습니다."

L.TEST_ALERT_LABEL = "MooveAlert 테스트 경고"

L.OPT_SOUND = "소리 사용"
L.OPT_FLASH = "화면 플래시 사용"
L.OPT_TRIVIAL = "사소한(낮은 레벨) 콘텐츠에서도 경고"
L.OPT_VOLUME_LABEL = "음량"
L.OPT_HAZARD_FATIGUE = "피로 경고"
L.OPT_HAZARD_DROWNING = "익사 경고"
L.OPT_HAZARD_LAVA = "용암 / 모닥불 경고"

L.HAZARD_FATIGUE_NAME = "피로"
L.HAZARD_DROWNING_NAME = "익사"
L.HAZARD_LAVA_NAME = "용암"

L.MSG_NO_COMBATLOG_SOUND = "전투 기록이 없는 클라이언트: 오라를 거는 주문에 대해 소리 알림만 제공합니다."
L.MSG_NO_COMBATLOG_NONE = "전투 기록도 오라 API도 없는 클라이언트: 감지가 불가능합니다."
