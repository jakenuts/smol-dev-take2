```powershell
# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.Common

# Import the ConvertTo-HashTable function
. ../scripts/ConvertTo-HashTable.ps1

# Define the stack name
$stackName = "samplestack"

# Define the template file path
$templateFilePath = "lambda-stack-template.yaml"

# Define the parameters file path
$parametersFilePath = "lambda-stack-parameters.json"

# Convert the parameters file to a hashtable
$parameters = Get-Content $parametersFilePath | ConvertTo-Json | ConvertTo-HashTable

try {
    # Deploy the stack
    New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFilePath -Raw) -Parameter $parameters -Capabilities CAPABILITY_IAM
    Write-Host "Successfully deployed stack $stackName"
} catch {
    # Write an error message if the deployment fails
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```