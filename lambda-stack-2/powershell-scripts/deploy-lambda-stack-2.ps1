```powershell
# Import AWS module
Import-Module AWSPowerShell

# Set AWS Credentials
Set-AWSCredentials -AccessKey 'your_access_key' -SecretKey 'your_secret_key'

# Set AWS Region
Set-DefaultAWSRegion -Region 'your_region'

# Define stack parameters
$stackParameters = @{
    "ParameterKey"   = "MyApiGateway";
    "ParameterValue" = "MyApiGateway";
}, @{
    "ParameterKey"   = "MyDynamoDBTable";
    "ParameterValue" = "MyDynamoDBTable";
}

# Define stack options
$stackOptions = @{
    "TemplateBody" = Get-Content -Path "../template.yaml" -Raw;
    "Parameters"   = $stackParameters;
    "StackName"    = "lambda-stack-2";
    "Capabilities" = "CAPABILITY_IAM", "CAPABILITY_NAMED_IAM";
}

# Deploy the stack
Write-Host "Deploying stack..."
New-CFNStack @stackOptions

# Wait for the stack to be created
Write-Host "Waiting for stack creation to complete..."
Wait-CFNStack -StackName "lambda-stack-2"

# Output the stack details
Write-Host "Stack details:"
Get-CFNStack -StackName "lambda-stack-2"
```