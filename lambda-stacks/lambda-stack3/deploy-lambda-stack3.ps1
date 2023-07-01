```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "lambda-stack3"

# Define the template file path
$templateFilePath = "./lambda-stack3-template.yaml"

# Define the parameters file path
$parametersFilePath = "./lambda-stack3-parameters.json"

# Try to deploy the stack
try {
    # Deploy the stack
    Write-Host "Deploying stack $stackName..."
    New-CFNStack -StackName $stackName -TemplateFile $templateFilePath -Parameter $parametersFilePath -Capability CAPABILITY_IAM

    # Wait for the stack to be created
    Write-Host "Waiting for stack $stackName to be created..."
    Wait-CFNStack -StackName $stackName

    # Get the stack details
    $stack = Get-CFNStack -StackName $stackName

    # Output the stack details
    Write-Host "Stack $stackName has been created with status $($stack.StackStatus)"
}
catch {
    # Output the error details
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```