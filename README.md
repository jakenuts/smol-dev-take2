# AWS Serverless Application Deployment

This application consists of a base stack with shared resources (DynamoDB table and API Gateway) and several ASP.NET Lambda stacks. 

## Prerequisites

- AWS CLI installed and configured
- AWS SAM CLI installed
- PowerShell

## Deployment Steps

1. Navigate to the `base-stack` directory:

    ```powershell
    cd base-stack
    ```

2. Run the PowerShell script to deploy the base stack:

    ```powershell
    ./powershell/deploy-base-stack.ps1
    ```

    This script deploys the base stack which includes the DynamoDB table (`MyDynamoDBTable`) and the API Gateway (`MyApiGateway`).

3. Navigate to the `lambda-stack-1` directory:

    ```powershell
    cd ../lambda-stack-1
    ```

4. Run the PowerShell script to deploy the first lambda stack:

    ```powershell
    ./powershell/deploy-lambda-stack-1.ps1
    ```

    This script deploys the first lambda stack which includes the ASP.NET application code (`Program.cs` and `Startup.cs`).

5. Repeat steps 3 and 4 for `lambda-stack-2`:

    ```powershell
    cd ../lambda-stack-2
    ./powershell/deploy-lambda-stack-2.ps1
    ```

## Troubleshooting

If you encounter an error during the deployment process, check the error message for details. For example, if you see an error message like "The REST API doesn't contain any methods", this means that the API Gateway deployment failed because no methods were defined in the API. Make sure that your `template.yaml` file includes definitions for the API methods.