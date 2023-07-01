```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "base-stack"

# Define the template file path
$templateFilePath = "./base-stack-template.yaml"

# Define the parameters file path
$parametersFilePath = "./base-stack-parameters.json"

# Load the parameters file content
$parametersFileContent = Get-Content $parametersFilePath | ConvertFrom-Json

# Convert the parameters file content to a format that can be used with the AWS CLI
$parameters = $parametersFileContent.Parameters.PSObject.Properties | ForEach-Object { 
    New-Object Amazon.CloudFormation.Model.Parameter -Property @{
        ParameterKey = $_.Name
        ParameterValue = $_.Value
    }
}

# Try to deploy the stack
try {
    # Deploy the stack
    $result = New-CFNStack -StackName $stackName -TemplateBody (Get-Content -Raw -Path $templateFilePath) -Parameter $parameters -Capabilities CAPABILITY_IAM

    # If the stack deployment was successful, print the stack details
    if ($result) {
        Write-Host "Successfully deployed stack $stackName"
    }
}
catch {
    # If the stack deployment failed, print the error message
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```