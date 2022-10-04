#Lab 7

$MyvCenter = Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1! -Force

$datacenter = "ICM-Datacenter"
$location = Get-Folder -Name datacenters
New-Datacenter -Location $location -Name $datacenter

Start-Sleep -Seconds 10

$LicenseDataManager = Get-LicenseDataManager -Server $MyvCenter
$LicenseData = New-Object VMware.VimAutomation.License.Types.LicenseData
$LicenseKeyEntry = New-Object VMware.VimAutomation.License.Types.LicenseKeyEntry
$LicenseKeyEntry.TypeId = "vmware-vsphere"
$LicenseKeyEntry.LicenseKey = "0J017-NTKEP-58PGT-0Q0HP-81XQM"
$LicenseData.LicenseKeys += $LicenseKeyEntry

$hostcontainer = Get-Datacenter -Name ICM-Datacenter
$LicenseDataManager.updateAssociatedLicenseData($hostcontainer.Uid, $LicenseData)

Add-VMHost -Name sa-esxi-01.vclass.local -Location ICM-Datacenter -User root -Password VMware1! -Force

Start-Sleep -Seconds 10

$LicenseDataManager = Get-LicenseDataManager -Server $MyvCenter
$LicenseData = New-Object VMware.VimAutomation.License.Types.LicenseData
$LicenseKeyEntry = New-Object VMware.VimAutomation.License.Types.LicenseKeyEntry
$LicenseKeyEntry.TypeId = "vmware-vsphere"
$LicenseKeyEntry.LicenseKey = "0J017-NTKEP-58PGT-0Q0HP-81XQM"
$LicenseData.LicenseKeys += $LicenseKeyEntry

$hostcontainer = Get-Datacenter -Name ICM-Datacenter
$LicenseDataManager.updateAssociatedLicenseData($hostcontainer.Uid, $LicenseData)

Add-VMHost -Name sa-esxi-02.vclass.local -Location ICM-Datacenter -User root -Password VMware1! -Force

Start-Sleep -Seconds 10

$vmhost = Get-VMHost sa-esxi-01.vclass.local
Set-VMHost -VMHost $vmhost -LicenseKey "N0283-XTK54-58JGR-07AK6-A85L5"


# Task 4

Add-VMHostNtpServer -VMHost sa-esxi-01.vclass.local -ntpserver 172.20.10.10
Get-VMHostService -VMHost sa-esxi-01.vclass.local | ? {$_.Key -eq "ntpd"} | Start-VMHostService
Get-VMHostService -VMHost sa-esxi-01.vclass.local | ? {$_.Key -eq "ntpd"} | Set-VMHostService -Policy On
Start-Sleep -Seconds 05

Add-VMHostNtpServer -VMHost sa-esxi-02.vclass.local -ntpserver 172.20.10.10
Get-VMHostService -VMHost sa-esxi-02.vclass.local | ? {$_.Key -eq "ntpd"} | Start-VMHostService
Get-VMHostService -VMHost sa-esxi-02.vclass.local | ? {$_.Key -eq "ntpd"} | Set-VMHostService -Policy On


#Task 5

New-Folder -name "Lab Servers" -Location ICM-Datacenter

Start-Sleep -Seconds 05

Move-VMHost sa-esxi-02.vclass.local -Destination "Lab Servers" -ErrorAction Ignore
$List = Get-VMHost
$List[1]
$List | ? {$_.name -eq "sa-esxi-01.vclass.local"} | Move-VMHost -Destination "Lab Servers" -ErrorAction Ignore


######################################

# Task 6
(Get-View (Get-View -ViewType Datacenter -Filter @{"name"="ICM-Datacenter"}).vmfolder).createfolder("Lab VMs")

Start-Sleep -Seconds 05

#Move-VM -VM "Win10-02", "Win10-04", "Win10-06" -Destination "Lab VMs"

(Get-View (Get-View -ViewType Datacenter -Filter @{"name"="ICM-Datacenter"}).vmfolder).createfolder("Lab Template")


"`n"
Write-Host " `t `t `t Completed Lab 7. Continue from Lab 8 Task 1" -ForegroundColor Green