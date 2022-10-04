#Lab 16

Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1!
Set-VM Photon-Template -ToTemplate -Confirm:$false
#Move-Template Photon-Template -Location "Lab-Template"

# Creat Customization Spec

New-OSCustomizationSpec -name "Photon-CustomSpec" -Domain vclass.local -OSType Linux -DnsServer 172.20.10.10 -DnsSuffix vclass.local

#VM names Photon-11 and Photon 12

Get-Template -Name Photon-Template | New-VM -Name Photon-11 -VMhost sa-esxi-01.vclass.local -Location "Lab VMs" -OSCustomizationSpec "Photon-CustomSpec" -Datastore iSCSI-Datastore -DiskStorageFormat Thin
Get-Template -Name Photon-Template | New-VM -Name Photon-12 -VMhost sa-esxi-02.vclass.local -Location "Lab VMs" -OSCustomizationSpec "Photon-CustomSpec" -Datastore iSCSI-Datastore -DiskStorageFormat Thin

Start-VM -VM "Photon-11", "Photon-12"

Write-Host " `t `t `t Completed Lab 16. Continue from Lab 17 Task 1" -ForegroundColor Green