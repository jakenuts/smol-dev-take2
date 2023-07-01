```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "lambda-stack-1"

# Define the template file path
$templateFilePath = "./lambda-stack-1/lambda-stack-1-template.yaml"

# Define the parameters file path
$parametersFilePath = "./lambda-stack-1/lambda-stack-1-parameters.json"

# Read the parameters file content
$parametersFileContent = Get-Content $parametersFilePath | ConvertFrom-Json

# Convert the parameters file content to a format that can be used with the AWS CLI
$parameters = $parametersFileContent | ForEach-Object { New-Object Amazon.CloudFormation.Model.Parameter -Property @{ ParameterKey = $_.ParameterKey; ParameterValue = $_.ParameterValue } }

try {
    # Deploy the stack
    $result = New-CFNStack -StackName $stackName -TemplateBody (Get-Content -Raw -Path $templateFilePath) -Parameter $parameters -Capabilities CAPABILITY_IAM

    # Wait for the stack to be created
    $result = Wait-CFNStack -StackName $stackName

    # Output the stack details
    $result
}
catch {
    # Output the error details
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```