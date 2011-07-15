#include FcnLib.ahk

ChangeLogitechWheelMode()

;close junk that we don't want running during the race
Process, Close, FindAndRunRobot.exe
Process, Close, dsidebar.exe
SoundSet, 40

RunAhk("NR2003hotkeys.ahk")
;LaunchRace("68.195.69.18", "pedalsdown")
LaunchRaceViaRLM()
ExitApp

LaunchRaceViaRLM()
{
   ProcessClose("RLMArena.exe")
   RunProgram("C:\Program Files\RLM Arena 4.2\RLMArena.exe")
   WinWaitActive, , Enter your username and password for your RaceLM league.
   ss()
   Send, {TAB 3}{ENTER}
   ss()
   WinWaitActive, , Select League
   ss()
   Send, {TAB 2}{DOWN}
   WaitForImageSearch("images/nr2003/BlazinPedals.bmp")
   ClickIfImageSearch("images/nr2003/BlazinPedals.bmp")
   WaitForImageSearch("images/nr2003/LaunchRace.bmp")
   ClickIfImageSearch("images/nr2003/LaunchRace.bmp")
}

ChangeLogitechWheelMode()
{
   ;Tell the logitech profiler to go into NR2003 mode so that I don't have combined pedals
   Run, "C:\Program Files\Logitech\Profiler\LWEmon.exe"
   ForceWinFocus("Logitech Profiler")
   ;Send, {ALT}ps{ENTER}
   Send, {ALT}
   Sleep, 100
   Send, p
   Sleep, 100
   Send, s
   Sleep, 100
   Send, {ENTER}
   Sleep, 100
   WinClose, Logitech Profiler
}

;{{{ archived

LaunchTeamspeak()
{
   Run, "C:\Program Files\TeamSpeak 3 Client\ts3client_win32.exe"

   ForceWinFocus("TeamSpeak 3")
   Send, {CTRLDOWN}s{CTRLUP}

   ForceWinFocus("Connect")
   Send, {ENTER}

   ForceWinFocus("TeamSpeak 3")
   WaitForImageSearch("images\teamspeak\ConnectedToServer.bmp")
   MouseClick, left,  40,  115
   Sleep, 500
   ;WaitFor my name to disappear (or for the top area to turn into a plus sign)
   MouseClick, right,  67,  133
   ;Sleep, 100
   WaitForImageSearch("images\teamspeak\ReadyToSwitchChannels.bmp")
   Send, {DOWN}{ENTER}
}

LaunchRace(ip, pass)
{
   RunProgram("C:\Papyrus\NASCAR Racing 2003 Season\NR2003.exe")

   SleepSeconds(15)
   ;wait until full screen

   Click(481, 888, "left")
   Click(692, 489, "left")
   ss()
   Click(692, 489, "left")
   ss()
   Send, {BACKSPACE 50}
   Send, %ip%
   Click(580, 283, "left")
   ss()
   Click(580, 283, "left")
   ss()
   Send, {BACKSPACE 50}
   Send, %pass%
   Click(1615, 1054, "left")
}

LaunchRaceViaSmsLobby()
{
   RunProgram("C:\Program Files\SMS_Lobby\SMSLobby.exe")

   WinWaitActive, , NR2003
   Sleep, 100
   WaitForImageSearch("images/smsLobby/NascarSimWorld.bmp")
   ClickIfImageSearch("images/smsLobby/NascarSimWorld.bmp")
   Sleep, 100
   MouseClick, left,  502,  79
   Send, race
   Sleep, 100

   Click(935, 110)
}

;}}}

ss()
{
sleep, 1000
}