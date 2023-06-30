```powershell
# Import AWS module
Import-Module AWSPowerShell

# Set AWS Credentials
Set-AWSCredentials -AccessKey 'YourAccessKey' -SecretKey 'YourSecretKey' -StoreAs 'default'

# Set AWS Region
Set-DefaultAWSRegion -Region 'YourRegion'

# Define stack parameters
$stackParameters = @{
    "ParameterKey"   = "YourParameterKey";
    "ParameterValue" = "YourParameterValue";
}

# Deploy the stack
New-CFNStack -StackName 'lambda_stack1' -TemplateBody (Get-Content -Raw -Path '..\template.yaml') -Parameter $stackParameters -Capabilities "CAPABILITY_IAM"

# Wait for the stack to be created
Write-Host "Waiting for stack creation to complete..."
Wait-CFNStack -StackName 'lambda_stack1'

# Output the stack outputs
(Get-CFNStack -StackName 'lambda_stack1').Outputs
```