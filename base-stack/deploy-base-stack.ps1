```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "base-stack"

# Define the template file
$templateFile = "./base-stack-template.yaml"

# Define the parameters file
$parametersFile = "./base-stack-parameters.json"

# Try to deploy the stack
try {
    # Deploy the stack
    Write-Host "Deploying stack $stackName"
    New-CFNStack -StackName $stackName -TemplateBody (Get-Content -Path $templateFile -Raw) -Parameter (Get-Content -Path $parametersFile -Raw) -Capabilities CAPABILITY_IAM

    # Wait for the stack to be created
    Write-Host "Waiting for stack $stackName to be created"
    Wait-CFNStack -StackName $stackName

    # Output the stack details
    Write-Host "Stack $stackName details:"
    Get-CFNStack -StackName $stackName
}
catch {
    # Output the error message
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```