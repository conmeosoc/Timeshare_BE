using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TimeshareExchangeAPI.Models;

public partial class TimeshareExchangeContext : DbContext
{
    public TimeshareExchangeContext()
    {
    }

    public TimeshareExchangeContext(DbContextOptions<TimeshareExchangeContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<Booking> Bookings { get; set; }

    public virtual DbSet<Exchange> Exchanges { get; set; }

    public virtual DbSet<Payment> Payments { get; set; }

    public virtual DbSet<Post> Posts { get; set; }

    public virtual DbSet<Realestate> Realestates { get; set; }

    public virtual DbSet<Timeshare> Timeshares { get; set; }

    public virtual DbSet<Voucher> Vouchers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            var config = new ConfigurationBuilder()
                    .SetBasePath(Directory.GetCurrentDirectory())
                    .AddJsonFile("appsettings.json").Build();
            optionsBuilder.UseSqlServer(config.GetConnectionString("TimeshareExchange"));

        }
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.ToTable("Account");

            entity.Property(e => e.Id).HasMaxLength(50);
            entity.Property(e => e.Address)
                .HasMaxLength(50)
                .HasColumnName("address");
            entity.Property(e => e.FullName)
                .HasMaxLength(50)
                .HasColumnName("fullName");
            entity.Property(e => e.Phone).HasColumnName("phone");
            entity.Property(e => e.Sex).HasColumnName("sex");
        });

        modelBuilder.Entity<Booking>(entity =>
        {
            entity.ToTable("Booking");

            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .HasColumnName("id");
            entity.Property(e => e.Deposit)
                .HasColumnType("money")
                .HasColumnName("deposit");
            entity.Property(e => e.EndDay)
                .HasColumnType("datetime")
                .HasColumnName("end_day");
            entity.Property(e => e.MemberId)
                .HasMaxLength(50)
                .HasColumnName("memberID");
            entity.Property(e => e.RealestateId)
                .HasMaxLength(50)
                .HasColumnName("realestateID");
            entity.Property(e => e.StartDay)
                .HasColumnType("datetime")
                .HasColumnName("start_day");

            entity.HasOne(d => d.Realestate).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.RealestateId)
                .HasConstraintName("FK_Booking_Realestate");
        });

        modelBuilder.Entity<Exchange>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("Exchange");

            entity.Property(e => e.EndDay)
                .HasColumnType("datetime")
                .HasColumnName("end_day");
            entity.Property(e => e.ExchangeDay)
                .HasColumnType("datetime")
                .HasColumnName("exchange_day");
            entity.Property(e => e.MemberId)
                .HasMaxLength(50)
                .HasColumnName("memberID");
            entity.Property(e => e.StartDay)
                .HasColumnType("datetime")
                .HasColumnName("start_day");
            entity.Property(e => e.TimeshareId)
                .HasMaxLength(50)
                .HasColumnName("timeshareID");

            entity.HasOne(d => d.Member).WithMany()
                .HasForeignKey(d => d.MemberId)
                .HasConstraintName("FK_Exchange_Account");

            entity.HasOne(d => d.Timeshare).WithMany()
                .HasForeignKey(d => d.TimeshareId)
                .HasConstraintName("FK_Exchange_Timeshare");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.PayId);

            entity.ToTable("payment");

            entity.Property(e => e.PayId)
                .HasMaxLength(50)
                .HasColumnName("payID");
            entity.Property(e => e.Date)
                .HasColumnType("datetime")
                .HasColumnName("date");
            entity.Property(e => e.MemberId)
                .HasMaxLength(50)
                .HasColumnName("memberID");
            entity.Property(e => e.Money).HasColumnName("money");

            entity.HasOne(d => d.Member).WithMany(p => p.Payments)
                .HasForeignKey(d => d.MemberId)
                .HasConstraintName("FK_payment_Account");
        });

        modelBuilder.Entity<Post>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("post");

            entity.Property(e => e.Price)
                .HasColumnType("money")
                .HasColumnName("price");
            entity.Property(e => e.RealestateId)
                .HasMaxLength(50)
                .HasColumnName("realestateID");

            entity.HasOne(d => d.Realestate).WithMany()
                .HasForeignKey(d => d.RealestateId)
                .HasConstraintName("FK_post_Realestate");
        });

        modelBuilder.Entity<Realestate>(entity =>
        {
            entity.ToTable("Realestate");

            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .HasColumnName("id");
            entity.Property(e => e.Facility)
                .HasMaxLength(50)
                .HasColumnName("facility");
            entity.Property(e => e.Feedback)
                .HasMaxLength(50)
                .HasColumnName("feedback");
            entity.Property(e => e.Location)
                .HasMaxLength(50)
                .HasColumnName("location");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .HasColumnName("name");
            entity.Property(e => e.Photo)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("photo");
            entity.Property(e => e.Status)
                .HasMaxLength(50)
                .HasColumnName("status");
        });

        modelBuilder.Entity<Timeshare>(entity =>
        {
            entity.ToTable("Timeshare");

            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .HasColumnName("ID");
            entity.Property(e => e.EndDay)
                .HasColumnType("datetime")
                .HasColumnName("end_day");
            entity.Property(e => e.MemberId)
                .HasMaxLength(50)
                .HasColumnName("memberID");
            entity.Property(e => e.RealestateId)
                .HasMaxLength(50)
                .HasColumnName("realestateID");
            entity.Property(e => e.StartDay)
                .HasColumnType("datetime")
                .HasColumnName("start_day");
            entity.Property(e => e.Status)
                .HasMaxLength(50)
                .HasColumnName("status");

            entity.HasOne(d => d.Member).WithMany(p => p.Timeshares)
                .HasForeignKey(d => d.MemberId)
                .HasConstraintName("FK_Timeshare_Account");

            entity.HasOne(d => d.Realestate).WithMany(p => p.Timeshares)
                .HasForeignKey(d => d.RealestateId)
                .HasConstraintName("FK_Timeshare_Realestate");
        });

        modelBuilder.Entity<Voucher>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("voucher");

            entity.Property(e => e.Amount).HasColumnName("amount");
            entity.Property(e => e.EndDay)
                .HasColumnType("datetime")
                .HasColumnName("end_day");
            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .HasColumnName("name");
            entity.Property(e => e.StartDay)
                .HasColumnType("datetime")
                .HasColumnName("start_day");
            entity.Property(e => e.Status)
                .HasColumnType("datetime")
                .HasColumnName("status");
            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .HasColumnName("type");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
