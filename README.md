# AWS Serverless Application Deployment

This application creates a nested AWS serverless set of stacks that have a DynamoDB table and API Gateway as shared resources and several ASP.NET Lambda stacks that nest paths under the base API Gateway.

## Prerequisites

- AWS CLI
- AWS SAM CLI
- PowerShell
- AWS.Tools.Common PowerShell module

## Deployment Steps

1. Open PowerShell and navigate to the directory containing the deployment scripts.

2. Import the AWS.Tools.Common module by running the following command:

```powershell
Import-Module AWS.Tools.Common
```

3. Deploy the base stack by running the following command:

```powershell
.\base-stack\deploy-base-stack.ps1
```

4. Deploy the Lambda stacks by running the following commands:

```powershell
.\lambda-stacks\lambda-stack1\deploy-lambda-stack1.ps1
.\lambda-stacks\lambda-stack2\deploy-lambda-stack2.ps1
.\lambda-stacks\lambda-stack3\deploy-lambda-stack3.ps1
```

If any errors occur during the deployment, they will be displayed in the PowerShell console.

## Troubleshooting

If you encounter the error "The REST API doesn't contain any methods" during the deployment, it means that the API Gateway deployment failed because no methods were defined in the API. Make sure that your API Gateway resource in the base stack template (`base-stack/base-stack-template.yaml`) has at least one method defined.

If the deployment of the DynamoDB table fails, it could be due to a number of reasons, such as insufficient permissions or exceeding the provisioned throughput capacity. Check the error message for more details and adjust your table configuration accordingly.

## Cleanup

To delete the resources created by this application, you can delete the CloudFormation stacks in the AWS Management Console or by using the AWS CLI.