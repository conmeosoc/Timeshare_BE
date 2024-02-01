using System.Configuration;

namespace TimeshareExchangeAPI.Globals
{
    public class GlobalFuns
    {
        public static IConfiguration Configuration { get; private set; }
        public static ConfigAppSetting G_Config { get; private set; } = new ConfigAppSetting();
        public static void ReadConfigSetting()
        {
            try
            {
                //init config and global parameter >
                var builder = new ConfigurationBuilder()
                    .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
                //
                Configuration = builder.Build();
                //
                ConfigurationBinder.Bind(Configuration, G_Config);
                //<----------
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + "\r\n" + ex.StackTrace);
            }
        }
    }
}
