```powershell
# Import the AWS module
Import-Module AWSPowerShell

# Define the parameters for the stack
$stackName = "lambda-stack-2"
$templateFile = "../template.yaml"
$parametersFile = "../parameters.json"
$parameters = Get-Content $parametersFile | ConvertFrom-Json

# Create an array to hold the parameter objects
$parameterObjects = @()

# Loop through each parameter and create a new object for it
foreach ($parameter in $parameters.PSObject.Properties) {
    $parameterObjects += New-Object Amazon.CloudFormation.Model.Parameter -Property @{
        ParameterKey = $parameter.Name
        ParameterValue = $parameter.Value
    }
}

# Deploy the stack
Write-Host "Deploying stack $stackName..."
New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFile -Raw) -Parameter $parameterObjects -Capabilities CAPABILITY_IAM

# Wait for the stack to finish deploying
Write-Host "Waiting for stack $stackName to finish deploying..."
Wait-CFNStack -StackName $stackName

# Output the stack details
Write-Host "Stack $stackName deployed successfully. Here are the details:"
Get-CFNStack -StackName $stackName
```