param([string]$resourceGroup)

$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."

For ($i = 1; $i -le 3; $i++)
{
    $vmName = "ConferenceDemo" + $i
    Write-Host "Creating VM: " $vmName
    New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
}

Write-Host "Run: 'Remove-AzResourceGroup -Name <ResourceGroupName>' to clean up demo resource group."


# TODO:
  # have the quantity of VMs created be dynamic