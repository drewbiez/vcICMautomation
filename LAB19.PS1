#Lab 19
#vSphere vMotion Migration
Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!

#New-VMHostNetworkAdapter -VMHost sa-esxi-01.vclass.local -PortGroup vMotion -VirtualSwitch vSwitch2 -IP 172.20.12.51 -SubnetMask 255.255.255.0 -VMotionEnabled $false

New-VirtualSwitch -VMHost sa-esxi-01.vclass.local -Name vSwitch2 -NumPorts 64 -Nic vmnic2

Start-Sleep -Seconds 20

New-VMHostNetworkAdapter -VMHost sa-esxi-01.vclass.local -PortGroup vMotion -VirtualSwitch vSwitch2 -IP 172.20.12.51 -SubnetMask 255.255.255.0 -VMotionEnabled $true




New-VirtualSwitch -VMHost sa-esxi-02.vclass.local -Name vSwitch2 -NumPorts 64 -Nic vmnic2

Start-Sleep -Seconds 20

New-VMHostNetworkAdapter -VMHost sa-esxi-02.vclass.local -PortGroup vMotion -VirtualSwitch vSwitch2 -IP 172.20.12.52 -SubnetMask 255.255.255.0 -VMotionEnabled $true


#Task 3 and Task 4

Get-VM Win10-02 | Move-VM -Destination sa-esxi-02.vclass.local
Get-VM Win10-04 | Move-VM -Destination sa-esxi-02.vclass.local

"`n"
Write-Host " `t `t `t Completed Lab 19. Continue from Lab 20 Task 1" -ForegroundColor Green