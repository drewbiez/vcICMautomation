#Lab 26
#Using vSphere HA
Get-Cluster -Name ICM-Compute-01 | Set-Cluster -HAEnabled:$true -Confirm:$false

Start-Sleep -Seconds 6


Get-VMHost -Name sa-esxi-01.vclass.local | Get-VMHostNetworkAdapter -name vmk2 | Set-VMHostNetworkAdapter -ManagementTrafficEnabled $true -Confirm:$false
Get-VMHost -Name sa-esxi-02.vclass.local | Get-VMHostNetworkAdapter -name vmk2 | Set-VMHostNetworkAdapter -ManagementTrafficEnabled $true -Confirm:$false

Get-Cluster -Name ICM-Compute-01 | Get-VMHost -Name sa-esxi-01.vclass.local | %{$_.extensiondata.reconfigureHostforDAS()}
Get-Cluster -Name ICM-Compute-01 | Get-VMHost -Name sa-esxi-02.vclass.local | %{$_.extensiondata.reconfigureHostforDAS()}



#Get-Cluster -Name ICM-Compute-01 | Set-Cluster -DrsEnabled:$true -Confirm:$false -HAAdmissionControlEnabled:$true -HAFailoverLevel 1


Write-Host " `t `t `t Completed Lab 26. Continue from Lab 27 Task 1" -ForegroundColor Green