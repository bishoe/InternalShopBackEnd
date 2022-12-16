using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using System;
using Serilog;

using Microsoft.Extensions.DependencyInjection;
using System.IO;
using System.Diagnostics;
using InternalShop.CustomText;
using DataBaseService;
 
namespace InternalShop
{
    public class Program
    {
        public static void Main(string[] args)
        {
            //CreateHostBuilder(args).Build().Run();
            var host = CreateHostBuilder(args).Build();
            using (var scope = host.Services.CreateScope())

            {
                 var services = scope.ServiceProvider;

                try
                {
                    var context = services.GetRequiredService<ApplicationDbContext>();
                    var dpContext = services.GetRequiredService<DataProtectionKeysContext>();
                    //var functionSvc = services.GetRequiredService<IFunctionalSvc>();
                    //var countrySvc = services.GetRequiredService<ICountrySvc>();

                    DbContextInitializer.Initialize(dpContext, context  ).Wait();
                     //   , functionSvc  
                   // , countrySvc

                  

                }
                catch (Exception ex)
                {
                    Log.Error("An error occurred while seeding the database  {Error} {StackTrace} {InnerException} {Source}",
                     ex.Message, ex.StackTrace, ex.InnerException, ex.Source);
                }
            }
            host.Run();
        }
            public static IHostBuilder CreateHostBuilder(string[] args) =>
Host.CreateDefaultBuilder(args)
.ConfigureWebHostDefaults(webBuilder =>
{
    webBuilder.UseSerilog((hostingContext, loggerConfiguration) => loggerConfiguration
.Enrich.FromLogContext()
.Enrich.WithProperty("Application", "InternalShop")
.Enrich.WithProperty("MachineName", Environment.MachineName)
.Enrich.WithProperty("CurrentManagedThreadId", Environment.CurrentManagedThreadId)
.Enrich.WithProperty("OSVersion", Environment.OSVersion)
.Enrich.WithProperty("Version", Environment.Version)
.Enrich.WithProperty("UserName", Environment.UserName)
.Enrich.WithProperty("ProcessId", Process.GetCurrentProcess().Id)
.Enrich.WithProperty("ProcessName", Process.GetCurrentProcess().ProcessName)
.WriteTo.Console(theme: CustomConsoleTheme.VisualStudioMacLight)
.WriteTo.File(formatter: new CustomTextFormatter(), path: Path.Combine(hostingContext.HostingEnvironment.ContentRootPath + $"{Path.DirectorySeparatorChar}Logs{Path.DirectorySeparatorChar}", $"InternalShop_{DateTime.Now:yyyyMMdd}.txt"))
.ReadFrom.Configuration(hostingContext.Configuration));
    webBuilder.UseStartup<Startup>();
});


    }
}
