# lol this just checks C: and prints some stats
# doesn’t actually fix anything, QA guy said it was “useful anyway?”

$drive = Get-PSDrive -Name C
Write-Host "Disk C Free: $($drive.Free / 1MB) MB"
Write-Host "Used: $($drive.Used / 1MB) MB"

# one time this hung on a Surface Pro, anyone remember why?
Start-Sleep -Seconds 1

# nope no logging either
