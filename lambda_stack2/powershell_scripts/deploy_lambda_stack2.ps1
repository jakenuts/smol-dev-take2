```powershell
# Import AWS module
Import-Module AWSPowerShell

# Set AWS Credentials
Set-AWSCredential -AccessKey 'your_access_key' -SecretKey 'your_secret_key'

# Set AWS Region
Set-DefaultAWSRegion -Region 'your_region'

# Define stack parameters
$stackParameters = @{
    "ParameterKey"   = "StackName";
    "ParameterValue" = "lambda_stack2";
}

# Deploy the stack
New-CFNStack -StackName "lambda_stack2" -TemplateBody (Get-Content -Raw -Path "../template.yaml") -Parameter $stackParameters

# Wait for the stack to be created
Write-Host "Waiting for stack to be created..."
Wait-CFNStack -StackName "lambda_stack2"

# Output the stack details
Get-CFNStack -StackName "lambda_stack2"
```