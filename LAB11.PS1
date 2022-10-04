#Lab11
Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!

Set-PowerCLIConfiguration -DefaultVIServerMode Single -Confirm:$false

Start-Sleep -Seconds 05

New-VirtualSwitch -VMHost sa-esxi-01.vclass.local -Name vSwitch1 -NumPorts 64 -Nic vmnic3 | New-VirtualPortGroup -Name Production
New-VirtualSwitch -VMHost sa-esxi-02.vclass.local -Name vSwitch1 -NumPorts 64 -Nic vmnic3 | New-VirtualPortGroup -Name Production

Start-Sleep -Seconds 05

$vm = Get-VM Win10-02, Win10-04

Get-NetworkAdapter -vm $vm

$network_adapter = Get-NetworkAdapter -vm $vm
Set-NetworkAdapter -NetworkAdapter $network_adapter -NetworkName Production -Confirm:$false

Write-Host " `t `t `t Completed Lab 11. Continue from Lab 12 Task 1" -ForegroundColor Green