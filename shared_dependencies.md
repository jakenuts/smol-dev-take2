1. AWS Resources: The AWS resources such as DynamoDB table and API Gateway are shared across all the stacks. These resources are defined in the base stack and used in the lambda stacks.

2. Stack Names: The names of the base stack and lambda stacks are shared across the deployment scripts and the stack templates.

3. Parameters: The parameters for the stacks are shared across the stack templates and the deployment scripts.

4. AWS Credentials: The AWS credentials are shared across all the deployment scripts.

5. ASP.NET Configuration: The ASP.NET configuration is shared across all the ASP.NET applications in the lambda stacks.

6. Function Names: The function names in the ASP.NET applications are shared across the lambda stacks.

7. Message Names: The message names used in the ASP.NET applications are shared across the lambda stacks.

8. DOM Element IDs: The IDs of the DOM elements used in the ASP.NET applications are shared across the lambda stacks.

9. Data Schemas: The data schemas used in the DynamoDB table are shared across all the lambda stacks.

10. API Gateway Paths: The paths under the base API Gateway are shared across all the lambda stacks.

11. PowerShell Script Names: The names of the PowerShell scripts for deploying the stacks are shared across all the lambda stacks.