Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1! -Force
Connect-VIServer -Server sa-esxi-01.vclass.local -User root -Password VMware1!

#Lab2 Task 1

Get-VMHostAuthentication -VMHost sa-esxi-01.vclass.local | Set-VMHostAuthentication -JoinDomain -Domain vclass.local -Username administrator -Password VMware1! -Confirm:$false

Start-Sleep -Seconds 05

#Lab 2 Task 3

Connect-VIServer -Server sa-esxi-01.vclass.local -User root -Password VMware1! -Force
$esx1 = Get-VMHost -Name sa-esxi-01.vclass.local

$esx1 | Get-VMHostService | ? {$_.Key -eq "TSM-SSH"} | Start-VMHostService
$esx1 | Get-VMHostService | ? {$_.Key -eq "TSM"} | Start-VMHostService

"`n"
Write-Host " `t `t `t Completed Lab 2. Continue from Lab 3 Task 1" -ForegroundColor Green