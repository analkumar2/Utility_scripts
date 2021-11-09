wmic diskdrive get Caption,Name | findstr "ADplus" > C:\Users\analk\Desktop\temp.txt

$tempfile = Get-Content "C:\Users\analk\Desktop\temp.txt"
$PHY = $tempfile.Split(" ")[-3]
ECHO $PHY

wsl --unmount $PHY

#Read-Host -Prompt "Press Enter to exit"