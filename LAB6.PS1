#Lab 6

$vCenter = Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!

$vCenterLicenses = "4J015-X9097-18UG5-0L98M-8MG5H"
$LicenseManager = Get-View ($vCenter.ExtensionData.content.LicenseManager)
$LicenseManager.AddLicense($vCenterLicenses,$null)
$LicenseAssignmentManager = Get-View ($LicenseManager.licenseAssignmentManager)
$LicenseAssignmentManager.updateAssignedLicense($vCenter.InstanceUuid,$vCenterLicenses,$null)

Write-Host " `t `t `t Completed Lab 6. Continue from Lab 7 Task 1" -ForegroundColor Green