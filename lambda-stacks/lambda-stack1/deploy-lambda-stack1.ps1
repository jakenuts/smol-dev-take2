```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "lambda-stack1"

# Define the template file
$templateFile = "lambda-stack1-template.yaml"

# Define the parameters file
$parametersFile = "lambda-stack1-parameters.json"

# Try to deploy the stack
try {
    # Deploy the stack
    Write-Host "Deploying stack $stackName..."
    New-AWSCFNStack -StackName $stackName -TemplateBody (Get-Content -Raw -Path $templateFile) -Parameter (Get-Content -Raw -Path $parametersFile) -Capabilities CAPABILITY_IAM

    # Wait for the stack to be created
    Write-Host "Waiting for stack $stackName to be created..."
    Wait-AWSCFNStackCreate -StackName $stackName

    # Display the stack outputs
    Write-Host "Stack $stackName outputs:"
    (Get-AWSCFNStack -StackName $stackName).Outputs | Format-Table -AutoSize
}
catch {
    # Display an error message
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```