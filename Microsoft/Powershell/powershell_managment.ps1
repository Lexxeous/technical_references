# Run a PowerShell script; you can pass parameters in from the command line
.\<pwsh_script>.ps1 -param1 <val1> -paramN <valN>
# Capture the command line input parameters and assign them to datatyped variables
param([datatype]$param1, [datatype]paramN)

.\script.ps1 -size 50 -location "United States"
param([int]$size, [string]location)

# Variables

$var = "str_val"
$num = 3
$object = <CmdLet-Object>


# Loops

For ($i = 0; $i -lt 3; $i++)
{
  $i # will print 0 1 2
}