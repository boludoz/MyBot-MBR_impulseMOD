; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "MOD" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: rulesss 2018
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once
; ================================================== IM Debug ================================================== ;
Global $g_hBtnTestBuilderTimeOCR = 0, $g_hBtnTestGlobalChatBot = 0, $g_hBtnTestClanChatBot = 0, $g_hBtnTestTNRQT = 0
Global $g_hBtnTestGoblinXP = 0, $g_hBtnForceStopBot = 0, $g_hBtnTestWardenMode = 0, $g_hBtnTestBotHumanization = 0, $g_hBtnDragNDropQueue = 0, $g_hBtnTestLabUpgrade = 0
Global $g_hBtnTestBuilderBaseAtk = 0, $g_hBtnTestBuilderBaseObs = 0, $g_hBtnTestGTFO = 0, $g_hBtnTestStopForWar = 0

; ================================================== Super XP PART ================================================== ;
Global $g_hGrpSuperXP = 0, $g_hChkEnableSuperXP = 0, $g_hChkSkipZoomOutXP = 0, $g_hChkSkipDragToEndXP = 0, $g_hChkFastGoblinXP = 0, $rbSXTraining = 0, $g_hLblLOCKEDSX = 0, $rbSXIAttacking = 0, $g_hTxtMaxXPtoGain = 0
Global $g_hChkSXBK = 0, $g_hChkSXAQ = 0, $g_hChkSXGW = 0
Global $DocXP1 = 0, $DocXP2 = 0, $DocXP3 = 0, $DocXP4 = 0, $DocXP5 = 0
Global $g_hLblXPatStart = 0, $g_hLblXPCurrent = 0, $g_hLblXPSXWon = 0, $g_hLblXPSXWonHour = 0, $g_hLblXPRunTime = 0

; ================================================== GTFO PART ================================================== ;
Global $g_hLblGFTO = 0, $g_hChkUseGTFO = 0, $g_hTxtMinSaveGTFO_Elixir = 0, $g_hTxtMinSaveGTFO_DE = 0, $g_hTxtCyclesGTFO = 0
Global $g_hLblKickout = 0, $g_hChkUseKickOut = 0, $g_hTxtDonatedCap = 0, $g_hTxtReceivedCap = 0, $g_hChkKickOutSpammers = 0, $g_hTxtKickLimit = 0
Global $g_hLblInitialDonated = 0, $g_hLblCurrentDonated = 0, $g_hGUI_GTFOMOD = 0
Global $g_hChkGTFOClanHop = False, $g_hChkGTFOReturnClan = False

; ================================================== Humanization PART ================================================== ;
Global $g_hChkUseBotHumanization = 0, $g_hChkUseAltRClick = 0, $g_acmbPriority = 0, $g_hChallengeMessage = 0, $g_ahumanMessage
Global $g_hLabel1 = 0, $g_hLabel2 = 0, $g_hLabel3 = 0, $g_hLabel4 = 0
Global $g_hLabel5 = 0, $g_hLabel6 = 0, $g_hLabel7 = 0, $g_hLabel8 = 0
Global $g_hLabel9 = 0, $g_hLabel10 = 0, $g_hLabel11 = 0, $g_hLabel12 = 0
Global $g_hLabel14 = 0, $g_hLabel15 = 0, $g_hLabel16 = 0, $g_hLabel13 = 0
Global $g_hLabel17 = 0, $g_hLabel18 = 0, $g_hLabel20 = 0
Global $g_hChkCollectAchievements = 0, $g_hChkLookAtRedNotifications = 0, $g_hCmbMaxActionsNumber = 0
Global $g_acmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_acmbMaxSpeed[2] = [0, 0]
Global $g_acmbPause[2] = [0, 0]
Global $g_ahumanMessage[2] = ["", ""]

; ================================================== ChatBOT PART ================================================== ;
Global $g_hCmblang = 0, $g_hChkDelayTime = 0, $g_hTxtDelayTime = 0
Global $g_hChkGlobalChat = 0, $g_hChkGlobalScramble = 0, $g_hChkSwitchLang = 0, $g_hChkClanChat = 0, $g_hChkCleverbot = 0
Global $g_hChkUseResponses = 0, $g_hChkUseGeneric = 0, $g_hChkChatNotify = 0, $g_hChkPbSendNewChats = 0, $g_hChkRusLang = 0
Global $g_hTxtEditGlobalMessages1 = "", $g_hTxtEditGlobalMessages2 = ""
Global $g_hTxtEditResponses = 0, $g_hTxtEditGeneric = 0, $ChatbotQueuedChats[0], $ChatbotReadQueued = False, $ChatbotReadInterval = 0, $ChatbotIsOnInterval = False, $TmpResp
Global $g_alblAinGlobal, $g_alblSGchats, $g_alblSwitchlang, $g_alblChatclan, $g_alblUsecustomresp, $g_alblUsegenchats, $g_alblNotifyclanchat, $g_alblSwitchlang, $g_alblUseremotechat

Global $g_hGUI_MOD = 0

Global $g_hGUI_MOD_TAB = 0, $g_hGUI_MOD_TAB_HUMANIZATION = 0, $g_hGUI_MOD_TAB_CHATBOT = 0, $g_hGUI_MOD_TAB_GTFO = 0, $g_hGUI_MOD_TAB_GOBLIN_XP = 0, $g_hGUI_MOD_TAB_IM_DEBUG = 0

Func CreateMODTab()

	$g_hGUI_MOD = _GUICreate("", $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hFrmBotEx)

	GUISwitch($g_hGUI_MOD)
	$g_hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))
	$g_hGUI_MOD_TAB_HUMANIZATION = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_01", "Humanization"))
	TabHumanizationGUI()
	$g_hGUI_MOD_TAB_CHATBOT = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_02", "ChatBot"))
	TabChatBotGUI()
	$g_hGUI_MOD_TAB_GTFO = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_03", "GTFO"))
	TabGTFOGUI()
	$g_hGUI_MOD_TAB_GOBLIN_XP = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_04", "Goblin XP"))
	TabGoblinXPGUI()
	$g_hGUI_MOD_TAB_IM_DEBUG = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_08", "IM Debug"))
	TabIMDebugGUI()

	GUICtrlCreateTabItem("")

EndFunc   ;==>CreateMODTab

Func TabHumanizationGUI()
	Local $x = 25, $y = 45
	GUICtrlCreateGroup(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Group_01", "Settings"), $x - 20, $y, $g_iSizeWGrpTab2, $g_iSizeHGrpTab3)

	$y += 17
	$g_hChkUseBotHumanization = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseBotHumanization", "Enable Bot Humanization"), 20, $y, 137, 17)
	GUICtrlSetOnEvent(-1, "chkUseBotHumanization")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$g_hChkUseAltRClick = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick", "Make ALL BOT clicks random"), 274, $y, 162, 17)
	GUICtrlSetOnEvent(-1, "chkUseAltRClick")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$x -= 15
	$y += 30
	GUICtrlCreateIcon($g_sLibIconPath, $eIcnChat, $x, $y + 5, 32, 32)
	$g_hLabel1 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_01", "Read the Clan Chat"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[0] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel2 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_02", "Read the Global Chat"), $x + 240, $y + 5, 110, 17)
	$g_acmbPriority[1] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel4 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_04", "Say..."), $x + 40, $y + 30, 31, 17)
	$g_ahumanMessage[0] = GUICtrlCreateInput("Hello !", $x + 75, $y + 25, 121, 21)
	$g_hLabel3 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_03", "Or"), $x + 205, $y + 30, 15, 17)
	$g_ahumanMessage[1] = GUICtrlCreateInput("Re !", $x + 225, $y + 25, 121, 21)
	$g_acmbPriority[2] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel20 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_20", "Launch Challenges with message"), $x + 40, $y + 55, 170, 17)
	$g_hChallengeMessage = GUICtrlCreateInput("Can you beat my village?", $x + 205, $y + 50, 141, 21)
	$g_acmbPriority[12] = GUICtrlCreateCombo("", $x + 355, $y + 50, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 81

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnRepeat, $x, $y + 5, 32, 32)
	$g_hLabel5 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_05", "Watch Defenses"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[3] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbStandardReplay")
	$g_hLabel6 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_06", "Watch Attacks"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[4] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbStandardReplay")
	$g_hLabel7 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_07", "Max Replay Speed"), $x + 240, $y + 5, 110, 17)
	$g_acmbMaxSpeed[0] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sReplayChain, "2")
	$g_hLabel8 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_08", "Pause Replay"), $x + 240, $y + 30, 110, 17)
	$g_acmbPause[0] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnClan, $x, $y + 5, 32, 32)
	$g_hLabel9 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_09", "Look at War log"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[5] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel10 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_10", "Visit Clanmates"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[6] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel11 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_11", "Look at Best Players"), $x + 240, $y + 5, 110, 17)
	$g_acmbPriority[7] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel12 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_12", "Look at Best Clans"), $x + 240, $y + 30, 110, 17)
	$g_acmbPriority[8] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnTarget, $x, $y + 5, 32, 32)
	$g_hLabel14 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_14", "Look at Current War"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[9] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel16 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_16", "Watch Replays"), $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[10] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbWarReplay")
	$g_hLabel13 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_13", "Max Replay Speed"), $x + 240, $y + 5, 110, 17)
	$g_acmbMaxSpeed[1] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sReplayChain, "2")
	$g_hLabel15 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_15", "Pause Replay"), $x + 240, $y + 30, 110, 17)
	$g_acmbPause[1] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	GUICtrlCreateIcon($g_sLibIconPath, $eIcnSettings, $x, $y + 5, 32, 32)
	$g_hLabel17 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_17", "Do nothing"), $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[11] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_hLabel18 = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "Label_18", "Max Actions by Loop"), $x + 240, $y + 5, 103, 17)
	$g_hCmbMaxActionsNumber = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1|2|3|4|5", "2")

	$y += 25

	$g_hChkCollectAchievements = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkCollectAchievements", "Collect achievements automatically"), $x + 40, $y, 182, 17)
	GUICtrlSetOnEvent(-1, "chkCollectAchievements")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$g_hChkLookAtRedNotifications = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkLookAtRedNotifications", "Look at red/purple flags on buttons"), $x + 240, $y, 187, 17)
	GUICtrlSetOnEvent(-1, "chkLookAtRedNotifications")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	For $i = $g_hLabel1 To $g_hChkLookAtRedNotifications
		GUICtrlSetState($i, $GUI_DISABLE)
	Next

	chkUseBotHumanization()

EndFunc   ;==>TabHumanizationGUI

Func TabChatBotGUI()
	ChatbotReadSettings()
	Local $x = 10, $y = 45

	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "Group_01", "Global Chat"), 16 - $x, $y, 438, 185) ;30
	$y += 17
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnNEWChat1, $x + 7, $y, 40, 40) ;55
	$g_hChkGlobalChat = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkGlobalChat_01", "Advertise in global"), 80 - $x, $y, 155, 17) ;54
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkGlobalChat_02", "Use global chat to send messages"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkGlobalChat")

	$g_hChkSwitchLang = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkSwitchLang_01", "Switch languages"), 270 - $x, $y, 115, 17) ;54
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkSwitchLang_02", "Switch languages after spamming for a new global chatroom"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkSwitchLang")
	;======kychera===========
	$g_hCmblang = GUICtrlCreateCombo("", 390 - $x, $y, 50, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL)) ;54
	GUICtrlSetData(-1, "EN|FR|DE|ES|IT|NL|NO|PR|TR|RU", "RU")
	GUICtrlSetState(-1, $GUI_INDETERMINATE)
	;==========================
	$y += 17
	$g_hChkGlobalScramble = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkGlobalScramble_01", "Scramble global chats"), 80 - $x, $y, 170, 17) ;75
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkGlobalScramble_02", "Scramble the message pieces defined in the textboxes below to be in a random order"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkGlobalScramble")

	$g_hChkRusLang = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkRusLang_01", "Russian"), $x + 250, $y, 115, 17) ;75
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkRusLang_02", "On. Russian send text. Note: The input language in the Android emulator must be RUSSIAN."))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkRusLang")

	$y += 17
	$g_hChkDelayTime = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "ChkDelayTime_01", "Delay Time"), 80 - $x, $y, -1, -1) ;95
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkDelayTime")
	$g_hTxtDelayTime = GUICtrlCreateInput("10", 160 - $x, $y + 2, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER)) ;96
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetLimit(-1, 2)
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "Label_15", "min"), 190 - $x, $y + 3, -1, -1) ;98

	$y += 25
	$g_hTxtEditGlobalMessages1 = GUICtrlCreateEdit(_ArrayToString($g_iChkGlobalMessages1, @CRLF), 24 - $x, $y, 420, 49) ;131
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "editGlobalMessages1_01", "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
	GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
	$y += 51
	$g_hTxtEditGlobalMessages2 = GUICtrlCreateEdit(_ArrayToString($g_iChkGlobalMessages2, @CRLF), 24 - $x, $y, 420, 49) ;182
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "editGlobalMessages2_01", "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
	GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")

	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 60
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "Group_02", "Clan Chat"), 16 - $x, $y, 438, 190) ;240
	$y += 17
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnNEWChat, $x + 5, $y, 40, 40) ;270
	$g_hChkClanChat = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkClanChat_01", "Chat in clan chat"), 70 - $x, $y, 97, 17) ;260
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkClanChat_02", "Use clan chat to send messages"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkClanChat")

	$g_hTxtEditResponses = GUICtrlCreateEdit(_ArrayToString($g_iChkClanResponses, ":", -1, -1, @CRLF), 220 - $x, $y - 5, 217, 81) ;250
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "editResponses_01", "Look for the specified keywords in clan messages and respond with the responses. One item per line, in the format keyword:response"))
	GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
	$y += 17
	$g_hChkUseResponses = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkUseResponses_01", "Use custom responses"), 70 - $x, $y, 135, 17) ;280
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkUseResponses_02", "Use the keywords and responses defined below"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkUseResponses")
	$y += 17
	$g_hChkUseGeneric = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkUseGeneric_01", "Use generic chats"), 70 - $x, $y, 97, 17) ;300
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkUseGeneric_02", "Use generic chats if reading the latest chat failed or there are no new chats"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkUseGeneric")
	$y += 17
	$g_hChkCleverbot = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkCleverbot_01", "Cleverbot"), 70 - $x, $y, 97, 17) ;320
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkCleverbot_02", "Enabele on this function to communicate Cleverbot with your clan"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkCleverbot")
	$y += 35
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnTelegram, $x + 7, $y, 32, 32)
	$g_hChkChatNotify = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkChatNotify_01", "Use remote for chatting"), 70 - $x, $y, 126, 17) ;350
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkChatNotify_02", "Send and recieve chats via pushbullet or telegram." & @CRLF & "Use BOT <myvillage> GETCHATS <interval|NOW|STOP> to get the latest clan" & @CRLF & "chat as an image, and BOT <myvillage> SENDCHAT <chat message> to send a chat to your clan"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkChatNotify")

	$g_hTxtEditGeneric = GUICtrlCreateEdit(_ArrayToString($g_iChkClanMessages, @CRLF), 220 - $x, $y - 5, 217, 81) ;340
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "editGeneric_01", "Generic messages to send, one per line"))
	GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
	$y += 17
	$g_hChkPbSendNewChats = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkPbSendNewChats_01", "Notify me new chat clan"), 70 - $x, $y, 150, 17) ;370
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Chat", "chkPbSendNewChats_02", "Will send an image of your clan chat via pushbullet & telegram when a new chat is detected. Not guaranteed to be 100% accurate."))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkPbSendNewChats")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

EndFunc   ;==>TabChatBotGUI

Func TabGTFOGUI()

	Local $x = 25, $y = 45
	GUICtrlCreateGroup(GetTranslatedFileIni("MOD GUI Design - Misc", "Group_01", "Special Kickass Donation"), $x - 20, $y, $g_iSizeWGrpTab2, 230)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)

	$y += 17
	$x -= 17
	$g_hLblGFTO = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblGTFO", "Lightning Fast Troops'n'Spells Donation"), $x, $y, 436, 22, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Misc", "LblGTFO_Info_01", "This is a Standalone feature!") & @CRLF & _
			GetTranslatedFileIni("MOD GUI Design - Misc", "LblGTFO_Info_02", "Just Set your custom train, correct capacities") & @CRLF & _
			GetTranslatedFileIni("MOD GUI Design - Misc", "LblGTFO_Info_03", "And This feature!"))
	GUICtrlSetBkColor($g_hLblGFTO, 0xA3FFB7) ; Blue
	GUICtrlSetFont($g_hLblGFTO, 12, 500, 0, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)

	$y += 30
	$g_hChkUseGTFO = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Misc", "ChkUseGTFO", "Enable it (at your own risks...)"), $x + 20, $y, -1, 17)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyGTFO")

	$y += 5
	$x -= 15
	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblMinSaveGTFO_01", "Exit SKD when Elixir") & " <", $x + 25, $y + 25, -1, -1)
	$g_hTxtMinSaveGTFO_Elixir = GUICtrlCreateInput("200000", $x + 160, $y + 22, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyElixirGTFO")

	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblMinSaveGTFO_02", "Exit SKD when Dark Elixir") & " <", $x + 25, $y + 50, -1, -1)
	$g_hTxtMinSaveGTFO_DE = GUICtrlCreateInput("2000", $x + 160, $y + 47, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyDarkElixirGTFO")

	$g_hChkGTFOClanHop = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Misc", "GTFOClanHop", "Clan hop after jump donate"), $x + 30, $y + 75, -1, -1)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "chkGTFOClanHop")

	$g_hChkGTFOReturnClan = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Misc", "GTFOReturnClan", "Return to clan after finish"), $x + 30, $y + 100, -1, -1)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "chkGTFOReturnClan")

	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblClanReturn", "Return to clan") & ": ", $x + 25, $y + 125, -1, -1)
	$g_hTxtClanID = GUICtrlCreateInput("#XXXXXX", $x + 160, $y + 123, 56, 21)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyClanReturnGTFO")

	;GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblMaxCyclesGTFO", "Exit after cycles") & ": ", $x + 25, $y + 150, -1, -1)
	;$g_hTxtCyclesGTFO = GUICtrlCreateInput("200", $x + 160, $y + 147, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	;GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	;GUICtrlSetColor(-1, $COLOR_BLACK)
	;GUICtrlSetOnEvent(-1, "ApplyCyclesGTFO")
	$x += 210
	$y += 2
	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "Label_01", "Goal of SKD is lightning fast donation"), $x + 2, $y, 250, -1, $SS_CENTER)
	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "Label_02", "SKD is perfect for GTFO and to win a lot of XP !"), $x + 2, $y + 18, 250, -1, $SS_CENTER)
	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "Label_03", "Time usage: 95% on Donations, 5% on Training"), $x + 2, $y + 36, 250, -1, $SS_CENTER)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)

	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "Label_04", "Initial") & ": ", $x + 17, $y + 54, -1, -1)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	$g_hLblInitialDonated = GUICtrlCreateLabel("0", $x + 52, $y + 54, 40, -1, $SS_LEFT)

	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "Label_05", "Current") & ": ", $x + 112, $y + 54, -1, -1)
	$g_hLblCurrentDonated = GUICtrlCreateLabel("0", $x + 157, $y + 54, 40, -1, $SS_LEFT)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 25, $y = 300
	GUICtrlCreateGroup(GetTranslatedFileIni("MOD GUI Design - Misc", "Group_02", "Special Kickass New Members"), $x - 20, $y - 20, $g_iSizeWGrpTab2, 150)
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)

	$x -= 17
	$g_hLblKickout = GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblKickout", "Kickout Spammers / New Members"), $x, $y, 436, 22, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetBkColor($g_hLblKickout, 0xA3FFB7)
	GUICtrlSetFont($g_hLblKickout, 12, 500, 0, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)

	$y += 30
	$g_hChkUseKickOut = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Misc", "ChkUseKickOut", "Enable it (at your own risks...)"), $x + 20, $y, -1, 17)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Misc", "ChkUseKickOut_Info_01", "Is necessary to be a Co-Leader or Leader"))
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyKickOut")

	$y += 25
	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblDonatedCap", "Donated Cap"), $x + 20, $y, -1, -1)
	$g_hTxtDonatedCap = GUICtrlCreateInput("8", $x + 120, $y - 2, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Misc", "LblDonatedCap_Info_01", "New member + Donated Troops Limits, when reach will be kick [0-8]"))
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyDonatedCap")

	$y += 25
	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblReceivedCap", "Received Cap"), $x + 20, $y, -1, -1)
	$g_hTxtReceivedCap = GUICtrlCreateInput("35", $x + 120, $y - 2, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Misc", "LblReceivedCap_Info_01", "New member + Received Troops limits, when reach will be kick [0-35]"))
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyReceivedCap")

	$y -= 10
	$g_hChkKickOutSpammers = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Misc", "ChkKickOutSpammers", "KickOut Spammers"), $x + 190, $y, -1, 17)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Misc", "ChkKickOutSpammers_Info_01", "Kick only members with Donations and '0' Requests!"))
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyKickOutSpammers")

	GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Misc", "LblKickLimit", "Kickout Limits"), $x + 359, $y - 15, -1, -1)
	$g_hTxtKickLimit = GUICtrlCreateInput("6", $x + 365, $y, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Misc", "LblKickLimit_Info_01", "How many Members will be kick each time.[1-9]") & @CRLF & _
			GetTranslatedFileIni("MOD GUI Design - Misc", "LblKickLimit_Info_02", "From Bottom Rank to Top"))
	GUICtrlSetFont(-1, 9, $FW_BOLD, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, $COLOR_BLACK)
	GUICtrlSetOnEvent(-1, "ApplyKickLimits")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

EndFunc   ;==>TabGTFOGUI

Func TabGoblinXPGUI()

	Local $x = 25, $y = 45, $xStart = 25, $yStart = 50

	$g_hGrpSuperXP = GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP_Info_05", "Goblin XP"), $x - 20, $y, 440, 340)
	$y += 17
	$g_hChkEnableSuperXP = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP_Info_01", "Enable Goblin XP"), $x, $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP")
	$g_hChkSkipZoomOutXP = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkSkipZoomOutXP", "Skip ZoomOut"), $x + 120, $y, -1, -1)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkSkipZoomOutXP_01", "Skip ZoomOut after Attack Finsihed."))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$g_hChkFastGoblinXP = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkFastGoblinXP", "Fast GoblinXP"), $x + 215, $y, -1, -1)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkFastGoblinXP_01", "Skip Current Xp Check from main screen and make GoblinXP Fast."))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$g_hChkSkipDragToEndXP = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkSkipDragToEndXP", "Skip Drag To End"), $x + 310, $y, -1, -1)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkSkipDragToEndXP_01", "Skip End Drag To Start Finding Goblin Picnic From Current Mission.") & @CRLF & _
			GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkSkipDragToEndXP_02", "Note: Uncheck When You Have Unlocked All Goblin Missions. It will be fast.") & @CRLF & _
			GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkSkipDragToEndXP_03", "Note: Check When You Have New Missions Locked. It will be fast."))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$rbSXTraining = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_01", "Farm XP during troops Training"), $x, $y + 25, 220, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$g_hLblLOCKEDSX = GUICtrlCreateLabel("LOCKED", $x + 210, $y + 35, 173, 50)
	GUICtrlSetFont(-1, 30, 800, 0, "Arial")
	GUICtrlSetColor(-1, 0xFF0000)
	GUICtrlSetState(-1, $GUI_HIDE)
	$rbSXIAttacking = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_02", "Farm XP instead of Attacking"), $x, $y + 45, 158, 17)
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_03", "Max XP to Gain") & ":", $x, $y + 78, -1, 17)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$g_hTxtMaxXPtoGain = GUICtrlCreateInput("500", $x + 85, $y + 75, 70, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetLimit(-1, 8)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$x += 129
	$y += 120
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_04", "Use"), $x - 35, $y + 13, 23, 17)
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnKing, $x, $y, 32, 32)
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnQueen, $x + 40, $y, 32, 32)
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnWarden, $x + 80, $y, 32, 32)
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_05", "to gain XP"), $x + 123, $y + 13, 53, 17)
	$x += 10
	$g_hChkSXBK = GUICtrlCreateCheckbox("", $x, $y + 35, 13, 13)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$g_hChkSXAQ = GUICtrlCreateCheckbox("", $x + 40, $y + 35, 13, 13)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$g_hChkSXGW = GUICtrlCreateCheckbox("", $x + 80, $y + 35, 13, 13)
	GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")

	$x = $xStart + 7
	$y += 85
	$DocXP1 = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_07", "XP at Start"), $x - 20, $y, 90, 19)
	GUICtrlSetBkColor(-1, 0xD8D8D8)
	$DocXP2 = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_08", "Current XP"), $x + 65, $y, 90, 19)
	GUICtrlSetBkColor(-1, 0xD8D8D8)
	$DocXP3 = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_09", "XP Won"), $x + 150, $y, 90, 19)
	GUICtrlSetBkColor(-1, 0xD8D8D8)
	$DocXP4 = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_10", "XP Won/Hour"), $x + 240, $y, 75, 19)
	GUICtrlSetBkColor(-1, 0xD8D8D8)
	$DocXP5 = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "chkEnableSuperXP2_Info_11", "Runtime"), $x + 315, $y, 90, 19)
	GUICtrlSetBkColor(-1, 0xD8D8D8)

	$y += 15
	$g_hLblXPatStart = GUICtrlCreateLabel("0", $x - 20, $y + 7, 90, 32)
	GUICtrlSetFont(-1, 17, 800, 0, "Arial")
	GUICtrlSetBkColor(-1, 0xbfdfff)
	$g_hLblXPCurrent = GUICtrlCreateLabel("0", $x + 65, $y + 7, 90, 32)
	GUICtrlSetFont(-1, 17, 800, 0, "Arial")
	GUICtrlSetBkColor(-1, 0xbfdfff)
	$g_hLblXPSXWon = GUICtrlCreateLabel("0", $x + 150, $y + 7, 90, 32)
	GUICtrlSetFont(-1, 17, 800, 0, "Arial")
	GUICtrlSetBkColor(-1, 0xbfdfff)
	$g_hLblXPSXWonHour = GUICtrlCreateLabel("0", $x + 240, $y + 7, 75, 32)
	GUICtrlSetFont(-1, 17, 800, 0, "Arial")
	GUICtrlSetBkColor(-1, 0xbfdfff)
	$g_hLblXPRunTime = GUICtrlCreateLabel("00:00:00", $x + 315, $y + 7, 90, 32)
	GUICtrlSetFont(-1, 17, 800, 0, "Arial")
	GUICtrlSetBkColor(-1, 0xbfdfff)

	$x = $xStart
	$y += 55
	GUICtrlCreateLabel( GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "Label_03", "Goblin XP attack continuously the TH of Goblin Picnic to farm XP."), $x - 13, $y, 312, 17)
	GUICtrlCreateLabel( GetTranslatedFileIni("MBR GUI Design MOD - Goblin XP", "Label_04", "At each attack, you win 5 XP"), $x - 13, $y + 20, 306, 17)

	chkEnableSuperXP()

	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc   ;==>TabGoblinXPGUI

Func TabIMDebugGUI()
	Local $x = 5, $y = 45 ;For Border
	Local $yNext = 30
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design MOD - SM Debug", "Group_01", "IM Debug"), $x, $y, $g_iSizeWGrpTab2, $g_iSizeHGrpTab2)
	$x = 300
	$y += 17
;	$g_hBtnTestBuilderTimeOCR = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestBuilderTimeOCR", "Check Builder Time OCR"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestBuilderTimeOCR")
	$y += $yNext
;	$g_hBtnTestWardenMode = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestWardenMode", "Check Warden Mode"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestWardenMode")
	$y += $yNext
	$g_hBtnTestGlobalChatBot = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestGlobalChatBot", "Test Global Chat Bot"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestGlobalChatBot")
	$y += $yNext
	$g_hBtnTestClanChatBot = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestClanChatBot", "Test Clan Chat Bot"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestClanChatBot")
	$y += $yNext
;	$g_hBtnTestTNRQT = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestTNRQT", "Test TNRQT"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestTNRQT")
	$y += $yNext
;	$g_hBtnTestCheckOneGem = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestCheckOneGem", "Test Check Gem Boost"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestCheckOneGem")
	$y += $yNext
	$g_hBtnTestGoblinXP = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestGoblinXP", "Test Goblin XP"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestGoblinXP")
	$y += $yNext
	$g_hBtnTestBotHumanization = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestBotHumanization", "Test Bot Humanization"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestBotHumanization")
	$y += $yNext
;	$g_hBtnDragNDropQueue = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnDragNDropQueue", "Test DragNDropQueue"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnDragNDropQueue")
	$y += $yNext
;	$g_hBtnTestLabUpgrade = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestLabUpgrade", "Test Lab Upgrade"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestLabUpgrade")
	$y += $yNext
	$g_hBtnTestGTFO = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestGTFO", "Test GTFO"), $x, $y, 140, 25)
	GUICtrlSetOnEvent(-1, "btnTestGTFO")
	$y += $yNext
;	$g_hBtnTestBuilderBaseAtk = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestBuilderBaseAtk", "Test BB Attack Now"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestBuilderBaseAtk")

	$x -= 145
	$y = 62

;	$g_hBtnTestBuilderBaseObs = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestBuilderBaseObs", "Test BB Remove Obstacles"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestBuilderBaseObs")
	$y += $yNext
;	$g_hBtnTestStopForWar = 0 = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnTestStopForWar", "Test Stop For War"), $x, $y, 140, 25)
;	GUICtrlSetOnEvent(-1, "btnTestStopForWar")

	;$x = 145
	;$y = 13 * $yNext
	;$g_hBtnForceStopBot = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design MOD - IM Debug", "BtnForceStopBot", "Force Stop BOT"), $x - 135, $y + 10, 140, 25)
	;GUICtrlSetOnEvent(-1, "btnForceStopBot")

EndFunc   ;==>TabIMDebugGUI
