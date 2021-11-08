<!-- Terraform Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Terraform Management: <img src="../.pics/Terraform/terraform_logo.png" width="90px"/>

> Credit: [**Terraform** explained in 15 mins | **Terraform** Tutorial for Beginners](https://www.youtube.com/watch?v=l5k1ai_GBDE) by [TechWorld with Nana](https://www.youtube.com/channel/UCdngmbVKX1Tgre699-XLlUA)

## Summary:
<p align="justify">
<strong>Terraform</strong> is a tool that uses Inastructure as Code (IaC) to automate provisioning, configuration, and management of infastructure. It mainly works as an infastructure provisioning tool, but can also deploy applications on said infastructure. It is similar to that of another infastructure tool called Ansible, while Ansible is more mature, <strong>Terraform</strong> is relatively new, still changing, and much more advanced for infastructure orchestration. 

<strong>Terraform</strong> is a declarative language. This means that **Terraform** configurations only need to contain the "end state" or the "desired resource", from there <strong>Terraform</strong> will figure out how to achieve the desired configurations on its own. Imperative languages require that you list out every required step to achieve the "end state." This allows developers to simply adjust old configuration files and re-execute, instead of having to write new steps to reach a new desired state. Ultimately, this keeps small, neat, and clean configuration workspaces and allows the developer to always know what the current state is.
</p>

> For more information, see the [**Terraform** documentation](https://www.terraform.io/docs/index.html).

## Installation:

### Windows:

Manually:

  * Download the appropriate version from the [main HashiCorp Terraform downloads page](https://www.terraform.io/downloads.html).
  * Unzip the binary.
  * Place the binary's folder into a desired location.
  * Add that desired location to your system PATH.

Using [Chocolatey](https://chocolatey.org/):

  * Run `choco install terraform`

### macOS:

Using [Homebrew](https://brew.sh/):

  * Run `brew install terraform`

## **Terraform** Architecture:

### **Terraform** Core:
<p align="justify">
<strong>Terraform</strong> core takes two inputs: a TF config file and the current state. <strong>Terraform</strong> then compares the desired TF config with the current state and changes necessary infastructure configurations to become consistent with the desired TF config. It creates and executes a "plan" with the required providers (AWS, K8s Docker, GitHub, MySQL, etc...) to achieve this.
</p>

### Providers and Resources:

Example configuration:

```terraform
# Connect/configure AWS provider
provider "aws" {
	version = "~> 2.0"
	region = "us-east-1"
}

# Create an AWS VPC resource
resource "aws_vpc" "example" {
	cidr_block = "10.0.0.0/16"
}
```

### Terraform Stages:
<p align="justify">
There are 4 main stages when using <strong>Terraform</strong> to create, modify, plan, execute, and/or destroy infastructure configuration states.
</p>

  * `refresh` - Query the infastructure providers to get the current configuration state.
  * `plan`    - Create an execution plan based on the delta between the current and desired infastructure configuration state.
  * `apply`   - Execute the created plan.
  * `destroy` - Delete/remove resources, infastructure, and/or configurations.


## Terraform Commands:

Main commands:

  * `init`      - Prepare your working directory for other commands
  * `validate`  - Check whether the configuration is valid
  * `plan`      - Show changes required by the current configuration
  * `apply`     - Create or update infrastructure
  * `destroy`   - Destroy previously-created infrastructure

All other commands:

  * `console`       - Try Terraform expressions at an interactive command prompt
  * `fmt`           - Reformat your configuration in the standard style
  * `force-unlock`  - Release a stuck lock on the current workspace
  * `get`           - Install or upgrade remote Terraform modules
  * `graph`         - Generate a Graphviz graph of the steps in an operation
  * `import`        - Associate existing infrastructure with a Terraform resource
  * `login`         - Obtain and save credentials for a remote host
  * `logout`        - Remove locally-stored credentials for a remote host
  * `output`        - Show output values from your root module
  * `providers`     - Show the providers required for this configuration
  * `refresh`       - Update the state to match remote systems
  * `show`          - Show the current state or a saved plan
  * `state`         - Advanced state management
  * `taint`         - Mark a resource instance as not fully functional
  * `test`          - Experimental support for module integration testing
  * `untaint`       - Remove the 'tainted' state from a resource instance
  * `version`       - Show the current Terraform version
  * `workspace`     - Workspace management
