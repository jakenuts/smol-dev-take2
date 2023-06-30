```powershell
# Import the AWS module
Import-Module AWSPowerShell

# Define the parameters
$stackName = "lambda-stack-1"
$templateFile = "../template.yaml"
$parametersFile = "../parameters.json"

# Read the parameters from the JSON file
$parameters = Get-Content $parametersFile | ConvertFrom-Json

# Convert the parameters to the format expected by the AWS CLI
$awsParameters = $parameters.PSObject.Properties | ForEach-Object { @{ ParameterKey = $_.Name; ParameterValue = $_.Value } }

# Deploy the stack
try {
    Write-Host "Deploying $stackName..."
    New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFile -Raw) -Parameter $awsParameters -Capabilities CAPABILITY_IAM
    Write-Host "Deployment of $stackName completed successfully."
} catch {
    Write-Host "Deployment of $stackName failed with error: $_"
    exit 1
}
```