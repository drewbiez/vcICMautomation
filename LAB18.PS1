#Lab18
Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!

Set-VM -VM Win10-06 -MemoryMB 45500 -Confirm:$false

#Task 2
#Increase the size of a VMDK File

Get-VM -Name Win10-06 | Get-HardDisk -Name "Hard Disk 1" | Set-HardDisk -CapacityGB 27 -Confirm:$false

"`n"
Write-Host " `t `t `t Completed Lab 18. Continue from Lab 19 Task 1" -ForegroundColor Green