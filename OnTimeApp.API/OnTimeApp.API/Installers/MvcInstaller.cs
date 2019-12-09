using System;
using System.IO;
using System.Reflection;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using OnTimeApp.API.Services;

namespace OnTimeApp.API.Installers
{
    public class MvcInstaller : IInstaller
    {
        public void InstallServices(IServiceCollection services, IConfiguration configuration)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1",
                    new OpenApiInfo
                    {
                        Title = "OnTimeApp API",
                        Version = "1",
                        Contact = new OpenApiContact()
                        {
                            Email = "sergiojj932@gmail.com",
                            Name = "Sergio Jimenez"
                        }
                    });

                var xmlCommentsFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlCommentsFullPath = Path.Combine(AppContext.BaseDirectory, xmlCommentsFile);
                c.IncludeXmlComments(xmlCommentsFullPath);
            });
            
            var users = new UserService();
            var roles = new RoleService(users);
            services.AddSingleton<IUserService>(users);
            services.AddSingleton<IRoleService>(roles);
            roles.AddRoleToUser("admin", "admin");
        }
    }
}