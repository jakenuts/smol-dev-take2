```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "lambda-stack-2"

# Define the template file path
$templateFilePath = "./lambda-stack-2/template.yaml"

# Define the parameters file path
$parametersFilePath = "./lambda-stack-2/parameters.json"

# Deploy the stack
try {
    Write-Host "Deploying stack $stackName"
    $result = New-CFNStack -StackName $stackName -TemplateBody (Get-Content -Path $templateFilePath -Raw) -Parameter (Get-CFNStackParameter -Path $parametersFilePath) -Capabilities CAPABILITY_IAM
    Write-Host "Successfully deployed stack $stackName"
} catch {
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```