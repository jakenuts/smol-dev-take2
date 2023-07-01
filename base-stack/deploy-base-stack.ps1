```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "samplestack"

# Define the template file path
$templateFilePath = "base-stack-template.yaml"

# Define the parameters file path
$parametersFilePath = "base-stack-parameters.json"

# Import the ConvertTo-HashTable script
. "..\scripts\ConvertTo-HashTable.ps1"

# Load the parameters from the JSON file
$parametersJson = Get-Content $parametersFilePath | ConvertFrom-Json

# Convert the parameters to a hashtable
$parameters = ConvertTo-HashTable -Json $parametersJson

try {
    # Deploy the stack
    New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFilePath -Raw) -Parameter $parameters -Capabilities CAPABILITY_IAM
    Write-Host "Successfully deployed stack $stackName"
} catch {
    # Write the exception message if the deployment fails
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```