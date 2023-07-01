```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "base-stack"

# Define the template file path
$templateFilePath = "./template.yaml"

# Define the parameters file path
$parametersFilePath = "./parameters.json"

# Check if the stack exists
$stack = Get-CFNStack -StackName $stackName -ErrorAction SilentlyContinue

# If the stack exists, update it. Otherwise, create a new stack
if ($stack) {
    Write-Host "Updating $stackName"
    Update-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFilePath -Raw) -Parameter (Get-Content $parametersFilePath | ConvertFrom-Json -AsHashtable) -Capabilities CAPABILITY_IAM
} else {
    Write-Host "Creating $stackName"
    New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFilePath -Raw) -Parameter (Get-Content $parametersFilePath | ConvertFrom-Json -AsHashtable) -Capabilities CAPABILITY_IAM
}

# Wait for the stack to finish deploying
Write-Host "Waiting for stack to be created or updated..."
Wait-CFNStack -StackName $stackName

# If the stack deployment fails, print the error message
if ($?) {
    Write-Host "Stack $stackName has been deployed successfully."
} else {
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```