```powershell
# Import AWS module
Import-Module AWSPowerShell

# Set AWS Credentials
Set-AWSCredential -AccessKey 'YourAccessKey' -SecretKey 'YourSecretKey'

# Set AWS Region
Set-DefaultAWSRegion -Region 'YourRegion'

# Define stack parameters
$stackParameters = @{
    "ParameterKey"   = "YourParameterKey";
    "ParameterValue" = "YourParameterValue";
}

# Deploy the stack
New-CFNStack -StackName 'lambda_stack3' -TemplateBody (Get-Content -Raw -Path "../template.yaml") -Parameter $stackParameters

# Wait for the stack to be created
Write-Host "Waiting for stack to be created..."
Wait-CFNStack -StackName 'lambda_stack3'

# Output the stack details
Get-CFNStack -StackName 'lambda_stack3'
```