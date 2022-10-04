#Lab 13

Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!



New-Datastore -VMHost sa-esxi-01.vclass.local -Name Shared-VMFS -Path naa.6589cfc000000efe34a55d1cfd0aa986 -Vmfs -Version 6


#Task 4 


#Task 5
New-Datastore -VMHost sa-esxi-01.vclass.local -Name iSCSI-Datastore -Path naa.6589cfc0000000550b10c0ce06eb5c7a -Vmfs -Version 6

Write-Host " `t `t `t Completed Lab 13. Continue from Lab 14 Task 1" -ForegroundColor Green