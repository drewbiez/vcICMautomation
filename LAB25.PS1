#Lab25
#Implementing vSphere DRS Cluster
$vCenter = Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!
$clusName = New-Cluster -Name ICM-Compute-01 -Location ICM-Datacenter -DrsEnabled:$true -Confirm:$false -DrsAutomationLevel Manual

$rate = 1

$clus = Get-Cluster -Name $clusName | Get-View

$clusSpec = New-Object Vmware.vim.clusterconfigspecEx
$clusSpec.DrsConfig = New-Object Vmware.vim.clusterDrsConfigInfo
$clusSpec.DrsConfig.VmotionRate = $rate
$clus.ReconfigureComputeResource_Task($clusSpec, $true)

Get-DrsRecommendation -Cluster $clusName -Refresh

Start-Sleep -Seconds 5

#Task4

Move-VMHost -VMHost sa-esxi-02.vclass.local -Destination $clusName
Move-VMHost -VMHost sa-esxi-01.vclass.local -Destination $clusName



#Task 5 and Task 6
#Verify Proper vSphere DRS Cluster Functionality and Disable the DRS

Get-Cluster -Name ICM-Compute-01 | Set-Cluster -DrsEnabled:$false -Confirm:$true

Write-Host " `t `t `t Completed Lab 25. Continue from Lab 26 Task 1" -ForegroundColor Green