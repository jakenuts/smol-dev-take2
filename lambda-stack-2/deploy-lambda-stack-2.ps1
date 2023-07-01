```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "lambda-stack-2"

# Define the template file path
$templateFilePath = "./lambda-stack-2/lambda-stack-2-template.yaml"

# Define the parameters file path
$parametersFilePath = "./lambda-stack-2/lambda-stack-2-parameters.json"

# Load the parameters from the JSON file
$parameters = Get-Content $parametersFilePath | ConvertFrom-Json

# Deploy the stack using AWS SAM
try {
    sam deploy --template-file $templateFilePath --stack-name $stackName --parameter-overrides $parameters --capabilities CAPABILITY_IAM
}
catch {
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```