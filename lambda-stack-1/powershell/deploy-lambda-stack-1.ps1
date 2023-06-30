```powershell
# Import the AWS module
Import-Module AWSPowerShell

# Define the parameters for the stack
$stackName = "lambda-stack-1"
$templateFile = "../template.yaml"
$parametersFile = "../parameters.json"

# Load the parameters from the JSON file
$parameters = Get-Content $parametersFile | ConvertFrom-Json

# Create an array to hold the parameter objects
$parameterObjects = @()

# Loop through each parameter and create a new object
foreach ($parameter in $parameters.PSObject.Properties) {
    $parameterObjects += New-Object Amazon.CloudFormation.Model.Parameter -Property @{
        ParameterKey = $parameter.Name
        ParameterValue = $parameter.Value
    }
}

# Deploy the stack
Write-Host "Deploying stack $stackName..."
New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFile -Raw) -Parameter $parameterObjects -Capabilities CAPABILITY_IAM

# Wait for the stack to be created
Write-Host "Waiting for stack $stackName to be created..."
Wait-CFNStack -StackName $stackName

# Output the stack details
Write-Host "Stack $stackName details:"
Get-CFNStack -StackName $stackName | Format-List
```
