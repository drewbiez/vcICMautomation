#Lab 22
#Controlling VM Resources 

Connect-VIServer -Server sa-vcsa-01.vclass.local -User administrator@vsphere.local -Password VMware1! 

Move-VM -VM Win10-04 -Destination sa-esxi-01.vclass.local

Start-Sleep -Seconds 60

Move-VM -VM Win10-02 -Destination sa-esxi-01.vclass.local


#########

#$Conf = Get-VM -Name Win10-02

#Set-VMResourceConfiguration -Configuration $Conf -CpuAffinity ([CpuAffinity]::Cpu0 -bor [CpuAffinity]::cpu1)



#Task 1 to create CPU Contention and Task 1 is to verify the CPU Share Functionality 
#Not much required 

Write-Host " `t `t `t Completed Lab 22. Continue from Lab 23 Task 1" -ForegroundColor Green