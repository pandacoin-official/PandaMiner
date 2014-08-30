#EndRegion ;
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$pnd_gui = GUICreate("pandaminer", 703, 503, 192, 137)
GUISetFont(8, 400, 0, "Arial")
GUISetBkColor(0x337247)
Opt("GUIOnEventMode", 1) ; Change to OnEvent mode
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")

$worker = GUICtrlCreateInput("Pandacoin Account Address", 246, 72, 209, 24)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0x7F7F7F)

$password = GUICtrlCreateInput("Worker Name", 246, 112, 209, 24)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0x7F7F7F)

$start = GUICtrlCreateButton("Start", 246, 320, 89, 41, $BS_FLAT)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x7F7F7F)
GUICtrlSetOnEvent($start, "start")

$stop = GUICtrlCreateButton("Stop", 368, 320, 89, 41, $BS_FLAT)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x7F7F7F)
GUICtrlSetOnEvent($stop, "stop")

$cpu_check = GUICtrlCreateCheckbox("", 246, 290, 12, 12)
GUICtrlSetColor(-1, 0xFFFFFF)

$gpu_check = GUICtrlCreateCheckbox("", 304, 290, 12, 12)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetState($gpu_check, $GUI_CHECKED)

$gpu_combo = GUICtrlCreateCombo("", 246, 208, 209, 25, BitOR($CBS_DROPDOWN, $WS_VSCROLL))
GUICtrlSetData(-1, "default (intensity ignored)|Radeon 5750|Radeon 5770|Radeon 5850|Radeon 5870|Radeon 5970|Radeon 6750|Radeon 6770|Radeon 6850|Radeon 6870|Radeon 6930|Radeon 6950|Radeon 6970|Radeon 6990|Radeon 7750|Radeon 7770|Radeon 7850 (low usage)|Radeon 7850 (high usage)|Radeon 7870 (low usage)|Radeon 7870 (high usage)|Radeon 7950 (low usage)|Radeon 7950 (high usage)|Radeon 7970 (low usage)|Radeon 7970 (high usage)|Radeon R7 260|Radeon R7 260X|Radeon R9 270|Radeon R9 270X|Radeon R9 280|Radeon R9 280X|Radeon R9 290 (low usage)|Radeon R9 290 (high usage)|Radeon R9 290X (low usage)|Radeon R9 290X (high usage)|nVidia x86(gpu)|nVidia x86(gpu+cpu)|nVidia x64(gpu)|nVidia x64(gpu+cpu)", "default (intensity ignored)")
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0x7F7F7F)
GUICtrlSetOnEvent($gpu_combo, "gpu_combo")

$gpu_label = GUICtrlCreateLabel("Graphics Card", 246, 184, 89, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)

$intensity_label = GUICtrlCreateLabel("Intensity", 246, 249, 59, 22)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)

$intensity = GUICtrlCreateInput("13", 304, 247, 25, 22, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
GUICtrlSetColor(-1, 0x808080)

$save = GUICtrlCreateButton("Save", 344, 246, 51, 25, $BS_FLAT)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x7F7F7F)
GUICtrlSetOnEvent($save, "save")

$load = GUICtrlCreateButton("Load", 408, 246, 48, 25, $BS_FLAT)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x7F7F7F)
GUICtrlSetOnEvent($load, "load")

$Label2 = GUICtrlCreateLabel("Settings", 246, 152, 209, 19, $SS_CENTER)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)

$Label1 = GUICtrlCreateLabel("Panda", 24, 25, 87, 35)
GUICtrlSetFont(-1, 20, 800, 0, "Arial Narrow")
GUICtrlSetColor(-1, 0xFFFFFF)

$Label3 = GUICtrlCreateLabel("Miner", 103, 24, 87, 35)
GUICtrlSetFont(-1, 20, 400, 0, "Arial Narrow")
GUICtrlSetColor(-1, 0xFFFFFF)

$Label4 = GUICtrlCreateLabel("Mining Pandacoin, Made Easy", 208, 408, 387, 40)
GUICtrlSetFont(-1, 20, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)

$Pic1 = GUICtrlCreatePic("download.bmp", 560, 360, 121, 121)
$Label5 = GUICtrlCreateLabel("CPU", 264, 288, 31, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)

$Label6 = GUICtrlCreateLabel("GPU", 320, 288, 32, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
GUICtrlSetColor(-1, 0xFFFFFF)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
  $worker_input = GUICtrlRead($worker)
  $password_input = GUICtrlRead($password)
  $gpu_input = GUICtrlRead($gpu_combo)
  $intensity_input = GUICtrlRead($intensity)
WEnd

Func save()
  Local $file = FileOpen("settings.data", 2)
  FileWriteLine($file, $gpu_input)
  FileWriteLine($file, $worker_input)
  FileWriteLine($file, $password_input)
  FileWriteLine($file, $intensity_input)

  FileWriteLine($file, GUICtrlRead($gpu_check))
  FileWriteLine($file, GUICtrlRead($cpu_check))

  FileWriteLine($file, GUICtrlGetState($password))

  FileClose($file)


EndFunc   ;==>save

Func load()
  Local $file = FileOpen("settings.data", 0)
  GUICtrlSetData($gpu_combo, FileReadLine($file, 1))
  GUICtrlSetData($worker, FileReadLine($file, 2))
  GUICtrlSetData($password, FileReadLine($file, 3))
  GUICtrlSetData($intensity, FileReadLine($file, 4))

  GUICtrlSetState($gpu_check, FileReadLine($file, 5))
  GUICtrlSetState($cpu_check, FileReadLine($file, 6))

  GUICtrlSetState($password, FileReadLine($file, 7))

  FileClose($file)
EndFunc   ;==>load

Func gpu_combo()
  If $gpu_input = "nVidia x86(gpu)" Then
    GUICtrlSetData($intensity, "-")
  EndIf
  If $gpu_input = "nVidia x86(gpu+cpu)" Then
    GUICtrlSetData($intensity, "-")
  EndIf
  If $gpu_input = "nVidia x64(gpu)" Then
    GUICtrlSetData($intensity, "-")
  EndIf
  If $gpu_input = "nVidia x64(gpu+cpu)" Then
    GUICtrlSetData($intensity, "-")
  EndIf

  If $gpu_input = "Radeon 5750" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 5770" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 5850" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 5870" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 5970" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 6750" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 6770" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 6850" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 6870" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 6930" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 6950" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 6970" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 6990" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 7750" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 7770" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon 7850 (low usage)" Then
    GUICtrlSetData($intensity, "13")
  EndIf
  If $gpu_input = "Radeon 7850 (high usage)" Then
    GUICtrlSetData($intensity, "20")
  EndIf
  If $gpu_input = "Radeon 7870 (low usage)" Then
    GUICtrlSetData($intensity, "13")
  EndIf
  If $gpu_input = "Radeon 7870 (high usage)" Then
    GUICtrlSetData($intensity, "20")
  EndIf
  If $gpu_input = "Radeon 7950 (low usage)" Then
    GUICtrlSetData($intensity, "13")
  EndIf
  If $gpu_input = "Radeon 7950 (high usage)" Then
    GUICtrlSetData($intensity, "20")
  EndIf
  If $gpu_input = "Radeon 7970 (low usage)" Then
    GUICtrlSetData($intensity, "13")
  EndIf
  If $gpu_input = "Radeon 7970 (high usage)" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon R7 260" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon R7 260X" Then
    GUICtrlSetData($intensity, "18")
  EndIf
  If $gpu_input = "Radeon R9 270" Then
    GUICtrlSetData($intensity, "20")
  EndIf
  If $gpu_input = "Radeon R9 270X" Then
    GUICtrlSetData($intensity, "20")
  EndIf
  If $gpu_input = "Radeon R9 280" Then
    GUICtrlSetData($intensity, "20")
  EndIf
  If $gpu_input = "Radeon R9 280X" Then
    GUICtrlSetData($intensity, "13")
  EndIf
  If $gpu_input = "Radeon R9 290 (low usage)" Then
    GUICtrlSetData($intensity, "13")
  EndIf
  If $gpu_input = "Radeon R9 290 (high usage)" Then
    GUICtrlSetData($intensity, "13")
  EndIf
  If $gpu_input = "Radeon R9 290X (low usage)" Then
    GUICtrlSetData($intensity, "13")
  EndIf
  If $gpu_input = "Radeon R9 290X (high usage)" Then
    GUICtrlSetData($intensity, "20")
  EndIf

EndFunc   ;==>gpu_combo

Func start()
  ;ConsoleWrite(@CRLF&"pool input:"&$pool_input)

  $pool_input = "multi.pandapool.info:3032"

  ProcessClose("cgminer.exe")
  ProcessClose("cudaminer.exe")
  ProcessClose("minerd.exe")
  FileDelete("scrypt*.bin")

  If GUICtrlRead($gpu_check) = 1 Then

    If $gpu_input = "default (intensity ignored)" Then
      ;ConsoleWrite(@CRLF&"cgminer.exe --scrypt -o stratum+tcp://"&$pool_input&" -u "&$worker_input&" -p "&$password_input)
      ShellExecute("cgminer.exe", "--scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    ;radeon section start
    If $gpu_input = "Radeon 5750" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 3200 -w 256 -g 1 -I 18 --shaders 720 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 5770" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 3200 -w 256 -g 1 -I 18 --shaders 800 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 5850" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 6144 -w 256 -g 1 -I 18 --shaders 1440 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 5870" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 6144 -w 256 -g 1 -I 18 --shaders 1600 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 5970" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 6144 -w 256 -g 1 -I 18 --shaders 3200 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 6750" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 3200 -w 256 -g 1 -I 18 --shaders 720 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 6770" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 3200 -w 256 -g 1 -I 18 --shaders 800 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 6850" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 6144 -w 256 -g 1 -I 18 --shaders 960 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 6870" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 6720 -w 256 -g 1 -I 18 --shaders 1120 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 6930" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8000 -w 256 -g 1 -I 18 --shaders 1280 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 6950" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8000 -w 256 -g 1 -I 18 --shaders 1408 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 6970" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8000 -w 256 -g 1 -I 18 --shaders 1536 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 6990" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8000 -w 256 -g 1 -I 18 --shaders 3072 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7750" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 7168 -w 256 -g 1 -I 18 --shaders 512 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7770" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8000 -w 256 -g 1 -I 18 --shaders 640 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7850 (low usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8192 -w 256 -g 2 -I 13 --shaders 1024 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7850 (high usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 12404 -w 256 -g 1 -I 20 --shaders 1024 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7870 (low usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8192 -w 256 -g 2 -I 13 --shaders 1280 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7870 (high usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 15508 -w 256 -g 1 -I 20 --shaders 1280 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7950 (low usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8192 -w 256 -g 2 -I 13 --shaders 1792 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7950 (high usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 21712 -w 256 -g 1 -I 20 --shaders 1792 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7970 (low usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8192 -w 256 -g 2 -I 13 --shaders 2048 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon 7970 (high usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 14336 -w 256 -g 2 -I 18 --shaders 2048 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R7 260" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8000 -w 256 -g 1 -I 18 --shaders 768 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R7 260X" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8000 -w 256 -g 1 -I 18 --shaders 896 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R9 270" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 21568 -w 256 -g 1 -I 20 --shaders 1280 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R9 270X" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 21568 -w 256 -g 1 -I 20 --shaders 1280 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R9 280" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 21712 -w 256 -g 1 -I 20 --shaders 2048 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R9 280X" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 8192 -w 256 -g 2 -I 13 --gpu-powertune 20 --shaders 2048 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R9 290 (low usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 10240 -w 256 -g 2 -I 13 --shaders 2560 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R9 290 (high usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 11264 -w 256 -g 2 -I 13 --shaders 2816 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R9 290X (low usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 11264 -w 256 -g 2 -I 13  --gpu-powertune 20 --shaders 2816 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    If $gpu_input = "Radeon R9 290X (high usage)" Then
      ShellExecute("cgminer.exe", "-I " & $intensity_input & " --thread-concurrency 32765 -w 256 -g 1 -I 20 --gpu-powertune 20 --shaders 2816 --scrypt -o stratum+tcp://" & $pool_input & " -u " & $worker_input & " -p " & $password_input)
    EndIf
    ;radeon section end
    If $gpu_input = "nVidia x86(gpu)" Then
      ;ConsoleWrite(@CRLF&"cudaminer.exe -H 2 -i 0 -l auto -C 1 -o stratum+tcp://"&$pool_input&$p2p_input&" -O "&$worker_input&":"&$password_input,@ScriptDir&"\cuda\x86\")
      ShellExecute("cudaminer.exe", "-H 2 -i 0 -l auto -C 1 -o stratum+tcp://" & $pool_input & " -O " & $worker_input & ":" & $password_input, @ScriptDir & "\cuda\x86\")
    EndIf

    If $gpu_input = "nVidia x86(gpu+cpu)" Then
      ShellExecute("cudaminer.exe", "-H 1 -i 0 -l auto -C 1 -o stratum+tcp://" & $pool_input & " -O " & $worker_input & ":" & $password_input, @ScriptDir & "\cuda\x86\")
    EndIf

    If $gpu_input = "nVidia x64(gpu)" Then
      ;ConsoleWrite(@CRLF&"cudaminer.exe -H 2 -i 0 -l auto -C 1 -o stratum+tcp://"&$pool_input&$p2p_input&" -O "&$worker_input&":"&$password_input,@ScriptDir&"\cuda\x64\")
      ShellExecute("cudaminer.exe", "-H 2 -i 0 -l auto -C 1 -o stratum+tcp://" & $pool_input & " -O " & $worker_input & ":" & $password_input, @ScriptDir & "\cuda\x64\")
    EndIf

    If $gpu_input = "nVidia x64(gpu+cpu)" Then
      ShellExecute("cudaminer.exe", "-H 1 -i 0 -l auto -C 1 -o stratum+tcp://" & $pool_input & " -O " & $worker_input & ":" & $password_input, @ScriptDir & "\cuda\x64\")
    EndIf
  EndIf

  If GUICtrlRead($cpu_check) = $GUI_CHECKED Then
    ShellExecute("minerd.exe", "-a scrypt -o stratum+tcp://" & $pool_input & " -O " & $worker_input & ":" & $password_input, @ScriptDir & "\cpu")
  EndIf

EndFunc   ;==>start

Func stop()
  ProcessClose("cgminer.exe")
  ProcessClose("cudaminer.exe")
  ProcessClose("minerd.exe")
EndFunc   ;==>stop

Func CLOSEClicked()
  Exit
EndFunc   ;==>CLOSEClicked
