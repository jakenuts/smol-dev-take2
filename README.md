# AWS Serverless Application Deployment

This project contains a nested AWS serverless set of stacks that have a DynamoDB table and API Gateway as shared resources, and several ASP.NET Lambda stacks that nest paths under the base API Gateway.

## Prerequisites

- AWS CLI
- AWS SAM CLI
- PowerShell
- AWS.Tools.Common PowerShell module

## Deployment Steps

1. Open PowerShell and navigate to the project directory.

2. Import the AWS.Tools.Common module:

```powershell
Import-Module AWS.Tools.Common
```

3. Convert the JSON parameters to a hashtable using the ConvertTo-HashTable script:

```powershell
. .\scripts\ConvertTo-HashTable.ps1
```

4. Deploy the base stack:

```powershell
$baseStackParameters = Get-Content -Path .\base-stack\base-stack-parameters.json | ConvertFrom-Json | ConvertTo-HashTable
.\base-stack\deploy-base-stack.ps1 -stackName "samplestack" -templateFile .\base-stack\base-stack-template.yaml -parameters $baseStackParameters
```

5. Deploy the Lambda stacks:

```powershell
$lambdaStackParameters = Get-Content -Path .\lambda-stacks\lambda-stack-parameters.json | ConvertFrom-Json | ConvertTo-HashTable
.\lambda-stacks\deploy-lambda-stack.ps1 -stackName "samplestack" -templateFile .\lambda-stacks\lambda-stack-template.yaml -parameters $lambdaStackParameters
```

If any errors occur during deployment, they will be displayed in the PowerShell console.

## Troubleshooting

If you encounter the error "The REST API doesn't contain any methods", ensure that your API Gateway resource in the base-stack-template.yaml file has at least one method defined.