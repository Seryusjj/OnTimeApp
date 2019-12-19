using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using OnTimeApp.API.Entities;
using OnTimeApp.API.Entities.DAL;
using OnTimeApp.API.Services;

namespace OnTimeApp.API.Installers
{
    public class DbInstaller : IInstaller
    {
        public void InstallServices(IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<DataContext>(options =>
            {
                options.UseInMemoryDatabase(databaseName: "Test");
            });            
            

            // DAL
            services.AddDefaultIdentity<AppUser>()
                .AddRoles<IdentityRole>()
                .AddEntityFrameworkStores<DataContext>();
            services.AddScoped<ICheckInDAL, CheckInDAL>();
            services.AddScoped<IHolidayRequestDAL, HolidayRequestDAL>();
            
            // services
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IRoleService, RoleService>();
            services.AddScoped<ICheckInRecordService, CheckInRecordService>();
            services.AddScoped<IHolidayRequestService, HolidayRequestService>();
        }
    }
}
