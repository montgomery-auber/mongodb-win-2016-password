
# Windows PowerShell example to check 'If File Exists' 
$ChkFile = "C:\Windows\Web\passwords-set-to-image-id" 
$FileExists = Test-Path $ChkFile 
If ($FileExists -eq $True) {
Write-Host "Script has already been run"
exit 1
}
Else {

$NEWPASS = (New-Object System.Net.WebClient).DownloadString("http://169.254.169.254/latest/meta-data/instance-id")



#use this instead of cat
$content = [System.IO.File]::ReadAllText("C:\Windows\Charming-Scripts\floating-cloud-mongo-passwd-orig.js").Replace("INSTANCE-ID",$NEWPASS)
[System.IO.File]::WriteAllText("C:\Windows\Charming-Scripts\floating-cloud-mongo-passwd.js", $content)

C:\Windows\Charming-Scripts\mongo-passwd-reset.bat


New-Item -ItemType file "C:\Windows\Web\passwords-set-to-image-id" 
 Exit 0
}