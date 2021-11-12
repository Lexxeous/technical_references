# ------------------------------------------------------------------------------------------------------------------------------------------ #

# Get help with PowerShell cmdlet
Get-Help -Name <pwsh_cmdlet> [-Detailed]

# Get list of installed modules
Get-Module

# Install a PowerShell module
Install-Module -Name <module_name> [-Scope { CurrentUser | AllUsers }] [-Repository <str>] [-AllowClobber]

# Update a PowerShell module
Update-Module -Name <module_name>

# Set the execution policy of PowerShell and cmdlets to inlcude external sources
Set-ExecutionPolicy -ExecutionPolicy { Restricted | RemoteSigned } [-Scope { CurrentUser | AllUsers }]

# Login/connect/authenticate with Azure account
Connect-AzAccount

# Get list of available locations
Get-AzLocation

# Get list of available subscriptions for your Azure account
Get-AzSubscription

# Print the current working subscription context
Get-AzContext

# Set/switch working subscription context
Set-AzContext -Subscription '00000000-0000-0000-0000-000000000000'

# Get list of available/created resource groups for the current subscription context for your Azure account
Get-AzResourceGroup

# Set default resource group
Set-AzDefault -ResourceGroupName <resource_group_name>

# Create a new resource group within the current subscription context for your Azure account
New-AzResourceGroup -Name <name> -Location <location>

# Get list of all resources for current subscription context for your Azure account
Get-AzResource [-ResourceGroupName <resource_name>]

# Prompts user for username and password then packages credential into a credential object: <cred_object>={ System.Security.SecureString | Get-Credential }
Get-Credential

# Virtual machine management
New-AzVm -ResourceGroupName <resource_group_name> -Name <vm_name> -Credential <cred_object> -Location <loc> -Image <img_name> # create
Remove-AzVm [-Name <vm_name>] [-ResourceGroupName <resource_group_name>] # delete
Start-AzVm [-Name <vm_name>] [-ResourceGroupName <resource_group_name>] # start
Stop-AzVm [-Name <vm_name>] [-ResourceGroupName <resource_group_name>] # stop
Restart-AzVm [-Name <vm_name>] [-ResourceGroupName <resource_group_name>] # reboot
Update-AzVm # update configuration
Get-AzVm [-Name <vm_name>] [-ResourceGroupName <resource_group_name>] [-Status] # get info
    $vm = (Get-AzVM -Name <vm_name> -ResourceGroupName <resource_group_name>) # set Azure VM info into variable
    $vm # print VM properties
    $vm.<property> # print single VM property
    $vm_ip =($vm | Get-AzPublicIpAddress) # print VM public IP address
    ssh <username>@$vm_ip # login to VM via SSH



# Iterative template deployment ; as you make changes to the JSON template file ; similar to Terraform default versioning
$templateFile = "{provide-the-path-to-the-template-file}"
$today=Get-Date -Format "MM-dd-yyyy"
$deploymentName="<deployment-reason>"+"$today"
New-AzResourceGroupDeployment `
  -Name $deploymentName `
  -ResourceGroupName <resource_group_name> `
  -TemplateFile $templateFile

# ------------------------------------------------------------------------------------------------------------------------------------------ #

# Format object output as table
Format-Table

#
Get-AzPublicIpAddress