using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


namespace OnTimeApp.API.Entities
{
    public class DataContext : IdentityDbContext
    {

        public DbSet<CheckInRecord> CheckInRecords { get; set; }

        public DataContext(DbContextOptions<DataContext> options) 
            : base (options)
        {            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder) 
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<CheckInRecord>().HasKey(d => d.Id);                  
        }
    }
}
