```powershell
# Import the AWS module
Import-Module AWSPowerShell

# Define the parameters
$stackName = "samplestack"
$templateFile = "../template.yaml"
$parametersFile = "../parameters.json"

# Read the parameters from the JSON file
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
try {
    Write-Host "Deploying stack $stackName..."
    New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFile -Raw) -Parameter $parameterObjects -Capabilities CAPABILITY_IAM
    Write-Host "Stack $stackName deployed successfully."
} catch {
    Write-Host "Failed to deploy stack $stackName: $_"
}
```