```powershell
# Import the AWS module
Import-Module AWSPowerShell

# Set AWS Credentials
Set-AWSCredential -AccessKey 'your_access_key' -SecretKey 'your_secret_key'

# Set AWS Region
Set-DefaultAWSRegion -Region 'your_region'

# Define stack parameters
$stackParameters = @{
    "StackName" = "lambda-stack-3"
    "TemplateBody" = Get-Content -Raw -Path "../template.yaml" | ConvertTo-Json -Compress
    "Parameters" = @{
        "MyApiGateway" = "MyApiGateway"
        "MyDynamoDBTable" = "MyDynamoDBTable"
    }
}

# Deploy the stack
try {
    Write-Host "Deploying stack..."
    New-CFNStack @stackParameters
    Write-Host "Stack deployed successfully."
} catch {
    Write-Host "Failed to deploy stack: $_"
}
```