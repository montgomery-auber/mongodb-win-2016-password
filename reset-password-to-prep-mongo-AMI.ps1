
$NEWPASS = (New-Object System.Net.WebClient).DownloadString("http://169.254.169.254/latest/meta-data/instance-id")

$content = [System.IO.File]::ReadAllText("C:\Windows\Charming-Scripts\mongo-passwd-reset-ami-prep-ORIG.bat").Replace("INSTANCE-ID",$NEWPASS)
[System.IO.File]::WriteAllText("C:\Windows\Charming-Scripts\mongo-passwd-reset-ami-prep.bat", $content)

C:\Windows\Charming-Scripts\mongo-passwd-reset-ami-prep.bat

rm "C:\Windows\Web\passwords-set-to-image-id"
