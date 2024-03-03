using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TimeshareExchangeAPI.Entities;

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

    public virtual DbSet<Feedback> Feedbacks { get; set; }

    public virtual DbSet<Payment> Payments { get; set; }

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
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .HasColumnName("username"); 
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(50)
                .HasColumnName("phone"); ;
            entity.Property(e => e.Sex).HasColumnName("sex");
            entity.Property(e => e.Status).HasColumnName("status");
        });

        modelBuilder.Entity<Booking>(entity =>
        {
            entity.ToTable("Booking");

            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .HasColumnName("id");
            entity.Property(e => e.Adult).HasColumnName("adult");
            entity.Property(e => e.Amount).HasColumnName("amount");
            entity.Property(e => e.Children).HasColumnName("children");
            entity.Property(e => e.CreatedDay)
                .HasColumnType("datetime")
                .HasColumnName("create_day");
           
            entity.Property(e => e.EndDay)
                .HasColumnType("datetime")
                .HasColumnName("end_day");
            entity.Property(e => e.MemberId)
                .HasMaxLength(50)
                .HasColumnName("memberID");
            entity.Property(e => e.Phone)
                .HasMaxLength(50)
                .HasColumnName("phone");
            entity.Property(e => e.FullName)
                .HasMaxLength(50)
                .HasColumnName("fullName");
            entity.Property(e => e.PaymentID)
                .HasMaxLength(50)
                .HasColumnName("paymentID");
            entity.Property(e => e.Status)
                .HasMaxLength(50)
                .HasColumnName("status");
            entity.Property(e => e.Room).HasColumnName("room");
            entity.Property(e => e.StartDay)
                .HasColumnType("datetime")
                .HasColumnName("start_day");
            entity.Property(e => e.TimeshareId)
                .HasMaxLength(50)
                .HasColumnName("timeshareID");

            entity.HasOne(d => d.Member).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.MemberId)
                .HasConstraintName("FK_Booking_Account");

            entity.HasOne(d => d.Timeshare).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.TimeshareId)
                .HasConstraintName("FK_Booking_Timeshare");
        });

        modelBuilder.Entity<Exchange>(entity =>
        {
            entity
                .ToTable("Exchange");
            entity.Property(e => e.ExchangeId)
                .HasMaxLength(50)
                .HasColumnName("Id");
            entity.Property(e => e.EndDay)
                .HasColumnType("datetime")
                .HasColumnName("end_day");
            entity.Property(e => e.ExchangeDay)
                .HasColumnType("datetime")
                .HasColumnName("exchange_day");
            entity.Property(e => e.MemberId1)
                .HasMaxLength(50)
                .HasColumnName("memberID1");
            entity.Property(e => e.MemberId2)
                .HasMaxLength(50)
                .HasColumnName("memberID2");
            entity.Property(e => e.StartDay)
                .HasColumnType("datetime")
                .HasColumnName("start_day");
            entity.Property(e => e.TimeshareId1)
                .HasMaxLength(50)
                .HasColumnName("timeshareID1");
            entity.Property(e => e.TimeshareId2)
                .HasMaxLength(50)
                .HasColumnName("timeshareID2");

            entity.HasOne(d => d.Member).WithMany()
                .HasForeignKey(d => d.MemberId1)
                .HasConstraintName("FK_Exchange_Account");
            entity.HasOne(d => d.Member).WithMany()
                .HasForeignKey(d => d.MemberId2)
                .HasConstraintName("FK_Exchange_Account");

            entity.HasOne(d => d.Timeshare).WithMany()
                .HasForeignKey(d => d.TimeshareId1)
                .HasConstraintName("FK_Exchange_Timeshare");
            entity.HasOne(d => d.Timeshare).WithMany()
                .HasForeignKey(d => d.TimeshareId2)
                .HasConstraintName("FK_Exchange_Timeshare");
        });

        modelBuilder.Entity<Feedback>(entity =>
        {
            entity.ToTable("Feedback");

            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .HasColumnName("id");
            entity.Property(e => e.MemberId)
                .HasMaxLength(50)
                .HasColumnName("memberID");
            entity.Property(e => e.RealestateId)
                .HasMaxLength(50)
                .HasColumnName("realestateID");
            
            entity.Property(e => e.Rate).HasColumnName("rate");
            entity.Property(e => e.Text)
                .HasMaxLength(50)
                .HasColumnName("text");

            entity.HasOne(d => d.Member).WithMany(p => p.Feedbacks)
                .HasForeignKey(d => d.MemberId)
                .HasConstraintName("FK_Feedback_Account");
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
            entity.Property(e => e.FeedbackId)
                .HasMaxLength(50)
                .HasColumnName("feedbackId");
            entity.Property(e => e.Location)
                .HasMaxLength(50)
                .HasColumnName("location");
            entity.Property(e => e.MemberID)
                .HasMaxLength(50)
                .HasColumnName("memberId");
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
            entity.Property(e => e.Description)
                .HasMaxLength(500) 
                .HasColumnName("description");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(18,0)")
                .HasColumnName("price");
            entity.Property(e => e.CreatedDate)
                .HasColumnType("datetime")
                .HasColumnName("create_day");
            entity.HasOne(d => d.FeedbackNavigation).WithMany(p => p.Realestates)
                .HasForeignKey(d => d.FeedbackId)
                .HasConstraintName("FK_Realestate_Feedback");
        });

        modelBuilder.Entity<Timeshare>(entity =>
        {
            entity.ToTable("Timeshare");

            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .HasColumnName("ID");
            entity.Property(e => e.Price)
               .HasColumnType("decimal(18,0)")
               .HasColumnName("price");
            entity.Property(e => e.EndDay)
                .HasColumnType("datetime")
                .HasColumnName("end_day"); 
            entity.Property(e => e.CreatedDay)
                .HasColumnType("datetime")
                .HasColumnName("create_day");
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
                .ToTable("Voucher");

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
                .HasColumnType("boolean")
                .HasColumnName("status");
            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .HasColumnName("type");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
