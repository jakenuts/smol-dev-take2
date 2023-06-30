```csharp
using Amazon.Lambda.AspNetCoreServer;
using Microsoft.AspNetCore.Hosting;

namespace LambdaStack1
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            Amazon.Lambda.AspNetCoreServer.APIGatewayProxyFunction.CreateWebHostBuilder(args)
                .UseStartup<Startup>();
    }
}
```