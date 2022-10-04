#Lab 12
Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!

New-VMHostNetworkAdapter -VMHost sa-esxi-02.vclass.local -PortGroup "IP Storage" -VirtualSwitch vSwitch0 -IP 172.20.10.62 -SubnetMask 255.255.255.0

Start-Sleep -Seconds 10

#Task 3

$VMhost = Get-VMHost sa-esxi-02.vclass.local
$VMhost | Get-VMHostStorage | Set-VMHostStorage -SoftwareIScsiEnabled $true

$VMhost | Get-VMHostHba -Type IScsi | New-IScsiHbaTarget -Address 172.20.10.15

$VMhost | Get-VMHostHba -Type IScsi | select device
$esxcli = $VMhost | Get-EsxCli
$esxcli.iscsi.networkportal.add('vmhba65',$null,'vmk1')

Get-VMHostStorage -VMHost sa-esxi-02.vclass.local -RescanVmfs -RescanAllhba -Refresh
"`n"
Write-Host " `t `t `t Completed Lab 12. Continue from Lab 13 Task 1" -ForegroundColor Green