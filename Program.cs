using Fivet.Dao;
using Fivet.ZeroIce.model;
using Fivet.ZeroIce;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Fivet.Server
{
    class Program
    {
        /// <summary>
        /// Main starting point
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        /// <summary>
        /// Build and configure a Host
        /// </summary>
        /// <param name="args"></param>
        /// <returns>The IHostBuilder</returns>
        public static IHostBuilder CreateHostBuilder(string[] args)=>
            Host.CreateDefaultBuilder(args)
            //  Development, Staging, Production
            .UseEnvironment("Development")
            //  Logging configuration
            .ConfigureLogging(logging =>
            {
                logging.ClearProviders();
                logging.AddConsole(options =>{
                    options.IncludeScopes = true;
                    options.TimestampFormat = "[yyyyMMdd.HHmmss.fff] ";
                    options.DisableColors = false;
                });
                logging.SetMinimumLevel(LogLevel.Trace);
            })
            //  Enable Control+C listener
            .UseConsoleLifetime()
            //  Service inside the DI
            .ConfigureServices((HostContext, services) =>
            {
                //  TheSystem
                services.AddSingleton<TheSystemDisp_, TheSystemImpl>();
                //  Contratos
                services.AddSingleton<ContratosDisp_, ContratosImpl>();
                //  The FivetContext
                services.AddDbContext<FivetContext>();
                //  The FivetService
                services.AddHostedService<FivetService>();
                //  The Logger
                services.AddLogging();
                //  The wait for
                services.Configure<HostOptions>(option =>
                {
                    option.ShutdownTimeout = System.TimeSpan.FromSeconds(15);
                });
            });
    }
}
