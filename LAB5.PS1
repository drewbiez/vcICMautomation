#Lab 5 Task 1 Task 2 Task 3
$VM = Get-VM -Name Photon-HW
$VM | New-HardDisk -CapacityGB 1 -StorageFormat Thin
$VM | New-HardDisk -CapacityGB 1 -StorageFormat EagerZeroedThick

Start-Sleep -Seconds 02
"`n"
Write-Host " `t `t `t Completed Lab 5. Continue from Lab 6 Task 1" -ForegroundColor Green