using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TyoajanlaskentaSovellus.Startup))]
namespace TyoajanlaskentaSovellus
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
