#Lab14 
#Accessing NFS Datastore

Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!

Get-VMHost sa-esxi-01.vclass.local, sa-esxi-02.vclass.local | New-Datastore -Nfs -Name NFS-Datastore -Path /nfs-data -NfsHost 172.20.10.10 

#Pending 
#unable to select the version



#Set-NfsServerConfiguration -EnableNfsv2 $false -EnableNfsv4 $true -EnableNfsv3 $true
#Set-NfsServerConfiguration -EnableNfsv2 $true
#Get-Datastore "NFS-Datastore" | Set-NfsServerConfiguration -EnableNFSV4 $True

#Set-NfsServerConfiguration -AlwaysOpenByName  -EnableNfsv2 $false -EnableNfsv4 $true -EnableNfsv3 $true


Write-Host " `t `t `t Completed Lab 14. Continue from Lab 15 Task 1" -ForegroundColor Green