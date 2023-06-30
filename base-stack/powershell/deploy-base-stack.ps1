```powershell
# Import the AWS module
Import-Module AWSPowerShell

# Set AWS Credentials
Set-AWSCredential -AccessKey 'your_access_key' -SecretKey 'your_secret_key'

# Set AWS Region
Set-DefaultAWSRegion -Region 'your_region'

# Define parameters
$stackName = "samplestack"
$templateFile = "../template.yaml"
$parametersFile = "../parameters.json"

# Read parameters from json file
$parameters = Get-Content $parametersFile | ConvertFrom-Json

# Convert parameters to AWS CloudFormation format
$awsParameters = @()
foreach ($parameter in $parameters.PSObject.Properties) {
    $awsParameters += @{ ParameterKey = $parameter.Name; ParameterValue = $parameter.Value }
}

# Deploy the stack
Write-Host "Deploying stack $stackName..."
New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFile -Raw) -Parameter $awsParameters -Capabilities CAPABILITY_IAM

# Wait for the stack to be created
Write-Host "Waiting for stack $stackName to be created..."
Wait-CFNStack -StackName $stackName

Write-Host "Stack $stackName has been created successfully."
```