 #Lab 20
Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!


Get-VM -Name Photon-11 | Move-VM -Destination sa-esxi-02.vclass.local



"`n"
Write-Host " `t `t `t Completed Lab 20. Continue from Lab 21 Task 1" -ForegroundColor Green