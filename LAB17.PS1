#Lab 17
#Using Content Libraries

$contentLib =@{
Name = "VM Library"
Published = $true
Datastore = Get-Datastore -Name "vsan*"
}

New-ContentLibrary @contentLib


#$files = Get-ChildItem -File
#New-ContentLibraryItem -ContentLibrary "VM Library" -Name Photon-LibTemplate -Files $files

Write-Host " `t `t `t Completed Lab 17. Continue from Lab 18 Task 1" -ForegroundColor Green