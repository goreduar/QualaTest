using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Quala.Core.Entities;
using Quala.Infraestructure.Data.Configuration;

namespace Quala.Infraestructure.Data;

public partial class TestDbContext : DbContext
{
    public IConfiguration Configuration { get; }
    public TestDbContext(IConfiguration configuration)
    {
        Configuration = configuration;
    }

    public TestDbContext(DbContextOptions<TestDbContext> options, IConfiguration configuration)
        : base(options)
    {
        Configuration = configuration;
    }

    public virtual DbSet<VQualaOffice> VQualaOffices { get; set; }
    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer(Configuration.GetConnectionString("DefaultConnection"));
    }       

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfiguration(new VQualaOfficeConfiguration());        
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
