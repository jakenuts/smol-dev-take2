```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "lambda-stack-1"

# Define the template file path
$templateFilePath = "./template.yaml"

# Define the parameters file path
$parametersFilePath = "./parameters.json"

# Try to deploy the stack
try {
    # Deploy the stack
    aws cloudformation deploy `
        --stack-name $stackName `
        --template-file $templateFilePath `
        --parameter-overrides (Get-Content $parametersFilePath | ConvertFrom-Json | ConvertTo-HashTable) `
        --capabilities CAPABILITY_IAM

    # Write a success message
    Write-Host "Successfully deployed stack $stackName"
}
catch {
    # Write an error message
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```