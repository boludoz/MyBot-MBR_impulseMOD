; #FUNCTION# ====================================================================================================================
; Name ..........: CheckVersion
; Description ...: Check if we have last version of program
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Sardo (2015-06)
; Modified ......: CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once
;Global $g_sLastModversion = "" ;latest version from GIT
;Global $g_sLastModmessage = "" ;message for last version
;Global $g_sOldModversmessage = "" ;warning message for old bot

Func CheckVersion()

	If not $g_bCheckVersion Then Return

	; Get the last Version from API
	Local $g_sBotGitVersion = ""
	Local $sCorrectStdOut = InetRead("https://api.github.com/repos/txmazing/MyBot-MBR_impulseMOD/releases/latest")
	If @error Or $sCorrectStdOut = "" Then Return
	Local $Temp = BinaryToString($sCorrectStdOut)

	If $Temp <> "" And Not @error Then
		Local $g_aBotVersionN = StringSplit($g_sModversion, " ", 2)
		If @error Then
			Local $g_iBotVersionN = StringReplace($g_sModversion, "v", "")
		Else
			Local $g_iBotVersionN = StringReplace($g_aBotVersionN[0], "v", "")
		EndIf
		Local $version = GetLastVersion($Temp)
		$g_sBotGitVersion = StringReplace($version[0], "v", "")
		SetDebugLog("Last GitHub version is " & $g_sBotGitVersion )
		SetDebugLog("Your version is " & $g_iBotVersionN )

		If _VersionCompare($g_iBotVersionN, $g_sBotGitVersion) = -1 Then
			SetLog("WARNING, YOUR VERSION (" & $g_iBotVersionN & ") IS OUT OF DATE.", $COLOR_INFO)
			Local $ChangelogTXT = GetLastChangeLog($Temp)
			Local $Changelog = StringSplit($ChangelogTXT[0], '\r\n', $STR_ENTIRESPLIT + $STR_NOCOUNT)
			For $i = 0 To UBound($Changelog) - 1
				SetLog($Changelog[$i] )
			Next
			PushMsg("Update")
		ElseIf _VersionCompare($g_iBotVersionN, $g_sBotGitVersion) = 0 Then
			SetLog("WELCOME CHIEF, YOU HAVE THE LATEST impulseMOD VERSION", $COLOR_SUCCESS)
			SetLog("Version is " & $g_iBotVersionN, $COLOR_ACTION)
		Else
			SetLog("YOU ARE USING A FUTURE VERSION CHIEF!", $COLOR_ACTION)
			SetLog("Last GitHub version is " & $g_sBotGitVersion, $COLOR_ACTION)
			SetLog("Your version is " & $g_iBotVersionN, $COLOR_ACTION)
		EndIf
	Else
		SetDebugLog($Temp)
	EndIf
EndFunc   ;==>CheckVersion

Func GetLastVersion($txt)
	Return _StringBetween($txt, '_impulseMOD_', '",')
EndFunc   ;==>GetLastVersion

Func GetLastChangeLog($txt)
	Return _StringBetween($txt, '"body":"', '"}')
EndFunc   ;==>GetLastChangeLog

Func GetVersionNormalized($VersionString, $Chars = 5)
	If StringLeft($VersionString, 1) = "v" Then $VersionString = StringMid($VersionString, 2)
	Local $a = StringSplit($VersionString, ".", 2)
	Local $i
	For $i = 0 To UBound($a) - 1
		If StringLen($a[$i]) < $Chars Then $a[$i] = _StringRepeat("0", $Chars - StringLen($a[$i])) & $a[$i]
	Next
	Return _ArrayToString($a, ".")
EndFunc   ;==>GetVersionNormalized
