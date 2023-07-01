# AWS Serverless Application Deployment

This project contains a nested AWS serverless set of stacks that have a DynamoDB table and API Gateway as shared resources, and several ASP.NET Lambda stacks that nest paths under the base API Gateway.

## Prerequisites

- AWS CLI installed and configured
- AWS SAM CLI installed
- PowerShell

## Deployment Steps

1. Navigate to the `base-stack` directory.

2. Run the `deploy-base-stack.ps1` PowerShell script to deploy the base stack. This script will create the DynamoDB table and API Gateway.

    ```powershell
    .\deploy-base-stack.ps1
    ```

    If the deployment fails, the script will output the error message.

3. Navigate to the `lambda-stack-1` directory.

4. Run the `deploy-lambda-stack-1.ps1` PowerShell script to deploy the first Lambda stack.

    ```powershell
    .\deploy-lambda-stack-1.ps1
    ```

    If the deployment fails, the script will output the error message.

5. Navigate to the `lambda-stack-2` directory.

6. Run the `deploy-lambda-stack-2.ps1` PowerShell script to deploy the second Lambda stack.

    ```powershell
    .\deploy-lambda-stack-2.ps1
    ```

    If the deployment fails, the script will output the error message.

## Note

The PowerShell scripts use the `AWS.Tools.Common` module for AWS operations. If you encounter any issues related to this module, ensure that it is installed and up-to-date.