using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Quala.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quala.Infraestructure.Data.Configuration
{
    class VQualaOfficeConfiguration : IEntityTypeConfiguration<VQualaOffice>
    {
        public void Configure(EntityTypeBuilder<VQualaOffice> builder)
        {
            builder
                .HasNoKey()
                .ToView("V_QualaOffice");

            builder.Property(e => e.Address)
                .HasMaxLength(250)
                .IsUnicode(false);
            builder.Property(e => e.CreationDate).HasColumnType("date");
            builder.Property(e => e.Identification)
                .HasMaxLength(50)
                .IsUnicode(false);
            builder.Property(e => e.MoneyDescription)
                .HasMaxLength(250)
                .IsUnicode(false);
            builder.Property(e => e.OfficeDescription)
                .HasMaxLength(250)
                .IsUnicode(false);
            builder.Property(e => e.TypeMoney)
                .HasMaxLength(25)
                .IsUnicode(false);
        }
    }
}
