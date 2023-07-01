```powershell
# Import the AWS.Tools.Common module
Import-Module AWS.Tools.Common

# Define the stack name
$stackName = "lambda-stack2"

# Define the template file path
$templateFilePath = "lambda-stacks/lambda-stack2/lambda-stack2-template.yaml"

# Define the parameters file path
$parametersFilePath = "lambda-stacks/lambda-stack2/parameters.json"

# Try to deploy the stack
try {
    # Deploy the stack
    Write-Host "Deploying stack $stackName..."
    New-AWSCFNStack -StackName $stackName -TemplateFile $templateFilePath -Parameter $parametersFilePath -Capability CAPABILITY_IAM

    # Wait for the stack to be created
    Write-Host "Waiting for stack $stackName to be created..."
    Wait-AWSCFNStackCreateComplete -StackName $stackName

    # Display a success message
    Write-Host "Stack $stackName has been created successfully."
}
catch {
    # Display an error message
    Write-Host "Failed to deploy stack $stackName : $($_.Exception.Message)"
}
```