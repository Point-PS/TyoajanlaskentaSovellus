using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Tyoaikasovellus.Startup))]
namespace Tyoaikasovellus
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
