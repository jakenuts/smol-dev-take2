# AWS Serverless Application Deployment

This repository contains a nested AWS serverless set of stacks that have a DynamoDB table and API Gateway as shared resources, and several ASP.NET Lambda stacks that nest paths under the base API Gateway.

## Prerequisites

- AWS CLI
- AWS SAM CLI
- PowerShell
- .NET Core SDK

## Deployment Steps

1. Open PowerShell and navigate to the directory containing the stack you want to deploy.

2. Import the AWS.Tools.Common module by running the following command:

```powershell
Import-Module AWS.Tools.Common
```

3. Run the deployment script for the base stack:

```powershell
.\base-stack\deploy.ps1
```

4. If the base stack deployment is successful, you can proceed to deploy the lambda stacks. Run the deployment script for each lambda stack:

```powershell
.\lambda-stack-1\deploy.ps1
.\lambda-stack-2\deploy.ps1
```

## Troubleshooting

If you encounter an error during deployment, the error message will be displayed in the PowerShell console. The error message will provide details about the resource that failed to create and the reason for the failure.

For example, if the API Gateway deployment fails because the REST API doesn't contain any methods, you will see an error message similar to the following:

```powershell
Failed to deploy stack MyApiGateway : The REST API doesn't contain any methods (Service: ApiGateway, Status Code: 400, Request ID: 2137230d-8837-40fb-83bd-af36e0d1277f)
```

In this case, you would need to add at least one method to the REST API in the `template.yaml` file for the base stack.

If the DynamoDB table creation fails, the error message will provide details about why the creation was cancelled. You would need to fix the issue in the `template.yaml` file for the base stack before you can successfully deploy the stack.