```powershell
# Import the AWS module
Import-Module AWSPowerShell

# Set AWS Credentials
$accessKey = 'your_access_key'
$secretKey = 'your_secret_key'
$region = 'your_region'

Set-AWSCredentials -AccessKey $accessKey -SecretKey $secretKey -StoreAs default
Set-DefaultAWSRegion -Region $region

# Define stack parameters
$stackName = 'base_stack'
$templateFile = '../template.yaml'
$parametersFile = '../parameters.json'

# Read parameters from json file
$parametersJson = Get-Content $parametersFile | ConvertFrom-Json
$parameters = @()
foreach($param in $parametersJson.parameters.PSObject.Properties){
    $parameters += New-CFNStackParameter -ParameterKey $param.Name -ParameterValue $param.Value
}

# Deploy the stack
Write-Host "Deploying stack $stackName..."
New-CFNStack -StackName $stackName -TemplateBody (Get-Content $templateFile -Raw) -Parameter $parameters -Capabilities CAPABILITY_IAM

# Wait for the stack to be created
Write-Host "Waiting for stack $stackName to be created..."
Wait-CFNStack -StackName $stackName

Write-Host "Stack $stackName has been created successfully."
```