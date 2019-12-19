using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


namespace OnTimeApp.API.Entities
{
    public class DataContext : IdentityDbContext<AppUser, IdentityRole, string>
    {
        public DbSet<CheckInRecord> CheckInRecords { get; set; }
        public DbSet<HolidayRequest> HolidayRequests { get; set; }

        public DataContext(DbContextOptions<DataContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            BuildCheckInRecords(modelBuilder);
            BuildHolidayRequests(modelBuilder);
        }

        private void BuildCheckInRecords(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CheckInRecord>().HasKey(d => d.Id);
            modelBuilder.Entity<CheckInRecord>().HasOne(x => x.User);
            
        }

        private void BuildHolidayRequests(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<HolidayRequest>().HasKey(d => d.Id);
            modelBuilder.Entity<HolidayRequest>().HasOne(x => x.User);
        }
    }
}