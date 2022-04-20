# Running the Azure CLI from PowerShell has some advantages over running the Azure CLI from the Windows
# command prompt. PowerShell provides additional tab completion features over those available from the command prompt.

# Ensure that the AzureCLI is installed
az { -v | --verision } # should print a version value

# Help Menu
az [-h | --help]

# Login to Azure account
az login

# Variables
var1="str1"
var2=5 # integer value

# get help and find info/examples on particular needed commands
az find <string_or_cmd>
	az find blob
	az find "az vm"
	az find "az vm create"


# Get the details of current working subscription
az account show [--output table]

# Get a list of subscriptions for your Azure account
az account list [--output table]

# Set a subscription to be the current active subscription
az account set --subscription <subscription_id>

# Get list of available locations
az account list-locations [--output table]


# Print list of available resource groups
az group list [--output table]
# Create resource group
az group create --name <resource_group_name> --location <loc>
# Set default resource group
az configure --defaults group=<resource_group_name>



#
az appservice plan create --name <app_plan_name> --resource-group <resource_group_name> --location <region> --sku { FREE | <sku> }
#
az appservice plan list --output table



#
az webapp create --name <webapp_name> --resource-group <resource_group_name> --plan <app_plan_name>
#
az webapp list --output table
	curl <webapp_name>.azurewebsites.net
# Assign a web application deployment source from Github
az webapp deployment source config --name <webapp_name> --resource-group <resource_group_name> --repo-url "https://public_repo_path/" --branch <branchName> --manual-integration


#
az vm restart -g <resource_group_name> -n <vm_name>




# Iterative template deployment ; as you make changes to the JSON template file ; similar to Terraform default versioning
templateFile="path/to/template/file.json"
today=$(date "+%d-%b-%Y")
DeploymentName="<deployment-reason>-"$today
az deployment group create --name $DeploymentName --resource-group <resource_group_name> --template-file $templateFile