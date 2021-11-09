wmic diskdrive get Caption,Name | findstr "ADplus" > C:\Users\analk\Desktop\temp.txt

$tempfile = Get-Content "C:\Users\analk\Desktop\temp.txt"
$PHY = $tempfile.Split(" ")[-3]
$PHYbare = $PHY.Split('\')[-1]
$THESIS = "\\wsl.localhost\Ubuntu\mnt\wsl\$($PHYbare)p4\analkumar2\Thesis work"
$ShortcutLocation = "C:\Users\analk\Desktop\Thesis work.lnk"
ECHO $tempfile
ECHO $PHY
ECHO $THESIS

wsl --mount $PHY -p 4

#New-Item -Path $ShortcutLocation -ItemType SymbolicLink -Value $THESIS -Force

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutLocation)
$Shortcut.TargetPath = $THESIS
$Shortcut.Save()

#Read-Host -Prompt "Press Enter to exit"